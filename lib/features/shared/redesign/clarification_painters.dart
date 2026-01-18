import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Hall of Mirrors Header - Multiple reflections/mirrors showing different versions
class HallOfMirrorsPainter extends CustomPainter {
  final bool isDark;

  HallOfMirrorsPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);

    // === LAYER 1: Deep mystical gradient ===
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0D1B2A),
          const Color(0xFF1B263B),
          const Color(0xFF2D3A4A),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // === LAYER 2: Stars ===
    for (int i = 0; i < 40; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.6;
      canvas.drawCircle(
        Offset(x, y),
        random.nextDouble() * 1.2 + 0.3,
        Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.2),
      );
    }

    // === LAYER 3: Ornate mirror frames ===
    void drawMirror(Offset center, double width, double height, double rotation, Color glowColor) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(rotation);

      // Mirror glow
      for (int i = 3; i >= 0; i--) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset.zero, width: width + i * 8, height: height + i * 8),
            const Radius.circular(8),
          ),
          Paint()..color = glowColor.withOpacity(0.12 - i * 0.025),
        );
      }

      // Mirror frame (ornate border)
      final framePaint = Paint()
        ..color = const Color(0xFFD4AF37)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset.zero, width: width, height: height),
          const Radius.circular(4),
        ),
        framePaint,
      );

      // Mirror surface (reflective gradient)
      final mirrorPaint = Paint()
        ..shader = LinearGradient(
          begin: const Alignment(-0.5, -0.5),
          end: const Alignment(0.5, 0.5),
          colors: [
            Colors.white.withOpacity(0.15),
            glowColor.withOpacity(0.1),
            Colors.white.withOpacity(0.08),
          ],
        ).createShader(Rect.fromCenter(center: Offset.zero, width: width, height: height));
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: Offset.zero, width: width - 6, height: height - 6),
          const Radius.circular(2),
        ),
        mirrorPaint,
      );

      // Reflection lines
      final reflectionPaint = Paint()
        ..color = Colors.white.withOpacity(0.2)
        ..strokeWidth = 1;
      canvas.drawLine(
        Offset(-width * 0.3, -height * 0.3),
        Offset(-width * 0.15, -height * 0.15),
        reflectionPaint,
      );

      canvas.restore();
    }

    // Central large mirror
    drawMirror(
      Offset(size.width * 0.5, size.height * 0.4),
      80, 100,
      0,
      const Color(0xFF7C3AED),
    );

    // Left mirror (tilted)
    drawMirror(
      Offset(size.width * 0.15, size.height * 0.45),
      50, 65,
      -0.15,
      const Color(0xFFEC4899),
    );

    // Right mirror (tilted)
    drawMirror(
      Offset(size.width * 0.85, size.height * 0.45),
      50, 65,
      0.15,
      const Color(0xFF14B8A6),
    );

    // Far left small mirror
    drawMirror(
      Offset(size.width * 0.05, size.height * 0.35),
      30, 40,
      -0.25,
      const Color(0xFFF59E0B),
    );

    // Far right small mirror
    drawMirror(
      Offset(size.width * 0.95, size.height * 0.35),
      30, 40,
      0.25,
      const Color(0xFF3B82F6),
    );

    // === LAYER 4: Question marks floating (which version?) ===
    final questionPaint = Paint()..color = const Color(0xFFD4AF37).withOpacity(0.3);
    void drawQuestion(Offset center, double size) {
      final path = Path();
      // Simple question mark shape
      path.addArc(
        Rect.fromCenter(center: Offset(center.dx, center.dy - size * 0.2), width: size * 0.6, height: size * 0.5),
        math.pi,
        -math.pi * 1.3,
      );
      path.lineTo(center.dx + size * 0.1, center.dy + size * 0.1);
      canvas.drawPath(path, questionPaint..style = PaintingStyle.stroke..strokeWidth = 2);
      canvas.drawCircle(Offset(center.dx + size * 0.05, center.dy + size * 0.3), 2, questionPaint..style = PaintingStyle.fill);
    }
    drawQuestion(Offset(size.width * 0.3, size.height * 0.2), 18);
    drawQuestion(Offset(size.width * 0.7, size.height * 0.15), 15);

    // === LAYER 5: Floating sparkles ===
    for (int i = 0; i < 15; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.7;
      final sparkleColor = [
        const Color(0xFFD4AF37),
        const Color(0xFF7C3AED),
        const Color(0xFFEC4899),
        Colors.white,
      ][i % 4];
      canvas.drawCircle(
        Offset(x, y),
        random.nextDouble() * 2 + 1,
        Paint()..color = sparkleColor.withOpacity(random.nextDouble() * 0.4 + 0.2),
      );
    }

    // === LAYER 6: Infinity symbol (multiple versions concept) ===
    final infinityPaint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final infinityPath = Path();
    final infCenter = Offset(size.width * 0.5, size.height * 0.7);
    infinityPath.moveTo(infCenter.dx, infCenter.dy);
    infinityPath.cubicTo(
      infCenter.dx - 30, infCenter.dy - 15,
      infCenter.dx - 30, infCenter.dy + 15,
      infCenter.dx, infCenter.dy,
    );
    infinityPath.cubicTo(
      infCenter.dx + 30, infCenter.dy - 15,
      infCenter.dx + 30, infCenter.dy + 15,
      infCenter.dx, infCenter.dy,
    );
    canvas.drawPath(infinityPath, infinityPaint);

    // === LAYER 7: Bottom fade ===
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            (isDark ? const Color(0xFF1E1B2E) : const Color(0xFFFAF5FF)).withOpacity(0.95),
          ],
        ).createShader(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25)),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Mini character portrait - SHADOW-BASED with PEEKING EYES
/// Uses entities NOT used on Character Entry page: Sun, Star, Tree, Crystal, Wave, Castle
class CharacterPortraitPainter extends CustomPainter {
  final Color accentColor;
  final int characterIndex;

  CharacterPortraitPainter({required this.accentColor, required this.characterIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(characterIndex * 17);

    // Different shadow scenes based on index
    switch (characterIndex % 6) {
      case 0:
        _drawSunShadow(canvas, size, accentColor, random);
        break;
      case 1:
        _drawStarShadow(canvas, size, accentColor, random);
        break;
      case 2:
        _drawTreeShadow(canvas, size, accentColor, random);
        break;
      case 3:
        _drawCrystalShadow(canvas, size, accentColor, random);
        break;
      case 4:
        _drawWaveShadow(canvas, size, accentColor, random);
        break;
      case 5:
        _drawCastleShadow(canvas, size, accentColor, random);
        break;
    }
  }

  /// Sun Shadow - Rising sun with peeking eyes (Golden Dawn)
  void _drawSunShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Golden dawn gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF1A0A10), const Color(0xFF3D1A25), const Color(0xFFFF6B35).withOpacity(0.4), const Color(0xFFFFD93D).withOpacity(0.3)],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Horizon glow ===
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4), Paint()..shader = LinearGradient(
      begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [Colors.transparent, const Color(0xFFFFD93D).withOpacity(0.15)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4)));

    // === LAYER 3: Stars fading ===
    for (int i = 0; i < 15; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.4;
      canvas.drawCircle(Offset(x, y), random.nextDouble() + 0.3, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.3 + 0.1));
    }

    // === LAYER 4: SUN SHADOW (dark silhouette with rays) ===
    final sunCenter = Offset(size.width * 0.5, size.height * 0.45);
    final sunRadius = size.width * 0.22;
    
    // Rays (dark)
    for (int i = 0; i < 12; i++) {
      final angle = i * math.pi / 6;
      canvas.drawLine(
        Offset(sunCenter.dx + sunRadius * 1.1 * math.cos(angle), sunCenter.dy + sunRadius * 1.1 * math.sin(angle)),
        Offset(sunCenter.dx + sunRadius * 1.6 * math.cos(angle), sunCenter.dy + sunRadius * 1.6 * math.sin(angle)),
        Paint()..color = const Color(0xFF0A0508)..strokeWidth = 4..strokeCap = StrokeCap.round,
      );
    }
    
    // Sun outer glow
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(sunCenter, sunRadius + i * 8, Paint()..color = color.withOpacity(0.08 - i * 0.015));
    }
    
    // Sun body (dark)
    canvas.drawCircle(sunCenter, sunRadius, Paint()..color = const Color(0xFF0A0508));

    // === LAYER 5: PEEKING EYES ===
    final eyeY = sunCenter.dy;
    final eyeSpacing = sunRadius * 0.4;
    final eyeSize = sunRadius * 0.2;
    _drawPeekingEyes(canvas, sunCenter.dx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Landscape silhouette ===
    final hillPath = Path();
    hillPath.moveTo(0, size.height);
    hillPath.lineTo(0, size.height * 0.75);
    hillPath.quadraticBezierTo(size.width * 0.25, size.height * 0.68, size.width * 0.5, size.height * 0.72);
    hillPath.quadraticBezierTo(size.width * 0.75, size.height * 0.76, size.width, size.height * 0.7);
    hillPath.lineTo(size.width, size.height);
    hillPath.close();
    canvas.drawPath(hillPath, Paint()..color = const Color(0xFF0A0508).withOpacity(0.8));

    // === LAYER 7: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.35)], stops: const [0.5, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Star Shadow - Shooting star with peeking eyes (Cosmic Night)
  void _drawStarShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Cosmic gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color(0xFF050515), const Color(0xFF1A0A35), const Color(0xFF2A1A55), color.withOpacity(0.2)],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Nebula glow ===
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.3), size.width * 0.4, Paint()..shader = RadialGradient(colors: [color.withOpacity(0.12), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.7, size.height * 0.3), radius: size.width * 0.4)));

    // === LAYER 3: Background stars ===
    for (int i = 0; i < 25; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.2 + 0.3, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.5 + 0.2));
    }

    // === LAYER 4: STAR SHADOW (5-pointed star silhouette) ===
    final starCenter = Offset(size.width * 0.5, size.height * 0.48);
    final starSize = size.width * 0.28;
    
    // Star outer glow
    for (int i = 4; i >= 0; i--) {
      _drawStarShape(canvas, starCenter, starSize + i * 6, Paint()..color = color.withOpacity(0.08 - i * 0.015));
    }
    
    // Star body (dark)
    _drawStarShape(canvas, starCenter, starSize, Paint()..color = const Color(0xFF0A0510));

    // === LAYER 5: PEEKING EYES ===
    final eyeY = starCenter.dy + starSize * 0.05;
    final eyeSpacing = starSize * 0.25;
    final eyeSize = starSize * 0.12;
    _drawPeekingEyes(canvas, starCenter.dx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Shooting star trail ===
    final trailPath = Path();
    trailPath.moveTo(size.width * 0.15, size.height * 0.2);
    trailPath.quadraticBezierTo(size.width * 0.25, size.height * 0.28, size.width * 0.35, size.height * 0.32);
    canvas.drawPath(trailPath, Paint()..shader = LinearGradient(
      colors: [Colors.white.withOpacity(0.4), Colors.transparent],
    ).createShader(Rect.fromLTWH(size.width * 0.15, size.height * 0.2, size.width * 0.2, size.height * 0.15))..style = PaintingStyle.stroke..strokeWidth = 3..strokeCap = StrokeCap.round);

    // === LAYER 7: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.45, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  void _drawStarShape(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    for (int i = 0; i < 5; i++) {
      final outerAngle = (i * 4 * math.pi / 5) - math.pi / 2;
      final innerAngle = outerAngle + math.pi / 5;
      final outerPoint = Offset(center.dx + size * math.cos(outerAngle), center.dy + size * math.sin(outerAngle));
      final innerPoint = Offset(center.dx + size * 0.4 * math.cos(innerAngle), center.dy + size * 0.4 * math.sin(innerAngle));
      if (i == 0) path.moveTo(outerPoint.dx, outerPoint.dy);
      else path.lineTo(outerPoint.dx, outerPoint.dy);
      path.lineTo(innerPoint.dx, innerPoint.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  /// Tree Shadow - Ancient tree with peeking eyes (Mystical Forest)
  void _drawTreeShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Forest gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF050510), const Color(0xFF0A1A15), const Color(0xFF152A20), color.withOpacity(0.15)],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Moonlight glow ===
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.15), size.width * 0.35, Paint()..shader = RadialGradient(colors: [const Color(0xFF9AE6B4).withOpacity(0.1), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.8, size.height * 0.15), radius: size.width * 0.35)));

    // === LAYER 3: Fireflies ===
    for (int i = 0; i < 12; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final glowSize = random.nextDouble() * 2 + 1;
      canvas.drawCircle(Offset(x, y), glowSize + 3, Paint()..color = const Color(0xFF9AE6B4).withOpacity(0.1));
      canvas.drawCircle(Offset(x, y), glowSize, Paint()..color = const Color(0xFF9AE6B4).withOpacity(random.nextDouble() * 0.4 + 0.3));
    }

    // === LAYER 4: TREE SHADOW ===
    final treeCx = size.width * 0.5;
    final treeBottom = size.height * 0.92;
    
    // Trunk (dark)
    final trunkPath = Path();
    trunkPath.moveTo(treeCx - size.width * 0.06, treeBottom);
    trunkPath.lineTo(treeCx - size.width * 0.04, size.height * 0.55);
    trunkPath.lineTo(treeCx + size.width * 0.04, size.height * 0.55);
    trunkPath.lineTo(treeCx + size.width * 0.06, treeBottom);
    trunkPath.close();
    canvas.drawPath(trunkPath, Paint()..color = const Color(0xFF0A0510));
    
    // Canopy (dark layered circles)
    final canopyY = size.height * 0.38;
    for (int i = 3; i >= 0; i--) {
      canvas.drawCircle(Offset(treeCx, canopyY), size.width * 0.32 + i * 6, Paint()..color = color.withOpacity(0.06 - i * 0.012));
    }
    canvas.drawOval(Rect.fromCenter(center: Offset(treeCx - size.width * 0.12, canopyY - size.height * 0.05), width: size.width * 0.35, height: size.height * 0.28), Paint()..color = const Color(0xFF0A0510));
    canvas.drawOval(Rect.fromCenter(center: Offset(treeCx + size.width * 0.1, canopyY), width: size.width * 0.38, height: size.height * 0.32), Paint()..color = const Color(0xFF0A0510));
    canvas.drawOval(Rect.fromCenter(center: Offset(treeCx, canopyY + size.height * 0.08), width: size.width * 0.4, height: size.height * 0.25), Paint()..color = const Color(0xFF0A0510));

    // === LAYER 5: PEEKING EYES (in trunk) ===
    final eyeY = size.height * 0.65;
    final eyeSpacing = size.width * 0.05;
    final eyeSize = size.width * 0.03;
    _drawPeekingEyes(canvas, treeCx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Ground ===
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.88, size.width, size.height * 0.12), Paint()..color = const Color(0xFF0A0510).withOpacity(0.7));

    // === LAYER 7: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.4, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Crystal Shadow - Glowing crystal with peeking eyes (Cave)
  void _drawCrystalShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Cave gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF0A0515), const Color(0xFF15102A), const Color(0xFF1A1535), color.withOpacity(0.12)],
        stops: const [0.0, 0.35, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Crystal glow ===
    final crystalCenter = Offset(size.width * 0.5, size.height * 0.52);
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(crystalCenter, size.width * 0.28 + i * 10, Paint()..color = color.withOpacity(0.08 - i * 0.012));
    }

    // === LAYER 3: Cave rock texture ===
    for (int i = 0; i < 8; i++) {
      final rx = random.nextDouble() * size.width;
      final ry = random.nextDouble() * size.height * 0.3;
      canvas.drawOval(Rect.fromCenter(center: Offset(rx, ry), width: 15 + random.nextDouble() * 20, height: 8 + random.nextDouble() * 10), Paint()..color = const Color(0xFF15102A).withOpacity(0.5));
    }

    // === LAYER 4: CRYSTAL SHADOW (hexagonal prism) ===
    final crystalPath = Path();
    crystalPath.moveTo(crystalCenter.dx, crystalCenter.dy - size.height * 0.32);
    crystalPath.lineTo(crystalCenter.dx + size.width * 0.2, crystalCenter.dy - size.height * 0.08);
    crystalPath.lineTo(crystalCenter.dx + size.width * 0.15, crystalCenter.dy + size.height * 0.22);
    crystalPath.lineTo(crystalCenter.dx, crystalCenter.dy + size.height * 0.28);
    crystalPath.lineTo(crystalCenter.dx - size.width * 0.15, crystalCenter.dy + size.height * 0.22);
    crystalPath.lineTo(crystalCenter.dx - size.width * 0.2, crystalCenter.dy - size.height * 0.08);
    crystalPath.close();
    canvas.drawPath(crystalPath, Paint()..color = const Color(0xFF0A0510));
    
    // Crystal facet line
    canvas.drawLine(Offset(crystalCenter.dx, crystalCenter.dy - size.height * 0.32), Offset(crystalCenter.dx, crystalCenter.dy + size.height * 0.28), Paint()..color = const Color(0xFF1A1025)..strokeWidth = 2);

    // === LAYER 5: PEEKING EYES ===
    final eyeY = crystalCenter.dy - size.height * 0.02;
    final eyeSpacing = size.width * 0.08;
    final eyeSize = size.width * 0.04;
    _drawPeekingEyes(canvas, crystalCenter.dx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Small crystals ===
    for (int i = 0; i < 4; i++) {
      final cx = size.width * (0.12 + i * 0.25);
      final cy = size.height * 0.85;
      final h = 12 + random.nextDouble() * 10;
      final smallCrystal = Path();
      smallCrystal.moveTo(cx, cy - h);
      smallCrystal.lineTo(cx + h * 0.3, cy);
      smallCrystal.lineTo(cx - h * 0.3, cy);
      smallCrystal.close();
      canvas.drawPath(smallCrystal, Paint()..color = color.withOpacity(0.4));
    }

    // === LAYER 7: Sparkles ===
    for (int i = 0; i < 10; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(sx, sy), random.nextDouble() * 1.5 + 0.5, Paint()..color = color.withOpacity(random.nextDouble() * 0.35 + 0.15));
    }

    // === LAYER 8: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.45)], stops: const [0.35, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Wave Shadow - Ocean wave with peeking eyes (Stormy Sea)
  void _drawWaveShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Stormy sea gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF050512), const Color(0xFF0A1525), const Color(0xFF143D55), color.withOpacity(0.2)],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Lightning flash ===
    canvas.drawLine(Offset(size.width * 0.75, 0), Offset(size.width * 0.7, size.height * 0.15), Paint()..color = Colors.white.withOpacity(0.15)..strokeWidth = 2);
    canvas.drawLine(Offset(size.width * 0.7, size.height * 0.15), Offset(size.width * 0.78, size.height * 0.25), Paint()..color = Colors.white.withOpacity(0.1)..strokeWidth = 1.5);

    // === LAYER 3: Rain ===
    for (int i = 0; i < 20; i++) {
      final rx = random.nextDouble() * size.width;
      final ry = random.nextDouble() * size.height * 0.6;
      canvas.drawLine(Offset(rx, ry), Offset(rx - 2, ry + 8), Paint()..color = Colors.white.withOpacity(0.15)..strokeWidth = 0.8);
    }

    // === LAYER 4: WAVE SHADOW (curling wave silhouette) ===
    final wavePath = Path();
    wavePath.moveTo(0, size.height * 0.6);
    wavePath.quadraticBezierTo(size.width * 0.15, size.height * 0.45, size.width * 0.35, size.height * 0.38);
    wavePath.quadraticBezierTo(size.width * 0.5, size.height * 0.32, size.width * 0.6, size.height * 0.35);
    // Curl
    wavePath.quadraticBezierTo(size.width * 0.75, size.height * 0.28, size.width * 0.7, size.height * 0.42);
    wavePath.quadraticBezierTo(size.width * 0.65, size.height * 0.55, size.width * 0.8, size.height * 0.58);
    wavePath.lineTo(size.width, size.height * 0.52);
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();
    
    // Wave glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawPath(wavePath, Paint()..color = color.withOpacity(0.06 - i * 0.012)..style = PaintingStyle.stroke..strokeWidth = 8 + i * 4.0);
    }
    canvas.drawPath(wavePath, Paint()..color = const Color(0xFF0A0510));

    // === LAYER 5: PEEKING EYES (in wave curl) ===
    final eyeY = size.height * 0.42;
    final eyeSpacing = size.width * 0.06;
    final eyeSize = size.width * 0.035;
    _drawPeekingEyes(canvas, size.width * 0.55, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Spray/foam dots ===
    for (int i = 0; i < 15; i++) {
      final sx = size.width * 0.4 + random.nextDouble() * size.width * 0.4;
      final sy = size.height * 0.3 + random.nextDouble() * size.height * 0.3;
      canvas.drawCircle(Offset(sx, sy), random.nextDouble() * 2 + 0.5, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.2 + 0.08));
    }

    // === LAYER 7: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.4, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Castle Shadow - Tower with peeking eyes (Fantasy Night)
  void _drawCastleShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Fantasy night gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF0A0515), const Color(0xFF1A0A30), const Color(0xFF2A1A45), color.withOpacity(0.15)],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Moon ===
    final moonCenter = Offset(size.width * 0.82, size.height * 0.15);
    for (int i = 3; i >= 0; i--) {
      canvas.drawCircle(moonCenter, 10 + i * 6.0, Paint()..color = Colors.white.withOpacity(0.05 - i * 0.01));
    }
    canvas.drawCircle(moonCenter, 8, Paint()..color = const Color(0xFFFFFFF0));

    // === LAYER 3: Stars ===
    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.4;
      canvas.drawCircle(Offset(x, y), random.nextDouble() + 0.3, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.4 + 0.2));
    }

    // === LAYER 4: Distant hills ===
    final hillPath = Path();
    hillPath.moveTo(0, size.height * 0.82);
    hillPath.quadraticBezierTo(size.width * 0.3, size.height * 0.75, size.width * 0.6, size.height * 0.78);
    hillPath.quadraticBezierTo(size.width * 0.85, size.height * 0.82, size.width, size.height * 0.76);
    hillPath.lineTo(size.width, size.height);
    hillPath.lineTo(0, size.height);
    hillPath.close();
    canvas.drawPath(hillPath, Paint()..color = const Color(0xFF0A0510).withOpacity(0.6));

    // === LAYER 5: CASTLE SHADOW (tower silhouette) ===
    final towerCx = size.width * 0.5;
    
    // Main tower
    final towerPath = Path();
    towerPath.moveTo(towerCx - size.width * 0.12, size.height * 0.92);
    towerPath.lineTo(towerCx - size.width * 0.12, size.height * 0.35);
    towerPath.lineTo(towerCx - size.width * 0.15, size.height * 0.35);
    towerPath.lineTo(towerCx, size.height * 0.18);
    towerPath.lineTo(towerCx + size.width * 0.15, size.height * 0.35);
    towerPath.lineTo(towerCx + size.width * 0.12, size.height * 0.35);
    towerPath.lineTo(towerCx + size.width * 0.12, size.height * 0.92);
    towerPath.close();
    
    // Glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawPath(towerPath, Paint()..color = color.withOpacity(0.06 - i * 0.012)..style = PaintingStyle.stroke..strokeWidth = 6 + i * 4.0);
    }
    canvas.drawPath(towerPath, Paint()..color = const Color(0xFF0A0510));
    
    // Battlements
    for (int b = 0; b < 3; b++) {
      final bx = towerCx - size.width * 0.1 + b * size.width * 0.1;
      canvas.drawRect(Rect.fromLTWH(bx - 4, size.height * 0.32, 8, 12), Paint()..color = const Color(0xFF0A0510));
    }

    // === LAYER 6: PEEKING EYES (window) ===
    final eyeY = size.height * 0.52;
    final eyeSpacing = size.width * 0.05;
    final eyeSize = size.width * 0.03;
    _drawPeekingEyes(canvas, towerCx, eyeY, eyeSpacing, eyeSize, color);
    
    // Window frame around eyes
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(towerCx, eyeY), width: size.width * 0.18, height: size.height * 0.12), const Radius.circular(2)), Paint()..color = const Color(0xFF1A1025)..style = PaintingStyle.stroke..strokeWidth = 2);

    // === LAYER 7: Flags ===
    final flagPath = Path();
    flagPath.moveTo(towerCx, size.height * 0.18);
    flagPath.lineTo(towerCx, size.height * 0.08);
    flagPath.lineTo(towerCx + size.width * 0.08, size.height * 0.11);
    flagPath.lineTo(towerCx, size.height * 0.14);
    canvas.drawPath(flagPath, Paint()..color = color.withOpacity(0.6));

    // === LAYER 8: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.4, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Helper: Draw peeking eyes with glow
  void _drawPeekingEyes(Canvas canvas, double cx, double cy, double spacing, double eyeSize, Color glowColor) {
    // Eye glow
    for (int i = 2; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3), Paint()..color = glowColor.withOpacity(0.12 - i * 0.03));
      canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3), Paint()..color = glowColor.withOpacity(0.12 - i * 0.03));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (golden amber)
    canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    
    // Pupils
    canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(cx - spacing - eyeSize * 0.25, cy - eyeSize * 0.25), eyeSize * 0.18, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + spacing - eyeSize * 0.25, cy - eyeSize * 0.25), eyeSize * 0.18, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Golden thread icon - for "what you connect with"
class GoldenThreadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    // Glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawCircle(
        center,
        radius + i * 4,
        Paint()..color = const Color(0xFFD4AF37).withOpacity(0.15 - i * 0.03),
      );
    }

    // Thread spiral
    final threadPaint = Paint()
      ..color = const Color(0xFFD4AF37)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final path = Path();
    for (double t = 0; t < 4 * math.pi; t += 0.1) {
      final r = radius * 0.2 + (radius * 0.6 * t / (4 * math.pi));
      final x = center.dx + r * math.cos(t);
      final y = center.dy + r * math.sin(t);
      if (t == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, threadPaint);

    // Sparkle at end
    final endX = center.dx + radius * math.cos(4 * math.pi);
    final endY = center.dy + radius * math.sin(4 * math.pi);
    canvas.drawCircle(Offset(endX, endY), 3, Paint()..color = const Color(0xFFD4AF37));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Falling leaf icon - for "what doesn't fit"
class FallingLeafPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final leafSize = size.width * 0.4;

    // Leaf shape
    final leafPath = Path();
    leafPath.moveTo(center.dx, center.dy - leafSize);
    leafPath.quadraticBezierTo(center.dx + leafSize, center.dy, center.dx, center.dy + leafSize);
    leafPath.quadraticBezierTo(center.dx - leafSize, center.dy, center.dx, center.dy - leafSize);

    // Gradient fill
    canvas.drawPath(
      leafPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFFE85D04), const Color(0xFFB5651D)],
        ).createShader(Rect.fromCenter(center: center, width: leafSize * 2, height: leafSize * 2)),
    );

    // Vein
    canvas.drawLine(
      Offset(center.dx, center.dy - leafSize * 0.8),
      Offset(center.dx, center.dy + leafSize * 0.6),
      Paint()..color = const Color(0xFF8B4513)..strokeWidth = 1.5,
    );

    // Side veins
    for (int i = 1; i <= 3; i++) {
      final y = center.dy - leafSize * 0.3 + i * leafSize * 0.25;
      canvas.drawLine(
        Offset(center.dx, y),
        Offset(center.dx + leafSize * 0.3 * (1 - i * 0.2), y + leafSize * 0.1),
        Paint()..color = const Color(0xFF8B4513).withOpacity(0.6)..strokeWidth = 1,
      );
      canvas.drawLine(
        Offset(center.dx, y),
        Offset(center.dx - leafSize * 0.3 * (1 - i * 0.2), y + leafSize * 0.1),
        Paint()..color = const Color(0xFF8B4513).withOpacity(0.6)..strokeWidth = 1,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Version card illustration - SHADOW-BASED with PEEKING EYES
/// Uses same entities as CharacterPortraitPainter but with DIFFERENT scene variations
class VersionMiniPainter extends CustomPainter {
  final Color color;
  final int versionIndex;

  VersionMiniPainter({required this.color, required this.versionIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(versionIndex * 37 + 13);
    
    // Different shadow scenes based on version - same entities, different environments
    switch (versionIndex % 6) {
      case 0:
        _drawSunsetSunShadow(canvas, size, color, random);
        break;
      case 1:
        _drawNebulaStarShadow(canvas, size, color, random);
        break;
      case 2:
        _drawWillowTreeShadow(canvas, size, color, random);
        break;
      case 3:
        _drawAmethystCrystalShadow(canvas, size, color, random);
        break;
      case 4:
        _drawTidalWaveShadow(canvas, size, color, random);
        break;
      case 5:
        _drawRuinedCastleShadow(canvas, size, color, random);
        break;
    }
  }

  /// Sunset Sun Shadow - Warm orange sunset with peeking eyes
  void _drawSunsetSunShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Sunset gradient (orange/rose) ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF2D1B2E), const Color(0xFF4A1B3D), const Color(0xFFFF6B6B).withOpacity(0.35), const Color(0xFFFFB347).withOpacity(0.3)],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Cloud wisps ===
    for (int i = 0; i < 5; i++) {
      final cx = random.nextDouble() * size.width;
      final cy = size.height * (0.15 + random.nextDouble() * 0.2);
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: 40 + random.nextDouble() * 30, height: 10 + random.nextDouble() * 6), Paint()..color = const Color(0xFFFF6B6B).withOpacity(0.15));
    }

    // === LAYER 3: SUN SHADOW (half-setting sun) ===
    final sunCenter = Offset(size.width * 0.5, size.height * 0.65);
    final sunRadius = size.width * 0.28;
    
    // Sun rays behind horizon
    for (int i = 0; i < 8; i++) {
      final angle = math.pi + (i - 3.5) * math.pi / 10;
      canvas.drawLine(
        Offset(sunCenter.dx + sunRadius * 0.8 * math.cos(angle), sunCenter.dy + sunRadius * 0.8 * math.sin(angle)),
        Offset(sunCenter.dx + sunRadius * 1.8 * math.cos(angle), sunCenter.dy + sunRadius * 1.8 * math.sin(angle)),
        Paint()..color = const Color(0xFF0A0508).withOpacity(0.5)..strokeWidth = 5..strokeCap = StrokeCap.round,
      );
    }
    
    // Sun outer glow
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(sunCenter, sunRadius + i * 8, Paint()..color = color.withOpacity(0.06 - i * 0.01));
    }
    
    // Sun body (dark)
    canvas.drawCircle(sunCenter, sunRadius, Paint()..color = const Color(0xFF0A0508));

    // === LAYER 4: PEEKING EYES ===
    final eyeY = sunCenter.dy - sunRadius * 0.1;
    final eyeSpacing = sunRadius * 0.35;
    final eyeSize = sunRadius * 0.15;
    _drawPeekingEyes(canvas, sunCenter.dx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 5: Horizon line ===
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25), Paint()..color = const Color(0xFF0A0508).withOpacity(0.85));
    
    // Water reflection
    for (int i = 0; i < 8; i++) {
      final ry = size.height * 0.78 + i * 8.0;
      canvas.drawLine(Offset(size.width * 0.3, ry), Offset(size.width * 0.7, ry), Paint()..color = color.withOpacity(0.1 - i * 0.01)..strokeWidth = 2);
    }

    // === LAYER 6: Birds silhouette ===
    for (int i = 0; i < 4; i++) {
      final bx = size.width * (0.2 + i * 0.18);
      final by = size.height * (0.25 + random.nextDouble() * 0.1);
      canvas.drawArc(Rect.fromCenter(center: Offset(bx - 4, by), width: 8, height: 4), 0.3, math.pi - 0.6, false, Paint()..color = const Color(0xFF0A0508)..strokeWidth = 1.5..style = PaintingStyle.stroke);
      canvas.drawArc(Rect.fromCenter(center: Offset(bx + 4, by), width: 8, height: 4), 0.3, math.pi - 0.6, false, Paint()..color = const Color(0xFF0A0508)..strokeWidth = 1.5..style = PaintingStyle.stroke);
    }

    // === LAYER 7: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.35)], stops: const [0.5, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Nebula Star Shadow - Deep purple cosmic scene
  void _drawNebulaStarShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Deep purple nebula gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = RadialGradient(
        center: const Alignment(0.3, -0.2),
        colors: [const Color(0xFF3D1A55), const Color(0xFF1A0A30), const Color(0xFF050510)],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Nebula clouds ===
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.3), size.width * 0.35, Paint()..shader = RadialGradient(colors: [const Color(0xFFEC4899).withOpacity(0.12), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.2, size.height * 0.3), radius: size.width * 0.35)));
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.6), size.width * 0.3, Paint()..shader = RadialGradient(colors: [color.withOpacity(0.1), Colors.transparent]).createShader(Rect.fromCircle(center: Offset(size.width * 0.8, size.height * 0.6), radius: size.width * 0.3)));

    // === LAYER 3: Dense star field ===
    for (int i = 0; i < 40; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final starSize = random.nextDouble() * 1.5 + 0.2;
      canvas.drawCircle(Offset(x, y), starSize, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.6 + 0.2));
    }

    // === LAYER 4: STAR SHADOW (6-pointed) ===
    final starCenter = Offset(size.width * 0.5, size.height * 0.45);
    final starSize = size.width * 0.25;
    
    // Star outer glow
    for (int i = 4; i >= 0; i--) {
      _draw6PointStar(canvas, starCenter, starSize + i * 5, Paint()..color = color.withOpacity(0.08 - i * 0.015));
    }
    
    // Star body (dark)
    _draw6PointStar(canvas, starCenter, starSize, Paint()..color = const Color(0xFF0A0510));

    // === LAYER 5: PEEKING EYES ===
    final eyeY = starCenter.dy + starSize * 0.05;
    final eyeSpacing = starSize * 0.22;
    final eyeSize = starSize * 0.1;
    _drawPeekingEyes(canvas, starCenter.dx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Comet tail ===
    final cometPath = Path();
    cometPath.moveTo(size.width * 0.85, size.height * 0.15);
    cometPath.quadraticBezierTo(size.width * 0.7, size.height * 0.2, size.width * 0.6, size.height * 0.22);
    canvas.drawPath(cometPath, Paint()..shader = LinearGradient(colors: [Colors.white.withOpacity(0.5), Colors.transparent]).createShader(Rect.fromLTWH(size.width * 0.6, size.height * 0.15, size.width * 0.25, size.height * 0.1))..style = PaintingStyle.stroke..strokeWidth = 2.5..strokeCap = StrokeCap.round);

    // === LAYER 7: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.4, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  void _draw6PointStar(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final outerAngle = (i * math.pi / 3) - math.pi / 2;
      final innerAngle = outerAngle + math.pi / 6;
      final outerPoint = Offset(center.dx + size * math.cos(outerAngle), center.dy + size * math.sin(outerAngle));
      final innerPoint = Offset(center.dx + size * 0.45 * math.cos(innerAngle), center.dy + size * 0.45 * math.sin(innerAngle));
      if (i == 0) path.moveTo(outerPoint.dx, outerPoint.dy);
      else path.lineTo(outerPoint.dx, outerPoint.dy);
      path.lineTo(innerPoint.dx, innerPoint.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  /// Willow Tree Shadow - Misty swamp with drooping branches
  void _drawWillowTreeShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Misty swamp gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF0A1510), const Color(0xFF152520), const Color(0xFF1A3028), color.withOpacity(0.12)],
        stops: const [0.0, 0.35, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Mist layers ===
    for (int i = 0; i < 4; i++) {
      final my = size.height * (0.5 + i * 0.12);
      canvas.drawRect(Rect.fromLTWH(0, my, size.width, 15), Paint()..shader = LinearGradient(colors: [Colors.transparent, Colors.white.withOpacity(0.05), Colors.transparent]).createShader(Rect.fromLTWH(0, my, size.width, 15)));
    }

    // === LAYER 3: Distant trees ===
    for (int i = 0; i < 5; i++) {
      final tx = size.width * (0.1 + i * 0.2);
      final th = 25 + random.nextDouble() * 15;
      canvas.drawPath(Path()..moveTo(tx - 8, size.height * 0.7)..lineTo(tx, size.height * 0.7 - th)..lineTo(tx + 8, size.height * 0.7)..close(), Paint()..color = const Color(0xFF0A1510).withOpacity(0.5));
    }

    // === LAYER 4: WILLOW TREE SHADOW ===
    final treeCx = size.width * 0.5;
    final treeTop = size.height * 0.12;
    
    // Trunk
    final trunkPath = Path();
    trunkPath.moveTo(treeCx - 8, size.height * 0.95);
    trunkPath.quadraticBezierTo(treeCx - 6, size.height * 0.5, treeCx - 3, size.height * 0.25);
    trunkPath.lineTo(treeCx + 3, size.height * 0.25);
    trunkPath.quadraticBezierTo(treeCx + 6, size.height * 0.5, treeCx + 8, size.height * 0.95);
    trunkPath.close();
    canvas.drawPath(trunkPath, Paint()..color = const Color(0xFF0A0508));
    
    // Drooping branches
    for (int i = 0; i < 7; i++) {
      final bx = treeCx + (i - 3) * 12.0;
      final by = size.height * 0.25;
      final bendY = size.height * 0.75;
      canvas.drawLine(Offset(bx, by), Offset(bx + (i - 3) * 4, bendY), Paint()..color = const Color(0xFF0A0508)..strokeWidth = 2..strokeCap = StrokeCap.round);
      // Leaves (small)
      for (int j = 0; j < 5; j++) {
        final lx = bx + (i - 3) * 4 * j / 5;
        final ly = by + (bendY - by) * j / 5;
        canvas.drawOval(Rect.fromCenter(center: Offset(lx + random.nextDouble() * 4 - 2, ly), width: 4, height: 2), Paint()..color = const Color(0xFF0A0508));
      }
    }

    // === LAYER 5: PEEKING EYES (in trunk knot) ===
    final eyeY = size.height * 0.42;
    final eyeSpacing = size.width * 0.035;
    final eyeSize = size.width * 0.025;
    _drawPeekingEyes(canvas, treeCx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Water/swamp ===
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.85, size.width, size.height * 0.15), Paint()..color = const Color(0xFF0A1510).withOpacity(0.7));
    // Ripples
    canvas.drawArc(Rect.fromCenter(center: Offset(size.width * 0.3, size.height * 0.9), width: 20, height: 6), 0, math.pi, false, Paint()..color = Colors.white.withOpacity(0.08)..style = PaintingStyle.stroke..strokeWidth = 1);

    // === LAYER 7: Fireflies ===
    for (int i = 0; i < 8; i++) {
      final fx = random.nextDouble() * size.width;
      final fy = size.height * 0.3 + random.nextDouble() * size.height * 0.4;
      canvas.drawCircle(Offset(fx, fy), 3, Paint()..color = const Color(0xFF9AE6B4).withOpacity(0.1));
      canvas.drawCircle(Offset(fx, fy), 1.5, Paint()..color = const Color(0xFF9AE6B4).withOpacity(random.nextDouble() * 0.4 + 0.3));
    }

    // === LAYER 8: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.35, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Amethyst Crystal Shadow - Purple gem in cave
  void _drawAmethystCrystalShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Cave gradient (warmer purple) ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [const Color(0xFF15081A), const Color(0xFF251535), const Color(0xFF3D1A55), color.withOpacity(0.15)],
        stops: const [0.0, 0.35, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Crystal cluster glow ===
    final crystalCenter = Offset(size.width * 0.5, size.height * 0.52);
    for (int i = 6; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: crystalCenter, width: size.width * 0.55 + i * 10, height: size.height * 0.45 + i * 8), Paint()..color = color.withOpacity(0.06 - i * 0.008));
    }

    // === LAYER 3: Cave stalactites ===
    for (int i = 0; i < 6; i++) {
      final sx = size.width * (0.08 + i * 0.18);
      final sh = 15 + random.nextDouble() * 20;
      canvas.drawPath(Path()..moveTo(sx - 4, 0)..lineTo(sx, sh)..lineTo(sx + 4, 0)..close(), Paint()..color = const Color(0xFF15081A));
    }

    // === LAYER 4: CRYSTAL CLUSTER SHADOW (multiple points) ===
    // Main large crystal
    _drawCrystalShard(canvas, crystalCenter.dx, crystalCenter.dy + size.height * 0.15, size.height * 0.42, size.width * 0.14, 0);
    // Left crystal
    _drawCrystalShard(canvas, crystalCenter.dx - size.width * 0.15, crystalCenter.dy + size.height * 0.2, size.height * 0.28, size.width * 0.1, -0.2);
    // Right crystal
    _drawCrystalShard(canvas, crystalCenter.dx + size.width * 0.15, crystalCenter.dy + size.height * 0.18, size.height * 0.32, size.width * 0.11, 0.15);

    // === LAYER 5: PEEKING EYES (in main crystal) ===
    final eyeY = crystalCenter.dy;
    final eyeSpacing = size.width * 0.06;
    final eyeSize = size.width * 0.035;
    _drawPeekingEyes(canvas, crystalCenter.dx, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Cave floor rocks ===
    for (int i = 0; i < 5; i++) {
      final rx = random.nextDouble() * size.width;
      final ry = size.height * 0.85 + random.nextDouble() * size.height * 0.1;
      canvas.drawOval(Rect.fromCenter(center: Offset(rx, ry), width: 12 + random.nextDouble() * 10, height: 6 + random.nextDouble() * 5), Paint()..color = const Color(0xFF15081A));
    }

    // === LAYER 7: Sparkles ===
    for (int i = 0; i < 15; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(sx, sy), random.nextDouble() + 0.5, Paint()..color = color.withOpacity(random.nextDouble() * 0.35 + 0.15));
    }

    // === LAYER 8: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.45)], stops: const [0.35, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  void _drawCrystalShard(Canvas canvas, double cx, double bottom, double height, double width, double tilt) {
    canvas.save();
    canvas.translate(cx, bottom);
    canvas.rotate(tilt);
    final path = Path();
    path.moveTo(0, -height);
    path.lineTo(width / 2, 0);
    path.lineTo(-width / 2, 0);
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xFF0A0510));
    canvas.restore();
  }

  /// Tidal Wave Shadow - Dramatic crashing wave
  void _drawTidalWaveShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Storm sky gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF050510), const Color(0xFF0A1520), const Color(0xFF152535), color.withOpacity(0.2)],
        stops: const [0.0, 0.3, 0.55, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Storm clouds ===
    for (int i = 0; i < 4; i++) {
      final cx = random.nextDouble() * size.width;
      final cy = size.height * (0.1 + random.nextDouble() * 0.15);
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: 50 + random.nextDouble() * 40, height: 15 + random.nextDouble() * 10), Paint()..color = const Color(0xFF1A2535).withOpacity(0.6));
    }

    // === LAYER 3: Lightning ===
    final lx = size.width * 0.25;
    canvas.drawLine(Offset(lx, 0), Offset(lx - 5, size.height * 0.12), Paint()..color = Colors.white.withOpacity(0.2)..strokeWidth = 2);
    canvas.drawLine(Offset(lx - 5, size.height * 0.12), Offset(lx + 3, size.height * 0.18), Paint()..color = Colors.white.withOpacity(0.15)..strokeWidth = 1.5);

    // === LAYER 4: MASSIVE WAVE SHADOW ===
    final wavePath = Path();
    wavePath.moveTo(0, size.height * 0.5);
    wavePath.quadraticBezierTo(size.width * 0.1, size.height * 0.35, size.width * 0.25, size.height * 0.28);
    // Curl top
    wavePath.quadraticBezierTo(size.width * 0.4, size.height * 0.18, size.width * 0.55, size.height * 0.22);
    wavePath.quadraticBezierTo(size.width * 0.65, size.height * 0.25, size.width * 0.6, size.height * 0.4);
    // Curl inside
    wavePath.quadraticBezierTo(size.width * 0.55, size.height * 0.52, size.width * 0.7, size.height * 0.55);
    wavePath.lineTo(size.width, size.height * 0.45);
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();
    
    // Wave glow
    for (int i = 3; i >= 0; i--) {
      canvas.drawPath(wavePath, Paint()..color = color.withOpacity(0.05 - i * 0.01)..style = PaintingStyle.stroke..strokeWidth = 10 + i * 5.0);
    }
    canvas.drawPath(wavePath, Paint()..color = const Color(0xFF0A0510));

    // === LAYER 5: PEEKING EYES (in curl) ===
    final eyeY = size.height * 0.38;
    final eyeSpacing = size.width * 0.05;
    final eyeSize = size.width * 0.03;
    _drawPeekingEyes(canvas, size.width * 0.5, eyeY, eyeSpacing, eyeSize, color);

    // === LAYER 6: Spray/foam ===
    for (int i = 0; i < 20; i++) {
      final sx = size.width * 0.3 + random.nextDouble() * size.width * 0.45;
      final sy = size.height * 0.2 + random.nextDouble() * size.height * 0.35;
      canvas.drawCircle(Offset(sx, sy), random.nextDouble() * 2.5 + 0.5, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.18 + 0.05));
    }

    // === LAYER 7: Rain ===
    for (int i = 0; i < 15; i++) {
      final rx = random.nextDouble() * size.width;
      final ry = random.nextDouble() * size.height * 0.4;
      canvas.drawLine(Offset(rx, ry), Offset(rx - 3, ry + 12), Paint()..color = Colors.white.withOpacity(0.12)..strokeWidth = 0.8);
    }

    // === LAYER 8: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.35, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Ruined Castle Shadow - Ancient ruins with moonlight
  void _drawRuinedCastleShadow(Canvas canvas, Size size, Color color, math.Random random) {
    // === LAYER 1: Moonlit night gradient ===
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF0A0818), const Color(0xFF151228), const Color(0xFF201A38), color.withOpacity(0.12)],
        stops: const [0.0, 0.35, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Full moon ===
    final moonCenter = Offset(size.width * 0.78, size.height * 0.18);
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(moonCenter, 12 + i * 8.0, Paint()..color = Colors.white.withOpacity(0.04 - i * 0.007));
    }
    canvas.drawCircle(moonCenter, 10, Paint()..color = const Color(0xFFFFFFF0));
    // Moon craters (subtle)
    canvas.drawCircle(Offset(moonCenter.dx - 3, moonCenter.dy + 2), 2, Paint()..color = const Color(0xFFE8E8D8));

    // === LAYER 3: Stars ===
    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.4;
      canvas.drawCircle(Offset(x, y), random.nextDouble() + 0.3, Paint()..color = Colors.white.withOpacity(random.nextDouble() * 0.4 + 0.2));
    }

    // === LAYER 4: Distant hills ===
    final hillPath = Path();
    hillPath.moveTo(0, size.height * 0.78);
    hillPath.quadraticBezierTo(size.width * 0.2, size.height * 0.72, size.width * 0.4, size.height * 0.75);
    hillPath.quadraticBezierTo(size.width * 0.7, size.height * 0.78, size.width, size.height * 0.72);
    hillPath.lineTo(size.width, size.height);
    hillPath.lineTo(0, size.height);
    hillPath.close();
    canvas.drawPath(hillPath, Paint()..color = const Color(0xFF0A0510).withOpacity(0.5));

    // === LAYER 5: RUINED CASTLE SHADOW ===
    final castleCx = size.width * 0.5;
    
    // Left ruined tower
    canvas.drawRect(Rect.fromLTWH(castleCx - size.width * 0.28, size.height * 0.4, size.width * 0.1, size.height * 0.5), Paint()..color = const Color(0xFF0A0510));
    // Broken top
    canvas.drawPath(Path()..moveTo(castleCx - size.width * 0.28, size.height * 0.4)..lineTo(castleCx - size.width * 0.24, size.height * 0.32)..lineTo(castleCx - size.width * 0.2, size.height * 0.38)..lineTo(castleCx - size.width * 0.18, size.height * 0.4), Paint()..color = const Color(0xFF0A0510));
    
    // Main tower (taller)
    canvas.drawRect(Rect.fromLTWH(castleCx - size.width * 0.1, size.height * 0.28, size.width * 0.2, size.height * 0.65), Paint()..color = const Color(0xFF0A0510));
    // Pointed roof
    canvas.drawPath(Path()..moveTo(castleCx - size.width * 0.12, size.height * 0.28)..lineTo(castleCx, size.height * 0.12)..lineTo(castleCx + size.width * 0.12, size.height * 0.28)..close(), Paint()..color = const Color(0xFF0A0510));
    
    // Right ruined wall
    canvas.drawRect(Rect.fromLTWH(castleCx + size.width * 0.15, size.height * 0.52, size.width * 0.12, size.height * 0.4), Paint()..color = const Color(0xFF0A0510));

    // === LAYER 6: PEEKING EYES (in tower window) ===
    final eyeY = size.height * 0.45;
    final eyeSpacing = size.width * 0.04;
    final eyeSize = size.width * 0.028;
    _drawPeekingEyes(canvas, castleCx, eyeY, eyeSpacing, eyeSize, color);
    
    // Window arch around eyes
    canvas.drawArc(Rect.fromCenter(center: Offset(castleCx, eyeY - size.height * 0.02), width: size.width * 0.14, height: size.height * 0.1), math.pi, math.pi, false, Paint()..color = const Color(0xFF151020)..style = PaintingStyle.stroke..strokeWidth = 2);

    // === LAYER 7: Vines/ivy on walls ===
    for (int i = 0; i < 4; i++) {
      final vx = castleCx - size.width * 0.05 + random.nextDouble() * size.width * 0.1;
      final vy1 = size.height * 0.55;
      final vy2 = size.height * 0.75;
      canvas.drawLine(Offset(vx, vy1), Offset(vx + random.nextDouble() * 8 - 4, vy2), Paint()..color = const Color(0xFF1A3020).withOpacity(0.5)..strokeWidth = 1.5);
    }

    // === LAYER 8: Bats ===
    for (int i = 0; i < 3; i++) {
      final bx = size.width * (0.25 + i * 0.2);
      final by = size.height * (0.25 + random.nextDouble() * 0.1);
      // Simple bat shape
      canvas.drawArc(Rect.fromCenter(center: Offset(bx - 3, by), width: 6, height: 3), 0, math.pi, false, Paint()..color = const Color(0xFF0A0510)..strokeWidth = 1.5..style = PaintingStyle.stroke);
      canvas.drawArc(Rect.fromCenter(center: Offset(bx + 3, by), width: 6, height: 3), 0, math.pi, false, Paint()..color = const Color(0xFF0A0510)..strokeWidth = 1.5..style = PaintingStyle.stroke);
    }

    // === LAYER 9: Vignette ===
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12)), Paint()..shader = RadialGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.4)], stops: const [0.4, 1.0]).createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  /// Helper: Draw peeking eyes with glow
  void _drawPeekingEyes(Canvas canvas, double cx, double cy, double spacing, double eyeSize, Color glowColor) {
    // Eye glow
    for (int i = 2; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3), Paint()..color = glowColor.withOpacity(0.12 - i * 0.03));
      canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2 + i * 4, height: eyeSize * 1.5 + i * 3), Paint()..color = glowColor.withOpacity(0.12 - i * 0.03));
    }
    
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2, height: eyeSize * 1.5), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (golden amber)
    canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    
    // Pupils
    canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    
    // Eye shine
    canvas.drawCircle(Offset(cx - spacing - eyeSize * 0.25, cy - eyeSize * 0.25), eyeSize * 0.18, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + spacing - eyeSize * 0.25, cy - eyeSize * 0.25), eyeSize * 0.18, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
