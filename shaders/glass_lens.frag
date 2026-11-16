#version 460 core
// Liquid Glass lens for GlassSurface (iOS 26 tier). Applied to the
// backdrop: the rounded edge bends in the content just outside the shape,
// squeezed into a thin band, the way a thick glass slab refracts light, with
// a touch of chromatic dispersion right at the rim.
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;          // backdrop texture size (physical px)
uniform vec4 uRect;          // glass rect in backdrop px: x, y, w, h
uniform float uRadius;       // corner radius (physical px)
uniform float uBezel;        // width of the bending band (physical px)
uniform float uStrength;     // max pull at the edge (physical px)
uniform sampler2D uTexture;  // the backdrop

out vec4 fragColor;

float sdRoundRect(vec2 p, vec2 halfSize, float r) {
  vec2 q = abs(p) - halfSize + r;
  return min(max(q.x, q.y), 0.0) + length(max(q, 0.0)) - r;
}

void main() {
  vec2 frag = FlutterFragCoord().xy;
  vec2 halfSize = uRect.zw * 0.5;
  vec2 p = frag - (uRect.xy + halfSize);
  float r = min(uRadius, min(halfSize.x, halfSize.y));
  float d = sdRoundRect(p, halfSize, r);   // < 0 inside

  vec2 uv = frag / uSize;
  if (d > 0.0 || uBezel <= 0.0) {
    fragColor = texture(uTexture, uv);
    return;
  }
  // 1 at the edge, 0 once uBezel deep; eased like a convex bevel.
  float t = clamp(1.0 + d / uBezel, 0.0, 1.0);
  float bend = t * t * (3.0 - 2.0 * t);
  // Outward normal from the distance field.
  vec2 e = vec2(1.0, 0.0);
  vec2 n = normalize(vec2(
    sdRoundRect(p + e.xy, halfSize, r) - sdRoundRect(p - e.xy, halfSize, r),
    sdRoundRect(p + e.yx, halfSize, r) - sdRoundRect(p - e.yx, halfSize, r)
  ) + 1e-5);
  vec2 offset = n * bend * uStrength;      // sample from outside the edge
  vec2 px = 1.0 / uSize;
  float spread = 0.04 * bend;              // dispersion only near the rim
  float red = texture(uTexture, uv + offset * (1.0 + spread) * px).r;
  vec4 mid = texture(uTexture, uv + offset * px);
  float blue = texture(uTexture, uv + offset * (1.0 - spread) * px).b;
  fragColor = vec4(red, mid.g, blue, mid.a);
}
