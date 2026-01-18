import 'package:flutter/material.dart';
import 'dart:math' as math;

// ============================================================================
// CASTING CIRCLE HEADER
// ============================================================================

/// Header for Character Entry - Mystical casting circle theme
class CastingCircleHeaderPainter extends CustomPainter {
  final bool isDark;

  CastingCircleHeaderPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    // === LAYER 1: Night sky gradient ===
    final bgGradient = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [const Color(0xFF0D0D1A), const Color(0xFF1A1A2E), const Color(0xFF2D1B4E)]
            : [const Color(0xFF4C1D95), const Color(0xFF6D28D9), const Color(0xFF8B5CF6)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgGradient);

    // === LAYER 2: Stars ===
    final random = math.Random(42);
    final starPaint = Paint();
    for (int i = 0; i < 50; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.8;
      starPaint.color = Colors.white.withOpacity(random.nextDouble() * 0.6 + 0.2);
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.5 + 0.5, starPaint);
    }

    // === LAYER 3: Central casting circle ===
    final center = Offset(size.width / 2, size.height * 0.5);
    final circleRadius = size.width * 0.28;

    // Outer glow
    for (int i = 4; i >= 0; i--) {
      final glowPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFFD4AF37).withOpacity(0.2 - i * 0.03),
            Colors.transparent,
          ],
        ).createShader(Rect.fromCircle(center: center, radius: circleRadius + i * 15));
      canvas.drawCircle(center, circleRadius + i * 15, glowPaint);
    }

    // Main circle ring
    final ringPaint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawCircle(center, circleRadius, ringPaint);
    
    // Inner circle
    canvas.drawCircle(center, circleRadius * 0.7, ringPaint..strokeWidth = 1.5..color = const Color(0xFFD4AF37).withOpacity(0.5));

    // === LAYER 4: Mystical symbols around circle ===
    final symbolPaint = Paint()..color = const Color(0xFFD4AF37).withOpacity(0.7);
    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4;
      final symbolCenter = Offset(
        center.dx + (circleRadius + 20) * math.cos(angle),
        center.dy + (circleRadius + 20) * math.sin(angle),
      );
      _drawMysticalSymbol(canvas, symbolCenter, 8, symbolPaint, i);
    }

    // === LAYER 5: Runes inside circle ===
    final runePaint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    
    // Draw connecting lines
    for (int i = 0; i < 6; i++) {
      final angle1 = i * math.pi / 3;
      final angle2 = (i + 2) * math.pi / 3;
      canvas.drawLine(
        Offset(center.dx + circleRadius * 0.5 * math.cos(angle1), center.dy + circleRadius * 0.5 * math.sin(angle1)),
        Offset(center.dx + circleRadius * 0.5 * math.cos(angle2), center.dy + circleRadius * 0.5 * math.sin(angle2)),
        runePaint,
      );
    }

    // === LAYER 6: Central pentagram/star ===
    _drawStar(canvas, center, circleRadius * 0.35, Paint()..color = const Color(0xFFD4AF37).withOpacity(0.6));
    canvas.drawCircle(center, 8, Paint()..color = const Color(0xFFD4AF37).withOpacity(0.8));

    // === LAYER 7: Floating particles ===
    final particlePaint = Paint();
    for (int i = 0; i < 15; i++) {
      final x = center.dx + (random.nextDouble() - 0.5) * circleRadius * 2.5;
      final y = center.dy + (random.nextDouble() - 0.5) * circleRadius * 2;
      particlePaint.color = const Color(0xFFD4AF37).withOpacity(random.nextDouble() * 0.4 + 0.1);
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 2 + 1, particlePaint);
    }

    // === LAYER 8: Bottom fade ===
    final fadePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          (isDark ? const Color(0xFF1E1B2E) : const Color(0xFFFAF5FF)).withOpacity(0.95),
        ],
      ).createShader(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25));
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25), fadePaint);
  }

  void _drawMysticalSymbol(Canvas canvas, Offset center, double size, Paint paint, int type) {
    switch (type % 4) {
      case 0: // Star
        _drawStar(canvas, center, size, paint);
        break;
      case 1: // Diamond
        final path = Path();
        path.moveTo(center.dx, center.dy - size);
        path.lineTo(center.dx + size * 0.7, center.dy);
        path.lineTo(center.dx, center.dy + size);
        path.lineTo(center.dx - size * 0.7, center.dy);
        path.close();
        canvas.drawPath(path, paint);
        break;
      case 2: // Circle
        canvas.drawCircle(center, size * 0.6, paint);
        break;
      case 3: // Triangle
        final path = Path();
        path.moveTo(center.dx, center.dy - size);
        path.lineTo(center.dx + size, center.dy + size * 0.6);
        path.lineTo(center.dx - size, center.dy + size * 0.6);
        path.close();
        canvas.drawPath(path, paint);
        break;
    }
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final angle = (i * 4 * math.pi / 5) - math.pi / 2;
      final point = Offset(center.dx + radius * math.cos(angle), center.dy + radius * math.sin(angle));
      if (i == 0) path.moveTo(point.dx, point.dy);
      else path.lineTo(point.dx, point.dy);
    }
    path.close();
    canvas.drawPath(path, paint..style = PaintingStyle.stroke..strokeWidth = 1.5);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================================
// CHARACTER CARD ILLUSTRATIONS - MYSTERIOUS SHADOWS with PEEKING EYES
// Non-animal entities: Mountains, Moon, Clouds, Flowers, Hearts, Lighthouses
// ============================================================================

/// Mountain Shadow - Mysterious peak with peeking eyes (Misty Dawn)
class MountainShadowPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  MountainShadowPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(101);
    
    // === LAYER 1: Misty dawn gradient (lavender/pink/blue) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1A0A25),
          const Color(0xFF2D1B4E),
          const Color(0xFF6B4984),
          const Color(0xFFB794F4).withOpacity(0.4),
        ],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Rising sun glow behind mountains ===
    final sunCenter = Offset(size.width * 0.5, size.height * 0.55);
    for (int i = 8; i >= 0; i--) {
      canvas.drawCircle(sunCenter, 30 + i * 20.0, Paint()..color = const Color(0xFFFFB6C1).withOpacity(0.06 - i * 0.006));
    }
    canvas.drawCircle(sunCenter, 25, Paint()..shader = RadialGradient(
      colors: [const Color(0xFFFFE4E6), const Color(0xFFFFB6C1).withOpacity(0.5)],
    ).createShader(Rect.fromCircle(center: sunCenter, radius: 25)));

    // === LAYER 3: Stars fading in dawn ===
    for (int i = 0; i < 35; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.4;
      final opacity = 0.3 + random.nextDouble() * 0.4;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.2 + 0.3, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 4: Distant mountain range silhouettes ===
    final distantMtnPath = Path();
    distantMtnPath.moveTo(0, size.height * 0.65);
    distantMtnPath.lineTo(size.width * 0.15, size.height * 0.45);
    distantMtnPath.lineTo(size.width * 0.35, size.height * 0.55);
    distantMtnPath.lineTo(size.width * 0.55, size.height * 0.4);
    distantMtnPath.lineTo(size.width * 0.75, size.height * 0.5);
    distantMtnPath.lineTo(size.width, size.height * 0.42);
    distantMtnPath.lineTo(size.width, size.height * 0.65);
    distantMtnPath.close();
    canvas.drawPath(distantMtnPath, Paint()..color = const Color(0xFF2A1A35).withOpacity(0.5));

    // === LAYER 5: Mist layer ===
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.2),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFB794F4).withOpacity(0.15), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.2)),
    );

    // === LAYER 6: Main MOUNTAIN SHADOW (dark silhouette) ===
    final mountainPath = Path();
    mountainPath.moveTo(size.width * 0.1, size.height);
    mountainPath.lineTo(size.width * 0.5, size.height * 0.25);
    mountainPath.lineTo(size.width * 0.9, size.height);
    mountainPath.close();
    canvas.drawPath(mountainPath, Paint()..color = const Color(0xFF0A0510));
    
    // Snow cap hint
    final snowPath = Path();
    snowPath.moveTo(size.width * 0.42, size.height * 0.35);
    snowPath.lineTo(size.width * 0.5, size.height * 0.25);
    snowPath.lineTo(size.width * 0.58, size.height * 0.35);
    snowPath.quadraticBezierTo(size.width * 0.5, size.height * 0.38, size.width * 0.42, size.height * 0.35);
    canvas.drawPath(snowPath, Paint()..color = Colors.white.withOpacity(0.15));

    // === LAYER 7: PEEKING EYES (mysterious, glowing from shadow) ===
    final eyeY = size.height * 0.48;
    final eyeSpacing = size.width * 0.08;
    final eyeSize = size.width * 0.04;
    
    // Eye glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.5 - eyeSpacing, eyeY), width: eyeSize * 2 + i * 8, height: eyeSize * 1.5 + i * 6), Paint()..color = accentColor.withOpacity(0.1 - i * 0.02));
      canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.5 + eyeSpacing, eyeY), width: eyeSize * 2 + i * 8, height: eyeSize * 1.5 + i * 6), Paint()..color = accentColor.withOpacity(0.1 - i * 0.02));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.5 - eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.5 + eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (golden amber)
    canvas.drawCircle(Offset(size.width * 0.5 - eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(size.width * 0.5 + eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    
    // Pupils
    canvas.drawCircle(Offset(size.width * 0.5 - eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(size.width * 0.5 + eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(size.width * 0.5 - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(size.width * 0.5 + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    // === LAYER 8: Floating particles/mist wisps ===
    for (int i = 0; i < 20; i++) {
      final px = random.nextDouble() * size.width;
      final py = size.height * 0.3 + random.nextDouble() * size.height * 0.4;
      canvas.drawCircle(Offset(px, py), random.nextDouble() * 2 + 1, Paint()..color = accentColor.withOpacity(random.nextDouble() * 0.2 + 0.05));
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.35)], stops: const [0.5, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Moon Shadow - Crescent with peeking eyes (Starry Night)
class MoonShadowPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  MoonShadowPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(102);
    
    // === LAYER 1: Deep night sky gradient ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF050510),
          const Color(0xFF0A0A25),
          const Color(0xFF151545),
          const Color(0xFF1A1A55),
        ],
        stops: const [0.0, 0.3, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Nebula glow ===
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.25), size.width * 0.4, Paint()..shader = RadialGradient(colors: [const Color(0xFF6B5B95).withOpacity(0.1), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.3, size.height * 0.25), radius: size.width * 0.4)));
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.7), size.width * 0.35, Paint()..shader = RadialGradient(colors: [accentColor.withOpacity(0.08), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.7, size.height * 0.7), radius: size.width * 0.35)));

    // === LAYER 3: Twinkling stars (many!) ===
    for (int i = 0; i < 60; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final starSize = random.nextDouble() * 1.5 + 0.3;
      if (i % 12 == 0) {
        // Cross sparkle on some stars
        final sparkle = Paint()..color = Colors.white.withOpacity(0.3)..strokeWidth = 0.5;
        canvas.drawLine(Offset(x - 3, y), Offset(x + 3, y), sparkle);
        canvas.drawLine(Offset(x, y - 3), Offset(x, y + 3), sparkle);
      }
      canvas.drawCircle(Offset(x, y), starSize, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.6 + 0.3));
    }

    // === LAYER 4: Distant clouds silhouette ===
    final cloudPath = Path();
    cloudPath.moveTo(0, size.height * 0.85);
    cloudPath.quadraticBezierTo(size.width * 0.2, size.height * 0.78, size.width * 0.35, size.height * 0.82);
    cloudPath.quadraticBezierTo(size.width * 0.5, size.height * 0.75, size.width * 0.65, size.height * 0.8);
    cloudPath.quadraticBezierTo(size.width * 0.85, size.height * 0.77, size.width, size.height * 0.83);
    cloudPath.lineTo(size.width, size.height);
    cloudPath.lineTo(0, size.height);
    cloudPath.close();
    canvas.drawPath(cloudPath, Paint()..color = const Color(0xFF0A0A15).withOpacity(0.7));

    // === LAYER 5: MOON SHADOW (crescent silhouette) ===
    final moonCenter = Offset(size.width * 0.5, size.height * 0.42);
    final moonRadius = size.width * 0.28;
    
    // Moon outer glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(moonCenter, moonRadius + i * 12.0, Paint()..color = accentColor.withOpacity(0.06 - i * 0.01));
    }
    
    // Moon main body (dark)
    canvas.drawCircle(moonCenter, moonRadius, Paint()..color = const Color(0xFF0A0510));
    
    // Crescent highlight (slight glow on edge)
    final crescentPath = Path();
    crescentPath.addArc(Rect.fromCircle(center: moonCenter, radius: moonRadius), -math.pi * 0.6, math.pi * 1.2);
    crescentPath.arcTo(Rect.fromCircle(center: Offset(moonCenter.dx + moonRadius * 0.35, moonCenter.dy), radius: moonRadius * 0.85), math.pi * 0.6, -math.pi * 1.2, false);
    canvas.drawPath(crescentPath, Paint()..color = const Color(0xFF1A1A35));

    // === LAYER 6: PEEKING EYES (glowing from moon shadow) ===
    final eyeY = moonCenter.dy + moonRadius * 0.1;
    final eyeSpacing = moonRadius * 0.35;
    final eyeSize = moonRadius * 0.18;
    
    // Eye glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(moonCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2 + i * 6, height: eyeSize * 1.5 + i * 4), Paint()..color = accentColor.withOpacity(0.12 - i * 0.025));
      canvas.drawOval(Rect.fromCenter(center: Offset(moonCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2 + i * 6, height: eyeSize * 1.5 + i * 4), Paint()..color = accentColor.withOpacity(0.12 - i * 0.025));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(moonCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(moonCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (silvery blue)
    canvas.drawCircle(Offset(moonCenter.dx - eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFF9AE6B4));
    canvas.drawCircle(Offset(moonCenter.dx + eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFF9AE6B4));
    
    // Pupils
    canvas.drawCircle(Offset(moonCenter.dx - eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF0A0A1A));
    canvas.drawCircle(Offset(moonCenter.dx + eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF0A0A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(moonCenter.dx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.25), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(moonCenter.dx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.25), eyeSize * 0.2, Paint()..color = Colors.white);

    // === LAYER 7: Floating stardust ===
    for (int i = 0; i < 15; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.7;
      canvas.drawCircle(Offset(px, py), random.nextDouble() * 2.5 + 1, Paint()..color = accentColor.withOpacity(random.nextDouble() * 0.25 + 0.1));
    }

    // === LAYER 8: Vignette ===
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.45, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Cloud Shadow - Fluffy cloud with peeking eyes (Sunset Sky)
class CloudShadowPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  CloudShadowPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(103);
    
    // === LAYER 1: Sunset gradient (orange/pink/purple) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1A0520),
          const Color(0xFF4A1942),
          const Color(0xFFFF6B6B).withOpacity(0.5),
          const Color(0xFFFFD93D).withOpacity(0.4),
        ],
        stops: const [0.0, 0.25, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Setting sun ===
    final sunCenter = Offset(size.width * 0.5, size.height * 0.85);
    for (int i = 6; i >= 0; i--) {
      canvas.drawCircle(sunCenter, 30 + i * 18.0, Paint()..color = const Color(0xFFFFD93D).withOpacity(0.08 - i * 0.01));
    }
    canvas.drawCircle(sunCenter, 28, Paint()..shader = RadialGradient(colors: [const Color(0xFFFFFFE0), const Color(0xFFFFD93D)]).createShader(Rect.fromCircle(center: sunCenter, radius: 28)));

    // === LAYER 3: Soft wispy clouds (background) ===
    for (int c = 0; c < 4; c++) {
      final cx = size.width * (0.15 + c * 0.25);
      final cy = size.height * (0.15 + random.nextDouble() * 0.15);
      final cloudColor = const Color(0xFFFFB6C1).withOpacity(0.3);
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: 50 + random.nextDouble() * 30, height: 18), Paint()..color = cloudColor);
      canvas.drawOval(Rect.fromCenter(center: Offset(cx + 20, cy - 5), width: 35, height: 14), Paint()..color = cloudColor);
    }

    // === LAYER 4: Distant landscape silhouette ===
    final landscapePath = Path();
    landscapePath.moveTo(0, size.height);
    landscapePath.lineTo(0, size.height * 0.88);
    landscapePath.quadraticBezierTo(size.width * 0.25, size.height * 0.82, size.width * 0.5, size.height * 0.85);
    landscapePath.quadraticBezierTo(size.width * 0.75, size.height * 0.88, size.width, size.height * 0.84);
    landscapePath.lineTo(size.width, size.height);
    landscapePath.close();
    canvas.drawPath(landscapePath, Paint()..color = const Color(0xFF1A0A15).withOpacity(0.7));

    // === LAYER 5: CLOUD SHADOW (main fluffy cloud silhouette) ===
    final cloudCenter = Offset(size.width * 0.5, size.height * 0.45);
    
    // Cloud outer glow
    for (int i = 4; i >= 0; i--) {
      final glowPath = Path();
      glowPath.addOval(Rect.fromCenter(center: cloudCenter, width: size.width * 0.7 + i * 15, height: size.height * 0.35 + i * 10));
      canvas.drawPath(glowPath, Paint()..color = accentColor.withOpacity(0.06 - i * 0.012));
    }
    
    // Cloud shadow body (dark puffy shapes)
    final cloudShadow = Paint()..color = const Color(0xFF0A0510);
    canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx - size.width * 0.15, cloudCenter.dy), width: size.width * 0.35, height: size.height * 0.25), cloudShadow);
    canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx + size.width * 0.1, cloudCenter.dy - size.height * 0.02), width: size.width * 0.38, height: size.height * 0.28), cloudShadow);
    canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx - size.width * 0.02, cloudCenter.dy + size.height * 0.06), width: size.width * 0.45, height: size.height * 0.22), cloudShadow);
    canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx + size.width * 0.2, cloudCenter.dy + size.height * 0.03), width: size.width * 0.28, height: size.height * 0.2), cloudShadow);

    // === LAYER 6: PEEKING EYES ===
    final eyeY = cloudCenter.dy;
    final eyeSpacing = size.width * 0.08;
    final eyeSize = size.width * 0.045;
    
    // Eye glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2 + i * 8, height: eyeSize * 1.5 + i * 6), Paint()..color = accentColor.withOpacity(0.12 - i * 0.025));
      canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2 + i * 8, height: eyeSize * 1.5 + i * 6), Paint()..color = accentColor.withOpacity(0.12 - i * 0.025));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(cloudCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (warm orange)
    canvas.drawCircle(Offset(cloudCenter.dx - eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(cloudCenter.dx + eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    
    // Pupils
    canvas.drawCircle(Offset(cloudCenter.dx - eyeSpacing, eyeY + eyeSize * 0.1), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cloudCenter.dx + eyeSpacing, eyeY + eyeSize * 0.1), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(cloudCenter.dx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.25), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cloudCenter.dx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.25), eyeSize * 0.2, Paint()..color = Colors.white);

    // === LAYER 7: Floating sparkles ===
    for (int i = 0; i < 18; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.75;
      canvas.drawCircle(Offset(px, py), random.nextDouble() * 2 + 0.5, Paint()..color = const Color(0xFFFFD93D).withOpacity(random.nextDouble() * 0.3 + 0.1));
    }

    // === LAYER 8: Vignette ===
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.3)], stops: const [0.5, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Flower Shadow - Mystical bloom with peeking eyes (Twilight Garden)
class FlowerShadowPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  FlowerShadowPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(104);
    
    // === LAYER 1: Twilight garden gradient (deep purple/teal) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0A0518),
          const Color(0xFF1A0A30),
          const Color(0xFF152535),
          const Color(0xFF1A3A2A).withOpacity(0.6),
        ],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Mystical glow ===
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.5), size.width * 0.5, Paint()..shader = RadialGradient(colors: [accentColor.withOpacity(0.12), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.5), radius: size.width * 0.5)));

    // === LAYER 3: Stars/fireflies ===
    for (int i = 0; i < 40; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final isFirefly = i % 5 == 0;
      final dotSize = isFirefly ? random.nextDouble() * 2.5 + 1 : random.nextDouble() * 1.2 + 0.3;
      final color = isFirefly ? const Color(0xFF9AE6B4) : Colors.white;
      if (isFirefly) {
        canvas.drawCircle(Offset(x, y), dotSize + 3, Paint()..color = color.withOpacity(0.15));
      }
      canvas.drawCircle(Offset(x, y), dotSize, Paint()..color = color.withOpacity(random.nextDouble() * 0.5 + 0.3));
    }

    // === LAYER 4: Garden floor silhouette ===
    final gardenPath = Path();
    gardenPath.moveTo(0, size.height);
    gardenPath.lineTo(0, size.height * 0.75);
    gardenPath.quadraticBezierTo(size.width * 0.25, size.height * 0.7, size.width * 0.5, size.height * 0.72);
    gardenPath.quadraticBezierTo(size.width * 0.75, size.height * 0.74, size.width, size.height * 0.7);
    gardenPath.lineTo(size.width, size.height);
    gardenPath.close();
    canvas.drawPath(gardenPath, Paint()..color = const Color(0xFF0A1A12));
    
    // Grass tufts
    for (int i = 0; i < 20; i++) {
      final gx = random.nextDouble() * size.width;
      final gy = size.height * 0.73 + random.nextDouble() * size.height * 0.15;
      canvas.drawLine(Offset(gx, gy), Offset(gx - 2, gy - 8), Paint()..color = const Color(0xFF1A3A25)..strokeWidth = 1.5..strokeCap = StrokeCap.round);
      canvas.drawLine(Offset(gx, gy), Offset(gx + 2, gy - 6), Paint()..color = const Color(0xFF1A3A25)..strokeWidth = 1.5..strokeCap = StrokeCap.round);
    }

    // === LAYER 5: FLOWER SHADOW (mystical bloom silhouette) ===
    final flowerCenter = Offset(size.width * 0.5, size.height * 0.48);
    final petalRadius = size.width * 0.18;
    
    // Flower outer glow
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(flowerCenter, petalRadius * 1.8 + i * 12, Paint()..color = accentColor.withOpacity(0.08 - i * 0.015));
    }
    
    // Petals (dark silhouette)
    final petalPaint = Paint()..color = const Color(0xFF0A0510);
    for (int p = 0; p < 6; p++) {
      final angle = p * math.pi / 3 - math.pi / 6;
      final petalPath = Path();
      petalPath.moveTo(flowerCenter.dx, flowerCenter.dy);
      petalPath.quadraticBezierTo(
        flowerCenter.dx + petalRadius * 0.7 * math.cos(angle - 0.4),
        flowerCenter.dy + petalRadius * 0.7 * math.sin(angle - 0.4),
        flowerCenter.dx + petalRadius * 1.3 * math.cos(angle),
        flowerCenter.dy + petalRadius * 1.3 * math.sin(angle),
      );
      petalPath.quadraticBezierTo(
        flowerCenter.dx + petalRadius * 0.7 * math.cos(angle + 0.4),
        flowerCenter.dy + petalRadius * 0.7 * math.sin(angle + 0.4),
        flowerCenter.dx, flowerCenter.dy,
      );
      canvas.drawPath(petalPath, petalPaint);
    }
    
    // Center circle (slightly lighter)
    canvas.drawCircle(flowerCenter, petalRadius * 0.45, Paint()..color = const Color(0xFF151520));

    // === LAYER 6: PEEKING EYES ===
    final eyeY = flowerCenter.dy;
    final eyeSpacing = petalRadius * 0.35;
    final eyeSize = petalRadius * 0.22;
    
    // Eye glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(flowerCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2 + i * 6, height: eyeSize * 1.5 + i * 4), Paint()..color = accentColor.withOpacity(0.15 - i * 0.03));
      canvas.drawOval(Rect.fromCenter(center: Offset(flowerCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2 + i * 6, height: eyeSize * 1.5 + i * 4), Paint()..color = accentColor.withOpacity(0.15 - i * 0.03));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(flowerCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(flowerCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (magenta/pink)
    canvas.drawCircle(Offset(flowerCenter.dx - eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBB6CE));
    canvas.drawCircle(Offset(flowerCenter.dx + eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBB6CE));
    
    // Pupils
    canvas.drawCircle(Offset(flowerCenter.dx - eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(flowerCenter.dx + eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(flowerCenter.dx - eyeSpacing - eyeSize * 0.25, eyeY - eyeSize * 0.25), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(flowerCenter.dx + eyeSpacing - eyeSize * 0.25, eyeY - eyeSize * 0.25), eyeSize * 0.2, Paint()..color = Colors.white);

    // === LAYER 7: Stem silhouette ===
    canvas.drawLine(Offset(flowerCenter.dx, flowerCenter.dy + petalRadius * 0.4), Offset(flowerCenter.dx, size.height * 0.78), Paint()..color = const Color(0xFF0A0510)..strokeWidth = 6..strokeCap = StrokeCap.round);

    // === LAYER 8: Floating pollen/sparkles ===
    for (int i = 0; i < 15; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.7;
      canvas.drawCircle(Offset(px, py), random.nextDouble() * 2 + 1, Paint()..color = accentColor.withOpacity(random.nextDouble() * 0.3 + 0.1));
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.45, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Heart Shadow - Glowing heart with peeking eyes (Romantic Dusk)
class HeartShadowPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  HeartShadowPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(105);
    
    // === LAYER 1: Romantic dusk gradient (rose/coral/purple) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1A0A20),
          const Color(0xFF3D1A35),
          const Color(0xFFE8758F).withOpacity(0.4),
          const Color(0xFFFFB6C1).withOpacity(0.3),
        ],
        stops: const [0.0, 0.3, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Soft radial glow ===
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.45), size.width * 0.55, Paint()..shader = RadialGradient(colors: [accentColor.withOpacity(0.15), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.45), radius: size.width * 0.55)));

    // === LAYER 3: Floating mini hearts (background) ===
    for (int i = 0; i < 15; i++) {
      final hx = random.nextDouble() * size.width;
      final hy = random.nextDouble() * size.height;
      final hs = 4 + random.nextDouble() * 6;
      final heartPath = Path();
      heartPath.moveTo(hx, hy + hs * 0.3);
      heartPath.cubicTo(hx - hs * 0.5, hy - hs * 0.2, hx - hs * 0.5, hy - hs * 0.6, hx, hy - hs * 0.3);
      heartPath.cubicTo(hx + hs * 0.5, hy - hs * 0.6, hx + hs * 0.5, hy - hs * 0.2, hx, hy + hs * 0.3);
      canvas.drawPath(heartPath, Paint()..color = accentColor.withOpacity(random.nextDouble() * 0.2 + 0.1));
    }

    // === LAYER 4: Stars ===
    for (int i = 0; i < 35; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.5;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.2 + 0.3, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.4 + 0.25));
    }

    // === LAYER 5: HEART SHADOW (main silhouette) ===
    final heartCenter = Offset(size.width * 0.5, size.height * 0.48);
    final heartSize = size.width * 0.35;
    
    // Heart outer glow
    for (int i = 5; i >= 0; i--) {
      final glowPath = Path();
      final gs = heartSize + i * 12;
      glowPath.moveTo(heartCenter.dx, heartCenter.dy + gs * 0.45);
      glowPath.cubicTo(heartCenter.dx - gs * 0.55, heartCenter.dy + gs * 0.1, heartCenter.dx - gs * 0.55, heartCenter.dy - gs * 0.35, heartCenter.dx, heartCenter.dy - gs * 0.15);
      glowPath.cubicTo(heartCenter.dx + gs * 0.55, heartCenter.dy - gs * 0.35, heartCenter.dx + gs * 0.55, heartCenter.dy + gs * 0.1, heartCenter.dx, heartCenter.dy + gs * 0.45);
      canvas.drawPath(glowPath, Paint()..color = accentColor.withOpacity(0.08 - i * 0.012));
    }
    
    // Heart shadow body
    final heartPath = Path();
    heartPath.moveTo(heartCenter.dx, heartCenter.dy + heartSize * 0.45);
    heartPath.cubicTo(heartCenter.dx - heartSize * 0.55, heartCenter.dy + heartSize * 0.1, heartCenter.dx - heartSize * 0.55, heartCenter.dy - heartSize * 0.35, heartCenter.dx, heartCenter.dy - heartSize * 0.15);
    heartPath.cubicTo(heartCenter.dx + heartSize * 0.55, heartCenter.dy - heartSize * 0.35, heartCenter.dx + heartSize * 0.55, heartCenter.dy + heartSize * 0.1, heartCenter.dx, heartCenter.dy + heartSize * 0.45);
    canvas.drawPath(heartPath, Paint()..color = const Color(0xFF0A0510));

    // === LAYER 6: PEEKING EYES ===
    final eyeY = heartCenter.dy - heartSize * 0.05;
    final eyeSpacing = heartSize * 0.2;
    final eyeSize = heartSize * 0.12;
    
    // Eye glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(heartCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2 + i * 6, height: eyeSize * 1.5 + i * 4), Paint()..color = accentColor.withOpacity(0.15 - i * 0.03));
      canvas.drawOval(Rect.fromCenter(center: Offset(heartCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2 + i * 6, height: eyeSize * 1.5 + i * 4), Paint()..color = accentColor.withOpacity(0.15 - i * 0.03));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(heartCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(heartCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (coral pink)
    canvas.drawCircle(Offset(heartCenter.dx - eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFF8FAB));
    canvas.drawCircle(Offset(heartCenter.dx + eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFF8FAB));
    
    // Pupils
    canvas.drawCircle(Offset(heartCenter.dx - eyeSpacing + eyeSize * 0.1, eyeY + eyeSize * 0.1), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(heartCenter.dx + eyeSpacing + eyeSize * 0.1, eyeY + eyeSize * 0.1), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(heartCenter.dx - eyeSpacing - eyeSize * 0.25, eyeY - eyeSize * 0.2), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(heartCenter.dx + eyeSpacing - eyeSize * 0.25, eyeY - eyeSize * 0.2), eyeSize * 0.2, Paint()..color = Colors.white);

    // === LAYER 7: Sparkles ===
    for (int i = 0; i < 18; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.75;
      final sparkleSize = 2 + random.nextDouble() * 3;
      if (i % 4 == 0) {
        canvas.drawLine(Offset(sx - sparkleSize, sy), Offset(sx + sparkleSize, sy), Paint()..color = Colors.white.withOpacity(0.3)..strokeWidth = 1);
        canvas.drawLine(Offset(sx, sy - sparkleSize), Offset(sx, sy + sparkleSize), Paint()..color = Colors.white.withOpacity(0.3)..strokeWidth = 1);
      }
      canvas.drawCircle(Offset(sx, sy), random.nextDouble() * 1.5 + 0.5, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.35 + 0.15));
    }

    // === LAYER 8: Vignette ===
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.35)], stops: const [0.5, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Lighthouse Shadow - Coastal beacon with peeking eyes (Coastal Night)
class LighthouseShadowPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  LighthouseShadowPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(106);
    
    // === LAYER 1: Coastal night gradient (deep blue/teal) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF050512),
          const Color(0xFF0A1525),
          const Color(0xFF143D55),
          const Color(0xFF1A4A5A).withOpacity(0.6),
        ],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Moon and moonlight on water ===
    final moonCenter = Offset(size.width * 0.82, size.height * 0.12);
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(moonCenter, 12 + i * 8.0, Paint()..color = Colors.white.withOpacity(0.05 - i * 0.008));
    }
    canvas.drawCircle(moonCenter, 10, Paint()..color = const Color(0xFFFFFFF0));

    // === LAYER 3: Stars ===
    for (int i = 0; i < 50; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.45;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.3 + 0.3, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.25));
    }

    // === LAYER 4: Ocean waves silhouette ===
    final wavePath = Path();
    wavePath.moveTo(0, size.height);
    wavePath.lineTo(0, size.height * 0.75);
    for (double x = 0; x <= size.width; x += 20) {
      wavePath.quadraticBezierTo(x + 10, size.height * 0.72 + math.sin(x * 0.1) * 5, x + 20, size.height * 0.75);
    }
    wavePath.lineTo(size.width, size.height);
    wavePath.close();
    canvas.drawPath(wavePath, Paint()..color = const Color(0xFF0A1520));
    
    // Wave highlights
    for (int w = 0; w < 5; w++) {
      final wy = size.height * 0.78 + w * 5;
      canvas.drawLine(Offset(random.nextDouble() * size.width * 0.3, wy), Offset(random.nextDouble() * size.width * 0.3 + 30, wy), Paint()..color = Colors.white.withOpacity(0.08)..strokeWidth = 1.5..strokeCap = StrokeCap.round);
      canvas.drawLine(Offset(size.width * 0.5 + random.nextDouble() * size.width * 0.4, wy + 2), Offset(size.width * 0.5 + random.nextDouble() * size.width * 0.4 + 25, wy + 2), Paint()..color = Colors.white.withOpacity(0.06)..strokeWidth = 1..strokeCap = StrokeCap.round);
    }

    // === LAYER 5: Cliff/rocky shore silhouette ===
    final cliffPath = Path();
    cliffPath.moveTo(0, size.height);
    cliffPath.lineTo(0, size.height * 0.65);
    cliffPath.quadraticBezierTo(size.width * 0.1, size.height * 0.6, size.width * 0.25, size.height * 0.68);
    cliffPath.quadraticBezierTo(size.width * 0.35, size.height * 0.72, size.width * 0.4, size.height * 0.7);
    cliffPath.lineTo(size.width * 0.4, size.height);
    cliffPath.close();
    canvas.drawPath(cliffPath, Paint()..color = const Color(0xFF08080F));

    // === LAYER 6: LIGHTHOUSE SHADOW ===
    final lhBase = Offset(size.width * 0.28, size.height * 0.7);
    final lhTopY = size.height * 0.25;
    final lhWidth = size.width * 0.12;
    
    // Lighthouse beam glow
    final beamPath = Path();
    beamPath.moveTo(lhBase.dx, lhTopY + 10);
    beamPath.lineTo(lhBase.dx - size.width * 0.4, lhTopY - 20);
    beamPath.lineTo(lhBase.dx - size.width * 0.35, lhTopY + 5);
    beamPath.close();
    canvas.drawPath(beamPath, Paint()..shader = LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [accentColor.withOpacity(0.25), Colors.transparent],
    ).createShader(Rect.fromLTWH(lhBase.dx - size.width * 0.45, lhTopY - 25, size.width * 0.45, 40)));
    
    // Second beam
    final beam2Path = Path();
    beam2Path.moveTo(lhBase.dx, lhTopY + 10);
    beam2Path.lineTo(lhBase.dx + size.width * 0.5, lhTopY + 30);
    beam2Path.lineTo(lhBase.dx + size.width * 0.45, lhTopY + 50);
    beam2Path.close();
    canvas.drawPath(beam2Path, Paint()..shader = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [accentColor.withOpacity(0.2), Colors.transparent],
    ).createShader(Rect.fromLTWH(lhBase.dx, lhTopY, size.width * 0.55, 60)));
    
    // Lighthouse body (dark silhouette)
    final lhPath = Path();
    lhPath.moveTo(lhBase.dx - lhWidth * 0.5, lhBase.dy);
    lhPath.lineTo(lhBase.dx - lhWidth * 0.35, lhTopY + 15);
    lhPath.lineTo(lhBase.dx - lhWidth * 0.4, lhTopY + 15);
    lhPath.lineTo(lhBase.dx - lhWidth * 0.4, lhTopY);
    lhPath.quadraticBezierTo(lhBase.dx, lhTopY - 10, lhBase.dx + lhWidth * 0.4, lhTopY);
    lhPath.lineTo(lhBase.dx + lhWidth * 0.4, lhTopY + 15);
    lhPath.lineTo(lhBase.dx + lhWidth * 0.35, lhTopY + 15);
    lhPath.lineTo(lhBase.dx + lhWidth * 0.5, lhBase.dy);
    lhPath.close();
    canvas.drawPath(lhPath, Paint()..color = const Color(0xFF0A0510));
    
    // Light housing glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawCircle(Offset(lhBase.dx, lhTopY + 5), 12 + i * 6.0, Paint()..color = accentColor.withOpacity(0.12 - i * 0.025));
    }

    // === LAYER 7: PEEKING EYES (in the light housing) ===
    final eyeY = lhTopY + 5;
    final eyeSpacing = lhWidth * 0.2;
    final eyeSize = lhWidth * 0.18;
    
    // Eye glow
    for (int i = 2; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(lhBase.dx - eyeSpacing, eyeY), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3), Paint()..color = accentColor.withOpacity(0.15 - i * 0.04));
      canvas.drawOval(Rect.fromCenter(center: Offset(lhBase.dx + eyeSpacing, eyeY), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3), Paint()..color = accentColor.withOpacity(0.15 - i * 0.04));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(lhBase.dx - eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(lhBase.dx + eyeSpacing, eyeY), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (golden)
    canvas.drawCircle(Offset(lhBase.dx - eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(lhBase.dx + eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    
    // Pupils
    canvas.drawCircle(Offset(lhBase.dx - eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF0A0A1A));
    canvas.drawCircle(Offset(lhBase.dx + eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF0A0A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(lhBase.dx - eyeSpacing - eyeSize * 0.25, eyeY - eyeSize * 0.2), eyeSize * 0.18, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(lhBase.dx + eyeSpacing - eyeSize * 0.25, eyeY - eyeSize * 0.2), eyeSize * 0.18, Paint()..color = Colors.white);

    // === LAYER 8: Sea spray particles ===
    for (int i = 0; i < 20; i++) {
      final px = random.nextDouble() * size.width;
      final py = size.height * 0.65 + random.nextDouble() * size.height * 0.25;
      canvas.drawCircle(Offset(px, py), random.nextDouble() * 1.5 + 0.5, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.15 + 0.05));
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.4, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Keep old animal painters for other pages (Story, Clarification, etc.)
/// Lion - Courage, strength - CONFIDENT expression
class LionIllustrationPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  LionIllustrationPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);
    
    // === LAYER 1: Epic sunset gradient ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1a0533),
          const Color(0xFF2D1B4E),
          const Color(0xFFFF6B35).withOpacity(0.5),
          const Color(0xFFFFAB4C).withOpacity(0.3),
        ],
        stops: const [0.0, 0.25, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Distant mountain silhouettes ===
    final mountainPath = Path();
    mountainPath.moveTo(0, size.height * 0.7);
    mountainPath.lineTo(size.width * 0.15, size.height * 0.5);
    mountainPath.lineTo(size.width * 0.3, size.height * 0.6);
    mountainPath.lineTo(size.width * 0.5, size.height * 0.4);
    mountainPath.lineTo(size.width * 0.7, size.height * 0.55);
    mountainPath.lineTo(size.width * 0.85, size.height * 0.35);
    mountainPath.lineTo(size.width, size.height * 0.5);
    mountainPath.lineTo(size.width, size.height * 0.7);
    mountainPath.close();
    canvas.drawPath(mountainPath, Paint()..color = const Color(0xFF1A0A25).withOpacity(0.6));

    // === LAYER 3: Setting sun with rays ===
    final sunCenter = Offset(size.width * 0.78, size.height * 0.35);
    // Sun rays
    for (int i = 0; i < 12; i++) {
      final angle = i * math.pi / 6;
      canvas.drawLine(
        Offset(sunCenter.dx + 25 * math.cos(angle), sunCenter.dy + 25 * math.sin(angle)),
        Offset(sunCenter.dx + 50 * math.cos(angle), sunCenter.dy + 50 * math.sin(angle)),
        Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.15)..strokeWidth = 4..strokeCap = StrokeCap.round,
      );
    }
    // Sun glow layers
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(sunCenter, 22 + i * 8.0, Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.1 - i * 0.015));
    }
    canvas.drawCircle(sunCenter, 20, Paint()..color = const Color(0xFFFFE4B5));

    // === LAYER 4: Stars ===
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.4;
      final starSize = random.nextDouble() * 1.5 + 0.4;
      if (i % 8 == 0) {
        canvas.drawCircle(Offset(x, y), starSize * 2.5, Paint()..color = Colors.white.withOpacity(0.15));
      }
      canvas.drawCircle(Offset(x, y), starSize, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.3));
    }

    // === LAYER 5: Rocky cliff with texture ===
    final cliffPath = Path();
    cliffPath.moveTo(0, size.height * 0.78);
    cliffPath.quadraticBezierTo(size.width * 0.15, size.height * 0.72, size.width * 0.35, size.height * 0.68);
    cliffPath.quadraticBezierTo(size.width * 0.55, size.height * 0.64, size.width * 0.75, size.height * 0.7);
    cliffPath.quadraticBezierTo(size.width * 0.9, size.height * 0.74, size.width, size.height * 0.72);
    cliffPath.lineTo(size.width, size.height);
    cliffPath.lineTo(0, size.height);
    cliffPath.close();
    canvas.drawPath(cliffPath, Paint()..shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xFF2A1A35), const Color(0xFF1A0A20)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4)));
    
    // Cliff texture
    for (int i = 0; i < 8; i++) {
      final px = random.nextDouble() * size.width;
      final py = size.height * 0.75 + random.nextDouble() * size.height * 0.15;
      canvas.drawOval(
        Rect.fromCenter(center: Offset(px, py), width: 15 + random.nextDouble() * 10, height: 5 + random.nextDouble() * 5),
        Paint()..color = const Color(0xFF3A2A45).withOpacity(0.3),
      );
    }

    // === LAYER 6: Majestic Lion (properly connected anatomy) ===
    final cx = size.width * 0.38;
    final cy = size.height * 0.52;
    final lionScale = size.width * 0.0045;
    
    // Mane - multiple layered fluffy shapes
    final maneColor = accentColor;
    final maneColorDark = Color.lerp(accentColor, const Color(0xFF4A2500), 0.3)!;
    
    // Outer mane (fluffy edges)
    for (int i = 0; i < 16; i++) {
      final angle = i * math.pi / 8 - math.pi / 2;
      final fluffPath = Path();
      final baseRadius = 38 * lionScale;
      final tipRadius = 52 * lionScale;
      fluffPath.moveTo(cx + baseRadius * math.cos(angle - 0.12), cy + baseRadius * math.sin(angle - 0.12));
      fluffPath.quadraticBezierTo(
        cx + tipRadius * 1.1 * math.cos(angle),
        cy + tipRadius * 1.1 * math.sin(angle),
        cx + baseRadius * math.cos(angle + 0.12),
        cy + baseRadius * math.sin(angle + 0.12),
      );
      canvas.drawPath(fluffPath, Paint()..color = maneColorDark);
    }
    
    // Inner mane (solid)
    canvas.drawCircle(Offset(cx, cy), 36 * lionScale, Paint()..shader = RadialGradient(
      center: const Alignment(-0.3, -0.4),
      colors: [maneColor, maneColorDark],
    ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: 36 * lionScale)));
    
    // Body - connected smoothly to mane
    final bodyPath = Path();
    bodyPath.moveTo(cx - 20 * lionScale, cy + 15 * lionScale);
    bodyPath.quadraticBezierTo(cx - 28 * lionScale, cy + 30 * lionScale, cx - 22 * lionScale, cy + 50 * lionScale);
    bodyPath.quadraticBezierTo(cx - 18 * lionScale, cy + 60 * lionScale, cx, cy + 62 * lionScale);
    bodyPath.quadraticBezierTo(cx + 18 * lionScale, cy + 60 * lionScale, cx + 22 * lionScale, cy + 50 * lionScale);
    bodyPath.quadraticBezierTo(cx + 28 * lionScale, cy + 30 * lionScale, cx + 20 * lionScale, cy + 15 * lionScale);
    bodyPath.close();
    canvas.drawPath(bodyPath, Paint()..color = const Color(0xFFD4A574));
    
    // Front legs - naturally flowing from body
    final legPaint = Paint()..color = const Color(0xFFD4A574);
    // Left leg
    final leftLegPath = Path();
    leftLegPath.moveTo(cx - 14 * lionScale, cy + 45 * lionScale);
    leftLegPath.quadraticBezierTo(cx - 16 * lionScale, cy + 55 * lionScale, cx - 14 * lionScale, cy + 68 * lionScale);
    leftLegPath.lineTo(cx - 8 * lionScale, cy + 68 * lionScale);
    leftLegPath.quadraticBezierTo(cx - 6 * lionScale, cy + 55 * lionScale, cx - 8 * lionScale, cy + 45 * lionScale);
    leftLegPath.close();
    canvas.drawPath(leftLegPath, legPaint);
    // Left paw
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - 11 * lionScale, cy + 70 * lionScale), width: 10 * lionScale, height: 6 * lionScale), legPaint);
    
    // Right leg
    final rightLegPath = Path();
    rightLegPath.moveTo(cx + 8 * lionScale, cy + 45 * lionScale);
    rightLegPath.quadraticBezierTo(cx + 6 * lionScale, cy + 55 * lionScale, cx + 8 * lionScale, cy + 68 * lionScale);
    rightLegPath.lineTo(cx + 14 * lionScale, cy + 68 * lionScale);
    rightLegPath.quadraticBezierTo(cx + 16 * lionScale, cy + 55 * lionScale, cx + 14 * lionScale, cy + 45 * lionScale);
    rightLegPath.close();
    canvas.drawPath(rightLegPath, legPaint);
    // Right paw
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + 11 * lionScale, cy + 70 * lionScale), width: 10 * lionScale, height: 6 * lionScale), legPaint);
    
    // Face
    canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy - 2 * lionScale), width: 32 * lionScale, height: 28 * lionScale), Paint()..color = const Color(0xFFD4A574));
    
    // Snout area (lighter)
    canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy + 5 * lionScale), width: 18 * lionScale, height: 12 * lionScale), Paint()..color = const Color(0xFFE8D4B8));
    
    // Ears (rounded, tucked into mane)
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - 18 * lionScale, cy - 20 * lionScale), width: 12 * lionScale, height: 14 * lionScale), Paint()..color = const Color(0xFFD4A574));
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + 18 * lionScale, cy - 20 * lionScale), width: 12 * lionScale, height: 14 * lionScale), Paint()..color = const Color(0xFFD4A574));
    // Inner ears
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - 18 * lionScale, cy - 20 * lionScale), width: 7 * lionScale, height: 8 * lionScale), Paint()..color = const Color(0xFFFFB6C1).withOpacity(0.5));
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + 18 * lionScale, cy - 20 * lionScale), width: 7 * lionScale, height: 8 * lionScale), Paint()..color = const Color(0xFFFFB6C1).withOpacity(0.5));
    
    // === EYES - CONFIDENT expression (open, looking forward) ===
    final eyeY = cy - 6 * lionScale;
    final eyeSpacing = 8 * lionScale;
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - eyeSpacing, eyeY), width: 10 * lionScale, height: 8 * lionScale), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + eyeSpacing, eyeY), width: 10 * lionScale, height: 8 * lionScale), Paint()..color = const Color(0xFFFFFFF0));
    // Irises (amber)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), 4 * lionScale, Paint()..color = const Color(0xFFD4A500));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), 4 * lionScale, Paint()..color = const Color(0xFFD4A500));
    // Pupils
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), 2 * lionScale, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), 2 * lionScale, Paint()..color = const Color(0xFF1A1A1A));
    // Eye shine
    canvas.drawCircle(Offset(cx - eyeSpacing - 1.5 * lionScale, eyeY - 1.5 * lionScale), 1.5 * lionScale, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - 1.5 * lionScale, eyeY - 1.5 * lionScale), 1.5 * lionScale, Paint()..color = Colors.white);
    
    // Nose
    final nosePath = Path();
    nosePath.moveTo(cx, cy + 2 * lionScale);
    nosePath.lineTo(cx - 5 * lionScale, cy + 8 * lionScale);
    nosePath.quadraticBezierTo(cx, cy + 10 * lionScale, cx + 5 * lionScale, cy + 8 * lionScale);
    nosePath.close();
    canvas.drawPath(nosePath, Paint()..color = const Color(0xFF3D2B1F));
    
    // Gentle confident smile
    canvas.drawArc(
      Rect.fromCenter(center: Offset(cx, cy + 12 * lionScale), width: 12 * lionScale, height: 6 * lionScale),
      0.15, 2.8, false,
      Paint()..color = const Color(0xFF3D2B1F)..style = PaintingStyle.stroke..strokeWidth = 1.5,
    );
    
    // Whisker dots
    canvas.drawCircle(Offset(cx - 8 * lionScale, cy + 6 * lionScale), 1, Paint()..color = const Color(0xFF3D2B1F));
    canvas.drawCircle(Offset(cx + 8 * lionScale, cy + 6 * lionScale), 1, Paint()..color = const Color(0xFF3D2B1F));

    // === LAYER 7: Floating embers/dust ===
    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final y = size.height * 0.25 + random.nextDouble() * size.height * 0.5;
      final emberSize = random.nextDouble() * 2.5 + 0.5;
      canvas.drawCircle(Offset(x, y), emberSize + 2, Paint()..color = const Color(0xFFFFAB4C).withOpacity(0.1));
      canvas.drawCircle(Offset(x, y), emberSize, Paint()..color = const Color(0xFFFFAB4C).withOpacity(random.nextDouble() * 0.5 + 0.3));
    }

    // === LAYER 8: Grass silhouettes on cliff ===
    final grassPaint = Paint()..color = const Color(0xFF1A0A15)..strokeWidth = 1.5..strokeCap = StrokeCap.round;
    for (int i = 0; i < 15; i++) {
      final gx = random.nextDouble() * size.width;
      final gy = size.height * 0.72 + random.nextDouble() * size.height * 0.1;
      canvas.drawLine(Offset(gx, gy), Offset(gx - 2, gy - 8), grassPaint);
      canvas.drawLine(Offset(gx, gy), Offset(gx + 2, gy - 6), grassPaint);
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.35)],
        stops: const [0.45, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Owl - Wisdom, guidance - CALM expression
class OwlIllustrationPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  OwlIllustrationPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(55);
    
    // === LAYER 1: Deep mystical night sky ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF050510),
          const Color(0xFF0A0A25),
          const Color(0xFF151535),
          accentColor.withOpacity(0.15),
        ],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Nebula glow effect ===
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.2),
      size.width * 0.5,
      Paint()..shader = RadialGradient(
        colors: [accentColor.withOpacity(0.08), Colors.transparent],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.3, size.height * 0.2), radius: size.width * 0.5)),
    );

    // === LAYER 3: Full moon with halo ===
    final moonCenter = Offset(size.width * 0.82, size.height * 0.12);
    // Outer halo rings
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(moonCenter, 18 + i * 10.0, Paint()..color = Colors.white.withOpacity(0.05 - i * 0.008));
    }
    // Moon surface
    canvas.drawCircle(moonCenter, 15, Paint()..shader = RadialGradient(
      center: const Alignment(-0.3, -0.3),
      colors: [const Color(0xFFFFFFF0), const Color(0xFFE8E8D8)],
    ).createShader(Rect.fromCircle(center: moonCenter, radius: 15)));
    // Moon craters (subtle)
    canvas.drawCircle(Offset(moonCenter.dx + 4, moonCenter.dy + 3), 3, Paint()..color = const Color(0xFFDDDDC8).withOpacity(0.4));
    canvas.drawCircle(Offset(moonCenter.dx - 5, moonCenter.dy + 5), 2, Paint()..color = const Color(0xFFDDDDC8).withOpacity(0.3));

    // === LAYER 4: Twinkling stars with variation ===
    for (int i = 0; i < 50; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.55;
      final starSize = random.nextDouble() * 1.5 + 0.3;
      // Some stars have a cross-shine effect
      if (i % 12 == 0) {
        final crossPaint = Paint()..color = Colors.white.withOpacity(0.25)..strokeWidth = 0.5;
        canvas.drawLine(Offset(x - 4, y), Offset(x + 4, y), crossPaint);
        canvas.drawLine(Offset(x, y - 4), Offset(x, y + 4), crossPaint);
      }
      canvas.drawCircle(Offset(x, y), starSize, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.6 + 0.3));
    }

    // === LAYER 5: Layered forest silhouettes (depth) ===
    // Far trees (lighter)
    for (int t = 0; t < 6; t++) {
      final tx = t * size.width * 0.2 - 10;
      final h = 35 + random.nextDouble() * 25;
      final treePath = Path();
      treePath.moveTo(tx - 12, size.height * 0.58);
      treePath.quadraticBezierTo(tx, size.height * 0.58 - h, tx + 12, size.height * 0.58);
      treePath.close();
      canvas.drawPath(treePath, Paint()..color = const Color(0xFF0A0A18).withOpacity(0.5));
    }
    // Near trees (darker)
    for (int t = 0; t < 5; t++) {
      final tx = t * size.width * 0.25 + 5;
      final h = 45 + random.nextDouble() * 20;
      final treePath = Path();
      treePath.moveTo(tx - 10, size.height * 0.62);
      treePath.quadraticBezierTo(tx, size.height * 0.62 - h, tx + 10, size.height * 0.62);
      treePath.close();
      canvas.drawPath(treePath, Paint()..color = const Color(0xFF06060F));
    }

    // === LAYER 6: Gnarled ancient branch ===
    final branchPath = Path();
    branchPath.moveTo(-5, size.height * 0.74);
    branchPath.cubicTo(size.width * 0.2, size.height * 0.72, size.width * 0.4, size.height * 0.68, size.width * 0.6, size.height * 0.70);
    branchPath.cubicTo(size.width * 0.8, size.height * 0.72, size.width * 0.95, size.height * 0.68, size.width + 5, size.height * 0.66);
    canvas.drawPath(branchPath, Paint()..color = const Color(0xFF2A1A15)..style = PaintingStyle.stroke..strokeWidth = 10..strokeCap = StrokeCap.round);
    // Bark texture
    canvas.drawPath(branchPath, Paint()..color = const Color(0xFF3D2820)..style = PaintingStyle.stroke..strokeWidth = 6);
    // Knots and small branches
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.71), 4, Paint()..color = const Color(0xFF1A0A05));
    final twig1 = Path()..moveTo(size.width * 0.2, size.height * 0.72)..quadraticBezierTo(size.width * 0.18, size.height * 0.78, size.width * 0.15, size.height * 0.82);
    canvas.drawPath(twig1, Paint()..color = const Color(0xFF2A1A15)..strokeWidth = 3..strokeCap = StrokeCap.round..style = PaintingStyle.stroke);
    final twig2 = Path()..moveTo(size.width * 0.75, size.height * 0.70)..quadraticBezierTo(size.width * 0.78, size.height * 0.75, size.width * 0.82, size.height * 0.78);
    canvas.drawPath(twig2, Paint()..color = const Color(0xFF2A1A15)..strokeWidth = 3..strokeCap = StrokeCap.round..style = PaintingStyle.stroke);

    // === LAYER 7: Wise Owl (properly connected anatomy) ===
    final cx = size.width * 0.42;
    final cy = size.height * 0.50;
    final owlScale = size.width * 0.0048;
    
    // Body - organic teardrop shape flowing into head
    final bodyPath = Path();
    bodyPath.moveTo(cx - 22 * owlScale, cy - 5 * owlScale);
    bodyPath.cubicTo(
      cx - 28 * owlScale, cy + 15 * owlScale,
      cx - 25 * owlScale, cy + 45 * owlScale,
      cx, cy + 55 * owlScale,
    );
    bodyPath.cubicTo(
      cx + 25 * owlScale, cy + 45 * owlScale,
      cx + 28 * owlScale, cy + 15 * owlScale,
      cx + 22 * owlScale, cy - 5 * owlScale,
    );
    bodyPath.close();
    canvas.drawPath(bodyPath, Paint()..shader = RadialGradient(
      center: const Alignment(0, -0.3),
      colors: [accentColor, Color.lerp(accentColor, const Color(0xFF1A0A25), 0.4)!],
    ).createShader(Rect.fromCenter(center: Offset(cx, cy + 20 * owlScale), width: 60 * owlScale, height: 70 * owlScale)));
    
    // Belly - lighter feather area
    final bellyPath = Path();
    bellyPath.moveTo(cx - 14 * owlScale, cy + 8 * owlScale);
    bellyPath.quadraticBezierTo(cx - 16 * owlScale, cy + 35 * owlScale, cx, cy + 45 * owlScale);
    bellyPath.quadraticBezierTo(cx + 16 * owlScale, cy + 35 * owlScale, cx + 14 * owlScale, cy + 8 * owlScale);
    bellyPath.close();
    canvas.drawPath(bellyPath, Paint()..color = accentColor.withOpacity(0.35));
    
    // Feather texture (V-patterns)
    final featherPaint = Paint()..color = accentColor.withOpacity(0.2)..style = PaintingStyle.stroke..strokeWidth = 1.2;
    for (int i = 0; i < 5; i++) {
      canvas.drawArc(
        Rect.fromCenter(center: Offset(cx, cy + 12 * owlScale + i * 8 * owlScale), width: 18 * owlScale, height: 7 * owlScale),
        0.35, math.pi - 0.7, false, featherPaint,
      );
    }
    
    // Head - seamlessly connected to body
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy - 12 * owlScale), width: 50 * owlScale, height: 44 * owlScale),
      Paint()..shader = RadialGradient(
        center: const Alignment(-0.2, -0.3),
        colors: [accentColor, Color.lerp(accentColor, const Color(0xFF1A0A25), 0.3)!],
      ).createShader(Rect.fromCenter(center: Offset(cx, cy - 12 * owlScale), width: 50 * owlScale, height: 44 * owlScale)),
    );
    
    // Ear tufts - organic feathery shapes
    void drawEarTuft(double offsetX, bool isLeft) {
      final dir = isLeft ? -1.0 : 1.0;
      final tuftPath = Path();
      tuftPath.moveTo(cx + dir * 16 * owlScale, cy - 28 * owlScale);
      tuftPath.quadraticBezierTo(cx + dir * 22 * owlScale, cy - 38 * owlScale, cx + dir * 18 * owlScale, cy - 50 * owlScale);
      tuftPath.quadraticBezierTo(cx + dir * 20 * owlScale, cy - 45 * owlScale, cx + dir * 24 * owlScale, cy - 48 * owlScale);
      tuftPath.quadraticBezierTo(cx + dir * 22 * owlScale, cy - 38 * owlScale, cx + dir * 10 * owlScale, cy - 30 * owlScale);
      tuftPath.close();
      canvas.drawPath(tuftPath, Paint()..color = accentColor);
    }
    drawEarTuft(-1, true);
    drawEarTuft(1, false);
    
    // Face disc (heart-shaped owl face)
    final faceDiscPath = Path();
    faceDiscPath.moveTo(cx, cy - 25 * owlScale);
    faceDiscPath.quadraticBezierTo(cx - 18 * owlScale, cy - 22 * owlScale, cx - 18 * owlScale, cy - 8 * owlScale);
    faceDiscPath.quadraticBezierTo(cx - 15 * owlScale, cy + 5 * owlScale, cx, cy + 2 * owlScale);
    faceDiscPath.quadraticBezierTo(cx + 15 * owlScale, cy + 5 * owlScale, cx + 18 * owlScale, cy - 8 * owlScale);
    faceDiscPath.quadraticBezierTo(cx + 18 * owlScale, cy - 22 * owlScale, cx, cy - 25 * owlScale);
    canvas.drawPath(faceDiscPath, Paint()..color = Colors.white.withOpacity(0.12));
    
    // === EYES - CALM expression (gentle, wise) ===
    final eyeY = cy - 12 * owlScale;
    final eyeSpacing = 10 * owlScale;
    // Eye sockets
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), 12 * owlScale, Paint()..color = const Color(0xFF0A0A1A).withOpacity(0.3));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), 12 * owlScale, Paint()..color = const Color(0xFF0A0A1A).withOpacity(0.3));
    // Eye whites
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), 10 * owlScale, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), 10 * owlScale, Paint()..color = const Color(0xFFFFFFF0));
    // Irises (amber/gold)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), 6 * owlScale, Paint()..shader = RadialGradient(
      colors: [const Color(0xFFFFD700), accentColor],
    ).createShader(Rect.fromCircle(center: Offset(cx - eyeSpacing, eyeY), radius: 6 * owlScale)));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), 6 * owlScale, Paint()..shader = RadialGradient(
      colors: [const Color(0xFFFFD700), accentColor],
    ).createShader(Rect.fromCircle(center: Offset(cx + eyeSpacing, eyeY), radius: 6 * owlScale)));
    // Pupils
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), 3 * owlScale, Paint()..color = const Color(0xFF0A0A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), 3 * owlScale, Paint()..color = const Color(0xFF0A0A1A));
    // Eye shine
    canvas.drawCircle(Offset(cx - eyeSpacing - 2 * owlScale, eyeY - 2 * owlScale), 2 * owlScale, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - 2 * owlScale, eyeY - 2 * owlScale), 2 * owlScale, Paint()..color = Colors.white);
    
    // Beak (curved, natural)
    final beakPath = Path();
    beakPath.moveTo(cx, cy - 3 * owlScale);
    beakPath.quadraticBezierTo(cx - 4 * owlScale, cy + 2 * owlScale, cx, cy + 5 * owlScale);
    beakPath.quadraticBezierTo(cx + 4 * owlScale, cy + 2 * owlScale, cx, cy - 3 * owlScale);
    canvas.drawPath(beakPath, Paint()..color = const Color(0xFFF4D03F));
    
    // Talons gripping branch - properly connected
    final talonY = cy + 55 * owlScale;
    final talonPaint = Paint()..color = const Color(0xFFF4D03F);
    // Left foot
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - 10 * owlScale, talonY - 3 * owlScale), width: 8 * owlScale, height: 10 * owlScale), talonPaint);
    canvas.drawLine(Offset(cx - 14 * owlScale, talonY + 2 * owlScale), Offset(cx - 16 * owlScale, talonY + 8 * owlScale), Paint()..color = const Color(0xFFF4D03F)..strokeWidth = 2..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(cx - 10 * owlScale, talonY + 4 * owlScale), Offset(cx - 10 * owlScale, talonY + 10 * owlScale), Paint()..color = const Color(0xFFF4D03F)..strokeWidth = 2..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(cx - 6 * owlScale, talonY + 2 * owlScale), Offset(cx - 4 * owlScale, talonY + 8 * owlScale), Paint()..color = const Color(0xFFF4D03F)..strokeWidth = 2..strokeCap = StrokeCap.round);
    // Right foot
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + 10 * owlScale, talonY - 3 * owlScale), width: 8 * owlScale, height: 10 * owlScale), talonPaint);
    canvas.drawLine(Offset(cx + 14 * owlScale, talonY + 2 * owlScale), Offset(cx + 16 * owlScale, talonY + 8 * owlScale), Paint()..color = const Color(0xFFF4D03F)..strokeWidth = 2..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(cx + 10 * owlScale, talonY + 4 * owlScale), Offset(cx + 10 * owlScale, talonY + 10 * owlScale), Paint()..color = const Color(0xFFF4D03F)..strokeWidth = 2..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(cx + 6 * owlScale, talonY + 2 * owlScale), Offset(cx + 4 * owlScale, talonY + 8 * owlScale), Paint()..color = const Color(0xFFF4D03F)..strokeWidth = 2..strokeCap = StrokeCap.round);

    // === LAYER 8: Magical wisps/fireflies ===
    for (int i = 0; i < 20; i++) {
      final px = random.nextDouble() * size.width;
      final py = size.height * 0.15 + random.nextDouble() * size.height * 0.55;
      final wispSize = random.nextDouble() * 2.5 + 0.5;
      // Glow
      canvas.drawCircle(Offset(px, py), wispSize + 3, Paint()..color = accentColor.withOpacity(0.1));
      canvas.drawCircle(Offset(px, py), wispSize, Paint()..color = accentColor.withOpacity(random.nextDouble() * 0.4 + 0.3));
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
        stops: const [0.45, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Pair of birds - Love, connection - CARING expression
class LoveBirdsIllustrationPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  LoveBirdsIllustrationPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(33);
    
    // === LAYER 1: Romantic twilight gradient ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1A0A25),
          const Color(0xFF2D1B4E),
          accentColor.withOpacity(0.4),
          const Color(0xFFFFB6C1).withOpacity(0.2),
        ],
        stops: const [0.0, 0.25, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Soft romantic glow ===
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.55),
      size.width * 0.6,
      Paint()..shader = RadialGradient(
        colors: [accentColor.withOpacity(0.12), Colors.transparent],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.55), radius: size.width * 0.6)),
    );

    // === LAYER 3: Full moon with romantic halo ===
    final moonCenter = Offset(size.width * 0.82, size.height * 0.15);
    // Soft glow rings
    for (int i = 6; i >= 0; i--) {
      canvas.drawCircle(moonCenter, 16 + i * 10.0, Paint()..color = Colors.white.withOpacity(0.04 - i * 0.005));
    }
    canvas.drawCircle(moonCenter, 14, Paint()..shader = RadialGradient(
      center: const Alignment(-0.3, -0.3),
      colors: [const Color(0xFFFFFFF5), const Color(0xFFE8E0D0)],
    ).createShader(Rect.fromCircle(center: moonCenter, radius: 14)));

    // === LAYER 4: Twinkling stars ===
    for (int i = 0; i < 40; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.5;
      final starSize = random.nextDouble() * 1.3 + 0.3;
      canvas.drawCircle(Offset(x, y), starSize, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.25));
    }

    // === LAYER 5: Sakura tree branch (organic, flowing) ===
    final branchPath = Path();
    branchPath.moveTo(-10, size.height * 0.72);
    branchPath.cubicTo(size.width * 0.15, size.height * 0.68, size.width * 0.35, size.height * 0.64, size.width * 0.55, size.height * 0.65);
    branchPath.cubicTo(size.width * 0.75, size.height * 0.66, size.width * 0.9, size.height * 0.60, size.width + 10, size.height * 0.58);
    canvas.drawPath(branchPath, Paint()..color = const Color(0xFF3D2520)..style = PaintingStyle.stroke..strokeWidth = 9..strokeCap = StrokeCap.round);
    canvas.drawPath(branchPath, Paint()..color = const Color(0xFF5A3D35)..style = PaintingStyle.stroke..strokeWidth = 5);
    
    // Sub-branches
    final subBranch1 = Path()..moveTo(size.width * 0.2, size.height * 0.68)..quadraticBezierTo(size.width * 0.17, size.height * 0.58, size.width * 0.12, size.height * 0.52);
    canvas.drawPath(subBranch1, Paint()..color = const Color(0xFF3D2520)..strokeWidth = 4..strokeCap = StrokeCap.round..style = PaintingStyle.stroke);
    final subBranch2 = Path()..moveTo(size.width * 0.78, size.height * 0.62)..quadraticBezierTo(size.width * 0.82, size.height * 0.53, size.width * 0.88, size.height * 0.48);
    canvas.drawPath(subBranch2, Paint()..color = const Color(0xFF3D2520)..strokeWidth = 4..strokeCap = StrokeCap.round..style = PaintingStyle.stroke);

    // === LAYER 6: Cherry blossoms (detailed, layered) ===
    void drawBlossom(Offset pos, double s, double opacity) {
      final blossomColor = accentColor.withOpacity(opacity);
      final centerColor = const Color(0xFFFFF0F5);
      // Petal shadows
      for (int p = 0; p < 5; p++) {
        final angle = p * math.pi * 2 / 5 - math.pi / 10;
        final petalPath = Path();
        final petalX = pos.dx + s * 1.1 * math.cos(angle);
        final petalY = pos.dy + s * 1.1 * math.sin(angle);
        petalPath.moveTo(pos.dx, pos.dy);
        petalPath.quadraticBezierTo(
          pos.dx + s * 0.6 * math.cos(angle - 0.3),
          pos.dy + s * 0.6 * math.sin(angle - 0.3),
          petalX, petalY,
        );
        petalPath.quadraticBezierTo(
          pos.dx + s * 0.6 * math.cos(angle + 0.3),
          pos.dy + s * 0.6 * math.sin(angle + 0.3),
          pos.dx, pos.dy,
        );
        canvas.drawPath(petalPath, Paint()..color = blossomColor);
      }
      // Center
      canvas.drawCircle(pos, s * 0.35, Paint()..color = centerColor);
      // Stamens
      for (int st = 0; st < 4; st++) {
        final stAngle = st * math.pi / 2 + math.pi / 4;
        canvas.drawLine(
          pos,
          Offset(pos.dx + s * 0.25 * math.cos(stAngle), pos.dy + s * 0.25 * math.sin(stAngle)),
          Paint()..color = const Color(0xFFFFD700).withOpacity(0.7)..strokeWidth = 1,
        );
      }
    }
    drawBlossom(Offset(size.width * 0.1, size.height * 0.54), 8, 0.85);
    drawBlossom(Offset(size.width * 0.16, size.height * 0.50), 6, 0.75);
    drawBlossom(Offset(size.width * 0.08, size.height * 0.58), 5, 0.6);
    drawBlossom(Offset(size.width * 0.85, size.height * 0.50), 7, 0.8);
    drawBlossom(Offset(size.width * 0.9, size.height * 0.46), 5, 0.65);
    drawBlossom(Offset(size.width * 0.92, size.height * 0.52), 6, 0.7);

    // === LAYER 7: Two love birds (properly connected anatomy) ===
    void drawBird(Offset center, Color bodyColor, bool facingRight) {
      final dir = facingRight ? 1.0 : -1.0;
      final birdScale = size.width * 0.004;
      
      // Tail feathers (flowing from body)
      final tailPath = Path();
      tailPath.moveTo(center.dx + dir * 12 * birdScale, center.dy);
      tailPath.quadraticBezierTo(center.dx + dir * 20 * birdScale, center.dy - 5 * birdScale, center.dx + dir * 28 * birdScale, center.dy - 2 * birdScale);
      tailPath.quadraticBezierTo(center.dx + dir * 22 * birdScale, center.dy + 2 * birdScale, center.dx + dir * 28 * birdScale, center.dy + 6 * birdScale);
      tailPath.quadraticBezierTo(center.dx + dir * 20 * birdScale, center.dy + 4 * birdScale, center.dx + dir * 12 * birdScale, center.dy + 3 * birdScale);
      canvas.drawPath(tailPath, Paint()..color = Color.lerp(bodyColor, const Color(0xFF2A1A25), 0.2)!);
      
      // Body (rounded, organic)
      final bodyPath = Path();
      bodyPath.moveTo(center.dx - dir * 8 * birdScale, center.dy - 8 * birdScale);
      bodyPath.cubicTo(
        center.dx + dir * 5 * birdScale, center.dy - 12 * birdScale,
        center.dx + dir * 15 * birdScale, center.dy - 5 * birdScale,
        center.dx + dir * 14 * birdScale, center.dy + 5 * birdScale,
      );
      bodyPath.cubicTo(
        center.dx + dir * 12 * birdScale, center.dy + 12 * birdScale,
        center.dx - dir * 5 * birdScale, center.dy + 12 * birdScale,
        center.dx - dir * 10 * birdScale, center.dy + 5 * birdScale,
      );
      bodyPath.close();
      canvas.drawPath(bodyPath, Paint()..shader = RadialGradient(
        center: Alignment(dir * -0.3, -0.3),
        colors: [bodyColor, Color.lerp(bodyColor, const Color(0xFF2A1A25), 0.25)!],
      ).createShader(Rect.fromCenter(center: center, width: 30 * birdScale, height: 25 * birdScale)));
      
      // Wing (layered feathers)
      final wingPath = Path();
      wingPath.moveTo(center.dx + dir * 2 * birdScale, center.dy - 2 * birdScale);
      wingPath.cubicTo(
        center.dx + dir * 8 * birdScale, center.dy - 6 * birdScale,
        center.dx + dir * 12 * birdScale, center.dy - 2 * birdScale,
        center.dx + dir * 10 * birdScale, center.dy + 6 * birdScale,
      );
      wingPath.cubicTo(
        center.dx + dir * 6 * birdScale, center.dy + 4 * birdScale,
        center.dx + dir * 2 * birdScale, center.dy + 2 * birdScale,
        center.dx + dir * 2 * birdScale, center.dy - 2 * birdScale,
      );
      canvas.drawPath(wingPath, Paint()..color = Color.lerp(bodyColor, Colors.white, 0.15)!.withOpacity(0.8));
      
      // Head (connected to body)
      final headCenter = Offset(center.dx - dir * 12 * birdScale, center.dy - 10 * birdScale);
      canvas.drawOval(
        Rect.fromCenter(center: headCenter, width: 22 * birdScale, height: 20 * birdScale),
        Paint()..shader = RadialGradient(
          center: Alignment(dir * -0.3, -0.3),
          colors: [bodyColor, Color.lerp(bodyColor, const Color(0xFF2A1A25), 0.2)!],
        ).createShader(Rect.fromCenter(center: headCenter, width: 22 * birdScale, height: 20 * birdScale)),
      );
      
      // === EYE - CARING expression (soft, gentle) ===
      final eyeX = headCenter.dx - dir * 4 * birdScale;
      final eyeY = headCenter.dy - 2 * birdScale;
      canvas.drawOval(Rect.fromCenter(center: Offset(eyeX, eyeY), width: 7 * birdScale, height: 6 * birdScale), Paint()..color = const Color(0xFFFFFFF0));
      canvas.drawCircle(Offset(eyeX, eyeY), 2.5 * birdScale, Paint()..color = const Color(0xFF2A1A25));
      canvas.drawCircle(Offset(eyeX - 1 * birdScale, eyeY - 1 * birdScale), 1 * birdScale, Paint()..color = Colors.white);
      
      // Beak (curved, natural)
      final beakPath = Path();
      final beakTip = Offset(headCenter.dx - dir * 18 * birdScale, headCenter.dy);
      beakPath.moveTo(headCenter.dx - dir * 10 * birdScale, headCenter.dy - 2 * birdScale);
      beakPath.quadraticBezierTo(beakTip.dx, beakTip.dy - 2 * birdScale, beakTip.dx, beakTip.dy);
      beakPath.quadraticBezierTo(beakTip.dx, beakTip.dy + 2 * birdScale, headCenter.dx - dir * 10 * birdScale, headCenter.dy + 2 * birdScale);
      beakPath.close();
      canvas.drawPath(beakPath, Paint()..color = const Color(0xFFFFA500));
      
      // Feet (gripping branch)
      final footY = center.dy + 12 * birdScale;
      final footPaint = Paint()..color = const Color(0xFFFFA500)..strokeWidth = 1.5..strokeCap = StrokeCap.round;
      canvas.drawLine(Offset(center.dx - dir * 3 * birdScale, center.dy + 8 * birdScale), Offset(center.dx - dir * 5 * birdScale, footY), footPaint);
      canvas.drawLine(Offset(center.dx + dir * 3 * birdScale, center.dy + 8 * birdScale), Offset(center.dx + dir * 5 * birdScale, footY), footPaint);
      // Toes
      canvas.drawLine(Offset(center.dx - dir * 5 * birdScale, footY), Offset(center.dx - dir * 8 * birdScale, footY + 3 * birdScale), footPaint..strokeWidth = 1);
      canvas.drawLine(Offset(center.dx + dir * 5 * birdScale, footY), Offset(center.dx + dir * 8 * birdScale, footY + 3 * birdScale), footPaint..strokeWidth = 1);
    }
    
    // Left bird (coral pink) - facing right
    drawBird(Offset(size.width * 0.36, size.height * 0.52), const Color(0xFFFBB6CE), true);
    // Right bird (mint teal) - facing left
    drawBird(Offset(size.width * 0.62, size.height * 0.50), const Color(0xFF9AE6B4), false);
    
    // === Heart symbol between them ===
    final heartCenter = Offset(size.width * 0.49, size.height * 0.42);
    final heartSize = size.width * 0.06;
    final heartPath = Path();
    heartPath.moveTo(heartCenter.dx, heartCenter.dy + heartSize * 0.7);
    heartPath.cubicTo(
      heartCenter.dx - heartSize * 0.8, heartCenter.dy + heartSize * 0.2,
      heartCenter.dx - heartSize * 0.8, heartCenter.dy - heartSize * 0.5,
      heartCenter.dx, heartCenter.dy - heartSize * 0.2,
    );
    heartPath.cubicTo(
      heartCenter.dx + heartSize * 0.8, heartCenter.dy - heartSize * 0.5,
      heartCenter.dx + heartSize * 0.8, heartCenter.dy + heartSize * 0.2,
      heartCenter.dx, heartCenter.dy + heartSize * 0.7,
    );
    // Heart glow
    for (int g = 3; g >= 0; g--) {
      canvas.drawPath(heartPath, Paint()..color = accentColor.withOpacity(0.15 - g * 0.03)..maskFilter = MaskFilter.blur(BlurStyle.normal, 4 + g * 3.0));
    }
    canvas.drawPath(heartPath, Paint()..color = accentColor);
    canvas.drawPath(heartPath, Paint()..color = Colors.white.withOpacity(0.3)..style = PaintingStyle.stroke..strokeWidth = 1);

    // === LAYER 8: Floating petals ===
    for (int i = 0; i < 20; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height;
      final petalSize = random.nextDouble() * 5 + 2;
      final rotation = random.nextDouble() * math.pi;
      canvas.save();
      canvas.translate(px, py);
      canvas.rotate(rotation);
      final petalPath = Path();
      petalPath.moveTo(0, 0);
      petalPath.quadraticBezierTo(petalSize * 0.5, -petalSize * 0.3, petalSize, 0);
      petalPath.quadraticBezierTo(petalSize * 0.5, petalSize * 0.3, 0, 0);
      canvas.drawPath(petalPath, Paint()..color = accentColor.withOpacity(random.nextDouble() * 0.35 + 0.15));
      canvas.restore();
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
        stops: const [0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Fox - Cleverness, playfulness - CURIOUS expression
class FoxIllustrationPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  FoxIllustrationPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(77);
    
    // === LAYER 1: Magical twilight meadow sky ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0A0A20),
          const Color(0xFF1A1A45),
          accentColor.withOpacity(0.35),
          const Color(0xFF2D4A35).withOpacity(0.4),
        ],
        stops: const [0.0, 0.25, 0.55, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Ambient glow ===
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.6),
      size.width * 0.5,
      Paint()..shader = RadialGradient(
        colors: [accentColor.withOpacity(0.1), Colors.transparent],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.6), radius: size.width * 0.5)),
    );

    // === LAYER 3: Stars ===
    for (int i = 0; i < 35; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.45;
      final starSize = random.nextDouble() * 1.4 + 0.3;
      if (i % 10 == 0) {
        final twinklePaint = Paint()..color = Colors.white.withOpacity(0.2)..strokeWidth = 0.5;
        canvas.drawLine(Offset(x - 3, y), Offset(x + 3, y), twinklePaint);
        canvas.drawLine(Offset(x, y - 3), Offset(x, y + 3), twinklePaint);
      }
      canvas.drawCircle(Offset(x, y), starSize, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.3));
    }

    // === LAYER 4: Rolling hills (layered depth) ===
    // Far hill
    final farHillPath = Path();
    farHillPath.moveTo(0, size.height * 0.72);
    farHillPath.quadraticBezierTo(size.width * 0.25, size.height * 0.62, size.width * 0.5, size.height * 0.68);
    farHillPath.quadraticBezierTo(size.width * 0.75, size.height * 0.74, size.width, size.height * 0.65);
    farHillPath.lineTo(size.width, size.height);
    farHillPath.lineTo(0, size.height);
    farHillPath.close();
    canvas.drawPath(farHillPath, Paint()..color = const Color(0xFF0A2518));
    
    // Near hill
    final nearHillPath = Path();
    nearHillPath.moveTo(0, size.height * 0.78);
    nearHillPath.quadraticBezierTo(size.width * 0.35, size.height * 0.70, size.width * 0.55, size.height * 0.74);
    nearHillPath.quadraticBezierTo(size.width * 0.8, size.height * 0.78, size.width, size.height * 0.72);
    nearHillPath.lineTo(size.width, size.height);
    nearHillPath.lineTo(0, size.height);
    nearHillPath.close();
    canvas.drawPath(nearHillPath, Paint()..color = const Color(0xFF143D28));

    // === LAYER 5: Grass tufts ===
    final grassPaint = Paint()..color = const Color(0xFF1D5035)..strokeWidth = 1.5..strokeCap = StrokeCap.round;
    for (int i = 0; i < 30; i++) {
      final gx = random.nextDouble() * size.width;
      final gy = size.height * 0.74 + random.nextDouble() * size.height * 0.12;
      final grassHeight = 6 + random.nextDouble() * 6;
      canvas.drawLine(Offset(gx, gy), Offset(gx - 2, gy - grassHeight), grassPaint);
      canvas.drawLine(Offset(gx, gy), Offset(gx, gy - grassHeight * 0.8), grassPaint);
      canvas.drawLine(Offset(gx, gy), Offset(gx + 2, gy - grassHeight * 0.9), grassPaint);
    }

    // === LAYER 6: Fox (properly connected anatomy) ===
    final cx = size.width * 0.48;
    final cy = size.height * 0.52;
    final foxScale = size.width * 0.005;
    final foxOrange = const Color(0xFFE85D04);
    final foxOrangeDark = const Color(0xFFB84500);
    
    // Fluffy tail (connected to body)
    final tailPath = Path();
    tailPath.moveTo(cx + 18 * foxScale, cy + 12 * foxScale);
    tailPath.cubicTo(
      cx + 35 * foxScale, cy + 5 * foxScale,
      cx + 55 * foxScale, cy + 10 * foxScale,
      cx + 52 * foxScale, cy + 28 * foxScale,
    );
    tailPath.cubicTo(
      cx + 48 * foxScale, cy + 42 * foxScale,
      cx + 30 * foxScale, cy + 38 * foxScale,
      cx + 18 * foxScale, cy + 28 * foxScale,
    );
    tailPath.close();
    canvas.drawPath(tailPath, Paint()..shader = RadialGradient(
      center: const Alignment(0.5, 0),
      colors: [foxOrange, foxOrangeDark],
    ).createShader(Rect.fromCenter(center: Offset(cx + 35 * foxScale, cy + 20 * foxScale), width: 40 * foxScale, height: 35 * foxScale)));
    // White tail tip
    final tailTipPath = Path();
    tailTipPath.moveTo(cx + 45 * foxScale, cy + 22 * foxScale);
    tailTipPath.quadraticBezierTo(cx + 55 * foxScale, cy + 20 * foxScale, cx + 52 * foxScale, cy + 30 * foxScale);
    tailTipPath.quadraticBezierTo(cx + 48 * foxScale, cy + 38 * foxScale, cx + 42 * foxScale, cy + 32 * foxScale);
    tailTipPath.close();
    canvas.drawPath(tailTipPath, Paint()..color = const Color(0xFFFFF8F0));
    
    // Body (rounded, organic shape flowing into legs and neck)
    final bodyPath = Path();
    bodyPath.moveTo(cx - 15 * foxScale, cy);
    bodyPath.cubicTo(
      cx - 22 * foxScale, cy + 10 * foxScale,
      cx - 20 * foxScale, cy + 28 * foxScale,
      cx - 12 * foxScale, cy + 35 * foxScale,
    );
    bodyPath.lineTo(cx + 12 * foxScale, cy + 35 * foxScale);
    bodyPath.cubicTo(
      cx + 20 * foxScale, cy + 28 * foxScale,
      cx + 22 * foxScale, cy + 10 * foxScale,
      cx + 15 * foxScale, cy,
    );
    bodyPath.close();
    canvas.drawPath(bodyPath, Paint()..shader = RadialGradient(
      center: const Alignment(0, -0.4),
      colors: [foxOrange, foxOrangeDark],
    ).createShader(Rect.fromCenter(center: Offset(cx, cy + 15 * foxScale), width: 50 * foxScale, height: 45 * foxScale)));
    
    // White chest (organic)
    final chestPath = Path();
    chestPath.moveTo(cx - 10 * foxScale, cy + 5 * foxScale);
    chestPath.quadraticBezierTo(cx - 14 * foxScale, cy + 20 * foxScale, cx - 8 * foxScale, cy + 32 * foxScale);
    chestPath.lineTo(cx + 8 * foxScale, cy + 32 * foxScale);
    chestPath.quadraticBezierTo(cx + 14 * foxScale, cy + 20 * foxScale, cx + 10 * foxScale, cy + 5 * foxScale);
    chestPath.close();
    canvas.drawPath(chestPath, Paint()..color = const Color(0xFFFFF8F0).withOpacity(0.92));
    
    // Front legs (naturally flowing from body)
    // Left leg
    final leftLegPath = Path();
    leftLegPath.moveTo(cx - 10 * foxScale, cy + 30 * foxScale);
    leftLegPath.quadraticBezierTo(cx - 14 * foxScale, cy + 42 * foxScale, cx - 12 * foxScale, cy + 55 * foxScale);
    leftLegPath.lineTo(cx - 6 * foxScale, cy + 55 * foxScale);
    leftLegPath.quadraticBezierTo(cx - 4 * foxScale, cy + 42 * foxScale, cx - 4 * foxScale, cy + 30 * foxScale);
    leftLegPath.close();
    canvas.drawPath(leftLegPath, Paint()..color = foxOrange);
    // Left paw
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - 9 * foxScale, cy + 57 * foxScale), width: 10 * foxScale, height: 6 * foxScale), Paint()..color = const Color(0xFFFFF8F0));
    
    // Right leg
    final rightLegPath = Path();
    rightLegPath.moveTo(cx + 4 * foxScale, cy + 30 * foxScale);
    rightLegPath.quadraticBezierTo(cx + 4 * foxScale, cy + 42 * foxScale, cx + 6 * foxScale, cy + 55 * foxScale);
    rightLegPath.lineTo(cx + 12 * foxScale, cy + 55 * foxScale);
    rightLegPath.quadraticBezierTo(cx + 14 * foxScale, cy + 42 * foxScale, cx + 10 * foxScale, cy + 30 * foxScale);
    rightLegPath.close();
    canvas.drawPath(rightLegPath, Paint()..color = foxOrange);
    // Right paw
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + 9 * foxScale, cy + 57 * foxScale), width: 10 * foxScale, height: 6 * foxScale), Paint()..color = const Color(0xFFFFF8F0));
    
    // Head (connected to body via neck)
    final headCx = cx - 8 * foxScale;
    final headCy = cy - 12 * foxScale;
    // Neck connection
    final neckPath = Path();
    neckPath.moveTo(cx - 12 * foxScale, cy);
    neckPath.quadraticBezierTo(headCx - 5 * foxScale, cy - 5 * foxScale, headCx - 8 * foxScale, headCy + 10 * foxScale);
    neckPath.lineTo(headCx + 8 * foxScale, headCy + 10 * foxScale);
    neckPath.quadraticBezierTo(headCx + 5 * foxScale, cy - 5 * foxScale, cx + 12 * foxScale, cy);
    canvas.drawPath(neckPath, Paint()..color = foxOrange);
    
    // Head shape
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx, headCy), width: 36 * foxScale, height: 32 * foxScale),
      Paint()..shader = RadialGradient(
        center: const Alignment(-0.3, -0.3),
        colors: [foxOrange, foxOrangeDark],
      ).createShader(Rect.fromCenter(center: Offset(headCx, headCy), width: 36 * foxScale, height: 32 * foxScale)),
    );
    
    // Ears (organic, flowing)
    void drawEar(double offsetX, bool isLeft) {
      final dir = isLeft ? -1.0 : 1.0;
      final earPath = Path();
      earPath.moveTo(headCx + dir * 10 * foxScale, headCy - 10 * foxScale);
      earPath.quadraticBezierTo(
        headCx + dir * 18 * foxScale, headCy - 35 * foxScale,
        headCx + dir * 8 * foxScale, headCy - 38 * foxScale,
      );
      earPath.quadraticBezierTo(
        headCx + dir * 2 * foxScale, headCy - 35 * foxScale,
        headCx + dir * 4 * foxScale, headCy - 12 * foxScale,
      );
      earPath.close();
      canvas.drawPath(earPath, Paint()..color = foxOrange);
      // Inner ear
      final innerEarPath = Path();
      innerEarPath.moveTo(headCx + dir * 9 * foxScale, headCy - 14 * foxScale);
      innerEarPath.quadraticBezierTo(
        headCx + dir * 14 * foxScale, headCy - 30 * foxScale,
        headCx + dir * 7 * foxScale, headCy - 32 * foxScale,
      );
      innerEarPath.quadraticBezierTo(
        headCx + dir * 4 * foxScale, headCy - 28 * foxScale,
        headCx + dir * 5 * foxScale, headCy - 15 * foxScale,
      );
      innerEarPath.close();
      canvas.drawPath(innerEarPath, Paint()..color = const Color(0xFFFFB6C1).withOpacity(0.6));
    }
    drawEar(-1, true);
    drawEar(1, false);
    
    // Snout (white, pointed)
    final snoutPath = Path();
    snoutPath.moveTo(headCx - 10 * foxScale, headCy + 2 * foxScale);
    snoutPath.quadraticBezierTo(headCx - 22 * foxScale, headCy + 5 * foxScale, headCx - 20 * foxScale, headCy + 8 * foxScale);
    snoutPath.quadraticBezierTo(headCx - 15 * foxScale, headCy + 12 * foxScale, headCx - 5 * foxScale, headCy + 10 * foxScale);
    snoutPath.close();
    canvas.drawPath(snoutPath, Paint()..color = const Color(0xFFFFF8F0));
    
    // === EYES - CURIOUS expression (one open, one winking) ===
    // Open eye
    final leftEyeX = headCx - 8 * foxScale;
    final leftEyeY = headCy - 4 * foxScale;
    canvas.drawOval(Rect.fromCenter(center: Offset(leftEyeX, leftEyeY), width: 8 * foxScale, height: 7 * foxScale), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(leftEyeX, leftEyeY), 3 * foxScale, Paint()..color = const Color(0xFF2A1A10));
    canvas.drawCircle(Offset(leftEyeX - 1 * foxScale, leftEyeY - 1 * foxScale), 1.2 * foxScale, Paint()..color = Colors.white);
    
    // Winking eye (curved line)
    final rightEyeX = headCx + 4 * foxScale;
    final rightEyeY = headCy - 3 * foxScale;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(rightEyeX, rightEyeY), width: 8 * foxScale, height: 4 * foxScale),
      0.2, 2.7, false,
      Paint()..color = const Color(0xFF2A1A10)..strokeWidth = 2..style = PaintingStyle.stroke..strokeCap = StrokeCap.round,
    );
    
    // Nose
    final nosePath = Path();
    nosePath.moveTo(headCx - 18 * foxScale, headCy + 5 * foxScale);
    nosePath.quadraticBezierTo(headCx - 22 * foxScale, headCy + 6 * foxScale, headCx - 20 * foxScale, headCy + 9 * foxScale);
    nosePath.quadraticBezierTo(headCx - 18 * foxScale, headCy + 10 * foxScale, headCx - 16 * foxScale, headCy + 8 * foxScale);
    nosePath.close();
    canvas.drawPath(nosePath, Paint()..color = const Color(0xFF1A1A1A));
    
    // Playful smile
    canvas.drawArc(
      Rect.fromCenter(center: Offset(headCx - 12 * foxScale, headCy + 10 * foxScale), width: 10 * foxScale, height: 5 * foxScale),
      0.15, 2.7, false,
      Paint()..color = const Color(0xFF2A1A10)..style = PaintingStyle.stroke..strokeWidth = 1.5..strokeCap = StrokeCap.round,
    );

    // === LAYER 7: Fireflies ===
    for (int i = 0; i < 18; i++) {
      final fx = random.nextDouble() * size.width;
      final fy = size.height * 0.35 + random.nextDouble() * size.height * 0.45;
      final glowSize = random.nextDouble() * 2 + 1;
      // Outer glow
      canvas.drawCircle(Offset(fx, fy), glowSize + 4, Paint()..color = const Color(0xFFFFFF99).withOpacity(0.1));
      canvas.drawCircle(Offset(fx, fy), glowSize + 2, Paint()..color = const Color(0xFFFFFF99).withOpacity(0.2));
      canvas.drawCircle(Offset(fx, fy), glowSize, Paint()..color = const Color(0xFFFFFF99).withOpacity(0.7));
    }

    // === LAYER 8: Sparkles ===
    for (int i = 0; i < 10; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.6;
      final sparkleSize = 3 + random.nextDouble() * 2;
      final sparklePaint = Paint()..color = Colors.white.withOpacity(0.4 + random.nextDouble() * 0.3)..strokeWidth = 1;
      canvas.drawLine(Offset(sx - sparkleSize, sy), Offset(sx + sparkleSize, sy), sparklePaint);
      canvas.drawLine(Offset(sx, sy - sparkleSize), Offset(sx, sy + sparkleSize), sparklePaint);
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.35)],
        stops: const [0.45, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Deer - Grace, leadership - CONFIDENT expression
class DeerIllustrationPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  DeerIllustrationPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(88);
    
    // === LAYER 1: Majestic dawn gradient ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0A0510),
          const Color(0xFF1A0A1A),
          accentColor.withOpacity(0.25),
          const Color(0xFF2A1A0A).withOpacity(0.5),
        ],
        stops: const [0.0, 0.2, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Rising sun/light source with god rays ===
    final lightCenter = Offset(size.width * 0.5, size.height * 0.32);
    // Outer glow rings
    for (int i = 8; i >= 0; i--) {
      canvas.drawCircle(lightCenter, 25 + i * 12.0, Paint()..color = accentColor.withOpacity(0.06 - i * 0.006));
    }
    // Light rays
    for (int i = 0; i < 12; i++) {
      final angle = i * math.pi / 6;
      final rayPath = Path();
      rayPath.moveTo(lightCenter.dx, lightCenter.dy);
      rayPath.lineTo(
        lightCenter.dx + 100 * math.cos(angle - 0.05),
        lightCenter.dy + 100 * math.sin(angle - 0.05),
      );
      rayPath.lineTo(
        lightCenter.dx + 100 * math.cos(angle + 0.05),
        lightCenter.dy + 100 * math.sin(angle + 0.05),
      );
      rayPath.close();
      canvas.drawPath(rayPath, Paint()..color = accentColor.withOpacity(0.04));
    }
    // Sun core
    canvas.drawCircle(lightCenter, 22, Paint()..shader = RadialGradient(
      colors: [const Color(0xFFFFE4B5), accentColor.withOpacity(0.7)],
    ).createShader(Rect.fromCircle(center: lightCenter, radius: 22)));

    // === LAYER 3: Stars fading in dawn light ===
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.35;
      final distFromLight = (Offset(x, y) - lightCenter).distance;
      final opacity = (distFromLight / size.width).clamp(0.0, 1.0) * (random.nextDouble() * 0.4 + 0.2);
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.2 + 0.3, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 4: Misty hilltop silhouettes (layered depth) ===
    // Far hill
    final farHillPath = Path();
    farHillPath.moveTo(0, size.height * 0.75);
    farHillPath.quadraticBezierTo(size.width * 0.25, size.height * 0.68, size.width * 0.5, size.height * 0.7);
    farHillPath.quadraticBezierTo(size.width * 0.75, size.height * 0.72, size.width, size.height * 0.68);
    farHillPath.lineTo(size.width, size.height);
    farHillPath.lineTo(0, size.height);
    farHillPath.close();
    canvas.drawPath(farHillPath, Paint()..color = const Color(0xFF0A0515).withOpacity(0.6));
    
    // Near hill
    final nearHillPath = Path();
    nearHillPath.moveTo(0, size.height * 0.82);
    nearHillPath.quadraticBezierTo(size.width * 0.3, size.height * 0.72, size.width * 0.5, size.height * 0.70);
    nearHillPath.quadraticBezierTo(size.width * 0.7, size.height * 0.68, size.width, size.height * 0.76);
    nearHillPath.lineTo(size.width, size.height);
    nearHillPath.lineTo(0, size.height);
    nearHillPath.close();
    canvas.drawPath(nearHillPath, Paint()..color = const Color(0xFF0F0A18));
    
    // Mist effect
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.65, size.width, size.height * 0.15),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, accentColor.withOpacity(0.08), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, size.height * 0.65, size.width, size.height * 0.15)),
    );

    // === LAYER 5: Majestic Deer (properly connected anatomy) ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.50;
    final deerScale = size.width * 0.0048;
    final deerBrown = const Color(0xFFB5651D);
    final deerBrownDark = const Color(0xFF8B4513);
    
    // Antlers (organic branching)
    void drawAntler(double startX, double startY, bool isLeft) {
      final dir = isLeft ? -1.0 : 1.0;
      final antlerPaint = Paint()..color = accentColor..strokeWidth = 3 * deerScale..strokeCap = StrokeCap.round;
      
      // Main beam (curved)
      final mainBeam = Path();
      mainBeam.moveTo(startX, startY);
      mainBeam.quadraticBezierTo(
        startX + dir * 10 * deerScale, startY - 20 * deerScale,
        startX + dir * 15 * deerScale, startY - 40 * deerScale,
      );
      canvas.drawPath(mainBeam, antlerPaint..style = PaintingStyle.stroke);
      
      // Tines (curved branches)
      final tine1 = Path()..moveTo(startX + dir * 4 * deerScale, startY - 12 * deerScale)
        ..quadraticBezierTo(startX + dir * 12 * deerScale, startY - 15 * deerScale, startX + dir * 16 * deerScale, startY - 18 * deerScale);
      canvas.drawPath(tine1, antlerPaint..strokeWidth = 2.5 * deerScale);
      
      final tine2 = Path()..moveTo(startX + dir * 10 * deerScale, startY - 28 * deerScale)
        ..quadraticBezierTo(startX + dir * 20 * deerScale, startY - 28 * deerScale, startX + dir * 24 * deerScale, startY - 32 * deerScale);
      canvas.drawPath(tine2, antlerPaint..strokeWidth = 2 * deerScale);
      
      final tine3 = Path()..moveTo(startX + dir * 15 * deerScale, startY - 40 * deerScale)
        ..quadraticBezierTo(startX + dir * 8 * deerScale, startY - 45 * deerScale, startX + dir * 5 * deerScale, startY - 52 * deerScale);
      canvas.drawPath(tine3, antlerPaint..strokeWidth = 2 * deerScale);
      
      final tine4 = Path()..moveTo(startX + dir * 15 * deerScale, startY - 40 * deerScale)
        ..quadraticBezierTo(startX + dir * 22 * deerScale, startY - 42 * deerScale, startX + dir * 28 * deerScale, startY - 48 * deerScale);
      canvas.drawPath(tine4, antlerPaint..strokeWidth = 2 * deerScale);
    }
    drawAntler(cx - 10 * deerScale, cy - 22 * deerScale, true);
    drawAntler(cx + 10 * deerScale, cy - 22 * deerScale, false);
    
    // Body (organic flowing shape)
    final bodyPath = Path();
    bodyPath.moveTo(cx - 18 * deerScale, cy + 5 * deerScale);
    bodyPath.cubicTo(
      cx - 28 * deerScale, cy + 15 * deerScale,
      cx - 28 * deerScale, cy + 35 * deerScale,
      cx - 18 * deerScale, cy + 42 * deerScale,
    );
    bodyPath.lineTo(cx + 18 * deerScale, cy + 42 * deerScale);
    bodyPath.cubicTo(
      cx + 28 * deerScale, cy + 35 * deerScale,
      cx + 28 * deerScale, cy + 15 * deerScale,
      cx + 18 * deerScale, cy + 5 * deerScale,
    );
    bodyPath.close();
    canvas.drawPath(bodyPath, Paint()..shader = RadialGradient(
      center: const Alignment(0, -0.4),
      colors: [deerBrown, deerBrownDark],
    ).createShader(Rect.fromCenter(center: Offset(cx, cy + 22 * deerScale), width: 60 * deerScale, height: 50 * deerScale)));
    
    // White spots on body
    canvas.drawCircle(Offset(cx - 12 * deerScale, cy + 18 * deerScale), 2.5 * deerScale, Paint()..color = Colors.white.withOpacity(0.45));
    canvas.drawCircle(Offset(cx + 10 * deerScale, cy + 22 * deerScale), 2 * deerScale, Paint()..color = Colors.white.withOpacity(0.4));
    canvas.drawCircle(Offset(cx - 5 * deerScale, cy + 30 * deerScale), 2.5 * deerScale, Paint()..color = Colors.white.withOpacity(0.35));
    canvas.drawCircle(Offset(cx + 15 * deerScale, cy + 32 * deerScale), 1.5 * deerScale, Paint()..color = Colors.white.withOpacity(0.4));
    
    // Neck (elegant curve connecting to body)
    final neckPath = Path();
    neckPath.moveTo(cx - 14 * deerScale, cy + 8 * deerScale);
    neckPath.cubicTo(
      cx - 16 * deerScale, cy - 5 * deerScale,
      cx - 10 * deerScale, cy - 18 * deerScale,
      cx, cy - 20 * deerScale,
    );
    neckPath.cubicTo(
      cx + 10 * deerScale, cy - 18 * deerScale,
      cx + 16 * deerScale, cy - 5 * deerScale,
      cx + 14 * deerScale, cy + 8 * deerScale,
    );
    neckPath.close();
    canvas.drawPath(neckPath, Paint()..color = deerBrown);
    
    // Legs (naturally flowing from body)
    void drawLeg(double offsetX, bool isFront) {
      final legPath = Path();
      final legTop = cy + 38 * deerScale;
      final legBot = cy + 65 * deerScale;
      legPath.moveTo(cx + offsetX - 4 * deerScale, legTop);
      legPath.quadraticBezierTo(cx + offsetX - 5 * deerScale, (legTop + legBot) / 2, cx + offsetX - 3 * deerScale, legBot);
      legPath.lineTo(cx + offsetX + 3 * deerScale, legBot);
      legPath.quadraticBezierTo(cx + offsetX + 5 * deerScale, (legTop + legBot) / 2, cx + offsetX + 4 * deerScale, legTop);
      legPath.close();
      canvas.drawPath(legPath, Paint()..color = isFront ? deerBrown : deerBrownDark);
      // Hoof
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(cx + offsetX - 4 * deerScale, legBot, 8 * deerScale, 5 * deerScale),
          const Radius.circular(2),
        ),
        Paint()..color = const Color(0xFF1A1A1A),
      );
    }
    drawLeg(-12 * deerScale, true);
    drawLeg(12 * deerScale, false);
    
    // Head (connected to neck)
    final headCx = cx;
    final headCy = cy - 18 * deerScale;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx, headCy), width: 32 * deerScale, height: 28 * deerScale),
      Paint()..shader = RadialGradient(
        center: const Alignment(-0.2, -0.3),
        colors: [deerBrown, deerBrownDark],
      ).createShader(Rect.fromCenter(center: Offset(headCx, headCy), width: 32 * deerScale, height: 28 * deerScale)),
    );
    
    // Ears (organic leaf shapes)
    void drawEar(bool isLeft) {
      final dir = isLeft ? -1.0 : 1.0;
      final earPath = Path();
      earPath.moveTo(headCx + dir * 12 * deerScale, headCy - 8 * deerScale);
      earPath.quadraticBezierTo(
        headCx + dir * 22 * deerScale, headCy - 18 * deerScale,
        headCx + dir * 20 * deerScale, headCy - 5 * deerScale,
      );
      earPath.quadraticBezierTo(
        headCx + dir * 18 * deerScale, headCy + 2 * deerScale,
        headCx + dir * 12 * deerScale, headCy - 2 * deerScale,
      );
      earPath.close();
      canvas.drawPath(earPath, Paint()..color = deerBrown);
      // Inner ear
      final innerEarPath = Path();
      innerEarPath.moveTo(headCx + dir * 13 * deerScale, headCy - 6 * deerScale);
      innerEarPath.quadraticBezierTo(
        headCx + dir * 19 * deerScale, headCy - 14 * deerScale,
        headCx + dir * 18 * deerScale, headCy - 5 * deerScale,
      );
      innerEarPath.quadraticBezierTo(
        headCx + dir * 16 * deerScale, headCy,
        headCx + dir * 13 * deerScale, headCy - 3 * deerScale,
      );
      innerEarPath.close();
      canvas.drawPath(innerEarPath, Paint()..color = const Color(0xFFFFB6C1).withOpacity(0.5));
    }
    drawEar(true);
    drawEar(false);
    
    // Snout (lighter area)
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx, headCy + 6 * deerScale), width: 16 * deerScale, height: 10 * deerScale),
      Paint()..color = const Color(0xFFDEB887),
    );
    
    // === EYES - CONFIDENT expression (calm, steady gaze) ===
    final eyeY = headCy - 2 * deerScale;
    final eyeSpacing = 8 * deerScale;
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(headCx - eyeSpacing, eyeY), width: 7 * deerScale, height: 6 * deerScale), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(headCx + eyeSpacing, eyeY), width: 7 * deerScale, height: 6 * deerScale), Paint()..color = const Color(0xFFFFFFF0));
    // Irises (warm brown)
    canvas.drawCircle(Offset(headCx - eyeSpacing, eyeY), 2.8 * deerScale, Paint()..color = const Color(0xFF5D4037));
    canvas.drawCircle(Offset(headCx + eyeSpacing, eyeY), 2.8 * deerScale, Paint()..color = const Color(0xFF5D4037));
    // Pupils
    canvas.drawCircle(Offset(headCx - eyeSpacing, eyeY), 1.5 * deerScale, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(headCx + eyeSpacing, eyeY), 1.5 * deerScale, Paint()..color = const Color(0xFF1A1A1A));
    // Eye shine
    canvas.drawCircle(Offset(headCx - eyeSpacing - 1 * deerScale, eyeY - 1 * deerScale), 1 * deerScale, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(headCx + eyeSpacing - 1 * deerScale, eyeY - 1 * deerScale), 1 * deerScale, Paint()..color = Colors.white);
    
    // Nose
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx, headCy + 10 * deerScale), width: 7 * deerScale, height: 5 * deerScale),
      Paint()..color = const Color(0xFF1A1A1A),
    );
    
    // Gentle expression
    canvas.drawArc(
      Rect.fromCenter(center: Offset(headCx, headCy + 14 * deerScale), width: 8 * deerScale, height: 4 * deerScale),
      0.2, 2.6, false,
      Paint()..color = const Color(0xFF4A3728)..style = PaintingStyle.stroke..strokeWidth = 1.2..strokeCap = StrokeCap.round,
    );

    // === LAYER 6: Floating particles/dust motes ===
    for (int i = 0; i < 25; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.7;
      final particleSize = random.nextDouble() * 2 + 0.5;
      // Glow
      canvas.drawCircle(Offset(px, py), particleSize + 2, Paint()..color = accentColor.withOpacity(0.08));
      canvas.drawCircle(Offset(px, py), particleSize, Paint()..color = accentColor.withOpacity(random.nextDouble() * 0.3 + 0.15));
    }

    // === LAYER 7: Vignette ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
        stops: const [0.4, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Cat - Contemplation, curiosity - CALM expression
class CatIllustrationPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  CatIllustrationPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(99);
    
    // === LAYER 1: Cozy warm library ambiance ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF1A1520),
          const Color(0xFF251A28),
          accentColor.withOpacity(0.15),
          const Color(0xFF2A2018),
        ],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Window with moonlight ===
    final windowCenter = Offset(size.width * 0.78, size.height * 0.22);
    // Window frame (arched)
    final windowPath = Path();
    windowPath.moveTo(windowCenter.dx - 22, windowCenter.dy + 28);
    windowPath.lineTo(windowCenter.dx - 22, windowCenter.dy - 15);
    windowPath.quadraticBezierTo(windowCenter.dx - 22, windowCenter.dy - 30, windowCenter.dx, windowCenter.dy - 30);
    windowPath.quadraticBezierTo(windowCenter.dx + 22, windowCenter.dy - 30, windowCenter.dx + 22, windowCenter.dy - 15);
    windowPath.lineTo(windowCenter.dx + 22, windowCenter.dy + 28);
    windowPath.close();
    canvas.drawPath(windowPath, Paint()..color = const Color(0xFF3D2B40));
    // Window glass (night sky)
    final windowGlassPath = Path();
    windowGlassPath.moveTo(windowCenter.dx - 18, windowCenter.dy + 24);
    windowGlassPath.lineTo(windowCenter.dx - 18, windowCenter.dy - 12);
    windowGlassPath.quadraticBezierTo(windowCenter.dx - 18, windowCenter.dy - 25, windowCenter.dx, windowCenter.dy - 25);
    windowGlassPath.quadraticBezierTo(windowCenter.dx + 18, windowCenter.dy - 25, windowCenter.dx + 18, windowCenter.dy - 12);
    windowGlassPath.lineTo(windowCenter.dx + 18, windowCenter.dy + 24);
    windowGlassPath.close();
    canvas.drawPath(windowGlassPath, Paint()..shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xFF0A1525), const Color(0xFF1A2545)],
    ).createShader(Rect.fromLTWH(windowCenter.dx - 18, windowCenter.dy - 25, 36, 50)));
    // Moon in window
    final moonInWindow = Offset(windowCenter.dx + 6, windowCenter.dy - 12);
    canvas.drawCircle(moonInWindow, 10, Paint()..color = Colors.white.withOpacity(0.15));
    canvas.drawCircle(moonInWindow, 7, Paint()..color = const Color(0xFFFFFAE0));
    // Stars in window
    for (int i = 0; i < 8; i++) {
      final sx = windowCenter.dx - 14 + random.nextDouble() * 28;
      final sy = windowCenter.dy - 22 + random.nextDouble() * 35;
      canvas.drawCircle(Offset(sx, sy), random.nextDouble() * 0.8 + 0.3, Paint()..color = Colors.white.withOpacity(0.6));
    }
    // Window dividers
    canvas.drawLine(Offset(windowCenter.dx, windowCenter.dy - 25), Offset(windowCenter.dx, windowCenter.dy + 24), Paint()..color = const Color(0xFF3D2B40)..strokeWidth = 2);
    canvas.drawLine(Offset(windowCenter.dx - 18, windowCenter.dy), Offset(windowCenter.dx + 18, windowCenter.dy), Paint()..color = const Color(0xFF3D2B40)..strokeWidth = 2);

    // === LAYER 3: Lamp with warm glow ===
    final lampCenter = Offset(size.width * 0.18, size.height * 0.32);
    // Warm light glow
    for (int i = 6; i >= 0; i--) {
      canvas.drawCircle(lampCenter, 18 + i * 14.0, Paint()..color = const Color(0xFFFFB347).withOpacity(0.06 - i * 0.008));
    }
    // Lamp base
    canvas.drawRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(lampCenter.dx, lampCenter.dy + 35), width: 14, height: 8),
      const Radius.circular(2),
    ), Paint()..color = const Color(0xFF4A3520));
    // Lamp stem
    canvas.drawLine(
      Offset(lampCenter.dx, lampCenter.dy + 30),
      Offset(lampCenter.dx, lampCenter.dy + 5),
      Paint()..color = const Color(0xFF6B5030)..strokeWidth = 4,
    );
    // Lamp shade (warm colored)
    final shadePath = Path();
    shadePath.moveTo(lampCenter.dx - 14, lampCenter.dy + 5);
    shadePath.quadraticBezierTo(lampCenter.dx - 10, lampCenter.dy - 15, lampCenter.dx, lampCenter.dy - 18);
    shadePath.quadraticBezierTo(lampCenter.dx + 10, lampCenter.dy - 15, lampCenter.dx + 14, lampCenter.dy + 5);
    shadePath.close();
    canvas.drawPath(shadePath, Paint()..shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [accentColor.withOpacity(0.6), accentColor.withOpacity(0.9)],
    ).createShader(Rect.fromLTWH(lampCenter.dx - 14, lampCenter.dy - 18, 28, 23)));

    // === LAYER 4: Bookshelf silhouettes with books ===
    // Left shelf
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width * 0.1, size.height), Paint()..color = const Color(0xFF12100D));
    // Right shelf
    canvas.drawRect(Rect.fromLTWH(size.width * 0.9, 0, size.width * 0.1, size.height), Paint()..color = const Color(0xFF12100D));
    // Books on shelves
    final bookColors = [accentColor, const Color(0xFF8B4513), const Color(0xFF2F4F4F), const Color(0xFFB8860B)];
    for (int shelf = 0; shelf < 4; shelf++) {
      final y = size.height * (0.12 + shelf * 0.22);
      for (int b = 0; b < 3; b++) {
        final bookHeight = 12 + random.nextDouble() * 8;
        canvas.drawRect(Rect.fromLTWH(size.width * 0.01 + b * 4, y - bookHeight, 3, bookHeight), Paint()..color = bookColors[random.nextInt(4)].withOpacity(0.45));
        canvas.drawRect(Rect.fromLTWH(size.width * 0.91 + b * 4, y - bookHeight, 3, bookHeight), Paint()..color = bookColors[random.nextInt(4)].withOpacity(0.45));
      }
    }

    // === LAYER 5: Cozy cushion/windowsill ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.25, size.height * 0.64, size.width * 0.5, size.height * 0.14), const Radius.circular(12)),
      Paint()..shader = RadialGradient(
        center: const Alignment(0, -0.5),
        colors: [accentColor.withOpacity(0.6), accentColor.withOpacity(0.4)],
      ).createShader(Rect.fromLTWH(size.width * 0.25, size.height * 0.64, size.width * 0.5, size.height * 0.14)),
    );
    // Cushion seam
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.65),
      Offset(size.width * 0.5, size.height * 0.77),
      Paint()..color = accentColor.withOpacity(0.3)..strokeWidth = 1,
    );

    // === LAYER 6: Cat (properly connected anatomy) ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.52;
    final catScale = size.width * 0.0048;
    final catGray = const Color(0xFF4A4A5A);
    final catGrayLight = const Color(0xFF6A6A7A);
    final catGrayDark = const Color(0xFF3A3A4A);
    
    // Tail (elegantly curled, connected to body)
    final tailPath = Path();
    tailPath.moveTo(cx + 20 * catScale, cy + 18 * catScale);
    tailPath.cubicTo(
      cx + 35 * catScale, cy + 12 * catScale,
      cx + 48 * catScale, cy + 5 * catScale,
      cx + 50 * catScale, cy - 10 * catScale,
    );
    tailPath.cubicTo(
      cx + 52 * catScale, cy - 22 * catScale,
      cx + 45 * catScale, cy - 28 * catScale,
      cx + 38 * catScale, cy - 25 * catScale,
    );
    canvas.drawPath(tailPath, Paint()
      ..color = catGray
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9 * catScale
      ..strokeCap = StrokeCap.round
    );
    // Tail tip lighter
    final tailTipPath = Path();
    tailTipPath.moveTo(cx + 48 * catScale, cy - 15 * catScale);
    tailTipPath.quadraticBezierTo(cx + 50 * catScale, cy - 22 * catScale, cx + 42 * catScale, cy - 24 * catScale);
    canvas.drawPath(tailTipPath, Paint()
      ..color = catGrayLight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7 * catScale
      ..strokeCap = StrokeCap.round
    );
    
    // Body (sitting, rounded organic shape)
    final bodyPath = Path();
    bodyPath.moveTo(cx - 18 * catScale, cy + 5 * catScale);
    bodyPath.cubicTo(
      cx - 25 * catScale, cy + 15 * catScale,
      cx - 25 * catScale, cy + 30 * catScale,
      cx - 15 * catScale, cy + 38 * catScale,
    );
    bodyPath.lineTo(cx + 18 * catScale, cy + 38 * catScale);
    bodyPath.cubicTo(
      cx + 25 * catScale, cy + 30 * catScale,
      cx + 25 * catScale, cy + 15 * catScale,
      cx + 18 * catScale, cy + 5 * catScale,
    );
    bodyPath.close();
    canvas.drawPath(bodyPath, Paint()..shader = RadialGradient(
      center: const Alignment(0, -0.3),
      colors: [catGrayLight, catGray],
    ).createShader(Rect.fromCenter(center: Offset(cx, cy + 20 * catScale), width: 55 * catScale, height: 45 * catScale)));
    
    // Chest (lighter fur)
    final chestPath = Path();
    chestPath.moveTo(cx - 12 * catScale, cy + 8 * catScale);
    chestPath.quadraticBezierTo(cx - 16 * catScale, cy + 22 * catScale, cx - 10 * catScale, cy + 35 * catScale);
    chestPath.lineTo(cx + 10 * catScale, cy + 35 * catScale);
    chestPath.quadraticBezierTo(cx + 16 * catScale, cy + 22 * catScale, cx + 12 * catScale, cy + 8 * catScale);
    chestPath.close();
    canvas.drawPath(chestPath, Paint()..color = catGrayLight.withOpacity(0.7));
    
    // Front paws (tucked under chest, naturally connected)
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx - 12 * catScale, cy + 38 * catScale), width: 14 * catScale, height: 10 * catScale),
      Paint()..color = catGray,
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx + 8 * catScale, cy + 38 * catScale), width: 14 * catScale, height: 10 * catScale),
      Paint()..color = catGray,
    );
    
    // Head (connected to body via neck)
    final headCx = cx - 2 * catScale;
    final headCy = cy - 10 * catScale;
    // Neck connection
    final neckPath = Path();
    neckPath.moveTo(cx - 14 * catScale, cy + 5 * catScale);
    neckPath.quadraticBezierTo(headCx - 10 * catScale, cy - 3 * catScale, headCx - 12 * catScale, headCy + 8 * catScale);
    neckPath.lineTo(headCx + 12 * catScale, headCy + 8 * catScale);
    neckPath.quadraticBezierTo(headCx + 10 * catScale, cy - 3 * catScale, cx + 14 * catScale, cy + 5 * catScale);
    canvas.drawPath(neckPath, Paint()..color = catGray);
    
    // Head shape
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx, headCy), width: 38 * catScale, height: 32 * catScale),
      Paint()..shader = RadialGradient(
        center: const Alignment(-0.2, -0.3),
        colors: [catGrayLight, catGray],
      ).createShader(Rect.fromCenter(center: Offset(headCx, headCy), width: 38 * catScale, height: 32 * catScale)),
    );
    
    // Ears (organic triangle with curves)
    void drawEar(bool isLeft) {
      final dir = isLeft ? -1.0 : 1.0;
      final earPath = Path();
      earPath.moveTo(headCx + dir * 12 * catScale, headCy - 10 * catScale);
      earPath.quadraticBezierTo(
        headCx + dir * 18 * catScale, headCy - 35 * catScale,
        headCx + dir * 8 * catScale, headCy - 38 * catScale,
      );
      earPath.quadraticBezierTo(
        headCx + dir * 2 * catScale, headCy - 32 * catScale,
        headCx + dir * 4 * catScale, headCy - 12 * catScale,
      );
      earPath.close();
      canvas.drawPath(earPath, Paint()..color = catGray);
      // Inner ear
      final innerEarPath = Path();
      innerEarPath.moveTo(headCx + dir * 11 * catScale, headCy - 14 * catScale);
      innerEarPath.quadraticBezierTo(
        headCx + dir * 15 * catScale, headCy - 30 * catScale,
        headCx + dir * 8 * catScale, headCy - 32 * catScale,
      );
      innerEarPath.quadraticBezierTo(
        headCx + dir * 5 * catScale, headCy - 26 * catScale,
        headCx + dir * 6 * catScale, headCy - 15 * catScale,
      );
      innerEarPath.close();
      canvas.drawPath(innerEarPath, Paint()..color = const Color(0xFFFFB6C1).withOpacity(0.5));
    }
    drawEar(true);
    drawEar(false);
    
    // === EYES - CALM expression (half-closed, contemplative) ===
    final eyeY = headCy - 2 * catScale;
    final eyeSpacing = 8 * catScale;
    // Half-closed almond eyes
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx - eyeSpacing, eyeY), width: 10 * catScale, height: 5 * catScale),
      Paint()..color = const Color(0xFF9AE6B4),
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx + eyeSpacing, eyeY), width: 10 * catScale, height: 5 * catScale),
      Paint()..color = const Color(0xFF9AE6B4),
    );
    // Vertical slit pupils
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx - eyeSpacing, eyeY), width: 2 * catScale, height: 4 * catScale),
      Paint()..color = const Color(0xFF1A1A1A),
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(headCx + eyeSpacing, eyeY), width: 2 * catScale, height: 4 * catScale),
      Paint()..color = const Color(0xFF1A1A1A),
    );
    // Eye shine
    canvas.drawCircle(Offset(headCx - eyeSpacing - 2 * catScale, eyeY - 0.5 * catScale), 1 * catScale, Paint()..color = Colors.white.withOpacity(0.7));
    canvas.drawCircle(Offset(headCx + eyeSpacing - 2 * catScale, eyeY - 0.5 * catScale), 1 * catScale, Paint()..color = Colors.white.withOpacity(0.7));
    
    // Nose (small triangle)
    final nosePath = Path();
    nosePath.moveTo(headCx, headCy + 4 * catScale);
    nosePath.lineTo(headCx - 4 * catScale, headCy + 9 * catScale);
    nosePath.lineTo(headCx + 4 * catScale, headCy + 9 * catScale);
    nosePath.close();
    canvas.drawPath(nosePath, Paint()..color = const Color(0xFFFFB6C1));
    
    // Whiskers
    final whiskerPaint = Paint()..color = Colors.white.withOpacity(0.4)..strokeWidth = 0.8..strokeCap = StrokeCap.round;
    // Left whiskers
    canvas.drawLine(Offset(headCx - 12 * catScale, headCy + 6 * catScale), Offset(headCx - 30 * catScale, headCy + 2 * catScale), whiskerPaint);
    canvas.drawLine(Offset(headCx - 12 * catScale, headCy + 8 * catScale), Offset(headCx - 30 * catScale, headCy + 8 * catScale), whiskerPaint);
    canvas.drawLine(Offset(headCx - 12 * catScale, headCy + 10 * catScale), Offset(headCx - 28 * catScale, headCy + 14 * catScale), whiskerPaint);
    // Right whiskers
    canvas.drawLine(Offset(headCx + 12 * catScale, headCy + 6 * catScale), Offset(headCx + 30 * catScale, headCy + 2 * catScale), whiskerPaint);
    canvas.drawLine(Offset(headCx + 12 * catScale, headCy + 8 * catScale), Offset(headCx + 30 * catScale, headCy + 8 * catScale), whiskerPaint);
    canvas.drawLine(Offset(headCx + 12 * catScale, headCy + 10 * catScale), Offset(headCx + 28 * catScale, headCy + 14 * catScale), whiskerPaint);

    // === LAYER 7: Open book nearby ===
    final bookCenter = Offset(size.width * 0.72, size.height * 0.70);
    // Book pages
    final bookPath = Path();
    bookPath.moveTo(bookCenter.dx - 12, bookCenter.dy + 6);
    bookPath.quadraticBezierTo(bookCenter.dx - 14, bookCenter.dy - 2, bookCenter.dx - 12, bookCenter.dy - 6);
    bookPath.lineTo(bookCenter.dx, bookCenter.dy - 3);
    bookPath.lineTo(bookCenter.dx + 12, bookCenter.dy - 6);
    bookPath.quadraticBezierTo(bookCenter.dx + 14, bookCenter.dy - 2, bookCenter.dx + 12, bookCenter.dy + 6);
    bookPath.lineTo(bookCenter.dx, bookCenter.dy + 3);
    bookPath.close();
    canvas.drawPath(bookPath, Paint()..color = const Color(0xFFFFF8E7));
    // Spine
    canvas.drawLine(Offset(bookCenter.dx, bookCenter.dy - 3), Offset(bookCenter.dx, bookCenter.dy + 3), Paint()..color = const Color(0xFF4A3728)..strokeWidth = 1);
    // Text lines
    for (int i = 0; i < 3; i++) {
      canvas.drawLine(
        Offset(bookCenter.dx - 9, bookCenter.dy - 2 + i * 3.0),
        Offset(bookCenter.dx - 3, bookCenter.dy - 2 + i * 3.0),
        Paint()..color = const Color(0xFF8B8B8B).withOpacity(0.4)..strokeWidth = 0.5,
      );
      canvas.drawLine(
        Offset(bookCenter.dx + 3, bookCenter.dy - 2 + i * 3.0),
        Offset(bookCenter.dx + 9, bookCenter.dy - 2 + i * 3.0),
        Paint()..color = const Color(0xFF8B8B8B).withOpacity(0.4)..strokeWidth = 0.5,
      );
    }

    // === LAYER 8: Floating dust particles in lamplight ===
    for (int i = 0; i < 25; i++) {
      final px = size.width * 0.1 + random.nextDouble() * size.width * 0.4;
      final py = random.nextDouble() * size.height * 0.55;
      final dustSize = random.nextDouble() * 1.5 + 0.3;
      canvas.drawCircle(Offset(px, py), dustSize + 1, Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.08));
      canvas.drawCircle(Offset(px, py), dustSize, Paint()..color = const Color(0xFFFFE4B5).withOpacity(random.nextDouble() * 0.2 + 0.08));
    }

    // === LAYER 9: Vignette ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.45)],
        stops: const [0.4, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================================
// CLARIFICATION SCREEN HEADER
// ============================================================================

/// Header for Clarification Screen - Crystal ball / oracle theme
class ClarificationHeaderPainter extends CustomPainter {
  final bool isDark;

  ClarificationHeaderPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    // === LAYER 1: Mystical gradient ===
    final bgGradient = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [const Color(0xFF0D1B2A), const Color(0xFF1B263B), const Color(0xFF415A77)]
            : [const Color(0xFF2C3E50), const Color(0xFF4CA1AF), const Color(0xFF6DD5ED)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgGradient);

    // === LAYER 2: Stars ===
    final random = math.Random(99);
    for (int i = 0; i < 60; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.7;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.5 + 0.5, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.3));
    }

    // === LAYER 3: Crystal ball ===
    final center = Offset(size.width / 2, size.height * 0.45);
    final orbRadius = size.width * 0.2;

    for (int i = 3; i >= 0; i--) {
      canvas.drawCircle(center, orbRadius + i * 20, Paint()..shader = RadialGradient(colors: [const Color(0xFF00D4FF).withOpacity(0.2 - i * 0.04), Colors.transparent]).createShader(Rect.fromCircle(center: center, radius: orbRadius + i * 20)));
    }
    canvas.drawCircle(center, orbRadius, Paint()..shader = RadialGradient(center: const Alignment(-0.3, -0.3), colors: [Colors.white.withOpacity(0.4), const Color(0xFF00D4FF).withOpacity(0.2), const Color(0xFF6B5B95).withOpacity(0.3)]).createShader(Rect.fromCircle(center: center, radius: orbRadius)));
    canvas.drawCircle(center, orbRadius, Paint()..color = Colors.white.withOpacity(0.3)..style = PaintingStyle.stroke..strokeWidth = 2);

    // Inner reflection
    canvas.drawCircle(Offset(center.dx - orbRadius * 0.3, center.dy - orbRadius * 0.3), orbRadius * 0.3, Paint()..shader = RadialGradient(center: const Alignment(-0.5, -0.5), radius: 0.5, colors: [Colors.white.withOpacity(0.6), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(center.dx - orbRadius * 0.3, center.dy - orbRadius * 0.3), radius: orbRadius * 0.3)));

    // === LAYER 4: Mystical symbols ===
    final symbolPaint = Paint()..color = Colors.white.withOpacity(0.4)..style = PaintingStyle.stroke..strokeWidth = 1.5;
    final trianglePath = Path();
    trianglePath.moveTo(center.dx, center.dy - orbRadius * 0.4);
    trianglePath.lineTo(center.dx + orbRadius * 0.35, center.dy + orbRadius * 0.3);
    trianglePath.lineTo(center.dx - orbRadius * 0.35, center.dy + orbRadius * 0.3);
    trianglePath.close();
    canvas.drawPath(trianglePath, symbolPaint);
    canvas.drawOval(Rect.fromCenter(center: center, width: orbRadius * 0.4, height: orbRadius * 0.2), symbolPaint);
    canvas.drawCircle(center, orbRadius * 0.08, Paint()..color = Colors.white.withOpacity(0.6));

    // === LAYER 5: Floating particles ===
    for (int i = 0; i < 12; i++) {
      final x = center.dx + (random.nextDouble() - 0.5) * orbRadius * 3;
      final y = center.dy + (random.nextDouble() - 0.5) * orbRadius * 2.5;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 3 + 1, Paint()..color = const Color(0xFF00D4FF).withOpacity(random.nextDouble() * 0.4 + 0.1));
    }

    // === LAYER 6: Bottom fade ===
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25),
      Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, (isDark ? const Color(0xFF1E1B2E) : const Color(0xFFFAF5FF)).withOpacity(0.95)]).createShader(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================================
// CHARACTER INPUT CARD CONFIGURATIONS
// ============================================================================

class CharacterCardTheme {
  final String name;
  final CustomPainter Function(Color accentColor, bool isDark) iconPainter;
  final Color accentColor;

  const CharacterCardTheme({
    required this.name,
    required this.iconPainter,
    required this.accentColor,
  });
}

class CharacterCardThemes {
  /// Shadow-based themes for Character Entry page (mysterious silhouettes with peeking eyes)
  static final List<CharacterCardTheme> shadowThemes = [
    CharacterCardTheme(
      name: 'Mountain',
      iconPainter: (color, isDark) => MountainShadowPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFFB794F4), // Lavender
    ),
    CharacterCardTheme(
      name: 'Moon',
      iconPainter: (color, isDark) => MoonShadowPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFF9AE6B4), // Mint
    ),
    CharacterCardTheme(
      name: 'Cloud',
      iconPainter: (color, isDark) => CloudShadowPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFFFFD93D), // Gold/Yellow
    ),
    CharacterCardTheme(
      name: 'Flower',
      iconPainter: (color, isDark) => FlowerShadowPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFFFBB6CE), // Pink
    ),
    CharacterCardTheme(
      name: 'Heart',
      iconPainter: (color, isDark) => HeartShadowPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFFEC4899), // Rose
    ),
    CharacterCardTheme(
      name: 'Lighthouse',
      iconPainter: (color, isDark) => LighthouseShadowPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFF38BDF8), // Sky Blue
    ),
  ];

  /// Animal-based themes for other pages (Story, Clarification, etc.)
  static final List<CharacterCardTheme> animalThemes = [
    CharacterCardTheme(
      name: 'Lion',
      iconPainter: (color, isDark) => LionIllustrationPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFF8B5CF6), // Purple
    ),
    CharacterCardTheme(
      name: 'Owl',
      iconPainter: (color, isDark) => OwlIllustrationPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFFF59E0B), // Amber
    ),
    CharacterCardTheme(
      name: 'Birds',
      iconPainter: (color, isDark) => LoveBirdsIllustrationPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFFEC4899), // Pink
    ),
    CharacterCardTheme(
      name: 'Fox',
      iconPainter: (color, isDark) => FoxIllustrationPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFF3B82F6), // Blue
    ),
    CharacterCardTheme(
      name: 'Deer',
      iconPainter: (color, isDark) => DeerIllustrationPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFFD97706), // Gold
    ),
    CharacterCardTheme(
      name: 'Cat',
      iconPainter: (color, isDark) => CatIllustrationPainter(accentColor: color, isDark: isDark),
      accentColor: const Color(0xFF14B8A6), // Teal
    ),
  ];

  /// Default themes list (for backwards compatibility - uses shadow themes for character entry)
  static List<CharacterCardTheme> get themes => shadowThemes;

  static CharacterCardTheme getTheme(int index) {
    return shadowThemes[index % shadowThemes.length];
  }

  static CharacterCardTheme getAnimalTheme(int index) {
    return animalThemes[index % animalThemes.length];
  }
}
