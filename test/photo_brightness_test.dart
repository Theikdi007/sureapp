import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:sure_app/design_system/components/photo_brightness.dart';

ByteData _solid(int w, int h, int r, int g, int b) {
  final bytes = Uint8List(w * h * 4);
  for (var i = 0; i < bytes.length; i += 4) {
    bytes
      ..[i] = r
      ..[i + 1] = g
      ..[i + 2] = b
      ..[i + 3] = 255;
  }
  return ByteData.sublistView(bytes);
}

void main() {
  test("the API's light grey no-photo picture reads as light", () {
    // rgb(244,245,247), the background of images/products/…/0 without a photo.
    expect(
      lumaOfRgba(_solid(480, 480, 244, 245, 247), 480, 480),
      greaterThan(0.6),
    );
  });

  test('a dark product shot reads as dark', () {
    expect(lumaOfRgba(_solid(480, 480, 12, 17, 23), 480, 480), lessThan(0.6));
  });
}
