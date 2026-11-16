import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/router/routes.dart';
import '../../../core/utils/myanmar_time.dart';
import '../../../design_system/components/order_components.dart';
import '../../../design_system/components/page_scaffold.dart';
import '../../../design_system/components/section_header.dart';
import '../../../design_system/components/service_components.dart';
import '../../../design_system/components/sheet_components.dart';
import '../../../design_system/components/sure_button.dart';
import '../../../design_system/components/sure_text_field.dart';
import '../../../design_system/components/sure_toast.dart';
import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/tokens/sure_metrics.dart';
import '../../../design_system/tokens/sure_typography.dart';
import '../../repairs/presentation/repairs_screen.dart' show LoadingBlock;
import '../../../shared/widgets/photo_picker.dart';
import '../../support/presentation/split_page.dart';
import '../data/warranty_repository.dart';
import 'warranty_providers.dart';

/// `endsOn` is a plain date (no time zone).
String _date(String ymd) => DateFormat('d MMM y').format(DateTime.parse(ymd));

/// TechVault Warranty (prototype `WARRANTY`): plan cards, My Claims and
/// Report Faulty Product. `GET warranty/plans`, `GET warranty/claims`,
/// `POST warranty/claims` (multipart, Idempotency-Key).
///
/// Compact: one scrolling page. Medium/expanded and book-posture folds:
/// plans and claims on the left, the claim form on the right.
class WarrantyScreen extends ConsumerStatefulWidget {
  const WarrantyScreen({super.key});

  @override
  ConsumerState<WarrantyScreen> createState() => _WarrantyScreenState();
}

class _WarrantyScreenState extends ConsumerState<WarrantyScreen> {
  static const _minChars = 10;

  /// Prototype `TechVault Warranty` column gap.
  static const double _gap = 18;

  // Form state lives here so it survives the layout switching panes.
  final _desc = TextEditingController();
  final _formKey = GlobalKey();
  String? _planId;
  UploadPhoto? _photo;
  bool _submitting = false;
  ApiException? _error;
  String? _photoError;

  /// One key per claim; kept for retries of the same claim, dropped when
  /// the claim changes or goes through.
  IdempotencyKey? _key;

  @override
  void initState() {
    super.initState();
    _desc.addListener(_changed);
  }

  @override
  void dispose() {
    _desc.dispose();
    super.dispose();
  }

  void _changed() => setState(() {
    _key = null;
    _error = null;
  });

  bool get _canSubmit =>
      !_submitting && _planId != null && _desc.text.trim().length >= _minChars;

  void _choosePlan(String id) {
    if (id == _planId) return;
    setState(() {
      _planId = id;
      _key = null;
      _error = null;
    });
  }

  /// From a plan sheet: pick the plan and bring the form into view.
  void _claimFor(WarrantyPlanDto plan) {
    _choosePlan(plan.id);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _formKey.currentContext;
      if (ctx != null && ctx.mounted) {
        Scrollable.ensureVisible(
          ctx,
          duration: SureMotion.medium,
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  Future<void> _pickPhoto() async {
    final pick = await pickUploadPhoto(context);
    if (pick == null || !mounted) return;
    setState(() {
      _key = null;
      _error = null;
      switch (pick) {
        case PhotoPicked(:final photo):
          _photo = photo;
          _photoError = null;
        case PhotoRejected(:final message):
          _photoError = message;
      }
    });
  }

  void _removePhoto() => setState(() {
    _photo = null;
    _photoError = null;
    _key = null;
  });

  Future<void> _submit() async {
    if (!_canSubmit) return;
    FocusScope.of(context).unfocus();
    final key = _key ??= IdempotencyKey.generate();
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      final claim = await ref
          .read(warrantyRepositoryProvider)
          .fileClaim(
            planId: _planId!,
            description: _desc.text.trim(),
            photo: _photo,
            key: key,
          );
      if (!mounted) return;
      _desc.removeListener(_changed);
      _desc.clear();
      _desc.addListener(_changed);
      setState(() {
        _submitting = false;
        _key = null;
        _photo = null;
      });
      ref.invalidate(warrantyClaimsProvider);
      SureToast.show(
        context,
        'Claim ${claim.number} submitted. We\'ll be in touch.',
        icon: LucideIcons.shieldCheck,
        color: SureToastColor.positive,
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _submitting = false;
        _error = e;
      });
      // A plan that turned out expired: refresh the list (it drops out of
      // the picker) and keep the planId error on screen.
      if (e.code == 'mobile.plan_expired' || e.fieldMessage('planId') != null) {
        ref.invalidate(warrantyPlansProvider);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final plans = ref.watch(warrantyPlansProvider);
    final claims = ref.watch(warrantyClaimsProvider);

    // Preselect when exactly one plan can take a claim.
    if (_planId == null) {
      final active = [...?plans.value?.where((p) => p.active)];
      if (active.length == 1) _planId = active.single.id;
    }

    final listPart = [..._plans(plans), ..._claims(claims)];
    final formPart = _form(plans.value ?? const []);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (useSplitLayout(context, constraints.maxWidth)) {
          return SplitPage(
            title: 'TechVault Warranty',
            subtitle: 'Coverage & protection plans',
            list: spaced(listPart, gap: _gap),
            detail: [formPart],
          );
        }
        return PageScaffold(
          title: 'TechVault Warranty',
          headerGap: 18,
          subtitle: 'Coverage & protection plans',
          onRefresh: () async {
            ref
              ..invalidate(warrantyPlansProvider)
              ..invalidate(warrantyClaimsProvider);
            await Future.wait([
              ref.read(warrantyPlansProvider.future),
              ref.read(warrantyClaimsProvider.future),
            ]);
          },
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: PageScaffold.sidePadding,
              ),
              sliver: SliverList.list(
                children: [
                  ...spaced([...listPart, formPart], gap: _gap),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _plans(AsyncValue<List<WarrantyPlanDto>> plans) =>
      switch (plans) {
        AsyncData(:final value) when value.isEmpty => [
          const EmptyState(
            icon: LucideIcons.shieldCheck,
            title: 'No plans yet',
            description:
                'Devices bought at SureStore and your XtraGuard plans show '
                'up here',
          ),
        ],
        AsyncData(:final value) => [
          for (final p in value)
            TechVaultListCard(
              plan: p.planName,
              device: p.device,
              expiry: p.expiryText,
              active: p.active,
              onTap: () => showPlanSheet(
                context,
                p,
                onClaim: p.active ? () => _claimFor(p) : null,
              ),
            ),
        ],
        AsyncError(:final error) when !plans.isLoading => [
          EmptyState(
            icon: LucideIcons.wifiOff,
            title: "Couldn't load your plans",
            description: error is ApiException ? error.userMessage : null,
            action: SureLink(
              'Try again',
              onTap: () => ref.invalidate(warrantyPlansProvider),
            ),
          ),
        ],
        _ => [const LoadingBlock()],
      };

  List<Widget> _claims(AsyncValue<List<WarrantyClaimDto>> claims) {
    final list = claims.value;
    if (list == null || list.isEmpty) {
      return [
        if (claims.hasError && !claims.isLoading)
          InlineAlert(
            icon: LucideIcons.wifiOff,
            critical: true,
            text: "Couldn't load your claims. Pull down to try again.",
          ),
      ];
    }
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionHeader(
            title: 'My Claims',
            description: "Claims you've filed and where they are",
          ),
          const SizedBox(height: 14),
          ...spaced([
            for (final c in list) _ClaimCard(claim: c),
          ], gap: SureSpace.x3),
        ],
      ),
    ];
  }

  Widget _form(List<WarrantyPlanDto> plans) {
    final c = context.colors;
    final err = _error;
    final planErr = err?.fieldMessage('planId');
    final descErr = err?.fieldMessage('description');
    final fileErr = err?.fieldMessage('file') ?? _photoError;
    final general =
        err != null &&
            planErr == null &&
            descErr == null &&
            err.fieldMessage('file') == null
        ? err
        : null;
    final active = plans.where((p) => p.active).toList();
    final chars = _desc.text.trim().length;

    return Column(
      key: _formKey,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionHeader(
          title: 'Report Faulty Product',
          description: 'File a warranty claim',
        ),
        const SizedBox(height: 14),
        if (plans.isNotEmpty && active.isEmpty) ...[
          const InlineAlert(
            icon: LucideIcons.shieldAlert,
            text:
                'None of your plans is active. Book a paid repair at any '
                'SureStore service desk instead.',
          ),
          const SizedBox(height: SureSpace.x2),
          Align(
            alignment: Alignment.centerLeft,
            child: SureLink(
              'Find a store',
              onTap: () => context.push(AppRoutes.findStore),
            ),
          ),
        ] else if (active.isNotEmpty) ...[
          const _InkLabel('Plan'),
          const SizedBox(height: SureSpace.x3),
          for (final p in active) ...[
            SelectRow(
              icon: LucideIcons.shieldCheck,
              title: p.device,
              description: '${p.planName} · ${p.expiryText}',
              selected: p.id == _planId,
              enabled: !_submitting,
              onSelect: () => _choosePlan(p.id),
            ),
            const SizedBox(height: SureSpace.x2),
          ],
          if (planErr != null) ...[
            FieldError(planErr),
            const SizedBox(height: SureSpace.x2),
          ],
          const SizedBox(height: SureSpace.x1),
          const _InkLabel('What happened?'),
          const SizedBox(height: SureSpace.x3),
          SureTextArea(
            controller: _desc,
            placeholder: 'Describe what happened',
            semanticLabel: 'Describe what happened',
            enabled: !_submitting,
            maxLength: 1000,
            error: descErr != null,
          ),
          if (descErr != null)
            FieldError(descErr)
          else if (chars < _minChars)
            Text(
              'At least $_minChars characters',
              style: SureText.caption1().copyWith(color: c.inkFaded),
            ),
          const SizedBox(height: SureSpace.x3),
          const _InkLabel('Evidence (Optional)'),
          const SizedBox(height: SureSpace.x3),
          _PhotoField(
            photo: _photo,
            enabled: !_submitting,
            onPick: _pickPhoto,
            onRemove: _removePhoto,
          ),
          if (fileErr != null) ...[
            const SizedBox(height: SureSpace.x1),
            FieldError(fileErr),
          ],
          if (general != null) ...[
            const SizedBox(height: SureSpace.x3),
            InlineAlert(
              icon: LucideIcons.circleAlert,
              critical: true,
              text: [
                general.userMessage,
                if (general.requestId case final id?) 'Ref: $id',
              ].join('\n'),
            ),
          ],
          const SizedBox(height: SureSpace.x3),
          SureButton(
            label: 'Submit Claim',
            loading: _submitting,
            onPressed: _canSubmit && active.any((p) => p.id == _planId)
                ? _submit
                : null,
          ),
        ],
      ],
    );
  }
}

/// Dashed drop area (prototype "Evidence"), or the picked photo with a
/// remove button.
class _PhotoField extends StatelessWidget {
  const _PhotoField({
    required this.photo,
    required this.enabled,
    required this.onPick,
    required this.onRemove,
  });

  final UploadPhoto? photo;
  final bool enabled;
  final VoidCallback onPick;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    if (photo case final p?) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: SureRadius.all(SureRadius.large),
            child: Image.file(
              File(p.path),
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              semanticLabel: 'Claim photo',
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Material(
              color: c.page.withValues(alpha: 0.9),
              shape: const CircleBorder(),
              child: IconButton(
                tooltip: 'Remove photo',
                onPressed: enabled ? onRemove : null,
                icon: Icon(LucideIcons.x, size: 18, color: c.ink),
              ),
            ),
          ),
        ],
      );
    }
    return PressScale(
      onTap: enabled ? onPick : null,
      semanticLabel: 'Add a photo (JPEG, PNG or WebP, up to 5 MB)',
      child: CustomPaint(
        // Over the fill, or the fill hides it.
        foregroundPainter: _DashedBorder(
          color: c.boxBorder,
          radius: SureRadius.large,
        ),
        child: Container(
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: c.pageFaded,
            borderRadius: SureRadius.all(SureRadius.large),
          ),
          child: Column(
            children: [
              Icon(LucideIcons.camera, size: 22, color: c.inkFaded),
              const SizedBox(height: SureSpace.x2),
              Text(
                'Place here',
                style: SureTypography.style(
                  size: 13,
                  height: 18 / 13,
                  color: c.inkFaded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedBorder extends CustomPainter {
  _DashedBorder({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          (Offset.zero & size).deflate(0.75),
          Radius.circular(radius),
        ),
      );
    for (final metric in path.computeMetrics()) {
      for (var d = 0.0; d < metric.length; d += 10) {
        canvas.drawPath(metric.extractPath(d, d + 6), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorder old) =>
      old.color != color || old.radius != radius;
}

/// 13/500 ink label above a form block (prototype "Evidence (Optional)").
class _InkLabel extends StatelessWidget {
  const _InkLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: SureTypography.style(
      size: 13,
      weight: SureTypography.medium,
      height: 18 / 13,
      color: context.colors.ink,
    ),
  );
}

class _ClaimCard extends StatelessWidget {
  const _ClaimCard({required this.claim});

  final WarrantyClaimDto claim;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return PressScale(
      onTap: () => showClaimSheet(context, claim),
      semanticLabel:
          'Claim ${claim.number}, ${claim.statusLabel}. ${claim.meta}',
      child: ExcludeSemantics(
        child: OutlinedCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: c.pointsFaded,
                      borderRadius: SureRadius.all(SureRadius.medium),
                    ),
                    child: Icon(
                      LucideIcons.shieldCheck,
                      size: 18,
                      color: c.points,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          claim.number,
                          style: SureText.body3(SureTypography.bold)
                              .copyWith(color: c.ink),
                        ),
                        Text(
                          claim.meta,
                          style: SureTypography.style(
                            size: 11,
                            height: 16 / 11,
                            color: c.inkFaded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: SureSpace.x3),
                  StatusDot(
                    label: claim.statusLabel,
                    color: claimStatusColor(claim.status),
                  ),
                ],
              ),
              const SizedBox(height: SureSpace.x2),
              Text(
                '“${claim.description}”',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: SureText.caption1().copyWith(
                  color: c.inkFaded,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Plan detail (`GET warranty/plans/{id}`): what it covers until when, the
/// policy document, and a shortcut to file a claim on it.
Future<void> showPlanSheet(
  BuildContext context,
  WarrantyPlanDto plan, {
  VoidCallback? onClaim,
}) => showSureSheet<void>(
  context,
  title: plan.planName,
  builder: (context) => Consumer(
    builder: (context, ref, _) {
      final c = context.colors;
      final detail = ref.watch(warrantyPlanDetailProvider(plan.id));
      final d = detail.value;
      final p = d?.plan ?? plan;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: StatusBadge(
                label: p.expiryText,
                color: p.active ? 'positive' : 'neutral',
              ),
            ),
            const SizedBox(height: SureSpace.x3),
            OutlinedCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  DetailRow(label: 'Device', value: p.device),
                  if (d?.variant case final v?)
                    DetailRow(label: 'Variant', value: v),
                  if (p.serial case final s?)
                    DetailRow(label: 'Serial', value: s),
                  DetailRow(
                    label: 'Plan',
                    value: p.source == 'xtraguard'
                        ? 'XtraGuard'
                        : 'SureStore warranty',
                  ),
                  if (p.endsOn case final e?)
                    DetailRow(
                      label: p.active ? 'Ends' : 'Ended',
                      value: _date(e),
                    ),
                ],
              ),
            ),
            const SizedBox(height: SureSpace.x4),
            switch (detail) {
              AsyncData(:final value) when value.covers.isNotEmpty => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SectionHeader(
                    title: 'What it covers',
                    size: SectionHeaderSize.medium,
                  ),
                  const SizedBox(height: SureSpace.x2),
                  for (final cover in value.covers) _CoverRow(cover: cover),
                ],
              ),
              AsyncData() => const SizedBox.shrink(),
              AsyncError(:final error) when !detail.isLoading => InlineAlert(
                icon: LucideIcons.wifiOff,
                critical: true,
                text: error is ApiException
                    ? error.userMessage
                    : "Couldn't load what this plan covers.",
              ),
              _ => const LoadingBlock(height: 64),
            },
            if (p.policyUrl case final url?) ...[
              const SizedBox(height: SureSpace.x3),
              SureButton(
                label: 'View policy',
                startIcon: LucideIcons.fileText,
                variant: SureButtonVariant.outline,
                onPressed: () => launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                ),
              ),
            ],
            if (onClaim != null) ...[
              const SizedBox(height: SureSpace.x2),
              SureButton(
                label: 'File a claim',
                startIcon: LucideIcons.wrench,
                onPressed: () {
                  Navigator.of(context).pop();
                  onClaim();
                },
              ),
            ],
            if (!p.active) ...[
              const SizedBox(height: SureSpace.x3),
              Text(
                'This plan has ended. Book a paid repair at any SureStore '
                'service desk.',
                style: SureText.caption1().copyWith(color: c.inkFaded),
              ),
            ],
          ],
        ),
      );
    },
  ),
);

class _CoverRow extends StatelessWidget {
  const _CoverRow({required this.cover});

  final WarrantyCoverDto cover;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(LucideIcons.check, size: 16, color: c.positiveInk),
          ),
          const SizedBox(width: SureSpace.x2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cover.name,
                  style: SureText.body3(SureTypography.medium)
                      .copyWith(color: c.ink),
                ),
                for (final line in [
                  ?cover.description,
                  ?cover.policy,
                  if (cover.endsOn case final e?) 'Until ${_date(e)}',
                ])
                  Text(
                    line,
                    style: SureText.caption1().copyWith(color: c.inkFaded),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// One claim: status, what was reported, the staff note and the photo.
Future<void> showClaimSheet(BuildContext context, WarrantyClaimDto claim) =>
    showSureSheet<void>(
      context,
      title: 'Claim ${claim.number}',
      builder: (context) => Consumer(
        builder: (context, ref, _) {
          final c = context.colors;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: StatusBadge(
                    label: claim.statusLabel,
                    color: claimStatusColor(claim.status),
                  ),
                ),
                const SizedBox(height: SureSpace.x3),
                OutlinedCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      DetailRow(label: 'Device', value: claim.device),
                      DetailRow(label: 'Plan', value: claim.planName),
                      DetailRow(
                        label: 'Filed',
                        value: MyanmarTime.format(claim.filedAt),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: SureSpace.x3),
                Text(
                  claim.description,
                  style: SureText.body3().copyWith(color: c.ink),
                ),
                if (claim.staffNote case final note?) ...[
                  const SizedBox(height: SureSpace.x3),
                  InlineAlert(icon: LucideIcons.messageSquare, text: note),
                ],
                if (claim.photoUrl != null) ...[
                  const SizedBox(height: SureSpace.x3),
                  switch (ref.watch(warrantyClaimPhotoProvider(claim.number))) {
                    AsyncData(:final value) => ClipRRect(
                      borderRadius: SureRadius.all(SureRadius.large),
                      child: Image.memory(
                        value,
                        fit: BoxFit.cover,
                        semanticLabel: 'Claim photo',
                      ),
                    ),
                    AsyncError() => Text(
                      "Couldn't load the photo.",
                      style: SureText.caption1().copyWith(color: c.inkFaded),
                    ),
                    _ => const LoadingBlock(height: 120),
                  },
                ],
              ],
            ),
          );
        },
      ),
    );
