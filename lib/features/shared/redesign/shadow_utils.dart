import 'package:flutter/material.dart';
import 'dart:math' as math;

/// =============================================================================
/// CENTRALIZED SHADOW CHARACTER UTILITIES
/// =============================================================================
/// 
/// This file provides consistent shadow character drawing across the entire app.
/// ALL shadow-based illustrations should use these utilities to maintain:
/// - Consistent eye proportions (4-5% of card width)
/// - Consistent character sizes (30-50% of card)
/// - Consistent glow intensities
/// - Consistent color palettes
/// 
/// DESIGN GUIDELINES:
/// 1. Shadow characters should occupy 30-50% of card area
/// 2. Eyes should be 4-5% of card width (not character width!)
/// 3. Eye spacing should be 6-10% of card width
/// 4. Glows should be subtle (opacity 0.08-0.15)
/// 5. Characters should blend INTO the environment, not sit on top
/// 6. Use gradients to merge shadow edges with background
/// =============================================================================

/// Standard proportions for shadow characters
class ShadowProportions {
  /// Eye size as percentage of card width (default 4.5%)
  static const double eyeSizeRatio = 0.045;
  
  /// Eye spacing as percentage of card width (default 8%)
  static const double eyeSpacingRatio = 0.08;
  
  /// Minimum eye size in pixels
  static const double minEyeSize = 8.0;
  
  /// Maximum eye size in pixels
  static const double maxEyeSize = 18.0;
  
  /// Glow intensity for shadows (subtle)
  static const double glowOpacity = 0.08;
  
  /// Number of glow layers
  static const int glowLayers = 4;
  
  /// Base glow spread per layer
  static const double glowSpread = 6.0;
}

/// Eye style options
enum EyeStyle {
  /// Standard round eyes with amber iris
  standard,
  /// Slightly sleepy/relaxed eyes
  sleepy,
  /// Alert/curious eyes
  curious,
  /// Mysterious half-closed eyes
  mysterious,
}

/// Standard shadow color palette
class ShadowColors {
  /// Primary shadow color (near black with hint of purple)
  static const Color shadow = Color(0xFF0A0510);
  
  /// Lighter shadow for secondary elements
  static const Color shadowLight = Color(0xFF15102A);
  
  /// Standard eye white color
  static const Color eyeWhite = Color(0xFFFFFFF0);
  
  /// Standard iris color (golden amber)
  static const Color iris = Color(0xFFFBD38D);
  
  /// Standard pupil color
  static const Color pupil = Color(0xFF1A1A1A);
  
  /// Eye shine color
  static const Color eyeShine = Colors.white;
}

/// Draw peeking eyes with consistent proportions
/// 
/// Parameters:
/// - [canvas] The canvas to draw on
/// - [center] Center point between the two eyes
/// - [cardWidth] Total width of the card (used for proportional sizing)
/// - [glowColor] Color for the eye glow effect
/// - [style] Eye style (standard, sleepy, curious, mysterious)
/// - [sizeMultiplier] Optional multiplier to adjust size (default 1.0)
void drawPeekingEyesProportional(
  Canvas canvas,
  Offset center,
  double cardWidth, {
  required Color glowColor,
  EyeStyle style = EyeStyle.standard,
  double sizeMultiplier = 1.0,
}) {
  // Calculate proportional sizes
  final eyeSize = (cardWidth * ShadowProportions.eyeSizeRatio * sizeMultiplier)
      .clamp(ShadowProportions.minEyeSize, ShadowProportions.maxEyeSize);
  final eyeSpacing = cardWidth * ShadowProportions.eyeSpacingRatio * sizeMultiplier;
  
  final leftEye = Offset(center.dx - eyeSpacing, center.dy);
  final rightEye = Offset(center.dx + eyeSpacing, center.dy);
  
  // Eye shape varies by style
  double eyeHeight = eyeSize;
  double eyeWidth = eyeSize * 1.3;
  double irisOffset = 0.0;
  
  switch (style) {
    case EyeStyle.sleepy:
      eyeHeight = eyeSize * 0.7;
      break;
    case EyeStyle.curious:
      eyeHeight = eyeSize * 1.1;
      irisOffset = -eyeSize * 0.1;
      break;
    case EyeStyle.mysterious:
      eyeHeight = eyeSize * 0.6;
      break;
    case EyeStyle.standard:
    default:
      break;
  }
  
  // Draw eyes
  _drawSingleEye(canvas, leftEye, eyeWidth, eyeHeight, eyeSize, glowColor, irisOffset);
  _drawSingleEye(canvas, rightEye, eyeWidth, eyeHeight, eyeSize, glowColor, irisOffset);
}

void _drawSingleEye(
  Canvas canvas,
  Offset center,
  double width,
  double height,
  double baseSize,
  Color glowColor,
  double irisOffset,
) {
  // 1. Subtle glow (not too prominent)
  for (int i = ShadowProportions.glowLayers - 1; i >= 0; i--) {
    canvas.drawOval(
      Rect.fromCenter(
        center: center,
        width: width + i * ShadowProportions.glowSpread,
        height: height + i * ShadowProportions.glowSpread * 0.75,
      ),
      Paint()..color = glowColor.withOpacity(ShadowProportions.glowOpacity - i * 0.015),
    );
  }
  
  // 2. Eye white (slightly oval)
  canvas.drawOval(
    Rect.fromCenter(center: center, width: width, height: height),
    Paint()..color = ShadowColors.eyeWhite,
  );
  
  // 3. Iris (golden amber)
  final irisSize = baseSize * 0.65;
  canvas.drawCircle(
    Offset(center.dx, center.dy + irisOffset),
    irisSize,
    Paint()..color = ShadowColors.iris,
  );
  
  // 4. Pupil
  final pupilSize = baseSize * 0.3;
  canvas.drawCircle(
    Offset(center.dx, center.dy + irisOffset),
    pupilSize,
    Paint()..color = ShadowColors.pupil,
  );
  
  // 5. Eye shine (essential for liveliness)
  final shineSize = baseSize * 0.15;
  canvas.drawCircle(
    Offset(center.dx - baseSize * 0.25, center.dy - baseSize * 0.2 + irisOffset),
    shineSize,
    Paint()..color = ShadowColors.eyeShine,
  );
}

/// Draw a subtle shadow glow around a path
/// Used to make shadows blend with the environment
void drawShadowBlendGlow(
  Canvas canvas,
  Path path,
  Color glowColor, {
  int layers = 4,
  double baseSpread = 4.0,
  double maxOpacity = 0.08,
}) {
  for (int i = layers - 1; i >= 0; i--) {
    canvas.drawPath(
      path,
      Paint()
        ..color = glowColor.withOpacity(maxOpacity - i * (maxOpacity / layers))
        ..style = PaintingStyle.stroke
        ..strokeWidth = baseSpread + i * baseSpread,
    );
  }
}

/// Draw a shadow silhouette with gradient edge for blending
void drawBlendedShadow(
  Canvas canvas,
  Path path, {
  Color? shadowColor,
  Color? edgeColor,
  double edgeWidth = 8.0,
}) {
  final color = shadowColor ?? ShadowColors.shadow;
  final edge = edgeColor ?? color.withOpacity(0.3);
  
  // Draw soft edge first
  canvas.drawPath(
    path,
    Paint()
      ..color = edge
      ..style = PaintingStyle.stroke
      ..strokeWidth = edgeWidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
  );
  
  // Draw solid shadow
  canvas.drawPath(path, Paint()..color = color);
}

/// Create a standard star field background
void drawStarField(
  Canvas canvas,
  Size size, {
  int count = 40,
  double maxY = 0.6,
  int seed = 42,
}) {
  final random = math.Random(seed);
  for (int i = 0; i < count; i++) {
    final x = random.nextDouble() * size.width;
    final y = random.nextDouble() * size.height * maxY;
    final starSize = random.nextDouble() * 1.5 + 0.4;
    final opacity = 0.3 + random.nextDouble() * 0.5;
    
    // Occasional glow for brighter stars
    if (i % 8 == 0) {
      canvas.drawCircle(
        Offset(x, y),
        starSize * 2.5,
        Paint()..color = Colors.white.withOpacity(opacity * 0.3),
      );
    }
    
    canvas.drawCircle(
      Offset(x, y),
      starSize,
      Paint()..color = Colors.white.withOpacity(opacity),
    );
  }
}

/// Create a subtle vignette effect
void drawVignette(
  Canvas canvas,
  Size size, {
  double intensity = 0.3,
  double innerRadius = 0.5,
}) {
  canvas.drawRect(
    Rect.fromLTWH(0, 0, size.width, size.height),
    Paint()
      ..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(intensity)],
        stops: [innerRadius, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
  );
}

/// Create atmospheric particles
void drawAtmosphericParticles(
  Canvas canvas,
  Size size,
  Color color, {
  int count = 15,
  double minY = 0.2,
  double maxY = 0.7,
  int seed = 42,
}) {
  final random = math.Random(seed);
  for (int i = 0; i < count; i++) {
    final x = random.nextDouble() * size.width;
    final y = size.height * minY + random.nextDouble() * size.height * (maxY - minY);
    final particleSize = random.nextDouble() * 2 + 1;
    final opacity = random.nextDouble() * 0.2 + 0.05;
    
    canvas.drawCircle(
      Offset(x, y),
      particleSize,
      Paint()..color = color.withOpacity(opacity),
    );
  }
}

// =============================================================================
// PRE-BUILT SHADOW SHAPES
// =============================================================================

/// Create a mountain shadow path
Path createMountainPath(Size size, {
  double leftEdge = 0.1,
  double rightEdge = 0.9,
  double peakHeight = 0.25,
  double peakX = 0.5,
}) {
  return Path()
    ..moveTo(size.width * leftEdge, size.height)
    ..lineTo(size.width * peakX, size.height * peakHeight)
    ..lineTo(size.width * rightEdge, size.height)
    ..close();
}

/// Create a flame/teardrop shadow path
Path createFlamePath(Offset center, double width, double height) {
  return Path()
    ..moveTo(center.dx, center.dy + height * 0.5)
    ..quadraticBezierTo(
      center.dx - width * 0.5, center.dy + height * 0.1,
      center.dx - width * 0.35, center.dy - height * 0.2,
    )
    ..quadraticBezierTo(
      center.dx - width * 0.15, center.dy - height * 0.4,
      center.dx, center.dy - height * 0.5,
    )
    ..quadraticBezierTo(
      center.dx + width * 0.15, center.dy - height * 0.4,
      center.dx + width * 0.35, center.dy - height * 0.2,
    )
    ..quadraticBezierTo(
      center.dx + width * 0.5, center.dy + height * 0.1,
      center.dx, center.dy + height * 0.5,
    )
    ..close();
}

/// Create a crescent moon shadow path
Path createMoonPath(Offset center, double radius) {
  final path = Path();
  path.addOval(Rect.fromCircle(center: center, radius: radius));
  return path;
}

/// Create a lighthouse shadow path
Path createLighthousePath(Offset base, double width, double height) {
  return Path()
    ..moveTo(base.dx - width * 0.5, base.dy)
    ..lineTo(base.dx - width * 0.35, base.dy - height * 0.7)
    ..lineTo(base.dx - width * 0.45, base.dy - height * 0.75)
    ..lineTo(base.dx - width * 0.45, base.dy - height * 0.8)
    ..lineTo(base.dx - width * 0.3, base.dy - height * 0.8)
    ..lineTo(base.dx - width * 0.25, base.dy - height * 0.95)
    ..quadraticBezierTo(base.dx, base.dy - height, base.dx + width * 0.25, base.dy - height * 0.95)
    ..lineTo(base.dx + width * 0.3, base.dy - height * 0.8)
    ..lineTo(base.dx + width * 0.45, base.dy - height * 0.8)
    ..lineTo(base.dx + width * 0.45, base.dy - height * 0.75)
    ..lineTo(base.dx + width * 0.35, base.dy - height * 0.7)
    ..lineTo(base.dx + width * 0.5, base.dy)
    ..close();
}

/// Create a fox silhouette path
Path createFoxPath(Offset center, double size) {
  final path = Path();
  
  // Body oval
  path.addOval(Rect.fromCenter(
    center: Offset(center.dx, center.dy + size * 0.1),
    width: size * 0.6,
    height: size * 0.45,
  ));
  
  // Head
  path.addOval(Rect.fromCenter(
    center: Offset(center.dx, center.dy - size * 0.08),
    width: size * 0.45,
    height: size * 0.38,
  ));
  
  return path;
}

/// Create fox ears
void drawFoxEars(Canvas canvas, Offset headCenter, double size, Color color, Color glowColor) {
  for (final dir in [-1.0, 1.0]) {
    final earPath = Path()
      ..moveTo(headCenter.dx + dir * size * 0.12, headCenter.dy - size * 0.1)
      ..lineTo(headCenter.dx + dir * size * 0.18, headCenter.dy - size * 0.28)
      ..lineTo(headCenter.dx + dir * size * 0.05, headCenter.dy - size * 0.12)
      ..close();
    
    // Subtle glow
    drawShadowBlendGlow(canvas, earPath, glowColor, layers: 3, baseSpread: 3);
    canvas.drawPath(earPath, Paint()..color = color);
  }
}

/// Create a fox tail
void drawFoxTail(Canvas canvas, Offset bodyCenter, double size, Color color, Color glowColor) {
  final tailPath = Path()
    ..moveTo(bodyCenter.dx - size * 0.25, bodyCenter.dy + size * 0.1)
    ..quadraticBezierTo(
      bodyCenter.dx - size * 0.42,
      bodyCenter.dy - size * 0.05,
      bodyCenter.dx - size * 0.35,
      bodyCenter.dy - size * 0.15,
    );
  
  // Subtle glow
  for (int i = 3; i >= 0; i--) {
    canvas.drawPath(
      tailPath,
      Paint()
        ..color = glowColor.withOpacity(0.06 - i * 0.015)
        ..style = PaintingStyle.stroke
        ..strokeWidth = size * 0.12 + i * 3
        ..strokeCap = StrokeCap.round,
    );
  }
  
  canvas.drawPath(
    tailPath,
    Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size * 0.1
      ..strokeCap = StrokeCap.round,
  );
}
