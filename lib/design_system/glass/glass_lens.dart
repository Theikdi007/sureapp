import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

/// The iOS 26 Liquid Glass lens (`shaders/glass_lens.frag`): content behind
/// the rounded edge bends inward like light through a thick glass slab.
///
/// A backdrop shader sees the whole screen in physical pixels, so the
/// render object hands the shader its on-screen rect every frame it moves
/// (scrolling lists, sheet and page transitions).
abstract final class GlassLens {
  static ui.FragmentProgram? _program;

  /// Whether the lens can draw here (iOS 26 tier, shader loaded, backend
  /// supports backdrop shaders).
  static bool get available =>
      _program != null && ui.ImageFilter.isShaderFilterSupported;

  /// Loads the shader once before `runApp`. Never throws: without it glass
  /// falls back to blur + saturation.
  static Future<void> preload() async {
    if (_program != null) return;
    try {
      _program = await ui.FragmentProgram.fromAsset('shaders/glass_lens.frag');
    } on Object catch (e) {
      debugPrint('GlassLens: shader unavailable ($e)');
    }
  }

  static ui.FragmentShader? _newShader() => _program?.fragmentShader();
}

/// Backdrop filter for one glass surface: [inner] (blur + saturation) then
/// the lens. Use only when [GlassLens.available].
class GlassLensBackdrop extends SingleChildRenderObjectWidget {
  const GlassLensBackdrop({
    super.key,
    required this.inner,
    required this.radius,
    this.bezel = 16,
    this.strength = 9,
    super.child,
  });

  final ui.ImageFilter inner;

  /// Corner radius in logical px.
  final double radius;

  /// Depth of the bending band and the largest pull, in logical px.
  final double bezel;
  final double strength;

  @override
  RenderGlassLensBackdrop createRenderObject(BuildContext context) =>
      RenderGlassLensBackdrop(
        inner: inner,
        radius: radius,
        bezel: bezel,
        strength: strength,
        devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
      );

  @override
  void updateRenderObject(
    BuildContext context,
    RenderGlassLensBackdrop renderObject,
  ) {
    renderObject
      ..inner = inner
      ..radius = radius
      ..bezel = bezel
      ..strength = strength
      ..devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
  }
}

class RenderGlassLensBackdrop extends RenderProxyBox {
  RenderGlassLensBackdrop({
    required this._inner,
    required this._radius,
    required this._bezel,
    required this._strength,
    required double devicePixelRatio,
  }) : _dpr = devicePixelRatio;

  ui.ImageFilter _inner;
  set inner(ui.ImageFilter v) {
    if (identical(v, _inner)) return;
    _inner = v;
    markNeedsPaint();
  }

  double _radius;
  set radius(double v) {
    if (v == _radius) return;
    _radius = v;
    markNeedsPaint();
  }

  double _bezel;
  set bezel(double v) {
    if (v == _bezel) return;
    _bezel = v;
    markNeedsPaint();
  }

  double _strength;
  set strength(double v) {
    if (v == _strength) return;
    _strength = v;
    markNeedsPaint();
  }

  double _dpr;
  set devicePixelRatio(double v) {
    if (v == _dpr) return;
    _dpr = v;
    markNeedsPaint();
  }

  ui.FragmentShader? _shader;
  Offset? _paintedAt;

  /// Lenses on screen. One persistent frame callback checks them after each
  /// frame that is drawn anyway (none of its own), so a moved lens repaints
  /// on the next frame.
  static final _live = <RenderGlassLensBackdrop>{};
  static bool _hooked = false;

  static void _afterFrame(Duration _) {
    for (final lens in _live.toList()) {
      lens._repaintIfMoved();
    }
  }

  /// Ancestor repaint boundaries move this box without repainting it, so
  /// the rect the shader got would go stale.
  void _repaintIfMoved() {
    if (!attached || !hasSize || _paintedAt == null) return;
    if (localToGlobal(Offset.zero) != _paintedAt) markNeedsPaint();
  }

  @override
  bool get alwaysNeedsCompositing => true;

  @override
  BackdropFilterLayer? get layer => super.layer as BackdropFilterLayer?;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _shader ??= GlassLens._newShader();
    _live.add(this);
    if (!_hooked) {
      _hooked = true;
      SchedulerBinding.instance.addPersistentFrameCallback(_afterFrame);
    }
  }

  @override
  void detach() {
    _live.remove(this);
    super.detach();
  }

  @override
  void dispose() {
    _shader?.dispose();
    _shader = null;
    super.dispose();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final shader = _shader;
    // Below ~44 pt the bend is invisible and a full-screen backdrop shader
    // per small chip (product grids) only costs frames: blur only.
    if (shader == null || child == null || size.shortestSide < 44) {
      _paintedAt = null;
      layer = (layer ?? BackdropFilterLayer())..filter = _inner;
      if (child == null) return;
      context.pushLayer(layer!, super.paint, offset);
      return;
    }
    final origin = localToGlobal(Offset.zero);
    _paintedAt = origin;
    final short = size.shortestSide / 2;
    // uSize (index 0, 1) and the sampler are set by the engine.
    shader
      ..setFloat(2, origin.dx * _dpr)
      ..setFloat(3, origin.dy * _dpr)
      ..setFloat(4, size.width * _dpr)
      ..setFloat(5, size.height * _dpr)
      ..setFloat(6, _radius * _dpr)
      ..setFloat(7, (_bezel < short ? _bezel : short) * _dpr)
      ..setFloat(8, _strength * _dpr);
    final filter = ui.ImageFilter.compose(
      outer: ui.ImageFilter.shader(shader),
      inner: _inner,
    );
    layer = (layer ?? BackdropFilterLayer())..filter = filter;
    context.pushLayer(layer!, super.paint, offset);
  }
}
