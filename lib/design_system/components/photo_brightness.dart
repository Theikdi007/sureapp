import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_brightness.g.dart';

/// Whether the top strip of a photo is light, so a screen drawn edge to edge
/// over it can pick dark status bar icons there (white icons vanish on a
/// light photo, such as the API's grey "no photo" picture).
///
/// Uses the same cache as `SureImage`, so it costs no extra download. Null
/// while unknown or when the image can't be read (keep the default).
@riverpod
Future<bool?> photoTopIsLight(Ref ref, String url) async {
  if (url.startsWith('asset:') || url.toLowerCase().contains('.svg')) {
    return null;
  }
  final completer = Completer<ui.Image>();
  final stream = CachedNetworkImageProvider(
    url,
  ).resolve(ImageConfiguration.empty);
  late final ImageStreamListener listener;
  listener = ImageStreamListener(
    (info, _) {
      if (!completer.isCompleted) completer.complete(info.image.clone());
      stream.removeListener(listener);
    },
    onError: (error, _) {
      if (!completer.isCompleted) completer.completeError(error);
      stream.removeListener(listener);
    },
  );
  stream.addListener(listener);
  try {
    final image = await completer.future.timeout(const Duration(seconds: 15));
    try {
      return await lumaOfTopStrip(image) > 0.6;
    } finally {
      image.dispose();
    }
  } on Object {
    return null;
  }
}

/// Average luma (0–1, Rec. 709) of the top 15 % of [image].
Future<double> lumaOfTopStrip(ui.Image image) async {
  final data = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
  if (data == null) return 0;
  return lumaOfRgba(data, image.width, image.height);
}

/// [lumaOfTopStrip] over raw RGBA bytes; sampled on a grid, not every pixel.
double lumaOfRgba(ByteData data, int width, int height) {
  final rows = (height * 0.15).ceil().clamp(1, height);
  final step = (width / 48).ceil().clamp(1, width);
  var sum = 0.0;
  var count = 0;
  for (var y = 0; y < rows; y += step) {
    for (var x = 0; x < width; x += step) {
      final i = (y * width + x) * 4;
      final r = data.getUint8(i), g = data.getUint8(i + 1);
      final b = data.getUint8(i + 2);
      sum += (0.2126 * r + 0.7152 * g + 0.0722 * b) / 255;
      count++;
    }
  }
  return count == 0 ? 0 : sum / count;
}
