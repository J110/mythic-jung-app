import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app/theme/app_theme.dart';
import 'shadow_utils.dart';

/// Story page illustrations - SHADOW SILHOUETTES WITH PEEKING EYES
/// 
/// All painters use centralized shadow_utils.dart for consistent:
/// - Eye proportions (4-5% of card width)
/// - Glow intensities
/// - Shadow colors
/// - Blending techniques
/// 
/// Character categories used on Story page:
/// - Fox (Animal) - Myth Summary
/// - Flame (Symbolic Entity) - Central Tension  
/// - Lighthouse (Building) - Guiding Sentence
/// - Mountain (Natural Entity) - North Star
/// - Moon (Cosmic) - Current Chapter

/// Myth Summary - Shadow Ancient Tome/Book with glowing eyes
/// Represents your complete mythic narrative - the grand story of your inner world
class MythStorytellerPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  MythStorytellerPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);
    const glowColor = Color(0xFFD4AF37); // Golden - represents ancient wisdom
    
    // === Background: Ancient library/mystical space ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A0A2E), Color(0xFF2D1545), Color(0xFF3D2055), Color(0xFF2A1535)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === Mystical glow behind book ===
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.45), width: size.width * 0.75, height: size.height * 0.55),
      Paint()..color = glowColor.withOpacity(0.1),
    );

    // === Floating ancient runes/symbols in background ===
    for (int i = 0; i < 12; i++) {
      final rx = random.nextDouble() * size.width;
      final ry = random.nextDouble() * size.height * 0.7;
      final runeSize = 8 + random.nextDouble() * 6;
      canvas.drawCircle(Offset(rx, ry), runeSize, Paint()..color = glowColor.withOpacity(0.08));
      canvas.drawCircle(Offset(rx, ry), runeSize * 0.4, Paint()..color = glowColor.withOpacity(0.2));
    }

    // === Pedestal/altar ===
    final pedestalPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.85)
      ..lineTo(size.width * 0.3, size.height * 0.72)
      ..lineTo(size.width * 0.7, size.height * 0.72)
      ..lineTo(size.width * 0.75, size.height * 0.85)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width * 0.25, size.height)
      ..close();
    canvas.drawPath(pedestalPath, Paint()..color = const Color(0xFF2A1A35));

    // === ANCIENT TOME SHADOW ===
    final bookCenter = Offset(size.width * 0.5, size.height * 0.45);
    final bookWidth = size.width * 0.45;
    final bookHeight = size.height * 0.35;
    
    // Book spine (center)
    final spinePath = Path()
      ..moveTo(bookCenter.dx - 4, bookCenter.dy - bookHeight * 0.5)
      ..lineTo(bookCenter.dx - 4, bookCenter.dy + bookHeight * 0.5)
      ..lineTo(bookCenter.dx + 4, bookCenter.dy + bookHeight * 0.5)
      ..lineTo(bookCenter.dx + 4, bookCenter.dy - bookHeight * 0.5)
      ..close();
    
    // Left page spread
    final leftPagePath = Path()
      ..moveTo(bookCenter.dx - 4, bookCenter.dy - bookHeight * 0.48)
      ..quadraticBezierTo(bookCenter.dx - bookWidth * 0.3, bookCenter.dy - bookHeight * 0.52, bookCenter.dx - bookWidth * 0.5, bookCenter.dy - bookHeight * 0.4)
      ..lineTo(bookCenter.dx - bookWidth * 0.5, bookCenter.dy + bookHeight * 0.4)
      ..quadraticBezierTo(bookCenter.dx - bookWidth * 0.3, bookCenter.dy + bookHeight * 0.52, bookCenter.dx - 4, bookCenter.dy + bookHeight * 0.48)
      ..close();
    
    // Right page spread
    final rightPagePath = Path()
      ..moveTo(bookCenter.dx + 4, bookCenter.dy - bookHeight * 0.48)
      ..quadraticBezierTo(bookCenter.dx + bookWidth * 0.3, bookCenter.dy - bookHeight * 0.52, bookCenter.dx + bookWidth * 0.5, bookCenter.dy - bookHeight * 0.4)
      ..lineTo(bookCenter.dx + bookWidth * 0.5, bookCenter.dy + bookHeight * 0.4)
      ..quadraticBezierTo(bookCenter.dx + bookWidth * 0.3, bookCenter.dy + bookHeight * 0.52, bookCenter.dx + 4, bookCenter.dy + bookHeight * 0.48)
      ..close();
    
    // Draw book with glow
    drawShadowBlendGlow(canvas, leftPagePath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawShadowBlendGlow(canvas, rightPagePath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawBlendedShadow(canvas, leftPagePath);
    drawBlendedShadow(canvas, rightPagePath);
    drawBlendedShadow(canvas, spinePath);
    
    // Page lines (subtle glow)
    for (int i = 0; i < 5; i++) {
      final lineY = bookCenter.dy - bookHeight * 0.25 + i * bookHeight * 0.12;
      canvas.drawLine(
        Offset(bookCenter.dx - bookWidth * 0.4, lineY),
        Offset(bookCenter.dx - bookWidth * 0.1, lineY),
        Paint()..color = glowColor.withOpacity(0.15)..strokeWidth = 1.5,
      );
      canvas.drawLine(
        Offset(bookCenter.dx + bookWidth * 0.1, lineY),
        Offset(bookCenter.dx + bookWidth * 0.4, lineY),
        Paint()..color = glowColor.withOpacity(0.15)..strokeWidth = 1.5,
      );
    }

    // PEEKING EYES - emerging from the book's pages (the story watches you)
    drawPeekingEyesProportional(
      canvas,
      Offset(bookCenter.dx, bookCenter.dy - bookHeight * 0.08),
      size.width,
      glowColor: glowColor,
      style: EyeStyle.mysterious,
    );

    // === Magical particles rising from book ===
    for (int i = 0; i < 10; i++) {
      final px = bookCenter.dx - bookWidth * 0.3 + random.nextDouble() * bookWidth * 0.6;
      final py = bookCenter.dy - bookHeight * 0.6 - random.nextDouble() * size.height * 0.2;
      canvas.drawCircle(Offset(px, py), 2 + random.nextDouble() * 2, Paint()..color = glowColor.withOpacity(0.3 + random.nextDouble() * 0.3));
    }

    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Central Tension - Twin Shadow Flames
class TensionFiguresPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  TensionFiguresPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(123);
    const leftGlow = Color(0xFFFF6B35);
    const rightGlow = Color(0xFF9AE6B4);
    
    // === Background: Warm dramatic gradient ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2D1515), Color(0xFF4A2525), Color(0xFF5A3030), Color(0xFF4A2020)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === Heat glow behind flames ===
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.5), size.width * 0.35, Paint()..color = leftGlow.withOpacity(0.12));
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.5), size.width * 0.35, Paint()..color = rightGlow.withOpacity(0.1));

    // === Ground ===
    final groundPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.82)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.78, size.width, size.height * 0.82)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(groundPath, Paint()..shader = const LinearGradient(
      begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [Color(0xFF3D2020), Color(0xFF2D1515)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.76, size.width, size.height * 0.24)));

    // === LEFT FLAME (proportional - about 35% of card width) ===
    final flameWidth = size.width * 0.28;
    final flameHeight = size.height * 0.4;
    
    final leftFlameCenter = Offset(size.width * 0.3, size.height * 0.5);
    final leftFlamePath = createFlamePath(leftFlameCenter, flameWidth, flameHeight);
    drawShadowBlendGlow(canvas, leftFlamePath, leftGlow, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawBlendedShadow(canvas, leftFlamePath);
    
    // Left flame eyes
    drawPeekingEyesProportional(
      canvas,
      Offset(leftFlameCenter.dx, leftFlameCenter.dy - flameHeight * 0.05),
      size.width,
      glowColor: leftGlow,
      style: EyeStyle.standard,
      sizeMultiplier: 0.9,
    );

    // === RIGHT FLAME ===
    final rightFlameCenter = Offset(size.width * 0.7, size.height * 0.5);
    final rightFlamePath = createFlamePath(rightFlameCenter, flameWidth, flameHeight);
    drawShadowBlendGlow(canvas, rightFlamePath, rightGlow, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawBlendedShadow(canvas, rightFlamePath);
    
    // Right flame eyes
    drawPeekingEyesProportional(
      canvas,
      Offset(rightFlameCenter.dx, rightFlameCenter.dy - flameHeight * 0.05),
      size.width,
      glowColor: rightGlow,
      style: EyeStyle.standard,
      sizeMultiplier: 0.9,
    );

    // === Tension arc between flames ===
    final tensionPath = Path()
      ..moveTo(leftFlameCenter.dx + flameWidth * 0.4, leftFlameCenter.dy - flameHeight * 0.3)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.25, rightFlameCenter.dx - flameWidth * 0.4, rightFlameCenter.dy - flameHeight * 0.3);
    for (int i = 3; i >= 0; i--) {
      canvas.drawPath(tensionPath, Paint()
        ..color = const Color(0xFFFBD38D).withOpacity(0.12 - i * 0.025)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4 + i * 2.0
        ..strokeCap = StrokeCap.round);
    }
    canvas.drawPath(tensionPath, Paint()
      ..color = const Color(0xFFFBD38D).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round);

    // === Embers ===
    for (int i = 0; i < 15; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.75;
      final emberColor = i % 2 == 0 ? leftGlow : const Color(0xFFFBD38D);
      canvas.drawCircle(Offset(x, y), 4, Paint()..color = emberColor.withOpacity(0.12));
      canvas.drawCircle(Offset(x, y), 1.5, Paint()..color = emberColor.withOpacity(0.5));
    }

    // === Vignette ===
    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Guiding Sentence - Shadow Lighthouse
class GuidingOwlPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  GuidingOwlPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(77);
    const glowColor = Color(0xFF14B8A6);
    
    // === Background: Twilight ocean ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1B4D5C), Color(0xFF2D6B7A), Color(0xFF3D8A8A), Color(0xFF2D6B7A)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === Stars ===
    drawStarField(canvas, size, count: 30, maxY: 0.4, seed: 77);

    // === Lighthouse beam ===
    final beamOrigin = Offset(size.width * 0.35, size.height * 0.22);
    final beamPath = Path()
      ..moveTo(beamOrigin.dx, beamOrigin.dy)
      ..lineTo(size.width * 1.1, size.height * 0.02)
      ..lineTo(size.width * 1.1, size.height * 0.35)
      ..close();
    canvas.drawPath(beamPath, Paint()..shader = LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight,
      colors: [glowColor.withOpacity(0.3), glowColor.withOpacity(0.08), Colors.transparent],
    ).createShader(Rect.fromLTWH(beamOrigin.dx, 0, size.width, size.height * 0.4)));

    // === Ocean waves ===
    for (int w = 0; w < 3; w++) {
      final waveY = size.height * (0.72 + w * 0.1);
      final wavePath = Path()..moveTo(-10, waveY);
      for (int i = 0; i < 6; i++) {
        wavePath.quadraticBezierTo(size.width * (i + 0.5) / 5, waveY - 8 + random.nextDouble() * 5, size.width * (i + 1) / 5, waveY);
      }
      wavePath.lineTo(size.width + 10, size.height);
      wavePath.lineTo(-10, size.height);
      wavePath.close();
      final waveColor = Color.lerp(const Color(0xFF2D6B7A), const Color(0xFF3D8A8A), w * 0.3)!;
      canvas.drawPath(wavePath, Paint()..color = waveColor);
    }

    // === Rocky cliff ===
    final cliffPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.15, size.height * 0.48, size.width * 0.4, size.height * 0.58)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.64, size.width * 0.45, size.height)
      ..close();
    canvas.drawPath(cliffPath, Paint()..shader = const LinearGradient(
      begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [Color(0xFF3D5A5A), Color(0xFF2D4A4A)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.45, size.width * 0.5, size.height * 0.55)));

    // === LIGHTHOUSE SHADOW (proportional - about 45% of card height) ===
    final lighthouseBase = Offset(size.width * 0.35, size.height * 0.75);
    final lighthouseWidth = size.width * 0.22;
    final lighthouseHeight = size.height * 0.55;
    
    final lighthousePath = createLighthousePath(lighthouseBase, lighthouseWidth, lighthouseHeight);
    drawShadowBlendGlow(canvas, lighthousePath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.1);
    drawBlendedShadow(canvas, lighthousePath);
    
    // Stripe details
    for (int i = 0; i < 4; i++) {
      final stripeY = lighthouseBase.dy - lighthouseHeight * (0.2 + i * 0.15);
      final stripeHalfWidth = lighthouseWidth * (0.32 - i * 0.03);
      canvas.drawLine(
        Offset(lighthouseBase.dx - stripeHalfWidth, stripeY),
        Offset(lighthouseBase.dx + stripeHalfWidth, stripeY),
        Paint()..color = glowColor.withOpacity(0.15)..strokeWidth = 2,
      );
    }
    
    // Lantern glow
    final lanternCenter = Offset(lighthouseBase.dx, lighthouseBase.dy - lighthouseHeight * 0.9);
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(lanternCenter, 10 + i * 5.0, Paint()..color = glowColor.withOpacity(0.15 - i * 0.02));
    }
    
    // EYES in lantern
    drawPeekingEyesProportional(
      canvas,
      lanternCenter,
      size.width,
      glowColor: glowColor,
      style: EyeStyle.standard,
      sizeMultiplier: 0.85,
    );

    // === Distant boat ===
    final boatCenter = Offset(size.width * 0.8, size.height * 0.58);
    final boatPath = Path()
      ..moveTo(boatCenter.dx - 12, boatCenter.dy)
      ..quadraticBezierTo(boatCenter.dx, boatCenter.dy + 6, boatCenter.dx + 12, boatCenter.dy)
      ..lineTo(boatCenter.dx + 9, boatCenter.dy - 4)
      ..lineTo(boatCenter.dx - 9, boatCenter.dy - 4)
      ..close();
    canvas.drawPath(boatPath, Paint()..color = const Color(0xFF6B4423));
    canvas.drawLine(Offset(boatCenter.dx, boatCenter.dy - 4), Offset(boatCenter.dx, boatCenter.dy - 18), Paint()..color = const Color(0xFF5A3A1A)..strokeWidth = 1.5);
    canvas.drawPath(Path()..moveTo(boatCenter.dx + 1, boatCenter.dy - 16)..lineTo(boatCenter.dx + 10, boatCenter.dy - 7)..lineTo(boatCenter.dx + 1, boatCenter.dy - 7)..close(), Paint()..color = const Color(0xFFFFF8DC).withOpacity(0.7));

    // === Vignette ===
    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// North Star - Shadow Mountain
class NorthStarFigurePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  NorthStarFigurePainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(99);
    const glowColor = Color(0xFFD4AF37);
    
    // === Background: Deep starry night ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0A0A18), Color(0xFF151530), Color(0xFF1A1A40), Color(0xFF252550)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === Milky way ===
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.1, 0, size.width * 0.8, size.height * 0.45),
      Paint()..shader = LinearGradient(
        begin: const Alignment(-0.5, -1), end: const Alignment(0.5, 1),
        colors: [Colors.transparent, Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.08), Colors.white.withOpacity(0.05), Colors.transparent],
      ).createShader(Rect.fromLTWH(size.width * 0.1, 0, size.width * 0.8, size.height * 0.45)),
    );

    // === Stars ===
    drawStarField(canvas, size, count: 55, maxY: 0.55, seed: 99);

    // === The North Star ===
    final starCenter = Offset(size.width * 0.7, size.height * 0.1);
    for (int i = 7; i >= 0; i--) {
      canvas.drawCircle(starCenter, 16 + i * 8.0, Paint()..color = glowColor.withOpacity(0.1 - i * 0.01));
    }
    for (int i = 0; i < 4; i++) {
      final angle = i * math.pi / 2;
      canvas.drawLine(
        Offset(starCenter.dx + 10 * math.cos(angle), starCenter.dy + 10 * math.sin(angle)),
        Offset(starCenter.dx + 30 * math.cos(angle), starCenter.dy + 30 * math.sin(angle)),
        Paint()..color = glowColor.withOpacity(0.5)..strokeWidth = 2..strokeCap = StrokeCap.round,
      );
    }
    canvas.drawCircle(starCenter, 10, Paint()..color = glowColor);
    canvas.drawCircle(starCenter, 5, Paint()..color = Colors.white);

    // === Far mountains ===
    final farMtnPath = Path()
      ..moveTo(0, size.height * 0.8)
      ..lineTo(size.width * 0.15, size.height * 0.6)
      ..lineTo(size.width * 0.3, size.height * 0.7)
      ..lineTo(size.width * 0.5, size.height * 0.55)
      ..lineTo(size.width * 0.65, size.height * 0.65)
      ..lineTo(size.width * 0.85, size.height * 0.52)
      ..lineTo(size.width, size.height * 0.6)
      ..lineTo(size.width, size.height * 0.8)
      ..close();
    canvas.drawPath(farMtnPath, Paint()..color = const Color(0xFF1A1A35).withOpacity(0.7));

    // === MAIN MOUNTAIN SHADOW (proportional - about 50% width) ===
    final mountainPath = createMountainPath(size, leftEdge: 0.15, rightEdge: 0.85, peakHeight: 0.28, peakX: 0.5);
    drawShadowBlendGlow(canvas, mountainPath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.1);
    drawBlendedShadow(canvas, mountainPath);
    
    // Snow cap
    final snowPath = Path()
      ..moveTo(size.width * 0.44, size.height * 0.38)
      ..lineTo(size.width * 0.5, size.height * 0.28)
      ..lineTo(size.width * 0.56, size.height * 0.38)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.36, size.width * 0.44, size.height * 0.38);
    canvas.drawPath(snowPath, Paint()..color = Colors.white.withOpacity(0.2));
    
    // EYES
    final eyeCenter = Offset(size.width * 0.5, size.height * 0.52);
    drawPeekingEyesProportional(
      canvas,
      eyeCenter,
      size.width,
      glowColor: glowColor,
      style: EyeStyle.mysterious,
    );

    // === Light beam from star to peak ===
    final beamPath = Path()
      ..moveTo(size.width * 0.45, size.height * 0.32)
      ..lineTo(starCenter.dx - 10, starCenter.dy + 12)
      ..lineTo(starCenter.dx + 10, starCenter.dy + 12)
      ..lineTo(size.width * 0.55, size.height * 0.32)
      ..close();
    canvas.drawPath(beamPath, Paint()..shader = LinearGradient(
      colors: [Colors.transparent, glowColor.withOpacity(0.08), glowColor.withOpacity(0.15)],
      begin: Alignment.bottomCenter, end: Alignment.topCenter,
    ).createShader(Rect.fromLTWH(size.width * 0.45, starCenter.dy, size.width * 0.1, size.height * 0.3)));

    // === Vignette ===
    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Current Chapter - Shadow Traveler on a winding path
/// Represents "where you are in your journey right now" - a figure at a specific point on their path
class CurrentChapterFigurePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  CurrentChapterFigurePainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(222);
    const glowColor = Color(0xFF8B5CF6); // Purple - represents the present moment
    const pathColor = Color(0xFFCBB89D); // Sandy/dusty path color - visible!
    
    // === Background: Twilight journey scene ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A1040), Color(0xFF251555), Color(0xFF352565), Color(0xFF453075)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === Stars in sky ===
    drawStarField(canvas, size, count: 30, maxY: 0.4, seed: 222);

    // === Distant mountains (the journey ahead/behind) ===
    final distantMtnPath = Path()
      ..moveTo(0, size.height * 0.55)
      ..lineTo(size.width * 0.15, size.height * 0.4)
      ..lineTo(size.width * 0.3, size.height * 0.48)
      ..lineTo(size.width * 0.5, size.height * 0.35)
      ..lineTo(size.width * 0.7, size.height * 0.45)
      ..lineTo(size.width * 0.85, size.height * 0.38)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width, size.height * 0.55)
      ..close();
    canvas.drawPath(distantMtnPath, Paint()..color = const Color(0xFF2A1A45).withOpacity(0.7));

    // === Ground/hills (draw BEFORE the path) ===
    final groundPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.6)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.55, size.width * 0.5, size.height * 0.58)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.62, size.width, size.height * 0.65)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(groundPath, Paint()..shader = const LinearGradient(
      begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [Color(0xFF3A2A55), Color(0xFF2A1A40)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.55, size.width, size.height * 0.45)));

    // === THE WINDING PATH - much more visible sandy trail ===
    // Path starts thin (distant past), widens (now), thins again (distant future)
    final journeyPathPoints = [
      Offset(size.width * 0.05, size.height * 0.38),
      Offset(size.width * 0.2, size.height * 0.48),
      Offset(size.width * 0.35, size.height * 0.55),
      Offset(size.width * 0.5, size.height * 0.64), // Current position - widest
      Offset(size.width * 0.65, size.height * 0.72),
      Offset(size.width * 0.8, size.height * 0.8),
      Offset(size.width * 0.95, size.height * 0.9),
    ];
    
    // Draw path as a visible trail with perspective (thin→thick→thin)
    final widths = [8.0, 14.0, 20.0, 28.0, 22.0, 16.0, 10.0];
    for (int i = 0; i < journeyPathPoints.length - 1; i++) {
      final start = journeyPathPoints[i];
      final end = journeyPathPoints[i + 1];
      
      // Path edge glow
      canvas.drawLine(start, end, Paint()..color = pathColor.withOpacity(0.3)..strokeWidth = widths[i] + 8..strokeCap = StrokeCap.round);
      // Main path
      canvas.drawLine(start, end, Paint()..color = pathColor.withOpacity(0.6)..strokeWidth = widths[i]..strokeCap = StrokeCap.round);
      // Center highlight
      canvas.drawLine(start, end, Paint()..color = pathColor.withOpacity(0.8)..strokeWidth = widths[i] * 0.4..strokeCap = StrokeCap.round);
    }
    
    // Path texture dots
    for (int i = 0; i < 20; i++) {
      final t = i / 20.0;
      final idx = (t * (journeyPathPoints.length - 1)).floor();
      final nextIdx = (idx + 1).clamp(0, journeyPathPoints.length - 1);
      final localT = (t * (journeyPathPoints.length - 1)) - idx;
      final point = Offset(
        journeyPathPoints[idx].dx + (journeyPathPoints[nextIdx].dx - journeyPathPoints[idx].dx) * localT,
        journeyPathPoints[idx].dy + (journeyPathPoints[nextIdx].dy - journeyPathPoints[idx].dy) * localT,
      );
      final offset = Offset((random.nextDouble() - 0.5) * 10, (random.nextDouble() - 0.5) * 6);
      canvas.drawCircle(point + offset, 1 + random.nextDouble() * 1.5, Paint()..color = pathColor.withOpacity(0.3 + random.nextDouble() * 0.2));
    }

    // === MILESTONE MARKERS - visible stone markers along path ===
    final milestones = [
      (pos: Offset(size.width * 0.2, size.height * 0.46), label: "past"),
      (pos: Offset(size.width * 0.35, size.height * 0.54), label: "past"),
      (pos: Offset(size.width * 0.65, size.height * 0.71), label: "future"),
      (pos: Offset(size.width * 0.8, size.height * 0.79), label: "future"),
    ];
    for (final m in milestones) {
      // Stone base
      final stonePath = Path()
        ..moveTo(m.pos.dx, m.pos.dy - 12)
        ..lineTo(m.pos.dx + 6, m.pos.dy)
        ..lineTo(m.pos.dx + 5, m.pos.dy + 3)
        ..lineTo(m.pos.dx - 5, m.pos.dy + 3)
        ..lineTo(m.pos.dx - 6, m.pos.dy)
        ..close();
      canvas.drawPath(stonePath, Paint()..color = const Color(0xFF5A4A6A));
      canvas.drawPath(stonePath, Paint()..color = glowColor.withOpacity(0.2)..style = PaintingStyle.stroke..strokeWidth = 1);
      // Small glow
      canvas.drawCircle(Offset(m.pos.dx, m.pos.dy - 6), 3, Paint()..color = glowColor.withOpacity(0.4));
    }

    // === "YOU ARE HERE" marker - prominent pulsing glow ===
    final youAreHerePos = Offset(size.width * 0.5, size.height * 0.63);
    // Large pulsing glow rings
    for (int i = 6; i >= 0; i--) {
      canvas.drawCircle(youAreHerePos, 12 + i * 6.0, Paint()..color = glowColor.withOpacity(0.25 - i * 0.03));
    }
    // Inner bright marker
    canvas.drawCircle(youAreHerePos, 10, Paint()..color = glowColor.withOpacity(0.7));
    canvas.drawCircle(youAreHerePos, 6, Paint()..color = Colors.white.withOpacity(0.8));
    canvas.drawCircle(youAreHerePos, 3, Paint()..color = glowColor);
    // Arrow pointing down to marker
    final arrowPath = Path()
      ..moveTo(youAreHerePos.dx, youAreHerePos.dy - 18)
      ..lineTo(youAreHerePos.dx - 6, youAreHerePos.dy - 26)
      ..lineTo(youAreHerePos.dx, youAreHerePos.dy - 22)
      ..lineTo(youAreHerePos.dx + 6, youAreHerePos.dy - 26)
      ..close();
    canvas.drawPath(arrowPath, Paint()..color = glowColor.withOpacity(0.8));

    // === TRAVELER SHADOW - standing AT the "you are here" marker ===
    final travelerCenter = Offset(size.width * 0.5, size.height * 0.48);
    final travelerSize = size.width * 0.25;
    
    // Full body silhouette with head integrated
    final bodyPath = Path();
    // Head (integrated at top)
    final headCenterY = travelerCenter.dy - travelerSize * 0.35;
    final headRadius = travelerSize * 0.18;
    bodyPath.addOval(Rect.fromCenter(
      center: Offset(travelerCenter.dx, headCenterY),
      width: headRadius * 2,
      height: headRadius * 1.8,
    ));
    
    // Body/cloak
    final cloakPath = Path()
      ..moveTo(travelerCenter.dx - headRadius * 0.7, headCenterY + headRadius * 0.6)
      ..quadraticBezierTo(travelerCenter.dx - travelerSize * 0.3, travelerCenter.dy - travelerSize * 0.1, travelerCenter.dx - travelerSize * 0.28, travelerCenter.dy + travelerSize * 0.35)
      ..lineTo(travelerCenter.dx + travelerSize * 0.28, travelerCenter.dy + travelerSize * 0.35)
      ..quadraticBezierTo(travelerCenter.dx + travelerSize * 0.3, travelerCenter.dy - travelerSize * 0.1, travelerCenter.dx + headRadius * 0.7, headCenterY + headRadius * 0.6)
      ..close();
    
    // Walking staff
    final staffTop = Offset(travelerCenter.dx + travelerSize * 0.35, travelerCenter.dy - travelerSize * 0.3);
    final staffBottom = Offset(travelerCenter.dx + travelerSize * 0.4, travelerCenter.dy + travelerSize * 0.4);
    
    // Draw traveler with glow
    drawShadowBlendGlow(canvas, cloakPath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawBlendedShadow(canvas, cloakPath);
    
    // Draw head (merged with body)
    final headPath = Path()..addOval(Rect.fromCenter(
      center: Offset(travelerCenter.dx, headCenterY),
      width: headRadius * 2,
      height: headRadius * 1.8,
    ));
    drawBlendedShadow(canvas, headPath);
    
    // Staff
    canvas.drawLine(staffTop, staffBottom, Paint()..color = const Color(0xFF2A1A20)..strokeWidth = 5..strokeCap = StrokeCap.round);
    canvas.drawLine(staffTop, staffBottom, Paint()..color = ShadowColors.shadow..strokeWidth = 3..strokeCap = StrokeCap.round);
    
    // PEEKING EYES - properly embedded in the head
    final eyeY = headCenterY + headRadius * 0.1;
    final eyeSpacing = headRadius * 0.5;
    final eyeSize = size.width * 0.025; // Smaller, proportional eyes
    
    // Eye glow
    for (int i = 2; i >= 0; i--) {
      canvas.drawOval(Rect.fromCenter(center: Offset(travelerCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2.2 + i * 3, height: eyeSize * 1.6 + i * 2), Paint()..color = glowColor.withOpacity(0.15 - i * 0.04));
      canvas.drawOval(Rect.fromCenter(center: Offset(travelerCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2.2 + i * 3, height: eyeSize * 1.6 + i * 2), Paint()..color = glowColor.withOpacity(0.15 - i * 0.04));
    }
    // Eye whites
    canvas.drawOval(Rect.fromCenter(center: Offset(travelerCenter.dx - eyeSpacing, eyeY), width: eyeSize * 2.2, height: eyeSize * 1.6), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(travelerCenter.dx + eyeSpacing, eyeY), width: eyeSize * 2.2, height: eyeSize * 1.6), Paint()..color = const Color(0xFFFFFFF0));
    // Irises
    canvas.drawCircle(Offset(travelerCenter.dx - eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(travelerCenter.dx + eyeSpacing, eyeY), eyeSize * 0.7, Paint()..color = const Color(0xFFFBD38D));
    // Pupils
    canvas.drawCircle(Offset(travelerCenter.dx - eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(travelerCenter.dx + eyeSpacing, eyeY), eyeSize * 0.35, Paint()..color = const Color(0xFF1A1A1A));
    // Shine
    canvas.drawCircle(Offset(travelerCenter.dx - eyeSpacing - eyeSize * 0.2, eyeY - eyeSize * 0.2), eyeSize * 0.18, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(travelerCenter.dx + eyeSpacing - eyeSize * 0.2, eyeY - eyeSize * 0.2), eyeSize * 0.18, Paint()..color = Colors.white);

    drawAtmosphericParticles(canvas, size, glowColor, count: 10, seed: 223);
    drawVignette(canvas, size, intensity: 0.25);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// ============================================================================
// FUNCTIONING CARD PAINTERS
// ============================================================================

/// Core Traits - Shadow Tree with Deep Roots
/// Represents "fundamental patterns that define you" - roots are your core, branches are expressions
class CoreTraitsPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  CoreTraitsPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(301);
    const glowColor = Color(0xFF6366F1); // Indigo - depth and wisdom
    
    // Background: Earth and sky split - showing above and below ground
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.5),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0A1520), Color(0xFF152535), Color(0xFF1A3040)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * 0.5)),
    );
    
    // Underground (where roots are)
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.5),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2A1A15), Color(0xFF1A0A05), Color(0xFF0A0502)],
      ).createShader(Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.5)),
    );

    // Ground line with glow
    canvas.drawLine(
      Offset(0, size.height * 0.5),
      Offset(size.width, size.height * 0.5),
      Paint()..color = const Color(0xFF3A2A20)..strokeWidth = 4,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.5),
      Offset(size.width, size.height * 0.5),
      Paint()..color = glowColor.withOpacity(0.2)..strokeWidth = 2,
    );

    // Stars in sky
    drawStarField(canvas, size, count: 20, maxY: 0.45, seed: 301);

    // === THE TREE OF CORE TRAITS ===
    final treeCenter = Offset(size.width * 0.5, size.height * 0.5);
    final treeSize = size.width * 0.35;
    
    // TRUNK (the core self)
    final trunkPath = Path()
      ..moveTo(treeCenter.dx - treeSize * 0.12, treeCenter.dy + treeSize * 0.05)
      ..lineTo(treeCenter.dx - treeSize * 0.08, treeCenter.dy - treeSize * 0.4)
      ..lineTo(treeCenter.dx + treeSize * 0.08, treeCenter.dy - treeSize * 0.4)
      ..lineTo(treeCenter.dx + treeSize * 0.12, treeCenter.dy + treeSize * 0.05)
      ..close();
    
    // BRANCHES (expressions of traits) - spreading upward
    final branches = <Path>[];
    // Main left branch
    branches.add(Path()
      ..moveTo(treeCenter.dx - treeSize * 0.05, treeCenter.dy - treeSize * 0.35)
      ..quadraticBezierTo(treeCenter.dx - treeSize * 0.25, treeCenter.dy - treeSize * 0.5, treeCenter.dx - treeSize * 0.4, treeCenter.dy - treeSize * 0.55));
    // Main right branch
    branches.add(Path()
      ..moveTo(treeCenter.dx + treeSize * 0.05, treeCenter.dy - treeSize * 0.35)
      ..quadraticBezierTo(treeCenter.dx + treeSize * 0.25, treeCenter.dy - treeSize * 0.5, treeCenter.dx + treeSize * 0.4, treeCenter.dy - treeSize * 0.55));
    // Center top
    branches.add(Path()
      ..moveTo(treeCenter.dx, treeCenter.dy - treeSize * 0.4)
      ..lineTo(treeCenter.dx, treeCenter.dy - treeSize * 0.65));
    // Small branches
    branches.add(Path()
      ..moveTo(treeCenter.dx - treeSize * 0.2, treeCenter.dy - treeSize * 0.45)
      ..lineTo(treeCenter.dx - treeSize * 0.3, treeCenter.dy - treeSize * 0.7));
    branches.add(Path()
      ..moveTo(treeCenter.dx + treeSize * 0.2, treeCenter.dy - treeSize * 0.45)
      ..lineTo(treeCenter.dx + treeSize * 0.3, treeCenter.dy - treeSize * 0.7));
    
    // ROOTS (deep patterns, foundations) - spreading downward
    final roots = <Path>[];
    // Main roots spreading out
    roots.add(Path()
      ..moveTo(treeCenter.dx - treeSize * 0.1, treeCenter.dy + treeSize * 0.05)
      ..quadraticBezierTo(treeCenter.dx - treeSize * 0.25, treeCenter.dy + treeSize * 0.2, treeCenter.dx - treeSize * 0.45, treeCenter.dy + treeSize * 0.35));
    roots.add(Path()
      ..moveTo(treeCenter.dx + treeSize * 0.1, treeCenter.dy + treeSize * 0.05)
      ..quadraticBezierTo(treeCenter.dx + treeSize * 0.25, treeCenter.dy + treeSize * 0.2, treeCenter.dx + treeSize * 0.45, treeCenter.dy + treeSize * 0.35));
    roots.add(Path()
      ..moveTo(treeCenter.dx - treeSize * 0.05, treeCenter.dy + treeSize * 0.05)
      ..quadraticBezierTo(treeCenter.dx - treeSize * 0.15, treeCenter.dy + treeSize * 0.3, treeCenter.dx - treeSize * 0.25, treeCenter.dy + treeSize * 0.5));
    roots.add(Path()
      ..moveTo(treeCenter.dx + treeSize * 0.05, treeCenter.dy + treeSize * 0.05)
      ..quadraticBezierTo(treeCenter.dx + treeSize * 0.15, treeCenter.dy + treeSize * 0.3, treeCenter.dx + treeSize * 0.25, treeCenter.dy + treeSize * 0.5));
    // Tap root (deep center)
    roots.add(Path()
      ..moveTo(treeCenter.dx, treeCenter.dy + treeSize * 0.05)
      ..lineTo(treeCenter.dx, treeCenter.dy + treeSize * 0.6));
    
    // Draw trunk with glow
    drawShadowBlendGlow(canvas, trunkPath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawBlendedShadow(canvas, trunkPath);
    
    // Draw branches
    for (final branch in branches) {
      canvas.drawPath(branch, Paint()..color = glowColor.withOpacity(0.08)..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
      canvas.drawPath(branch, Paint()..color = ShadowColors.shadow..strokeWidth = 5..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    }
    
    // Draw roots (glowing more - they're the "core")
    for (final root in roots) {
      canvas.drawPath(root, Paint()..color = glowColor.withOpacity(0.15)..strokeWidth = 10..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
      canvas.drawPath(root, Paint()..color = ShadowColors.shadow..strokeWidth = 6..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    }
    
    // PEEKING EYES in the trunk (your core self looking out)
    drawPeekingEyesProportional(
      canvas,
      Offset(treeCenter.dx, treeCenter.dy - treeSize * 0.15),
      size.width,
      glowColor: glowColor,
      style: EyeStyle.mysterious,
    );

    // Glowing energy in roots (representing deep patterns)
    for (int i = 0; i < 5; i++) {
      final rx = treeCenter.dx - treeSize * 0.3 + random.nextDouble() * treeSize * 0.6;
      final ry = treeCenter.dy + treeSize * 0.2 + random.nextDouble() * treeSize * 0.35;
      canvas.drawCircle(Offset(rx, ry), 3 + random.nextDouble() * 3, Paint()..color = glowColor.withOpacity(0.2 + random.nextDouble() * 0.2));
    }

    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Symbolic Essence - Shadow Mirror revealing inner reflection
/// Represents "the deeper symbolic meaning behind your patterns" - a mirror that shows your true essence
class SymbolicEssencePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  SymbolicEssencePainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(302);
    const glowColor = Color(0xFFD97706); // Amber - represents illumination/truth
    
    // Background: Mystical chamber
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A0A25), Color(0xFF2D1545), Color(0xFF3D1F5A), Color(0xFF2A1240)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Mystical atmosphere
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.45), width: size.width * 0.8, height: size.height * 0.6),
      Paint()..color = glowColor.withOpacity(0.08),
    );

    // Floating symbols in background (representing symbols/meaning)
    for (int i = 0; i < 8; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.3 + size.height * 0.1;
      // Draw small mystical symbols
      if (i % 3 == 0) {
        // Star shape
        final starPath = Path();
        for (int j = 0; j < 5; j++) {
          final angle = (j * 4 * math.pi / 5) - math.pi / 2;
          final point = Offset(sx + 6 * math.cos(angle), sy + 6 * math.sin(angle));
          if (j == 0) starPath.moveTo(point.dx, point.dy);
          else starPath.lineTo(point.dx, point.dy);
        }
        starPath.close();
        canvas.drawPath(starPath, Paint()..color = glowColor.withOpacity(0.2)..style = PaintingStyle.stroke..strokeWidth = 1);
      } else {
        canvas.drawCircle(Offset(sx, sy), 4, Paint()..color = glowColor.withOpacity(0.15));
      }
    }

    // === THE MYSTICAL MIRROR ===
    final mirrorCenter = Offset(size.width * 0.5, size.height * 0.45);
    final mirrorWidth = size.width * 0.4;
    final mirrorHeight = size.height * 0.45;
    
    // Ornate mirror frame (oval)
    final frameOuter = Rect.fromCenter(center: mirrorCenter, width: mirrorWidth + 20, height: mirrorHeight + 20);
    final frameInner = Rect.fromCenter(center: mirrorCenter, width: mirrorWidth, height: mirrorHeight);
    
    // Frame glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawOval(
        Rect.fromCenter(center: mirrorCenter, width: mirrorWidth + 20 + i * 8, height: mirrorHeight + 20 + i * 8),
        Paint()..color = glowColor.withOpacity(0.1 - i * 0.015),
      );
    }
    
    // Ornate frame
    canvas.drawOval(frameOuter, Paint()..color = const Color(0xFF3A2A20)..style = PaintingStyle.stroke..strokeWidth = 12);
    canvas.drawOval(frameOuter, Paint()..color = glowColor.withOpacity(0.4)..style = PaintingStyle.stroke..strokeWidth = 3);
    
    // Mirror surface (dark, reflective)
    canvas.drawOval(frameInner, Paint()..shader = RadialGradient(
      colors: [const Color(0xFF151020), const Color(0xFF0A0510), ShadowColors.shadow],
      stops: const [0.0, 0.6, 1.0],
    ).createShader(frameInner));
    
    // Mirror surface sheen
    final sheenPath = Path()
      ..addOval(Rect.fromCenter(center: Offset(mirrorCenter.dx - mirrorWidth * 0.15, mirrorCenter.dy - mirrorHeight * 0.15), width: mirrorWidth * 0.4, height: mirrorHeight * 0.3));
    canvas.drawPath(sheenPath, Paint()..color = Colors.white.withOpacity(0.05));
    
    // Decorative corner flourishes on frame
    for (final angle in [0.0, math.pi]) {
      final fx = mirrorCenter.dx + (mirrorWidth * 0.5 + 10) * math.cos(angle);
      final fy = mirrorCenter.dy;
      canvas.drawCircle(Offset(fx, fy), 6, Paint()..color = glowColor.withOpacity(0.5));
    }
    for (final angle in [math.pi / 2, -math.pi / 2]) {
      final fx = mirrorCenter.dx;
      final fy = mirrorCenter.dy + (mirrorHeight * 0.5 + 10) * math.sin(angle);
      canvas.drawCircle(Offset(fx, fy), 6, Paint()..color = glowColor.withOpacity(0.5));
    }

    // PEEKING EYES in the mirror - your essence looking back at you
    drawPeekingEyesProportional(
      canvas,
      Offset(mirrorCenter.dx, mirrorCenter.dy - mirrorHeight * 0.05),
      size.width,
      glowColor: glowColor,
      style: EyeStyle.mysterious,
      sizeMultiplier: 1.0,
    );
    
    // Mystical ripples emanating from eyes (the essence revealing itself)
    for (int i = 0; i < 3; i++) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(mirrorCenter.dx, mirrorCenter.dy), width: mirrorWidth * 0.5 + i * 25, height: mirrorHeight * 0.4 + i * 20),
        Paint()..color = glowColor.withOpacity(0.08 - i * 0.02)..style = PaintingStyle.stroke..strokeWidth = 1,
      );
    }

    // Ground/pedestal
    final pedestalPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.85)
      ..lineTo(size.width * 0.35, size.height * 0.78)
      ..lineTo(size.width * 0.65, size.height * 0.78)
      ..lineTo(size.width * 0.7, size.height * 0.85)
      ..lineTo(size.width * 0.7, size.height)
      ..lineTo(size.width * 0.3, size.height)
      ..close();
    canvas.drawPath(pedestalPath, Paint()..color = const Color(0xFF2A1A35));

    drawAtmosphericParticles(canvas, size, glowColor, count: 12, seed: 303);
    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Narrative Arc - Shadow River/Wave in Canyon
class NarrativeArcPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  NarrativeArcPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(303);
    const glowColor = Color(0xFF7C3AED); // Purple
    
    // Background: Sunset canyon
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFF8C42), Color(0xFFD97706), Color(0xFF8B5A2B), Color(0xFF4A2A15)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Sun
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.15), size.width * 0.12, Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.8));

    // Canyon walls
    canvas.drawPath(
      Path()..moveTo(0, size.height * 0.3)..lineTo(0, size.height)..lineTo(size.width * 0.2, size.height)..lineTo(size.width * 0.15, size.height * 0.4)..close(),
      Paint()..color = const Color(0xFF3A1A0A),
    );
    canvas.drawPath(
      Path()..moveTo(size.width, size.height * 0.35)..lineTo(size.width, size.height)..lineTo(size.width * 0.8, size.height)..lineTo(size.width * 0.85, size.height * 0.45)..close(),
      Paint()..color = const Color(0xFF3A1A0A),
    );

    // WAVE/RIVER SHADOW
    final waveCenter = Offset(size.width * 0.5, size.height * 0.55);
    final waveSize = size.width * 0.5;
    
    final wavePath = Path()
      ..moveTo(waveCenter.dx - waveSize * 0.6, waveCenter.dy + waveSize * 0.15)
      ..quadraticBezierTo(waveCenter.dx - waveSize * 0.3, waveCenter.dy - waveSize * 0.3, waveCenter.dx, waveCenter.dy - waveSize * 0.25)
      ..quadraticBezierTo(waveCenter.dx + waveSize * 0.3, waveCenter.dy - waveSize * 0.2, waveCenter.dx + waveSize * 0.5, waveCenter.dy + waveSize * 0.1)
      ..quadraticBezierTo(waveCenter.dx + waveSize * 0.3, waveCenter.dy + waveSize * 0.3, waveCenter.dx, waveCenter.dy + waveSize * 0.25)
      ..quadraticBezierTo(waveCenter.dx - waveSize * 0.3, waveCenter.dy + waveSize * 0.2, waveCenter.dx - waveSize * 0.6, waveCenter.dy + waveSize * 0.15)
      ..close();
    
    drawShadowBlendGlow(canvas, wavePath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawBlendedShadow(canvas, wavePath);
    
    // Eyes in wave curl
    drawPeekingEyesProportional(canvas, Offset(waveCenter.dx - waveSize * 0.1, waveCenter.dy - waveSize * 0.05), size.width, glowColor: glowColor, style: EyeStyle.curious);

    // Water spray particles
    drawAtmosphericParticles(canvas, size, const Color(0xFFFFE4B5), count: 10, minY: 0.35, maxY: 0.7, seed: 304);
    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Redemption Arc - Shadow Phoenix in Dawn Sky
class RedemptionArcPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  RedemptionArcPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(304);
    const glowColor = Color(0xFF10B981); // Emerald
    
    // Background: Dawn sky
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A1A35), Color(0xFF3D2D5A), Color(0xFFD97706), Color(0xFFFF8C42)],
        stops: [0.0, 0.3, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Rising sun
    final sunCenter = Offset(size.width * 0.5, size.height * 0.9);
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(sunCenter, 50 + i * 25.0, Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.1 - i * 0.015));
    }
    canvas.drawCircle(sunCenter, 40, Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.6));

    // Sun rays
    for (int i = 0; i < 8; i++) {
      final angle = -math.pi + i * math.pi / 7;
      canvas.drawLine(
        Offset(sunCenter.dx + 50 * math.cos(angle), sunCenter.dy + 50 * math.sin(angle)),
        Offset(sunCenter.dx + 120 * math.cos(angle), sunCenter.dy + 120 * math.sin(angle)),
        Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.3)..strokeWidth = 3..strokeCap = StrokeCap.round,
      );
    }

    // PHOENIX SHADOW
    final phoenixCenter = Offset(size.width * 0.5, size.height * 0.42);
    final phoenixSize = size.width * 0.45;
    
    // Body
    final bodyPath = Path()..addOval(Rect.fromCenter(center: phoenixCenter, width: phoenixSize * 0.4, height: phoenixSize * 0.5));
    
    // Wings spread
    final leftWing = Path()
      ..moveTo(phoenixCenter.dx - phoenixSize * 0.15, phoenixCenter.dy)
      ..quadraticBezierTo(phoenixCenter.dx - phoenixSize * 0.5, phoenixCenter.dy - phoenixSize * 0.3, phoenixCenter.dx - phoenixSize * 0.6, phoenixCenter.dy - phoenixSize * 0.1)
      ..quadraticBezierTo(phoenixCenter.dx - phoenixSize * 0.45, phoenixCenter.dy + phoenixSize * 0.1, phoenixCenter.dx - phoenixSize * 0.15, phoenixCenter.dy + phoenixSize * 0.1);
    final rightWing = Path()
      ..moveTo(phoenixCenter.dx + phoenixSize * 0.15, phoenixCenter.dy)
      ..quadraticBezierTo(phoenixCenter.dx + phoenixSize * 0.5, phoenixCenter.dy - phoenixSize * 0.3, phoenixCenter.dx + phoenixSize * 0.6, phoenixCenter.dy - phoenixSize * 0.1)
      ..quadraticBezierTo(phoenixCenter.dx + phoenixSize * 0.45, phoenixCenter.dy + phoenixSize * 0.1, phoenixCenter.dx + phoenixSize * 0.15, phoenixCenter.dy + phoenixSize * 0.1);
    
    // Tail feathers
    final tailPath = Path()
      ..moveTo(phoenixCenter.dx, phoenixCenter.dy + phoenixSize * 0.2)
      ..quadraticBezierTo(phoenixCenter.dx - phoenixSize * 0.15, phoenixCenter.dy + phoenixSize * 0.5, phoenixCenter.dx, phoenixCenter.dy + phoenixSize * 0.6)
      ..quadraticBezierTo(phoenixCenter.dx + phoenixSize * 0.15, phoenixCenter.dy + phoenixSize * 0.5, phoenixCenter.dx, phoenixCenter.dy + phoenixSize * 0.2);
    
    drawShadowBlendGlow(canvas, bodyPath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawShadowBlendGlow(canvas, leftWing, glowColor, layers: 3, baseSpread: 3, maxOpacity: 0.1);
    drawShadowBlendGlow(canvas, rightWing, glowColor, layers: 3, baseSpread: 3, maxOpacity: 0.1);
    drawShadowBlendGlow(canvas, tailPath, glowColor, layers: 3, baseSpread: 3, maxOpacity: 0.1);
    drawBlendedShadow(canvas, bodyPath);
    drawBlendedShadow(canvas, leftWing);
    drawBlendedShadow(canvas, rightWing);
    drawBlendedShadow(canvas, tailPath);
    
    // Head
    canvas.drawOval(Rect.fromCenter(center: Offset(phoenixCenter.dx, phoenixCenter.dy - phoenixSize * 0.22), width: phoenixSize * 0.25, height: phoenixSize * 0.22), Paint()..color = ShadowColors.shadow);
    
    // Eyes
    drawPeekingEyesProportional(canvas, Offset(phoenixCenter.dx, phoenixCenter.dy - phoenixSize * 0.22), size.width, glowColor: glowColor, style: EyeStyle.curious, sizeMultiplier: 0.85);

    drawStarField(canvas, size, count: 20, maxY: 0.35, seed: 305);
    drawVignette(canvas, size, intensity: 0.25);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Costs & Compensations - Shadow Scales in Storm
class CostsCompensationsPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  CostsCompensationsPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(305);
    const glowColor = Color(0xFFF59E0B); // Amber
    
    // Background: Storm sky
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A1A2A), Color(0xFF2D2D45), Color(0xFF3D3D5A), Color(0xFF4A4A6A)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Storm clouds
    for (int i = 0; i < 4; i++) {
      final cx = size.width * (0.15 + i * 0.25);
      final cy = size.height * (0.15 + random.nextDouble() * 0.15);
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: 70 + random.nextDouble() * 40, height: 30), Paint()..color = const Color(0xFF2A2A45).withOpacity(0.8));
    }

    // Lightning bolt
    final lightningPath = Path()
      ..moveTo(size.width * 0.65, 0)
      ..lineTo(size.width * 0.55, size.height * 0.25)
      ..lineTo(size.width * 0.65, size.height * 0.25)
      ..lineTo(size.width * 0.5, size.height * 0.5);
    canvas.drawPath(lightningPath, Paint()..color = glowColor.withOpacity(0.4)..style = PaintingStyle.stroke..strokeWidth = 3);

    // SCALES SHADOW
    final scalesCenter = Offset(size.width * 0.5, size.height * 0.52);
    final scalesSize = size.width * 0.4;
    
    // Central pillar
    canvas.drawRect(Rect.fromCenter(center: Offset(scalesCenter.dx, scalesCenter.dy + scalesSize * 0.1), width: scalesSize * 0.08, height: scalesSize * 0.6), Paint()..color = ShadowColors.shadow);
    
    // Balance beam
    final beamPath = Path()
      ..moveTo(scalesCenter.dx - scalesSize * 0.5, scalesCenter.dy - scalesSize * 0.05)
      ..lineTo(scalesCenter.dx + scalesSize * 0.5, scalesCenter.dy + scalesSize * 0.05);
    canvas.drawPath(beamPath, Paint()..color = ShadowColors.shadow..strokeWidth = 6..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    
    // Left pan
    final leftPanPath = Path()..addOval(Rect.fromCenter(center: Offset(scalesCenter.dx - scalesSize * 0.45, scalesCenter.dy + scalesSize * 0.15), width: scalesSize * 0.35, height: scalesSize * 0.12));
    drawShadowBlendGlow(canvas, leftPanPath, glowColor, layers: 3, baseSpread: 3, maxOpacity: 0.1);
    drawBlendedShadow(canvas, leftPanPath);
    
    // Right pan
    final rightPanPath = Path()..addOval(Rect.fromCenter(center: Offset(scalesCenter.dx + scalesSize * 0.45, scalesCenter.dy + scalesSize * 0.25), width: scalesSize * 0.35, height: scalesSize * 0.12));
    drawShadowBlendGlow(canvas, rightPanPath, glowColor, layers: 3, baseSpread: 3, maxOpacity: 0.1);
    drawBlendedShadow(canvas, rightPanPath);
    
    // Chain lines
    canvas.drawLine(Offset(scalesCenter.dx - scalesSize * 0.5, scalesCenter.dy - scalesSize * 0.05), Offset(scalesCenter.dx - scalesSize * 0.45, scalesCenter.dy + scalesSize * 0.1), Paint()..color = ShadowColors.shadow..strokeWidth = 2);
    canvas.drawLine(Offset(scalesCenter.dx + scalesSize * 0.5, scalesCenter.dy + scalesSize * 0.05), Offset(scalesCenter.dx + scalesSize * 0.45, scalesCenter.dy + scalesSize * 0.2), Paint()..color = ShadowColors.shadow..strokeWidth = 2);
    
    // Eyes on fulcrum
    drawPeekingEyesProportional(canvas, Offset(scalesCenter.dx, scalesCenter.dy - scalesSize * 0.2), size.width, glowColor: glowColor, style: EyeStyle.standard);

    drawAtmosphericParticles(canvas, size, const Color(0xFF6A6A8A), count: 12, seed: 306);
    drawVignette(canvas, size, intensity: 0.35);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Power Stance - Shadow Lion in Golden Savanna
class PowerStancePainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  PowerStancePainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(306);
    const glowColor = Color(0xFFDC2626); // Red
    
    // Background: Golden savanna sunset
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFF6B35), Color(0xFFD97706), Color(0xFFB8860B), Color(0xFF8B7355)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Setting sun
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.2), size.width * 0.15, Paint()..color = const Color(0xFFFFE4B5).withOpacity(0.7));

    // Savanna grass silhouettes
    for (int i = 0; i < 20; i++) {
      final gx = random.nextDouble() * size.width;
      final gHeight = 15 + random.nextDouble() * 25;
      canvas.drawLine(
        Offset(gx, size.height * 0.82),
        Offset(gx + random.nextDouble() * 8 - 4, size.height * 0.82 - gHeight),
        Paint()..color = const Color(0xFF6B5A3A).withOpacity(0.6)..strokeWidth = 2,
      );
    }

    // Ground
    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.8, size.width, size.height * 0.2), Paint()..color = const Color(0xFF5A4A2A));

    // LION SHADOW
    final lionCenter = Offset(size.width * 0.45, size.height * 0.5);
    final lionSize = size.width * 0.42;
    
    // Body
    final bodyPath = Path()..addOval(Rect.fromCenter(center: Offset(lionCenter.dx, lionCenter.dy + lionSize * 0.1), width: lionSize * 0.65, height: lionSize * 0.45));
    
    // Mane (circle around head)
    final maneCenter = Offset(lionCenter.dx, lionCenter.dy - lionSize * 0.1);
    final manePath = Path()..addOval(Rect.fromCenter(center: maneCenter, width: lionSize * 0.6, height: lionSize * 0.55));
    
    // Head inside mane
    final headPath = Path()..addOval(Rect.fromCenter(center: maneCenter, width: lionSize * 0.35, height: lionSize * 0.32));
    
    drawShadowBlendGlow(canvas, bodyPath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawShadowBlendGlow(canvas, manePath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    drawBlendedShadow(canvas, bodyPath);
    drawBlendedShadow(canvas, manePath);
    drawBlendedShadow(canvas, headPath);
    
    // Tail
    final tailPath = Path()
      ..moveTo(lionCenter.dx + lionSize * 0.28, lionCenter.dy + lionSize * 0.15)
      ..quadraticBezierTo(lionCenter.dx + lionSize * 0.5, lionCenter.dy + lionSize * 0.05, lionCenter.dx + lionSize * 0.45, lionCenter.dy - lionSize * 0.1);
    canvas.drawPath(tailPath, Paint()..color = ShadowColors.shadow..strokeWidth = lionSize * 0.06..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    
    // Proud eyes
    drawPeekingEyesProportional(canvas, Offset(maneCenter.dx, maneCenter.dy - lionSize * 0.02), size.width, glowColor: glowColor, style: EyeStyle.standard, sizeMultiplier: 1.0);

    // Acacia tree silhouette
    final treeX = size.width * 0.85;
    canvas.drawRect(Rect.fromCenter(center: Offset(treeX, size.height * 0.65), width: 8, height: size.height * 0.3), Paint()..color = const Color(0xFF3A2A1A));
    canvas.drawOval(Rect.fromCenter(center: Offset(treeX, size.height * 0.45), width: 60, height: 25), Paint()..color = const Color(0xFF3A2A1A));

    drawVignette(canvas, size, intensity: 0.25);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Alignment Indicators - Shadow Compass in Aurora
class AlignmentIndicatorsPainter extends CustomPainter {
  final Color primaryColor;
  final Color accentColor;
  final bool isDark;

  AlignmentIndicatorsPainter({required this.primaryColor, required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(307);
    const glowColor = Color(0xFF14B8A6); // Teal
    
    // Background: Northern lights
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0A1A25), Color(0xFF152535), Color(0xFF1A3545), Color(0xFF0D1B2A)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Aurora waves
    for (int i = 0; i < 4; i++) {
      final auroraPath = Path()..moveTo(0, size.height * (0.15 + i * 0.1));
      for (int j = 0; j < 10; j++) {
        auroraPath.quadraticBezierTo(
          size.width * (j + 0.5) / 10, size.height * (0.1 + i * 0.1) + random.nextDouble() * 30 - 15,
          size.width * (j + 1) / 10, size.height * (0.15 + i * 0.1),
        );
      }
      final auroraColor = i % 2 == 0 ? glowColor : const Color(0xFF22D3EE);
      canvas.drawPath(auroraPath, Paint()..color = auroraColor.withOpacity(0.15 - i * 0.03)..style = PaintingStyle.stroke..strokeWidth = 20 - i * 4);
    }

    // Stars
    drawStarField(canvas, size, count: 40, maxY: 0.5, seed: 307);

    // Snow ground
    canvas.drawPath(
      Path()..moveTo(0, size.height)..lineTo(0, size.height * 0.8)..quadraticBezierTo(size.width * 0.5, size.height * 0.75, size.width, size.height * 0.8)..lineTo(size.width, size.height)..close(),
      Paint()..color = const Color(0xFF2A3A4A),
    );

    // COMPASS SHADOW
    final compassCenter = Offset(size.width * 0.5, size.height * 0.5);
    final compassSize = size.width * 0.35;
    
    // Outer ring
    final outerPath = Path()..addOval(Rect.fromCenter(center: compassCenter, width: compassSize, height: compassSize));
    drawShadowBlendGlow(canvas, outerPath, glowColor, layers: 4, baseSpread: 4, maxOpacity: 0.12);
    canvas.drawOval(Rect.fromCenter(center: compassCenter, width: compassSize, height: compassSize), Paint()..color = ShadowColors.shadow..style = PaintingStyle.stroke..strokeWidth = 6);
    
    // Inner compass face
    canvas.drawOval(Rect.fromCenter(center: compassCenter, width: compassSize * 0.85, height: compassSize * 0.85), Paint()..color = ShadowColors.shadow);
    
    // Compass needle (N-S)
    final needlePath = Path()
      ..moveTo(compassCenter.dx, compassCenter.dy - compassSize * 0.35)
      ..lineTo(compassCenter.dx + compassSize * 0.08, compassCenter.dy)
      ..lineTo(compassCenter.dx, compassCenter.dy + compassSize * 0.35)
      ..lineTo(compassCenter.dx - compassSize * 0.08, compassCenter.dy)
      ..close();
    canvas.drawPath(needlePath, Paint()..color = glowColor.withOpacity(0.2));
    
    // Cardinal direction marks
    for (int i = 0; i < 4; i++) {
      final angle = i * math.pi / 2 - math.pi / 2;
      canvas.drawLine(
        Offset(compassCenter.dx + compassSize * 0.3 * math.cos(angle), compassCenter.dy + compassSize * 0.3 * math.sin(angle)),
        Offset(compassCenter.dx + compassSize * 0.4 * math.cos(angle), compassCenter.dy + compassSize * 0.4 * math.sin(angle)),
        Paint()..color = glowColor.withOpacity(0.3)..strokeWidth = 3..strokeCap = StrokeCap.round,
      );
    }
    
    // Eyes
    drawPeekingEyesProportional(canvas, compassCenter, size.width, glowColor: glowColor, style: EyeStyle.standard);

    drawVignette(canvas, size, intensity: 0.3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// ============================================================================
// CARD CONFIGURATION AND WIDGETS
// ============================================================================

class ContentCardConfig {
  final String id;
  final String title;
  final String infoText;
  final CustomPainter Function(Color primary, Color accent, bool isDark) iconPainter;
  final Color accentColor;

  const ContentCardConfig({
    required this.id,
    required this.title,
    required this.infoText,
    required this.iconPainter,
    required this.accentColor,
  });
}

class ContentCard extends StatefulWidget {
  final ContentCardConfig config;
  final String? content;
  final List<dynamic>? examples;
  final bool isLoading;

  const ContentCard({super.key, required this.config, this.content, this.examples, this.isLoading = false});

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.content != null ? () => _openDetailView(context) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: _isHovered ? widget.config.accentColor.withOpacity(0.3) : Colors.black.withOpacity(0.2), blurRadius: _isHovered ? 15 : 8, offset: const Offset(0, 4))],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Positioned.fill(
                  child: widget.isLoading
                      ? Container(color: widget.config.accentColor.withOpacity(0.2), child: Center(child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(widget.config.accentColor))))
                      : CustomPaint(painter: widget.config.iconPainter(widget.config.accentColor, widget.config.accentColor, isDark), size: Size.infinite),
                ),
                Positioned(bottom: 0, left: 0, right: 0, height: 60, child: Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withOpacity(0.7)])))),
                Positioned(bottom: 10, left: 12, right: 12, child: Text(widget.config.title, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white, shadows: [Shadow(offset: const Offset(1, 1), blurRadius: 3, color: Colors.black.withOpacity(0.5))]), maxLines: 1, overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDetailView(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false, barrierDismissible: true, barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) => ContentDetailView(config: widget.config, content: widget.content!, examples: widget.examples ?? []),
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)), child: child),
    ));
  }
}

class ContentDetailView extends StatefulWidget {
  final ContentCardConfig config;
  final String content;
  final List<dynamic> examples;

  const ContentDetailView({super.key, required this.config, required this.content, required this.examples});

  @override
  State<ContentDetailView> createState() => _ContentDetailViewState();
}

class _ContentDetailViewState extends State<ContentDetailView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 3 tabs: About, In Your Life, Examples (consistent with Archetype detail view)
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF1A1225) : Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Header with illustration (200px height - standard)
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: widget.config.iconPainter(widget.config.accentColor, widget.config.accentColor, isDark),
                      size: Size.infinite,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: 12,
                    left: 12,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.close, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  // Title only (info text moved to About tab)
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Text(
                      widget.config.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(offset: const Offset(1, 1), blurRadius: 4, color: Colors.black.withOpacity(0.5))],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TabBar with 3 tabs: About, In Your Life, Examples
            Container(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: widget.config.accentColor,
                indicatorWeight: 3,
                labelColor: widget.config.accentColor,
                unselectedLabelColor: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                labelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.psychology, size: 18), SizedBox(width: 6), Text('About')])),
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.visibility, size: 18), SizedBox(width: 6), Text('In Your Life')])),
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.movie_outlined, size: 18), SizedBox(width: 6), Text('Examples')])),
                ],
              ),
            ),
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAboutTab(context, isDark),
                  _buildInYourLifeTab(context, isDark),
                  _buildExamplesTab(context, isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// About tab - explains what this concept represents
  Widget _buildAboutTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // What is this section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.config.accentColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.lightbulb_outline, color: widget.config.accentColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'What is ${widget.config.title}?',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.config.infoText,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.7,
                    fontSize: 16,
                    color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.config.accentColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: widget.config.accentColor.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: widget.config.accentColor, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _getAboutDescription(widget.config.id),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark ? Colors.white.withOpacity(0.8) : Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// In Your Life tab - personalized narrative content
  Widget _buildInYourLifeTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.config.accentColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.person_outline, color: widget.config.accentColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'How This Shows Up For You',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.content,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.8,
                    fontSize: 16,
                    color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Examples tab - pop culture examples
  Widget _buildExamplesTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    if (widget.examples.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_outlined, size: 64, color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No examples available',
              style: theme.textTheme.titleMedium?.copyWith(color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Text(
              'Pop culture examples will appear here',
              style: theme.textTheme.bodySmall?.copyWith(color: isDark ? Colors.grey.shade500 : Colors.grey.shade500),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.examples.length,
      itemBuilder: (context, index) {
        final example = widget.examples[index];
        final character = example is Map ? (example['character'] ?? example['name'] ?? 'Character') : 'Character';
        final description = example is Map ? (example['description'] ?? example['text'] ?? example.toString()) : example.toString();
        final franchise = example is Map ? (example['franchise'] ?? '') : '';
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2D1F42) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: widget.config.accentColor.withOpacity(0.3)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.2 : 0.05), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.config.accentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.person, size: 20, color: widget.config.accentColor),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.toString(),
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87),
                        ),
                        if (franchise.isNotEmpty)
                          Text(
                            franchise.toString(),
                            style: theme.textTheme.bodySmall?.copyWith(color: widget.config.accentColor.withOpacity(0.8)),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description.toString(),
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.6, color: isDark ? Colors.white.withOpacity(0.8) : Colors.black87),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Get detailed description for the About tab
  String _getAboutDescription(String id) {
    switch (id) {
      case 'mythSummary':
        return 'This is the grand narrative of your inner world — the archetypal story that shapes how you see yourself and move through life. It\'s the myth you unconsciously live by.';
      case 'centralTension':
        return 'Every compelling story has a central conflict. This is yours — the core dynamic that creates both challenges and opportunities for growth in your life.';
      case 'guidingSentence':
        return 'This is your inner compass — a crystallized expression of what drives you toward authenticity and fulfillment. It\'s the question or statement that keeps you aligned.';
      case 'northStarScene':
        return 'This is a vivid visualization of your highest potential — the scene that represents who you can become when you\'re living in full alignment with your deeper self.';
      case 'currentChapter':
        return 'Your life story is unfolding in chapters. This represents where you are right now in your psychological journey — the themes and challenges of your current phase.';
      case 'coreTraits':
        return 'These are the fundamental psychological patterns that define how you operate — the core aspects of your personality that consistently show up across different situations.';
      case 'symbolicEssence':
        return 'This captures the deeper symbolic meaning behind your patterns — the archetypal image or metaphor that best represents your essential nature.';
      case 'narrativeArc':
        return 'This is the typical story arc your life tends to follow — the pattern of how events and experiences unfold for you, shaped by your psychological dynamics.';
      case 'redemptionArc':
        return 'This outlines your path toward growth and transformation — how you can work with your patterns to achieve integration and wholeness.';
      case 'costsAndCompensations':
        return 'Every psychological pattern has both costs and compensations. This reveals the trade-offs you make and the adaptations you\'ve developed.';
      case 'powerStance':
        return 'This is your position of strength and authority — how you naturally show up when you\'re operating from your most empowered self.';
      case 'alignmentIndicators':
        return 'These are the signs that show when you\'re living in alignment with your deeper self versus when you\'ve strayed from your authentic path.';
      default:
        return 'This represents an important aspect of your psychological landscape and inner narrative.';
    }
  }
}

/// ArchetypeDetailView - Full-screen detail view for archetype cards
/// Matches the design pattern of ContentDetailView for consistency
/// Standard 3-tab layout: About, In Your Life, Examples
class ArchetypeDetailView extends StatefulWidget {
  final String motif;
  final String label;
  final String description;
  final Color accentColor;
  final double score;
  final bool isShadow;
  final CustomPainter Function(String motif, Color color, bool isDark, {bool isShadow}) painterBuilder;
  final String howItShowsUp;
  final List<dynamic> examples;  // Optional examples (defaults to empty)
  
  const ArchetypeDetailView({
    super.key,
    required this.motif,
    required this.label,
    required this.description,
    required this.accentColor,
    required this.score,
    required this.isShadow,
    required this.painterBuilder,
    required this.howItShowsUp,
    this.examples = const [],  // Optional, defaults to empty
  });

  @override
  State<ArchetypeDetailView> createState() => _ArchetypeDetailViewState();
}

class _ArchetypeDetailViewState extends State<ArchetypeDetailView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 3 tabs: About, In Your Life, Examples (consistent with ContentDetailView)
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF1A1225) : Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Header with illustration (200px height - standard)
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: widget.painterBuilder(widget.motif, widget.accentColor, isDark, isShadow: widget.isShadow),
                      size: Size.infinite,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: 12,
                    left: 12,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.close, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  // Title and score
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.isShadow)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'SHADOW',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        Text(
                          widget.label,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(offset: const Offset(1, 1), blurRadius: 4, color: Colors.black.withOpacity(0.5))],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Strength: ${(widget.score * 100).toInt()}%',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.white.withOpacity(0.9),
                                shadows: [Shadow(offset: const Offset(0.5, 0.5), blurRadius: 2, color: Colors.black.withOpacity(0.5))],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: widget.score,
                                  minHeight: 6,
                                  backgroundColor: Colors.white.withOpacity(0.2),
                                  valueColor: AlwaysStoppedAnimation(widget.accentColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // TabBar with 3 tabs: About, In Your Life, Examples
            Container(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: widget.accentColor,
                indicatorWeight: 3,
                labelColor: widget.accentColor,
                unselectedLabelColor: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                labelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.psychology, size: 18), SizedBox(width: 6), Text('About')])),
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.visibility, size: 18), SizedBox(width: 6), Text('In Your Life')])),
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.movie_outlined, size: 18), SizedBox(width: 6), Text('Examples')])),
                ],
              ),
            ),
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAboutTab(context, isDark),
                  _buildInYourLifeTab(context, isDark),
                  _buildExamplesTab(context, isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.accentColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.lightbulb_outline, color: widget.accentColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'About This Energy',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.8,
                    fontSize: 16,
                    color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          if (widget.isShadow) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(isDark ? 0.2 : 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.psychology, size: 20, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(
                        'Shadow Integration',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This energy may be hidden from your conscious awareness. It might appear in your dreams, projections onto others, or emerge during stress. Acknowledging and integrating this shadow aspect can lead to greater wholeness.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? Colors.white.withOpacity(0.7) : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInYourLifeTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2D1F42) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.person_outline, color: widget.accentColor, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'How This Shows Up For You',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.howItShowsUp,
              style: theme.textTheme.bodyLarge?.copyWith(
                height: 1.8,
                fontSize: 16,
                color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamplesTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    if (widget.examples.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_outlined, size: 64, color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No examples available',
              style: theme.textTheme.titleMedium?.copyWith(color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Text(
              'Pop culture examples will appear here',
              style: theme.textTheme.bodySmall?.copyWith(color: isDark ? Colors.grey.shade500 : Colors.grey.shade500),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.examples.length,
      itemBuilder: (context, index) {
        final example = widget.examples[index];
        final character = example is Map ? (example['character'] ?? example['name'] ?? 'Character') : 'Character';
        final description = example is Map ? (example['description'] ?? example['text'] ?? example.toString()) : example.toString();
        final franchise = example is Map ? (example['franchise'] ?? '') : '';
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2D1F42) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: widget.accentColor.withOpacity(0.3)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.2 : 0.05), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.accentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.person, size: 20, color: widget.accentColor),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.toString(),
                          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87),
                        ),
                        if (franchise.isNotEmpty)
                          Text(
                            franchise.toString(),
                            style: theme.textTheme.bodySmall?.copyWith(color: widget.accentColor.withOpacity(0.8)),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description.toString(),
                style: theme.textTheme.bodyMedium?.copyWith(height: 1.6, color: isDark ? Colors.white.withOpacity(0.8) : Colors.black87),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContentCardGrid extends StatelessWidget {
  final List<ContentCardConfig> configs;
  final Map<String, String?> contents;
  final Map<String, List<dynamic>>? examples;
  final bool isLoading;

  const ContentCardGrid({super.key, required this.configs, required this.contents, this.examples, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.0),
      itemCount: configs.length,
      itemBuilder: (context, index) {
        final config = configs[index];
        return ContentCard(config: config, content: contents[config.id], examples: examples?[config.id], isLoading: isLoading && contents[config.id] == null);
      },
    );
  }
}

class StoryCardConfigs {
  static final mythSummary = ContentCardConfig(id: 'mythSummary', title: 'Myth Summary', infoText: 'The overarching narrative of your inner mythology.', iconPainter: (primary, accent, isDark) => MythStorytellerPainter(primaryColor: const Color(0xFF7C3AED), accentColor: const Color(0xFFD4AF37), isDark: isDark), accentColor: const Color(0xFF7C3AED));
  static final centralTension = ContentCardConfig(id: 'centralTension', title: 'Central Tension', infoText: 'The core conflict driving your inner narrative.', iconPainter: (primary, accent, isDark) => TensionFiguresPainter(primaryColor: const Color(0xFF7C3AED), accentColor: const Color(0xFFD97706), isDark: isDark), accentColor: const Color(0xFFD97706));
  static final guidingSentence = ContentCardConfig(id: 'guidingSentence', title: 'Guiding Sentence', infoText: 'Your inner compass toward authenticity.', iconPainter: (primary, accent, isDark) => GuidingOwlPainter(primaryColor: const Color(0xFF14B8A6), accentColor: const Color(0xFFF59E0B), isDark: isDark), accentColor: const Color(0xFF14B8A6));
  static final northStarScene = ContentCardConfig(id: 'northStarScene', title: 'North Star Scene', infoText: 'Your highest potential visualized.', iconPainter: (primary, accent, isDark) => NorthStarFigurePainter(primaryColor: const Color(0xFF6366F1), accentColor: const Color(0xFFF59E0B), isDark: isDark), accentColor: const Color(0xFFF59E0B));
  static final currentChapter = ContentCardConfig(id: 'currentChapter', title: 'Current Chapter', infoText: 'Where you are in your journey right now.', iconPainter: (primary, accent, isDark) => CurrentChapterFigurePainter(primaryColor: const Color(0xFF8B5CF6), accentColor: const Color(0xFFD97706), isDark: isDark), accentColor: const Color(0xFF8B5CF6));

  static List<ContentCardConfig> get all => [mythSummary, centralTension, guidingSentence, northStarScene, currentChapter];
}

class FunctioningCardConfigs {
  static final coreTraits = ContentCardConfig(id: 'coreTraits', title: 'Core Traits', infoText: 'The fundamental patterns that define how you operate.', iconPainter: (primary, accent, isDark) => CoreTraitsPainter(primaryColor: const Color(0xFF6366F1), accentColor: const Color(0xFF6366F1), isDark: isDark), accentColor: const Color(0xFF6366F1));
  static final symbolicEssence = ContentCardConfig(id: 'symbolicEssence', title: 'Symbolic Essence', infoText: 'The deeper symbolic meaning behind your patterns.', iconPainter: (primary, accent, isDark) => SymbolicEssencePainter(primaryColor: const Color(0xFFD97706), accentColor: const Color(0xFFD97706), isDark: isDark), accentColor: const Color(0xFFD97706));
  static final narrativeArc = ContentCardConfig(id: 'narrativeArc', title: 'Narrative Arc', infoText: 'The story arc that your life tends to follow.', iconPainter: (primary, accent, isDark) => NarrativeArcPainter(primaryColor: const Color(0xFF7C3AED), accentColor: const Color(0xFF7C3AED), isDark: isDark), accentColor: const Color(0xFF7C3AED));
  static final redemptionArc = ContentCardConfig(id: 'redemptionArc', title: 'Redemption Arc', infoText: 'The path toward growth and transformation.', iconPainter: (primary, accent, isDark) => RedemptionArcPainter(primaryColor: const Color(0xFF10B981), accentColor: const Color(0xFF10B981), isDark: isDark), accentColor: const Color(0xFF10B981));
  static final costsAndCompensations = ContentCardConfig(id: 'costsAndCompensations', title: 'Costs & Compensations', infoText: 'The trade-offs and adaptations in your patterns.', iconPainter: (primary, accent, isDark) => CostsCompensationsPainter(primaryColor: const Color(0xFFF59E0B), accentColor: const Color(0xFFF59E0B), isDark: isDark), accentColor: const Color(0xFFF59E0B));
  static final powerStance = ContentCardConfig(id: 'powerStance', title: 'Power Stance', infoText: 'Your position of strength and authority.', iconPainter: (primary, accent, isDark) => PowerStancePainter(primaryColor: const Color(0xFFDC2626), accentColor: const Color(0xFFDC2626), isDark: isDark), accentColor: const Color(0xFFDC2626));
  static final alignmentIndicators = ContentCardConfig(id: 'alignmentIndicators', title: 'Alignment Indicators', infoText: 'Signs that show when you are aligned or misaligned.', iconPainter: (primary, accent, isDark) => AlignmentIndicatorsPainter(primaryColor: const Color(0xFF14B8A6), accentColor: const Color(0xFF14B8A6), isDark: isDark), accentColor: const Color(0xFF14B8A6));

  static List<ContentCardConfig> get all => [coreTraits, symbolicEssence, narrativeArc, redemptionArc, costsAndCompensations, powerStance, alignmentIndicators];
}

// =============================================================================
// ARCHETYPE PAINTERS - Each represents a Jungian archetypal energy
// =============================================================================

/// Hero Archetype - Simple Iconic Eagle (login/welcome style)
/// Minimal geometric shapes with focus on glowing peeking eyes
class HeroArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  HeroArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(501);
    final glowColor = accentColor;
    
    // === HERO: DAWN + CLEAR WITH MORNING MIST ===
    
    // === LAYER 1: Dawn gradient (navy → amber → gold) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0D1525), // Deep night blue (fading)
          const Color(0xFF1A2540),
          const Color(0xFF3D4A65),
          const Color(0xFF6B5A48),
          const Color(0xFF8B7355),
          const Color(0xFFD4A855),
          const Color(0xFFE8C078),
        ],
        stops: const [0.0, 0.15, 0.3, 0.45, 0.6, 0.8, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Fading stars (dawn indicator) ===
    for (int i = 0; i < 20; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.3;
      final opacity = 0.1 + random.nextDouble() * 0.2; // Very faint - fading
      canvas.drawCircle(Offset(sx, sy), 0.4 + random.nextDouble() * 0.6, 
        Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 3: Rising sun with warm halos ===
    final sunCenter = Offset(size.width * 0.5, size.height * 0.88);
    for (int i = 8; i >= 0; i--) {
      canvas.drawCircle(sunCenter, size.width * 0.35 + i * 12.0, 
        Paint()..color = const Color(0xFFFFD700).withOpacity(0.04 - i * 0.004));
    }
    // Sun rays breaking through
    for (int r = 0; r < 12; r++) {
      final angle = r * 3.14159 / 6;
      final rayPath = Path()
        ..moveTo(sunCenter.dx, sunCenter.dy)
        ..lineTo(sunCenter.dx + math.cos(angle) * size.width * 0.5, sunCenter.dy + math.sin(angle) * size.height * 0.4);
      canvas.drawPath(rayPath, Paint()..color = const Color(0xFFFFD700).withOpacity(0.08)..strokeWidth = 15..style = PaintingStyle.stroke);
    }
    canvas.drawCircle(sunCenter, size.width * 0.15, 
      Paint()..shader = RadialGradient(colors: [const Color(0xFFFFFFE0), const Color(0xFFFFD700), const Color(0xFFE8C078)])
        .createShader(Rect.fromCircle(center: sunCenter, radius: size.width * 0.15)));

    // === LAYER 4: Distant mountain range ===
    final distantMtns = Path()
      ..moveTo(0, size.height * 0.7)
      ..lineTo(size.width * 0.12, size.height * 0.55)
      ..lineTo(size.width * 0.28, size.height * 0.62)
      ..lineTo(size.width * 0.4, size.height * 0.5)
      ..lineTo(size.width * 0.55, size.height * 0.58)
      ..lineTo(size.width * 0.68, size.height * 0.48)
      ..lineTo(size.width * 0.82, size.height * 0.55)
      ..lineTo(size.width, size.height * 0.52)
      ..lineTo(size.width, size.height * 0.7)
      ..close();
    canvas.drawPath(distantMtns, Paint()..color = const Color(0xFF4A3A48).withOpacity(0.5));

    // === LAYER 5: MORNING MIST (key weather element) ===
    // Multiple mist layers for depth
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.22),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFFFE8D8).withOpacity(0.35), const Color(0xFFE8D8C8).withOpacity(0.25), Colors.transparent],
        stops: const [0.0, 0.3, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.22)),
    );
    // Lower mist band
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.65, size.width, size.height * 0.15),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFFFFFFF).withOpacity(0.2), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, size.height * 0.65, size.width, size.height * 0.15)),
    );

    // === LAYER 6: Near mountain range ===
    final nearMtns = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.78)
      ..lineTo(size.width * 0.15, size.height * 0.65)
      ..lineTo(size.width * 0.25, size.height * 0.72)
      ..lineTo(size.width * 0.35, size.height * 0.62)
      ..lineTo(size.width * 0.48, size.height * 0.7)
      ..lineTo(size.width * 0.55, size.height * 0.58)
      ..lineTo(size.width * 0.68, size.height * 0.68)
      ..lineTo(size.width * 0.78, size.height * 0.6)
      ..lineTo(size.width * 0.9, size.height * 0.7)
      ..lineTo(size.width, size.height * 0.65)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(nearMtns, Paint()..color = const Color(0xFF1A1520).withOpacity(0.85));

    // === LAYER 7: Light morning clouds (clear weather) ===
    for (int c = 0; c < 2; c++) {
      final cloudX = size.width * (0.25 + c * 0.4);
      final cloudY = size.height * (0.12 + random.nextDouble() * 0.08);
      canvas.drawOval(Rect.fromCenter(center: Offset(cloudX, cloudY), width: 40 + random.nextDouble() * 25, height: 10), 
        Paint()..color = const Color(0xFFFFE4D0).withOpacity(0.15));
    }

    // === SIMPLE ICONIC EAGLE ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.42;
    final s = size.width * 0.35; // Main size unit

    // Body (simple oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy), width: s * 0.35, height: s * 0.5));
    
    // Head (circle on top of body)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.28), width: s * 0.28, height: s * 0.25));
    
    // Beak (small triangle)
    final beak = Path()
      ..moveTo(cx, cy - s * 0.28)
      ..lineTo(cx - s * 0.08, cy - s * 0.22)
      ..lineTo(cx, cy - s * 0.18)
      ..close();
    
    // Left wing (simple curved triangle)
    final leftWing = Path()
      ..moveTo(cx - s * 0.12, cy - s * 0.05)
      ..quadraticBezierTo(cx - s * 0.4, cy - s * 0.15, cx - s * 0.55, cy + s * 0.1)
      ..quadraticBezierTo(cx - s * 0.45, cy + s * 0.15, cx - s * 0.35, cy + s * 0.18)
      ..quadraticBezierTo(cx - s * 0.25, cy + s * 0.12, cx - s * 0.12, cy + s * 0.08);
    
    // Right wing (mirror)
    final rightWing = Path()
      ..moveTo(cx + s * 0.12, cy - s * 0.05)
      ..quadraticBezierTo(cx + s * 0.4, cy - s * 0.15, cx + s * 0.55, cy + s * 0.1)
      ..quadraticBezierTo(cx + s * 0.45, cy + s * 0.15, cx + s * 0.35, cy + s * 0.18)
      ..quadraticBezierTo(cx + s * 0.25, cy + s * 0.12, cx + s * 0.12, cy + s * 0.08);
    
    // Tail (simple fan shape)
    final tail = Path()
      ..moveTo(cx - s * 0.1, cy + s * 0.22)
      ..quadraticBezierTo(cx - s * 0.15, cy + s * 0.35, cx - s * 0.12, cy + s * 0.45)
      ..quadraticBezierTo(cx, cy + s * 0.4, cx + s * 0.12, cy + s * 0.45)
      ..quadraticBezierTo(cx + s * 0.15, cy + s * 0.35, cx + s * 0.1, cy + s * 0.22);

    // === DRAW with soft glow ===
    final eaglePath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(leftWing, Offset.zero)..addPath(rightWing, Offset.zero)..addPath(tail, Offset.zero);
    drawShadowBlendGlow(canvas, eaglePath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(leftWing, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(rightWing, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(beak, Paint()..color = ShadowColors.shadow);

    // === LARGE GLOWING PEEKING EYES (main feature) ===
    final eyeY = cy - s * 0.28;
    final eyeSpacing = s * 0.08;
    final eyeSize = s * 0.055;
    
    // Eye glow layers
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    // White of eyes
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    // Iris (golden/fierce)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFFBD38D));
    // Pupil
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    // Highlight
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.15);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Helper to draw properly proportioned and well-spaced eyes for mythical creatures
void _drawDetailedEyes(Canvas canvas, Offset center, double spacing, double eyeSize, Color glowColor, {bool narrow = false}) {
  final eyeHeight = narrow ? eyeSize * 1.4 : eyeSize * 2.0;
  final eyeWidth = eyeSize * 2.8;
  
  // Outer glow (3 layers)
  for (int i = 3; i >= 0; i--) {
    final glowSpread = i * 4.0;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx - spacing, center.dy), width: eyeWidth + glowSpread, height: eyeHeight + glowSpread * 0.7),
      Paint()..color = glowColor.withOpacity(0.15 - i * 0.035),
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx + spacing, center.dy), width: eyeWidth + glowSpread, height: eyeHeight + glowSpread * 0.7),
      Paint()..color = glowColor.withOpacity(0.15 - i * 0.035),
    );
  }
  
  // Eye whites (cream colored)
  canvas.drawOval(Rect.fromCenter(center: Offset(center.dx - spacing, center.dy), width: eyeWidth, height: eyeHeight), Paint()..color = const Color(0xFFFFFFF0));
  canvas.drawOval(Rect.fromCenter(center: Offset(center.dx + spacing, center.dy), width: eyeWidth, height: eyeHeight), Paint()..color = const Color(0xFFFFFFF0));
  
  // Iris (golden amber)
  final irisSize = eyeSize * 1.0;
  canvas.drawCircle(Offset(center.dx - spacing, center.dy), irisSize, Paint()..color = const Color(0xFFFBD38D));
  canvas.drawCircle(Offset(center.dx + spacing, center.dy), irisSize, Paint()..color = const Color(0xFFFBD38D));
  
  // Pupil (dark)
  final pupilSize = eyeSize * 0.5;
  canvas.drawCircle(Offset(center.dx - spacing, center.dy), pupilSize, Paint()..color = const Color(0xFF1A1A1A));
  canvas.drawCircle(Offset(center.dx + spacing, center.dy), pupilSize, Paint()..color = const Color(0xFF1A1A1A));
  
  // Shine highlights (2 per eye for more life)
  final shineSize = eyeSize * 0.25;
  canvas.drawCircle(Offset(center.dx - spacing - eyeSize * 0.3, center.dy - eyeSize * 0.25), shineSize, Paint()..color = Colors.white);
  canvas.drawCircle(Offset(center.dx - spacing + eyeSize * 0.15, center.dy + eyeSize * 0.15), shineSize * 0.5, Paint()..color = Colors.white.withOpacity(0.6));
  canvas.drawCircle(Offset(center.dx + spacing - eyeSize * 0.3, center.dy - eyeSize * 0.25), shineSize, Paint()..color = Colors.white);
  canvas.drawCircle(Offset(center.dx + spacing + eyeSize * 0.15, center.dy + eyeSize * 0.15), shineSize * 0.5, Paint()..color = Colors.white.withOpacity(0.6));
}

/// Trickster Archetype - Simple Iconic Fox (login/welcome style)
/// Minimal geometric shapes with focus on glowing peeking eyes
class TricksterArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  TricksterArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(502);
    final glowColor = accentColor;
    
    // === TRICKSTER: TWILIGHT + FOGGY ===
    
    // === LAYER 1: Twilight gradient (purple → deep blue → navy) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1A1035), // Purple twilight
          const Color(0xFF251545),
          const Color(0xFF351858),
          const Color(0xFF2A1248),
          const Color(0xFF1A0A30),
          const Color(0xFF0A0518),
        ],
        stops: const [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Crescent moon (twilight indicator) ===
    final moonCenter = Offset(size.width * 0.82, size.height * 0.12);
    canvas.drawCircle(moonCenter, size.width * 0.06, Paint()..color = const Color(0xFFE8E0F0).withOpacity(0.7));
    canvas.drawCircle(Offset(moonCenter.dx + 4, moonCenter.dy - 2), size.width * 0.05, Paint()..color = const Color(0xFF251545));
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(moonCenter, size.width * 0.08 + i * 8, Paint()..color = const Color(0xFFD8D0E8).withOpacity(0.05 - i * 0.008));
    }

    // === LAYER 3: Emerging stars (twilight - some visible) ===
    for (int i = 0; i < 25; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.4;
      final starSize = 0.4 + random.nextDouble() * 1.0;
      final opacity = 0.15 + random.nextDouble() * 0.35; // Emerging, not fully bright
      canvas.drawCircle(Offset(sx, sy), starSize, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 4: Distant forest silhouette ===
    final distantTrees = Path();
    distantTrees.moveTo(0, size.height * 0.72);
    double x = 0;
    while (x < size.width + 20) {
      final treeH = 15 + random.nextDouble() * 25;
      final treeW = 8 + random.nextDouble() * 10;
      distantTrees.lineTo(x, size.height * 0.72 - treeH * 0.4);
      distantTrees.lineTo(x + treeW / 2, size.height * 0.72 - treeH);
      distantTrees.lineTo(x + treeW, size.height * 0.72 - treeH * 0.4);
      x += treeW + random.nextDouble() * 8;
    }
    distantTrees.lineTo(size.width, size.height * 0.72);
    distantTrees.lineTo(size.width, size.height);
    distantTrees.lineTo(0, size.height);
    distantTrees.close();
    canvas.drawPath(distantTrees, Paint()..color = const Color(0xFF150820).withOpacity(0.5));

    // === LAYER 5: HEAVY FOG (key weather element - multiple layers) ===
    // Upper fog band
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.35, size.width, size.height * 0.2),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFD0C0E0).withOpacity(0.15), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, size.height * 0.35, size.width, size.height * 0.2)),
    );
    // Mid fog band (thickest)
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.52, size.width, size.height * 0.25),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFE0D0F0).withOpacity(0.25), const Color(0xFFD0C0E0).withOpacity(0.2), Colors.transparent],
        stops: const [0.0, 0.3, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, size.height * 0.52, size.width, size.height * 0.25)),
    );
    // Low ground fog
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.15),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFFFFFFF).withOpacity(0.18), const Color(0xFFE8E0F8).withOpacity(0.12)],
      ).createShader(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.15)),
    );

    // === LAYER 6: Fox-fire wisps through fog ===
    for (int i = 0; i < 18; i++) {
      final ox = random.nextDouble() * size.width;
      final oy = size.height * 0.3 + random.nextDouble() * size.height * 0.45;
      final wispSize = 2 + random.nextDouble() * 5;
      if (i % 3 == 0) {
        final trail = Path()..moveTo(ox, oy)..quadraticBezierTo(ox - 10, oy + 8, ox - 15, oy + 15);
        canvas.drawPath(trail, Paint()..color = glowColor.withOpacity(0.08)..strokeWidth = 2..style = PaintingStyle.stroke);
      }
      canvas.drawCircle(Offset(ox, oy), wispSize * 2.5, Paint()..color = glowColor.withOpacity(0.04));
      canvas.drawCircle(Offset(ox, oy), wispSize * 1.5, Paint()..color = glowColor.withOpacity(0.1));
      canvas.drawCircle(Offset(ox, oy), wispSize, Paint()..color = glowColor.withOpacity(0.18));
    }

    // === LAYER 7: Ground with fog wisps ===
    final ground = Path()
      ..moveTo(0, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.83, size.width * 0.5, size.height * 0.82)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.83, size.width, size.height * 0.85)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(ground, Paint()..shader = LinearGradient(
      begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [const Color(0xFF150A20), const Color(0xFF0A0512)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.82, size.width, size.height * 0.18)));
    
    // Ground fog wisps
    for (int i = 0; i < 6; i++) {
      final wx = random.nextDouble() * size.width;
      final wy = size.height * 0.85 + random.nextDouble() * size.height * 0.08;
      canvas.drawOval(Rect.fromCenter(center: Offset(wx, wy), width: 30 + random.nextDouble() * 20, height: 8), 
        Paint()..color = const Color(0xFFE0D0F0).withOpacity(0.1));
    }

    // === SIMPLE ICONIC FOX ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    final s = size.width * 0.32; // Main size unit

    // Body (simple oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.2), width: s * 0.75, height: s * 0.5));
    
    // Head (circle, slightly overlapping body)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.05), width: s * 0.6, height: s * 0.5));
    
    // Left ear (simple triangle)
    final leftEar = Path()
      ..moveTo(cx - s * 0.22, cy - s * 0.18)
      ..lineTo(cx - s * 0.35, cy - s * 0.55)
      ..lineTo(cx - s * 0.08, cy - s * 0.22)
      ..close();
    
    // Right ear (simple triangle)
    final rightEar = Path()
      ..moveTo(cx + s * 0.22, cy - s * 0.18)
      ..lineTo(cx + s * 0.35, cy - s * 0.55)
      ..lineTo(cx + s * 0.08, cy - s * 0.22)
      ..close();
    
    // Snout (small downward triangle)
    final snout = Path()
      ..moveTo(cx - s * 0.1, cy + s * 0.05)
      ..quadraticBezierTo(cx, cy + s * 0.18, cx + s * 0.1, cy + s * 0.05);
    
    // Tail (simple curved shape behind)
    final tail = Path()
      ..moveTo(cx - s * 0.3, cy + s * 0.35)
      ..quadraticBezierTo(cx - s * 0.55, cy + s * 0.15, cx - s * 0.6, cy - s * 0.1)
      ..quadraticBezierTo(cx - s * 0.55, cy - s * 0.02, cx - s * 0.45, cy + s * 0.12)
      ..quadraticBezierTo(cx - s * 0.35, cy + s * 0.28, cx - s * 0.3, cy + s * 0.35);

    // === DRAW with soft glow ===
    final foxPath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(leftEar, Offset.zero)..addPath(rightEar, Offset.zero)..addPath(tail, Offset.zero);
    drawShadowBlendGlow(canvas, foxPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(rightEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(snout, Paint()..color = ShadowColors.shadow..style = PaintingStyle.fill);

    // === LARGE GLOWING PEEKING EYES (main feature) ===
    final eyeY = cy - s * 0.08;
    final eyeSpacing = s * 0.14;
    final eyeSize = s * 0.085;
    
    // Eye glow layers
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    // White of eyes
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    // Iris (amber/orange)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFE8A030));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFE8A030));
    // Pupil
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    // Highlight
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.22, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.22, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Sage Archetype - Simple Iconic Owl (login screen style)
/// Minimal geometric shapes with focus on large glowing peeking eyes
class SageArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  SageArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(503);
    final glowColor = accentColor;
    
    // === SAGE: MIDNIGHT + CLEAR STARRY (no moon, brightest stars) ===
    
    // === LAYER 1: Deepest midnight sky (darkest blacks) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF010105), // Pure midnight black
          const Color(0xFF030308),
          const Color(0xFF050510),
          const Color(0xFF080818),
          const Color(0xFF0A0A20),
          const Color(0xFF080815),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Nebula glows (no moon at midnight - stars are source) ===
    // Purple nebula (left)
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.3), size.width * 0.35,
      Paint()..shader = RadialGradient(colors: [const Color(0xFF6B4984).withOpacity(0.15), Colors.transparent])
        .createShader(Rect.fromCircle(center: Offset(size.width * 0.25, size.height * 0.3), radius: size.width * 0.35)));
    // Blue nebula (right)
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.2), size.width * 0.3,
      Paint()..shader = RadialGradient(colors: [const Color(0xFF2040A0).withOpacity(0.18), Colors.transparent])
        .createShader(Rect.fromCircle(center: Offset(size.width * 0.75, size.height * 0.2), radius: size.width * 0.3)));
    // Wisdom glow behind owl
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.45), size.width * 0.4,
      Paint()..shader = RadialGradient(colors: [glowColor.withOpacity(0.18), glowColor.withOpacity(0.06), Colors.transparent])
        .createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.45), radius: size.width * 0.4)));

    // === LAYER 3: BRILLIANT STARFIELD (midnight = brightest stars, clear weather) ===
    for (int i = 0; i < 80; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.7;
      final starSize = 0.5 + random.nextDouble() * 1.8;
      final brightness = 0.4 + random.nextDouble() * 0.6; // Very bright at midnight
      if (i % 8 == 0) {
        // Cross sparkle for bright stars
        final sparkle = Paint()..color = Colors.white.withOpacity(0.6)..strokeWidth = 0.6;
        canvas.drawLine(Offset(sx - 5, sy), Offset(sx + 5, sy), sparkle);
        canvas.drawLine(Offset(sx, sy - 5), Offset(sx, sy + 5), sparkle);
      }
      canvas.drawCircle(Offset(sx, sy), starSize, Paint()..color = Colors.white.withOpacity(brightness));
    }

    // === LAYER 4: Constellation pattern (wisdom symbol) ===
    final constStars = [Offset(size.width * 0.15, size.height * 0.12), Offset(size.width * 0.25, size.height * 0.08), 
      Offset(size.width * 0.35, size.height * 0.15), Offset(size.width * 0.28, size.height * 0.22)];
    for (int i = 0; i < constStars.length - 1; i++) {
      canvas.drawLine(constStars[i], constStars[i + 1], Paint()..color = glowColor.withOpacity(0.35)..strokeWidth = 1);
    }
    for (final star in constStars) {
      canvas.drawCircle(star, 3, Paint()..color = glowColor.withOpacity(0.8));
    }

    // === LAYER 5: Milky way band hint (clear midnight sky feature) ===
    final milkyWay = Path()
      ..moveTo(0, size.height * 0.1)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.2, size.width * 0.5, size.height * 0.15)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.1, size.width, size.height * 0.18);
    canvas.drawPath(milkyWay, Paint()..color = const Color(0xFFE8E0F8).withOpacity(0.06)..strokeWidth = 40..style = PaintingStyle.stroke..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));

    // === LAYER 6: Distant forest silhouette ===
    final forestPath = Path();
    forestPath.moveTo(0, size.height * 0.9);
    double x = -5;
    while (x < size.width + 10) {
      final treeH = 8 + random.nextDouble() * 18;
      final treeW = 6 + random.nextDouble() * 8;
      forestPath.lineTo(x, size.height * 0.9 - treeH * 0.3);
      forestPath.lineTo(x + treeW / 2, size.height * 0.9 - treeH);
      forestPath.lineTo(x + treeW, size.height * 0.9 - treeH * 0.3);
      x += treeW + random.nextDouble() * 4;
    }
    forestPath.lineTo(size.width, size.height);
    forestPath.lineTo(0, size.height);
    forestPath.close();
    canvas.drawPath(forestPath, Paint()..color = const Color(0xFF050508));

    // === LAYER 7: Ancient tree with detailed branch ===
    final trunk = Path()
      ..moveTo(size.width * 0.08, size.height)
      ..quadraticBezierTo(size.width * 0.12, size.height * 0.85, size.width * 0.15, size.height * 0.72)
      ..lineTo(size.width * 0.18, size.height * 0.72)
      ..quadraticBezierTo(size.width * 0.14, size.height * 0.88, size.width * 0.12, size.height)
      ..close();
    canvas.drawPath(trunk, Paint()..color = ShadowColors.shadow);
    
    canvas.drawLine(Offset(size.width * 0.12, size.height * 0.76), Offset(size.width * 0.92, size.height * 0.72),
      Paint()..color = ShadowColors.shadow..strokeWidth = 7..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(size.width * 0.7, size.height * 0.73), Offset(size.width * 0.82, size.height * 0.62),
      Paint()..color = ShadowColors.shadow..strokeWidth = 3.5..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(size.width * 0.35, size.height * 0.74), Offset(size.width * 0.28, size.height * 0.65),
      Paint()..color = ShadowColors.shadow..strokeWidth = 2.5..strokeCap = StrokeCap.round);
    for (int t = 0; t < 5; t++) {
      final tx = size.width * (0.2 + t * 0.15);
      canvas.drawLine(Offset(tx, size.height * 0.73), Offset(tx + 8, size.height * 0.68 + random.nextDouble() * 6),
        Paint()..color = ShadowColors.shadow..strokeWidth = 1.5..strokeCap = StrokeCap.round);
    }

    // === SIMPLE ICONIC OWL (like login screen) ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.45;
    final s = size.width * 0.35; // Main size unit

    // Body (simple rounded oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.1), width: s * 0.85, height: s * 0.7));
    
    // Head merged with body (slightly smaller circle on top)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.15), width: s * 0.7, height: s * 0.55));
    
    // Left ear tuft (simple triangle)
    final leftEar = Path()
      ..moveTo(cx - s * 0.25, cy - s * 0.32)
      ..lineTo(cx - s * 0.32, cy - s * 0.58)
      ..lineTo(cx - s * 0.12, cy - s * 0.35)
      ..close();
    
    // Right ear tuft (simple triangle)
    final rightEar = Path()
      ..moveTo(cx + s * 0.25, cy - s * 0.32)
      ..lineTo(cx + s * 0.32, cy - s * 0.58)
      ..lineTo(cx + s * 0.12, cy - s * 0.35)
      ..close();
    
    // Small beak (tiny triangle)
    final beak = Path()
      ..moveTo(cx - s * 0.05, cy + s * 0.02)
      ..lineTo(cx, cy + s * 0.1)
      ..lineTo(cx + s * 0.05, cy + s * 0.02)
      ..close();

    // === DRAW with soft glow ===
    final owlPath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(leftEar, Offset.zero)..addPath(rightEar, Offset.zero);
    drawShadowBlendGlow(canvas, owlPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(rightEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(beak, Paint()..color = ShadowColors.shadow);

    // === LARGE GLOWING PEEKING EYES (main feature - like login owl) ===
    final eyeY = cy - s * 0.12;
    final eyeSpacing = s * 0.17;
    final eyeSize = s * 0.11;
    
    // Eye glow layers (very prominent)
    for (int i = 6; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 5;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.07 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.07 - i * 0.008));
    }
    
    // White of eyes (large)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.6, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.6, Paint()..color = const Color(0xFFFFFFF0));
    // Iris (golden amber - wise owl)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize, Paint()..color = const Color(0xFFD4A020));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize, Paint()..color = const Color(0xFFD4A020));
    // Pupil (large, round)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.45, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.45, Paint()..color = const Color(0xFF1A1A1A));
    // Highlight
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.35), eyeSize * 0.25, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.35), eyeSize * 0.25, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.18);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Nurturer Archetype - Simple Iconic Mother Bird with Chicks
/// Minimal geometric shapes - oval body with wings wrapped, small chicks nearby
class NurturerArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  NurturerArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(504);
    final glowColor = accentColor;
    
    // === NURTURER: GOLDEN HOUR (evening) + PARTLY CLOUDY ===
    
    // === LAYER 1: Golden hour gradient (warm orange → pink → soft purple) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF2A1835), // Soft upper purple
          const Color(0xFF4A2545),
          const Color(0xFF6A3550), // Pink transition
          const Color(0xFF8A4545), // Warm coral
          const Color(0xFFB86040), // Golden orange
          const Color(0xFFE88050), // Warm horizon
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.78, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: PARTLY CLOUDY (scattered warm clouds) ===
    // Cloud 1 - large
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.2, size.height * 0.12), width: 70, height: 22),
      Paint()..color = const Color(0xFFFFD8C0).withOpacity(0.35));
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.15, size.height * 0.1), width: 45, height: 15),
      Paint()..color = const Color(0xFFFFE0D0).withOpacity(0.3));
    // Cloud 2
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.6, size.height * 0.08), width: 55, height: 18),
      Paint()..color = const Color(0xFFFFD0B0).withOpacity(0.3));
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.65, size.height * 0.06), width: 40, height: 12),
      Paint()..color = const Color(0xFFFFE8D8).withOpacity(0.25));
    // Cloud 3
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.85, size.height * 0.15), width: 50, height: 16),
      Paint()..color = const Color(0xFFFFD8C8).withOpacity(0.28));

    // === LAYER 3: Golden sun glow (low, golden hour position) ===
    final sunCenter = Offset(size.width * 0.75, size.height * 0.92);
    for (int g = 6; g >= 0; g--) {
      canvas.drawCircle(sunCenter, size.width * 0.25 + g * 15, 
        Paint()..color = const Color(0xFFFFB060).withOpacity(0.08 - g * 0.01));
    }
    // Warm light washing over scene
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.3),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFFFD090).withOpacity(0.15), const Color(0xFFFFB070).withOpacity(0.1)],
      ).createShader(Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.3)),
    );

    // === LAYER 4: Warm central glow (nurturing light) ===
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.48), size.width * 0.4,
      Paint()..shader = RadialGradient(colors: [glowColor.withOpacity(0.2), glowColor.withOpacity(0.08), Colors.transparent])
        .createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.48), radius: size.width * 0.4)));

    // === LAYER 5: Distant garden silhouette ===
    final gardenPath = Path();
    gardenPath.moveTo(0, size.height * 0.88);
    double x = 0;
    while (x < size.width) {
      if (random.nextBool()) {
        final flowerH = 8 + random.nextDouble() * 12;
        gardenPath.quadraticBezierTo(x + 4, size.height * 0.88 - flowerH, x + 8, size.height * 0.88);
      } else {
        final bushH = 5 + random.nextDouble() * 10;
        final bushW = 12 + random.nextDouble() * 10;
        gardenPath.quadraticBezierTo(x + bushW / 2, size.height * 0.88 - bushH, x + bushW, size.height * 0.88);
        x += bushW / 2;
      }
      x += 6 + random.nextDouble() * 8;
    }
    gardenPath.lineTo(size.width, size.height);
    gardenPath.lineTo(0, size.height);
    gardenPath.close();
    canvas.drawPath(gardenPath, Paint()..color = const Color(0xFF2A1520).withOpacity(0.6));

    // === LAYER 6: Fireflies in golden light ===
    for (int i = 0; i < 20; i++) {
      final fx = random.nextDouble() * size.width;
      final fy = random.nextDouble() * size.height * 0.75;
      final particleSize = 1 + random.nextDouble() * 2.5;
      canvas.drawCircle(Offset(fx, fy), particleSize * 3, Paint()..color = const Color(0xFFFFE080).withOpacity(0.08));
      canvas.drawCircle(Offset(fx, fy), particleSize * 1.5, Paint()..color = const Color(0xFFFFD060).withOpacity(0.15));
      canvas.drawCircle(Offset(fx, fy), particleSize, Paint()..color = glowColor.withOpacity(0.3));
    }

    // === LAYER 7: Heart-shaped flowers (golden-lit) ===
    for (int h = 0; h < 4; h++) {
      final hx = size.width * (0.15 + h * 0.25) + random.nextDouble() * 15;
      final hy = size.height * 0.15 + random.nextDouble() * size.height * 0.15;
      final heartPath = Path()
        ..moveTo(hx, hy + 3)
        ..quadraticBezierTo(hx - 4, hy - 2, hx - 4, hy + 2)
        ..quadraticBezierTo(hx - 4, hy + 5, hx, hy + 8)
        ..quadraticBezierTo(hx + 4, hy + 5, hx + 4, hy + 2)
        ..quadraticBezierTo(hx + 4, hy - 2, hx, hy + 3);
      canvas.drawPath(heartPath, Paint()..color = glowColor.withOpacity(0.25 + random.nextDouble() * 0.15));
    }

    // === LAYER 8: Ground with golden glow ===
    final ground = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.77, size.width * 0.5, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.77, size.width, size.height * 0.8)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(ground, Paint()..shader = LinearGradient(
      begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [const Color(0xFF4A2535), const Color(0xFF2A1520)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25)));
    
    // Nest strands
    for (int s = 0; s < 10; s++) {
      final sx = size.width * 0.3 + random.nextDouble() * size.width * 0.4;
      final sy = size.height * 0.78 + random.nextDouble() * size.height * 0.08;
      canvas.drawLine(Offset(sx, sy), Offset(sx + 10 + random.nextDouble() * 15, sy + 2),
        Paint()..color = const Color(0xFF5A3545).withOpacity(0.5)..strokeWidth = 1..strokeCap = StrokeCap.round);
    }

    // === SIMPLE ICONIC MOTHER BIRD ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.45;
    final s = size.width * 0.32; // STANDARD SIZE UNIT

    // Body (oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.1), width: s * 0.8, height: s * 0.55));
    
    // Head (circle)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.18), width: s * 0.45, height: s * 0.4));
    
    // Left wing (curved, wrapped around)
    final leftWing = Path()
      ..moveTo(cx - s * 0.3, cy - s * 0.05)
      ..quadraticBezierTo(cx - s * 0.5, cy + s * 0.1, cx - s * 0.45, cy + s * 0.35)
      ..quadraticBezierTo(cx - s * 0.35, cy + s * 0.3, cx - s * 0.25, cy + s * 0.25);
    
    // Right wing (curved, wrapped around)
    final rightWing = Path()
      ..moveTo(cx + s * 0.3, cy - s * 0.05)
      ..quadraticBezierTo(cx + s * 0.5, cy + s * 0.1, cx + s * 0.45, cy + s * 0.35)
      ..quadraticBezierTo(cx + s * 0.35, cy + s * 0.3, cx + s * 0.25, cy + s * 0.25);
    
    // Small beak
    final beak = Path()
      ..moveTo(cx - s * 0.06, cy - s * 0.12)
      ..lineTo(cx, cy - s * 0.02)
      ..lineTo(cx + s * 0.06, cy - s * 0.12);
    
    // Small chicks (2 tiny ovals)
    final chick1 = Path()..addOval(Rect.fromCenter(center: Offset(cx - s * 0.15, cy + s * 0.42), width: s * 0.18, height: s * 0.15));
    final chick2 = Path()..addOval(Rect.fromCenter(center: Offset(cx + s * 0.15, cy + s * 0.42), width: s * 0.18, height: s * 0.15));

    // === DRAW with soft glow ===
    final birdPath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(chick1, Offset.zero)..addPath(chick2, Offset.zero);
    drawShadowBlendGlow(canvas, birdPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(rightWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(beak, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(chick1, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(chick2, Paint()..color = ShadowColors.shadow);

    // === LARGE GLOWING PEEKING EYES (STANDARD) ===
    final eyeY = cy - s * 0.2;
    final eyeSpacing = s * 0.14;
    final eyeSize = s * 0.085;
    
    // Eye glow layers
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    // White of eyes
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    // Iris (warm pink)
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFF0A0B0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFF0A0B0));
    // Pupil
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    // Highlight
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    // Tiny eyes for chicks
    canvas.drawCircle(Offset(cx - s * 0.15, cy + s * 0.4), 2, Paint()..color = glowColor.withOpacity(0.5));
    canvas.drawCircle(Offset(cx + s * 0.15, cy + s * 0.4), 2, Paint()..color = glowColor.withOpacity(0.5));

    drawVignette(canvas, size, intensity: 0.2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Warrior Archetype - Detailed Howling Wolf
/// Realistic wolf silhouette with fur detail - represents fierce loyalty and strength
/// Warrior Archetype - Simple Iconic Wolf (login/welcome style)
/// Minimal geometric shapes with focus on glowing peeking eyes
class WarriorArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  WarriorArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(505);
    final glowColor = accentColor;
    
    // === WARRIOR: STORMY NIGHT + THUNDERSTORM ===
    
    // === LAYER 1: Dramatic stormy night sky ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF050810), // Deep storm blue
          const Color(0xFF0A1018),
          const Color(0xFF152030),
          const Color(0xFF1A2840),
          const Color(0xFF253550),
          const Color(0xFF1A2535),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Storm clouds ===
    for (int c = 0; c < 4; c++) {
      final cx = size.width * (-0.1 + c * 0.35);
      final cy = size.height * (0.08 + random.nextDouble() * 0.15);
      final cloudW = 70 + random.nextDouble() * 50;
      final cloudH = 20 + random.nextDouble() * 15;
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: cloudW, height: cloudH), 
        Paint()..color = const Color(0xFF2A3545).withOpacity(0.6));
      canvas.drawOval(Rect.fromCenter(center: Offset(cx + 25, cy - 8), width: cloudW * 0.7, height: cloudH * 0.8), 
        Paint()..color = const Color(0xFF354560).withOpacity(0.5));
    }

    // === LAYER 3: Full moon with dramatic halo ===
    final moonCenter = Offset(size.width * 0.78, size.height * 0.16);
    // Moon halo layers
    for (int i = 6; i >= 0; i--) {
      canvas.drawCircle(moonCenter, size.width * 0.08 + i * 10, Paint()..color = const Color(0xFFE8E8F0).withOpacity(0.04 - i * 0.005));
    }
    // Cloud passing moon
    canvas.drawOval(Rect.fromCenter(center: Offset(moonCenter.dx - 15, moonCenter.dy + 5), width: 40, height: 12), 
      Paint()..color = const Color(0xFF304050).withOpacity(0.4));
    // Moon core
    canvas.drawCircle(moonCenter, size.width * 0.1, 
      Paint()..shader = RadialGradient(colors: [const Color(0xFFF8F8FF), const Color(0xFFE8E8F0), const Color(0xFFD0D0E0)])
        .createShader(Rect.fromCircle(center: moonCenter, radius: size.width * 0.1)));

    // === LAYER 4: Stars through clouds ===
    for (int i = 0; i < 30; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.5;
      final opacity = 0.15 + random.nextDouble() * 0.35;
      canvas.drawCircle(Offset(sx, sy), 0.5 + random.nextDouble() * 1.0, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 5: Lightning hint ===
    final lightningPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.05)
      ..lineTo(size.width * 0.22, size.height * 0.15)
      ..lineTo(size.width * 0.26, size.height * 0.15)
      ..lineTo(size.width * 0.2, size.height * 0.28);
    canvas.drawPath(lightningPath, Paint()..color = const Color(0xFFB0C0E0).withOpacity(0.2)..strokeWidth = 2..style = PaintingStyle.stroke);
    // Lightning glow
    canvas.drawCircle(Offset(size.width * 0.23, size.height * 0.15), 25, Paint()..color = const Color(0xFF90A0D0).withOpacity(0.08));

    // === LAYER 6: Distant fortress silhouette ===
    final fortressPath = Path()
      ..moveTo(size.width * 0.7, size.height * 0.65)
      ..lineTo(size.width * 0.72, size.height * 0.52)
      ..lineTo(size.width * 0.74, size.height * 0.52)
      ..lineTo(size.width * 0.74, size.height * 0.48) // Tower
      ..lineTo(size.width * 0.76, size.height * 0.48)
      ..lineTo(size.width * 0.76, size.height * 0.52)
      ..lineTo(size.width * 0.82, size.height * 0.52)
      ..lineTo(size.width * 0.84, size.height * 0.65)
      ..close();
    canvas.drawPath(fortressPath, Paint()..color = const Color(0xFF101520).withOpacity(0.6));

    // === LAYER 7: Rocky cliff terrain ===
    final cliffPath = Path()
      ..moveTo(0, size.height * 0.82)
      ..lineTo(size.width * 0.08, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.15, size.height * 0.72, size.width * 0.25, size.height * 0.74)
      ..lineTo(size.width * 0.35, size.height * 0.68)
      ..quadraticBezierTo(size.width * 0.45, size.height * 0.72, size.width * 0.55, size.height * 0.7)
      ..lineTo(size.width * 0.65, size.height * 0.74)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.72, size.width * 0.85, size.height * 0.75)
      ..lineTo(size.width, size.height * 0.78)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(cliffPath, Paint()..shader = LinearGradient(
      begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [const Color(0xFF151A25), const Color(0xFF080A12)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.68, size.width, size.height * 0.32)));
    
    // Rock texture details
    for (int r = 0; r < 8; r++) {
      final rx = random.nextDouble() * size.width;
      final ry = size.height * 0.78 + random.nextDouble() * size.height * 0.15;
      canvas.drawOval(Rect.fromCenter(center: Offset(rx, ry), width: 8 + random.nextDouble() * 12, height: 3 + random.nextDouble() * 4), 
        Paint()..color = const Color(0xFF252A38).withOpacity(0.5));
    }

    // === SIMPLE ICONIC WOLF ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    final s = size.width * 0.32; // Main size unit

    // Body (horizontal oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.15), width: s * 0.9, height: s * 0.5));
    
    // Head (circle, to the left of body)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx - s * 0.1, cy - s * 0.08), width: s * 0.55, height: s * 0.48));
    
    // Snout (oval extending forward)
    final snout = Path()..addOval(Rect.fromCenter(center: Offset(cx - s * 0.32, cy + s * 0.02), width: s * 0.3, height: s * 0.2));
    
    // Left ear (triangle)
    final leftEar = Path()
      ..moveTo(cx - s * 0.28, cy - s * 0.22)
      ..lineTo(cx - s * 0.38, cy - s * 0.52)
      ..lineTo(cx - s * 0.15, cy - s * 0.25)
      ..close();
    
    // Right ear (triangle)
    final rightEar = Path()
      ..moveTo(cx + s * 0.02, cy - s * 0.22)
      ..lineTo(cx + s * 0.08, cy - s * 0.5)
      ..lineTo(cx + s * 0.15, cy - s * 0.2)
      ..close();
    
    // Tail (curved shape)
    final tail = Path()
      ..moveTo(cx + s * 0.35, cy + s * 0.25)
      ..quadraticBezierTo(cx + s * 0.55, cy + s * 0.15, cx + s * 0.6, cy)
      ..quadraticBezierTo(cx + s * 0.55, cy + s * 0.08, cx + s * 0.45, cy + s * 0.18)
      ..quadraticBezierTo(cx + s * 0.4, cy + s * 0.22, cx + s * 0.35, cy + s * 0.25);
    
    // Legs (simple rectangles)
    final legs = Path()
      ..addRect(Rect.fromLTWH(cx - s * 0.25, cy + s * 0.32, s * 0.12, s * 0.2))
      ..addRect(Rect.fromLTWH(cx - s * 0.05, cy + s * 0.32, s * 0.12, s * 0.2))
      ..addRect(Rect.fromLTWH(cx + s * 0.12, cy + s * 0.32, s * 0.12, s * 0.2))
      ..addRect(Rect.fromLTWH(cx + s * 0.28, cy + s * 0.32, s * 0.12, s * 0.18));

    // === DRAW with soft glow ===
    final wolfPath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(snout, Offset.zero)..addPath(leftEar, Offset.zero)..addPath(rightEar, Offset.zero)..addPath(tail, Offset.zero)..addPath(legs, Offset.zero);
    drawShadowBlendGlow(canvas, wolfPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(legs, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(snout, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(rightEar, Paint()..color = ShadowColors.shadow);

    // === LARGE GLOWING PEEKING EYES (main feature) ===
    final eyeY = cy - s * 0.1;
    final eyeX = cx - s * 0.1;
    final eyeSpacing = s * 0.12;
    final eyeSize = s * 0.08;
    
    // Eye glow layers
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(eyeX - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(eyeX + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    // White of eyes
    canvas.drawCircle(Offset(eyeX - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(eyeX + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    // Iris (fierce amber/yellow)
    canvas.drawCircle(Offset(eyeX - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFE8B830));
    canvas.drawCircle(Offset(eyeX + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFE8B830));
    // Pupil
    canvas.drawCircle(Offset(eyeX - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(eyeX + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    // Highlight
    canvas.drawCircle(Offset(eyeX - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(eyeX + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Lover Archetype - Simple Iconic Swan (login/welcome style)
/// Minimal geometric shapes with focus on glowing peeking eye
class LoverArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  LoverArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(506);
    final glowColor = accentColor;
    
    // === LOVER: DUSK + CLEAR CALM ===
    
    // === LAYER 1: Dusk gradient (pink → purple → deep blue) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1A1535), // Upper twilight blue
          const Color(0xFF2A1845),
          const Color(0xFF452050), // Purple transition
          const Color(0xFF6A3060), // Pink/rose
          const Color(0xFF8A4068), // Warm rose
          const Color(0xFFAA5575), // Dusk pink horizon
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.78, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Romantic sky glow ===
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.35),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFFFB0C8).withOpacity(0.12), const Color(0xFFE8A0B0).withOpacity(0.08)],
      ).createShader(Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.35)),
    );

    // === LAYER 3: First stars (dusk = just appearing) ===
    for (int i = 0; i < 20; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.35;
      final starSize = 0.4 + random.nextDouble() * 0.9;
      final opacity = 0.15 + random.nextDouble() * 0.3; // Faint, just appearing
      canvas.drawCircle(Offset(sx, sy), starSize, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 4: Venus (evening star - bright at dusk) ===
    final venusStar = Offset(size.width * 0.75, size.height * 0.12);
    for (int g = 3; g >= 0; g--) {
      canvas.drawCircle(venusStar, 6 + g * 5.0, Paint()..color = const Color(0xFFFFE8F0).withOpacity(0.15 - g * 0.03));
    }
    canvas.drawCircle(venusStar, 3, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.7));

    // === LAYER 5: Willow tree silhouettes ===
    final leftWillow = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.05, size.height * 0.35, size.width * 0.08, size.height * 0.42)
      ..quadraticBezierTo(size.width * 0.1, size.height * 0.5, size.width * 0.05, size.height * 0.58);
    canvas.drawPath(leftWillow, Paint()..color = const Color(0xFF150A20).withOpacity(0.75)..strokeWidth = 5..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    for (int b = 0; b < 4; b++) {
      final bx = size.width * 0.02 + b * 8;
      final by = size.height * 0.4 + b * 10;
      final branch = Path()..moveTo(bx, by)..quadraticBezierTo(bx + 5, by + 25, bx - 3, by + 45);
      canvas.drawPath(branch, Paint()..color = const Color(0xFF150A20).withOpacity(0.5)..strokeWidth = 1.5..style = PaintingStyle.stroke);
    }

    // === LAYER 6: Calm lake water (clear weather = mirror-like) ===
    final waterY = size.height * 0.58;
    canvas.drawRect(Rect.fromLTWH(0, waterY, size.width, size.height - waterY),
      Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [const Color(0xFF3A2545), const Color(0xFF2A1838), const Color(0xFF1A1028)])
        .createShader(Rect.fromLTWH(0, waterY, size.width, size.height - waterY)));
    
    // Sky reflection in calm water
    canvas.drawRect(Rect.fromLTWH(0, waterY, size.width, size.height * 0.15),
      Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [const Color(0xFF8A5070).withOpacity(0.2), Colors.transparent])
        .createShader(Rect.fromLTWH(0, waterY, size.width, size.height * 0.15)));

    // === LAYER 7: Lily pads ===
    for (int l = 0; l < 4; l++) {
      final lx = size.width * (0.15 + l * 0.22) + random.nextDouble() * 15;
      final ly = waterY + 18 + random.nextDouble() * 25;
      canvas.drawOval(Rect.fromCenter(center: Offset(lx, ly), width: 12 + random.nextDouble() * 8, height: 6),
        Paint()..color = const Color(0xFF3A2840).withOpacity(0.5));
    }

    // === LAYER 8: Gentle water ripples (calm, minimal) ===
    for (int i = 0; i < 4; i++) {
      final rippleY = waterY + 15 + i * 18;
      canvas.drawPath(
        Path()..moveTo(size.width * 0.1, rippleY)..quadraticBezierTo(size.width * 0.5, rippleY + 2, size.width * 0.9, rippleY),
        Paint()..color = const Color(0xFF6A5078).withOpacity(0.2)..strokeWidth = 1..style = PaintingStyle.stroke);
    }

    // === LAYER 9: Rose petals floating ===
    for (int p = 0; p < 6; p++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.55;
      final petalPath = Path()
        ..moveTo(px, py)
        ..quadraticBezierTo(px + 4, py - 3, px + 6, py + 1)
        ..quadraticBezierTo(px + 4, py + 4, px, py);
      canvas.drawPath(petalPath, Paint()..color = const Color(0xFFE8A0B0).withOpacity(0.25 + random.nextDouble() * 0.15));
    }

    // === SIMPLE ICONIC SWAN ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.45;
    final s = size.width * 0.3; // Main size unit

    // Body (simple oval floating on water)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.3), width: s * 1.0, height: s * 0.45));
    
    // Wing (slight bump on top of body)
    final wing = Path()..addOval(Rect.fromCenter(center: Offset(cx - s * 0.1, cy + s * 0.18), width: s * 0.6, height: s * 0.35));
    
    // Neck (simple curved path - elegant S-curve)
    final neck = Path();
    neck.moveTo(cx + s * 0.25, cy + s * 0.2);
    // S-curve up
    neck.quadraticBezierTo(cx + s * 0.35, cy - s * 0.1, cx + s * 0.15, cy - s * 0.35);
    // Head
    neck.quadraticBezierTo(cx + s * 0.05, cy - s * 0.5, cx - s * 0.08, cy - s * 0.45);
    // Beak
    neck.lineTo(cx - s * 0.22, cy - s * 0.42);
    // Back under head
    neck.quadraticBezierTo(cx - s * 0.1, cy - s * 0.38, cx + s * 0.02, cy - s * 0.4);
    // Inner neck curve
    neck.quadraticBezierTo(cx + s * 0.18, cy - s * 0.25, cx + s * 0.22, cy);
    neck.quadraticBezierTo(cx + s * 0.22, cy + s * 0.15, cx + s * 0.2, cy + s * 0.2);
    neck.close();
    
    // Tail (simple raised point)
    final tail = Path()
      ..moveTo(cx - s * 0.4, cy + s * 0.25)
      ..lineTo(cx - s * 0.5, cy + s * 0.1)
      ..quadraticBezierTo(cx - s * 0.45, cy + s * 0.2, cx - s * 0.4, cy + s * 0.25);

    // === DRAW with soft glow ===
    final swanPath = Path()..addPath(body, Offset.zero)..addPath(wing, Offset.zero)..addPath(neck, Offset.zero)..addPath(tail, Offset.zero);
    drawShadowBlendGlow(canvas, swanPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(wing, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(neck, Paint()..color = ShadowColors.shadow);

    // === SINGLE GLOWING PEEKING EYE (swan viewed from side) ===
    final eyeX = cx - s * 0.02;
    final eyeY = cy - s * 0.43;
    final eyeSize = s * 0.065;
    
    // Eye glow layers
    for (int i = 4; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 3;
      canvas.drawCircle(Offset(eyeX, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.07 - i * 0.012));
    }
    
    // White of eye
    canvas.drawCircle(Offset(eyeX, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    // Iris (soft pink/amber - loving)
    canvas.drawCircle(Offset(eyeX, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFF0A8B8));
    // Pupil
    canvas.drawCircle(Offset(eyeX, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    // Highlight
    canvas.drawCircle(Offset(eyeX - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.22, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.18);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Rebel Archetype - Simple Iconic Phoenix
/// Minimal flame-shaped body with upward wings - represents liberation
class RebelArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  RebelArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(507);
    final glowColor = accentColor;
    
    // === REBEL: MIDDAY + VOLCANIC SMOKE (harsh light through ash) ===
    
    // === LAYER 1: Midday volcanic sky (bright but blocked by smoke) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF3A2A25), // Smoky brown-grey (midday sun blocked)
          const Color(0xFF4A3530),
          const Color(0xFF5A4035), // Hazy midday
          const Color(0xFF6A4540),
          const Color(0xFF7A5045), // Warm volcanic
          const Color(0xFF5A3530),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.78, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: VOLCANIC SMOKE CLOUDS (heavy, blocking midday sun) ===
    // Thick smoke layer
    for (int c = 0; c < 6; c++) {
      final cx = size.width * (-0.15 + c * 0.25);
      final cy = size.height * (0.02 + random.nextDouble() * 0.18);
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: 80 + random.nextDouble() * 50, height: 25 + random.nextDouble() * 18),
        Paint()..color = const Color(0xFF3A2520).withOpacity(0.6));
      canvas.drawOval(Rect.fromCenter(center: Offset(cx + 25, cy + 8), width: 60, height: 18),
        Paint()..color = const Color(0xFF4A3530).withOpacity(0.5));
    }
    // Rising smoke columns
    for (int s = 0; s < 3; s++) {
      final smokeX = size.width * (0.3 + s * 0.25);
      final smokePath = Path()
        ..moveTo(smokeX, size.height * 0.9)
        ..quadraticBezierTo(smokeX + 15, size.height * 0.6, smokeX - 10, size.height * 0.3)
        ..quadraticBezierTo(smokeX + 20, size.height * 0.15, smokeX, size.height * 0.05);
      canvas.drawPath(smokePath, Paint()..color = const Color(0xFF4A3830).withOpacity(0.25)..strokeWidth = 25..style = PaintingStyle.stroke..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15));
    }

    // === LAYER 3: Hidden midday sun (trying to break through) ===
    final sunCenter = Offset(size.width * 0.5, size.height * 0.15);
    canvas.drawCircle(sunCenter, size.width * 0.2,
      Paint()..shader = RadialGradient(colors: [const Color(0xFFFFE080).withOpacity(0.25), const Color(0xFFFF9040).withOpacity(0.1), Colors.transparent])
        .createShader(Rect.fromCircle(center: sunCenter, radius: size.width * 0.2)));
    // Diffused sun disc
    canvas.drawCircle(sunCenter, size.width * 0.08, Paint()..color = const Color(0xFFFFD060).withOpacity(0.4));

    // === LAYER 4: Lava glow on ground ===
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.68, size.width, size.height * 0.18),
      Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFFFF4422).withOpacity(0.2), const Color(0xFFFF6633).withOpacity(0.15), Colors.transparent])
        .createShader(Rect.fromLTWH(0, size.height * 0.68, size.width, size.height * 0.18)));

    // === LAYER 5: Phoenix fire glow ===
    for (int g = 4; g >= 0; g--) {
      canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.52), size.width * 0.28 + g * 15,
        Paint()..color = glowColor.withOpacity(0.1 - g * 0.018));
    }

    // === LAYER 6: Cracked volcanic earth ===
    final groundPath = Path()
      ..moveTo(0, size.height * 0.84)
      ..lineTo(size.width, size.height * 0.82)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(groundPath, Paint()..color = const Color(0xFF1A0A0A));
    // Lava cracks
    for (int crack = 0; crack < 7; crack++) {
      final crackX = size.width * (0.08 + crack * 0.13);
      final crackPath = Path()
        ..moveTo(crackX, size.height * 0.85)
        ..lineTo(crackX + 4, size.height * 0.91)
        ..lineTo(crackX + 2, size.height);
      canvas.drawPath(crackPath, Paint()..color = const Color(0xFFFF5522).withOpacity(0.5)..strokeWidth = 2..style = PaintingStyle.stroke);
      canvas.drawPath(crackPath, Paint()..color = const Color(0xFFFF7744).withOpacity(0.2)..strokeWidth = 8..style = PaintingStyle.stroke..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5));
    }

    // === LAYER 7: Rising embers (visible in midday smoke) ===
    for (int i = 0; i < 40; i++) {
      final sx = size.width * 0.1 + random.nextDouble() * size.width * 0.8;
      final sy = size.height * 0.25 + random.nextDouble() * size.height * 0.55;
      final emberSize = 1 + random.nextDouble() * 3;
      if (i % 4 == 0) {
        final trailPath = Path()..moveTo(sx, sy)..lineTo(sx - 2, sy + 15);
        canvas.drawPath(trailPath, Paint()..color = glowColor.withOpacity(0.12)..strokeWidth = 1..style = PaintingStyle.stroke);
      }
      canvas.drawCircle(Offset(sx, sy), emberSize * 2, Paint()..color = glowColor.withOpacity(0.08));
      canvas.drawCircle(Offset(sx, sy), emberSize, Paint()..color = glowColor.withOpacity(0.3 + random.nextDouble() * 0.2));
    }

    // === LAYER 8: Ash particles (thick, midday visibility) ===
    for (int a = 0; a < 35; a++) {
      final ax = random.nextDouble() * size.width;
      final ay = random.nextDouble() * size.height * 0.75;
      canvas.drawCircle(Offset(ax, ay), 0.5 + random.nextDouble() * 1.5, Paint()..color = const Color(0xFF808080).withOpacity(0.25 + random.nextDouble() * 0.15));
    }

    // === SIMPLE ICONIC PHOENIX ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    final s = size.width * 0.32; // STANDARD SIZE UNIT

    // Body (flame shape - teardrop pointing up)
    final body = Path()
      ..moveTo(cx, cy - s * 0.5)
      ..quadraticBezierTo(cx + s * 0.25, cy - s * 0.2, cx + s * 0.2, cy + s * 0.2)
      ..quadraticBezierTo(cx + s * 0.1, cy + s * 0.35, cx, cy + s * 0.4)
      ..quadraticBezierTo(cx - s * 0.1, cy + s * 0.35, cx - s * 0.2, cy + s * 0.2)
      ..quadraticBezierTo(cx - s * 0.25, cy - s * 0.2, cx, cy - s * 0.5)
      ..close();
    
    // Left wing (upward sweep)
    final leftWing = Path()
      ..moveTo(cx - s * 0.15, cy - s * 0.1)
      ..quadraticBezierTo(cx - s * 0.4, cy - s * 0.25, cx - s * 0.55, cy - s * 0.45)
      ..quadraticBezierTo(cx - s * 0.4, cy - s * 0.2, cx - s * 0.25, cy + s * 0.05);
    
    // Right wing (upward sweep)
    final rightWing = Path()
      ..moveTo(cx + s * 0.15, cy - s * 0.1)
      ..quadraticBezierTo(cx + s * 0.4, cy - s * 0.25, cx + s * 0.55, cy - s * 0.45)
      ..quadraticBezierTo(cx + s * 0.4, cy - s * 0.2, cx + s * 0.25, cy + s * 0.05);
    
    // Tail flames
    final tail = Path()
      ..moveTo(cx - s * 0.1, cy + s * 0.35)
      ..quadraticBezierTo(cx - s * 0.15, cy + s * 0.55, cx - s * 0.08, cy + s * 0.6)
      ..quadraticBezierTo(cx, cy + s * 0.5, cx + s * 0.08, cy + s * 0.6)
      ..quadraticBezierTo(cx + s * 0.15, cy + s * 0.55, cx + s * 0.1, cy + s * 0.35);

    // === DRAW with fiery glow ===
    final phoenixPath = Path()..addPath(body, Offset.zero);
    drawShadowBlendGlow(canvas, phoenixPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.18);

    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(rightWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);

    // === LARGE GLOWING PEEKING EYES (STANDARD) ===
    final eyeY = cy - s * 0.15;
    final eyeSpacing = s * 0.12;
    final eyeSize = s * 0.085;
    
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFFF8844));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFFF8844));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.25);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Seeker Archetype - Simple Iconic Hawk
/// Minimal oval body with angular wings - represents exploration and quest
class SeekerArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  SeekerArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(508);
    final glowColor = accentColor;
    
    // === SEEKER: MORNING + PARTLY CLOUDY (fresh start, adventure calls) ===
    
    // === LAYER 1: Fresh morning sky gradient (soft blue → cyan) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1A3545), // Upper morning blue
          const Color(0xFF2A4555),
          const Color(0xFF3A5565), // Soft cyan
          const Color(0xFF4A6575),
          const Color(0xFF5A7585), // Lighter horizon
          const Color(0xFF6A8595),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.78, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: PARTLY CLOUDY (scattered morning clouds) ===
    // Cloud 1 - larger
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.15, size.height * 0.1), width: 65, height: 20),
      Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.35));
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.1, size.height * 0.08), width: 45, height: 14),
      Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.3));
    // Cloud 2
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.55, size.height * 0.06), width: 55, height: 16),
      Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.3));
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.6, size.height * 0.04), width: 35, height: 12),
      Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.25));
    // Cloud 3 
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.85, size.height * 0.12), width: 50, height: 15),
      Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.28));

    // === LAYER 3: Morning sun (low, side lighting) ===
    final sunCenter = Offset(size.width * 0.9, size.height * 0.25);
    for (int g = 5; g >= 0; g--) {
      canvas.drawCircle(sunCenter, size.width * 0.15 + g * 12, 
        Paint()..color = const Color(0xFFFFE8A0).withOpacity(0.08 - g * 0.012));
    }
    // Sun rays
    for (int r = 0; r < 8; r++) {
      final angle = -3.14159 / 2 + r * 3.14159 / 8;
      final rayPath = Path()
        ..moveTo(sunCenter.dx, sunCenter.dy)
        ..lineTo(sunCenter.dx + math.cos(angle) * size.width * 0.3, sunCenter.dy + math.sin(angle) * size.height * 0.25);
      canvas.drawPath(rayPath, Paint()..color = const Color(0xFFFFE8A0).withOpacity(0.1)..strokeWidth = 8..style = PaintingStyle.stroke);
    }
    canvas.drawCircle(sunCenter, size.width * 0.06, Paint()..color = const Color(0xFFFFFFE0).withOpacity(0.8));

    // === LAYER 4: Distant mountain range ===
    final distantMtns = Path()
      ..moveTo(0, size.height * 0.72)
      ..lineTo(size.width * 0.15, size.height * 0.58)
      ..lineTo(size.width * 0.28, size.height * 0.65)
      ..lineTo(size.width * 0.42, size.height * 0.52)
      ..lineTo(size.width * 0.55, size.height * 0.6)
      ..lineTo(size.width * 0.7, size.height * 0.5)
      ..lineTo(size.width * 0.85, size.height * 0.58)
      ..lineTo(size.width, size.height * 0.55)
      ..lineTo(size.width, size.height * 0.72)
      ..close();
    canvas.drawPath(distantMtns, Paint()..color = const Color(0xFF2A4050).withOpacity(0.5));

    // === LAYER 5: Morning horizon glow ===
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.55, size.width, size.height * 0.2),
      Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [Colors.transparent, const Color(0xFF80D0E0).withOpacity(0.1), glowColor.withOpacity(0.08), Colors.transparent])
        .createShader(Rect.fromLTWH(0, size.height * 0.55, size.width, size.height * 0.2)));

    // === LAYER 6: Fresh morning plains ===
    final plains = Path()
      ..moveTo(0, size.height * 0.78)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.74, size.width * 0.5, size.height * 0.72)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.74, size.width, size.height * 0.76)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(plains, Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [const Color(0xFF2A4045), const Color(0xFF203538)])
      .createShader(Rect.fromLTWH(0, size.height * 0.72, size.width, size.height * 0.28)));

    // === LAYER 7: Adventure path ===
    final pathStart = Offset(size.width * 0.5, size.height);
    final pathEnd = Offset(size.width * 0.72, size.height * 0.55);
    final adventurePath = Path()
      ..moveTo(pathStart.dx - 8, pathStart.dy)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.85, pathEnd.dx - 3, pathEnd.dy)
      ..lineTo(pathEnd.dx + 3, pathEnd.dy)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.85, pathStart.dx + 8, pathStart.dy)
      ..close();
    canvas.drawPath(adventurePath, Paint()..color = const Color(0xFF3A5058).withOpacity(0.45));
    
    // Path markers (glowing in morning light)
    for (int m = 0; m < 4; m++) {
      final my = size.height * (0.78 + m * 0.05);
      final mx = size.width * 0.52 + (m * 6);
      canvas.drawCircle(Offset(mx, my), 2.5, Paint()..color = glowColor.withOpacity(0.35 + m * 0.12));
    }

    // === LAYER 8: Morning dew particles ===
    for (int d = 0; d < 12; d++) {
      final dx = random.nextDouble() * size.width;
      final dy = size.height * 0.75 + random.nextDouble() * size.height * 0.2;
      canvas.drawCircle(Offset(dx, dy), 1, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.2 + random.nextDouble() * 0.15));
    }

    // === SIMPLE ICONIC HAWK ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.45;
    final s = size.width * 0.32; // STANDARD SIZE UNIT

    // Body (streamlined oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy), width: s * 0.35, height: s * 0.55));
    
    // Head (circle)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.32), width: s * 0.35, height: s * 0.3));
    
    // Beak (pointed)
    final beak = Path()
      ..moveTo(cx - s * 0.08, cy - s * 0.32)
      ..lineTo(cx, cy - s * 0.22)
      ..lineTo(cx + s * 0.08, cy - s * 0.32);
    
    // Left wing (angular, soaring)
    final leftWing = Path()
      ..moveTo(cx - s * 0.12, cy - s * 0.1)
      ..quadraticBezierTo(cx - s * 0.35, cy - s * 0.15, cx - s * 0.55, cy + s * 0.05)
      ..quadraticBezierTo(cx - s * 0.4, cy + s * 0.1, cx - s * 0.25, cy + s * 0.12);
    
    // Right wing (angular, soaring)
    final rightWing = Path()
      ..moveTo(cx + s * 0.12, cy - s * 0.1)
      ..quadraticBezierTo(cx + s * 0.35, cy - s * 0.15, cx + s * 0.55, cy + s * 0.05)
      ..quadraticBezierTo(cx + s * 0.4, cy + s * 0.1, cx + s * 0.25, cy + s * 0.12);
    
    // Tail (simple fan)
    final tail = Path()
      ..moveTo(cx - s * 0.08, cy + s * 0.25)
      ..lineTo(cx - s * 0.12, cy + s * 0.42)
      ..quadraticBezierTo(cx, cy + s * 0.38, cx + s * 0.12, cy + s * 0.42)
      ..lineTo(cx + s * 0.08, cy + s * 0.25);

    // === DRAW with glow ===
    final hawkPath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(tail, Offset.zero);
    drawShadowBlendGlow(canvas, hawkPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(beak, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(rightWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    // === LARGE GLOWING PEEKING EYES (STANDARD) ===
    final eyeY = cy - s * 0.32;
    final eyeSpacing = s * 0.1;
    final eyeSize = s * 0.07;
    
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFF40D8D0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFF40D8D0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.22);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Child Archetype - Simple Iconic Fawn (Baby Deer)
/// Small oval body with large ears - represents innocence and wonder
class ChildArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  ChildArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(509);
    final glowColor = accentColor;
    
    // === CHILD: TWILIGHT + LIGHT SNOW (magical, wonder-filled) ===
    
    // === LAYER 1: Twilight gradient (emerging stars, purple/blue magic) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0A0A25), // Deep twilight blue
          const Color(0xFF151540),
          const Color(0xFF252055), // Purple transition
          const Color(0xFF302560),
          const Color(0xFF352865), // Lighter at horizon
          const Color(0xFF252050),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.78, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Rainbow hint (fading in twilight sky) ===
    for (int r = 0; r < 5; r++) {
      final rainbowColor = [const Color(0xFFFF6B6B), const Color(0xFFFFE66D), const Color(0xFF4ECB71), const Color(0xFF5BC0EB), const Color(0xFFC792EA)][r];
      canvas.drawArc(
        Rect.fromCenter(center: Offset(size.width * 0.2, size.height * 0.35), width: size.width * 0.4 + r * 8, height: size.height * 0.4 + r * 6),
        3.14159, 1.2, false,
        Paint()..color = rainbowColor.withOpacity(0.08)..strokeWidth = 3..style = PaintingStyle.stroke..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));
    }

    // === LAYER 3: Emerging twilight stars ===
    for (int i = 0; i < 45; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.55;
      final starSize = 0.4 + random.nextDouble() * 1.5;
      final opacity = 0.2 + random.nextDouble() * 0.5;
      if (i % 15 == 0) {
        final sparkle = Paint()..color = Colors.white.withOpacity(0.5)..strokeWidth = 0.5;
        canvas.drawLine(Offset(sx - 4, sy), Offset(sx + 4, sy), sparkle);
        canvas.drawLine(Offset(sx, sy - 4), Offset(sx, sy + 4), sparkle);
      }
      canvas.drawCircle(Offset(sx, sy), starSize, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 4: Bright wishing star ===
    final starPos = Offset(size.width * 0.72, size.height * 0.15);
    for (int ray = 0; ray < 8; ray++) {
      final angle = ray * 3.14159 / 4;
      final rayLen = (ray % 2 == 0) ? 18 : 12;
      canvas.drawLine(starPos, Offset(starPos.dx + math.cos(angle) * rayLen, starPos.dy + math.sin(angle) * rayLen),
        Paint()..color = glowColor.withOpacity(0.5)..strokeWidth = 1.5);
    }
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(starPos, 8 + i * 6.0, Paint()..color = glowColor.withOpacity(0.12 - i * 0.018));
    }
    canvas.drawCircle(starPos, 5, Paint()..color = glowColor.withOpacity(0.85));

    // === LAYER 5: LIGHT SNOW (magical, gentle falling) ===
    for (int s = 0; s < 50; s++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height;
      final snowSize = 1 + random.nextDouble() * 2.5;
      // Soft glow around snowflakes
      canvas.drawCircle(Offset(sx, sy), snowSize * 2, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.08));
      canvas.drawCircle(Offset(sx, sy), snowSize, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.4 + random.nextDouble() * 0.3));
    }

    // === LAYER 6: Snow-dusted mushrooms ===
    for (int m = 0; m < 3; m++) {
      final mx = size.width * (0.1 + m * 0.35) + random.nextDouble() * 20;
      final my = size.height * 0.88;
      final mushH = 8 + random.nextDouble() * 10;
      final mushW = 10 + random.nextDouble() * 6;
      canvas.drawRect(Rect.fromLTWH(mx - 2, my - mushH * 0.5, 4, mushH * 0.5), 
        Paint()..color = const Color(0xFF1A1535).withOpacity(0.7));
      canvas.drawArc(Rect.fromCenter(center: Offset(mx, my - mushH * 0.5), width: mushW, height: mushH * 0.6), 
        3.14159, 3.14159, true, Paint()..color = const Color(0xFF2A2050).withOpacity(0.7));
      // Snow on cap
      canvas.drawArc(Rect.fromCenter(center: Offset(mx, my - mushH * 0.55), width: mushW * 0.8, height: mushH * 0.25), 
        3.14159, 3.14159, true, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.3));
    }

    // === LAYER 7: Snow-covered meadow ===
    final ground = Path()
      ..moveTo(0, size.height * 0.82)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.79, size.width * 0.5, size.height * 0.78)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.79, size.width, size.height * 0.82)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    // Ground with snow coverage
    canvas.drawPath(ground, Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [const Color(0xFF2A2555), const Color(0xFF1A1540)])
      .createShader(Rect.fromLTWH(0, size.height * 0.78, size.width, size.height * 0.22)));
    // Snow layer on ground
    canvas.drawPath(ground, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.15));
    
    // Wildflowers peeking through snow
    for (int w = 0; w < 6; w++) {
      final wx = random.nextDouble() * size.width;
      final wy = size.height * 0.84 + random.nextDouble() * size.height * 0.08;
      final flowerColor = [const Color(0xFFE8A0E8), const Color(0xFFA0E8E8), const Color(0xFFE8E8A0)][w % 3];
      canvas.drawCircle(Offset(wx, wy), 1.5 + random.nextDouble() * 1.5, Paint()..color = flowerColor.withOpacity(0.35));
    }

    // === SIMPLE ICONIC FAWN ===
    final cx = size.width * 0.45;
    final cy = size.height * 0.52;
    final s = size.width * 0.28; // Slightly smaller - it's a baby!

    // Body (small oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.15), width: s * 0.6, height: s * 0.4));
    
    // Head (large circle for baby proportions)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.15), width: s * 0.5, height: s * 0.45));
    
    // Large ears (triangles - big for a fawn)
    final leftEar = Path()
      ..moveTo(cx - s * 0.18, cy - s * 0.28)
      ..lineTo(cx - s * 0.35, cy - s * 0.55)
      ..lineTo(cx - s * 0.08, cy - s * 0.32)
      ..close();
    
    final rightEar = Path()
      ..moveTo(cx + s * 0.18, cy - s * 0.28)
      ..lineTo(cx + s * 0.35, cy - s * 0.55)
      ..lineTo(cx + s * 0.08, cy - s * 0.32)
      ..close();
    
    // Small snout
    final snout = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.02), width: s * 0.18, height: s * 0.12));
    
    // Tiny legs
    final legs = Path()
      ..addRect(Rect.fromLTWH(cx - s * 0.22, cy + s * 0.32, s * 0.08, s * 0.18))
      ..addRect(Rect.fromLTWH(cx - s * 0.08, cy + s * 0.32, s * 0.08, s * 0.18))
      ..addRect(Rect.fromLTWH(cx + s * 0.08, cy + s * 0.32, s * 0.08, s * 0.16))
      ..addRect(Rect.fromLTWH(cx + s * 0.2, cy + s * 0.32, s * 0.08, s * 0.16));
    
    // Small tail
    final tail = Path()..addOval(Rect.fromCenter(center: Offset(cx - s * 0.28, cy + s * 0.12), width: s * 0.1, height: s * 0.08));

    // === DRAW with soft glow ===
    final fawnPath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero);
    drawShadowBlendGlow(canvas, fawnPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(rightEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(snout, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(legs, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);

    // === LARGE GLOWING PEEKING EYES (bigger for baby - cute!) ===
    final eyeY = cy - s * 0.18;
    final eyeSpacing = s * 0.14;
    final eyeSize = s * 0.1; // Bigger eyes for cute baby look
    
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFB8A0E8));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFB8A0E8));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.22, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.22, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.22);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Healer Archetype - Simple Iconic Dove
/// Minimal oval body with gentle curved wings - represents compassion and care
class HealerArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  HealerArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(510);
    final glowColor = accentColor;
    
    // === HEALER: AFTERNOON + LIGHT RAIN (cleansing, reflective) ===
    
    // === LAYER 1: Afternoon overcast gradient (grey-green tones) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF2A3535), // Overcast afternoon grey
          const Color(0xFF304040),
          const Color(0xFF354545), // Soft light breaking through
          const Color(0xFF3A4A4A),
          const Color(0xFF3D4D4D),
          const Color(0xFF354545),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Rain clouds ===
    for (int c = 0; c < 4; c++) {
      final cx = size.width * (-0.1 + c * 0.32);
      final cy = size.height * (0.05 + random.nextDouble() * 0.1);
      canvas.drawOval(Rect.fromCenter(center: Offset(cx, cy), width: 70 + random.nextDouble() * 40, height: 22 + random.nextDouble() * 12),
        Paint()..color = const Color(0xFF505858).withOpacity(0.5));
      canvas.drawOval(Rect.fromCenter(center: Offset(cx + 20, cy - 5), width: 50, height: 15),
        Paint()..color = const Color(0xFF606868).withOpacity(0.4));
    }

    // === LAYER 3: Soft afternoon light through clouds ===
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.3, 0, size.width * 0.4, size.height * 0.6),
      Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
        colors: [const Color(0xFFFFFFFF).withOpacity(0.08), Colors.transparent])
        .createShader(Rect.fromLTWH(size.width * 0.3, 0, size.width * 0.4, size.height * 0.6)));

    // === LAYER 4: Central healing glow ===
    for (int g = 4; g >= 0; g--) {
      canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.45), size.width * 0.25 + g * 12,
        Paint()..color = glowColor.withOpacity(0.1 - g * 0.018));
    }
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.45), size.width * 0.2,
      Paint()..shader = RadialGradient(colors: [glowColor.withOpacity(0.2), glowColor.withOpacity(0.08), Colors.transparent])
        .createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.45), radius: size.width * 0.2)));

    // === LAYER 5: LIGHT RAIN STREAKS ===
    for (int r = 0; r < 40; r++) {
      final rx = random.nextDouble() * size.width;
      final ry = random.nextDouble() * size.height * 0.75;
      final rainLen = 8 + random.nextDouble() * 15;
      canvas.drawLine(
        Offset(rx, ry),
        Offset(rx - 2, ry + rainLen),
        Paint()..color = const Color(0xFFB0D0D0).withOpacity(0.25 + random.nextDouble() * 0.15)..strokeWidth = 1..strokeCap = StrokeCap.round);
    }

    // === LAYER 6: Healing spring with rain ripples ===
    final waterPath = Path()
      ..moveTo(size.width * 0.25, size.height * 0.88)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.82, size.width * 0.75, size.height * 0.88)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.93, size.width * 0.25, size.height * 0.88);
    canvas.drawPath(waterPath, Paint()..color = const Color(0xFF2A4545).withOpacity(0.6));
    // Rain ripples
    for (int rip = 0; rip < 6; rip++) {
      final ripX = size.width * (0.3 + random.nextDouble() * 0.4);
      final ripY = size.height * 0.85 + random.nextDouble() * 0.05;
      canvas.drawCircle(Offset(ripX, ripY), 3 + random.nextDouble() * 5, 
        Paint()..color = const Color(0xFF60A0A0).withOpacity(0.2)..strokeWidth = 1..style = PaintingStyle.stroke);
    }

    // === LAYER 7: Lotus flowers (wet, glistening) ===
    for (int l = 0; l < 2; l++) {
      final lx = size.width * (0.38 + l * 0.24);
      final ly = size.height * 0.86;
      for (int p = 0; p < 5; p++) {
        final angle = -2.5 + p * 0.4;
        final petalPath = Path()
          ..moveTo(lx, ly)
          ..quadraticBezierTo(lx + math.cos(angle) * 8, ly + math.sin(angle) * 4 - 5, lx + math.cos(angle) * 5, ly - 8);
        canvas.drawPath(petalPath, Paint()..color = glowColor.withOpacity(0.3)..strokeWidth = 2..style = PaintingStyle.stroke);
      }
      // Water drops on lotus
      canvas.drawCircle(Offset(lx + 3, ly - 5), 1.5, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.4));
    }

    // === LAYER 8: Wet herbs/plants ===
    for (int h = 0; h < 6; h++) {
      final hx = random.nextDouble() * size.width;
      final hy = size.height * 0.9;
      final herbH = 10 + random.nextDouble() * 15;
      canvas.drawLine(Offset(hx, hy), Offset(hx + 2, hy - herbH), 
        Paint()..color = const Color(0xFF2A4545).withOpacity(0.7)..strokeWidth = 1.5);
      canvas.drawOval(Rect.fromCenter(center: Offset(hx + 4, hy - herbH * 0.6), width: 6, height: 3),
        Paint()..color = const Color(0xFF3A5555).withOpacity(0.6));
      // Water droplet on leaf
      canvas.drawCircle(Offset(hx + 4, hy - herbH * 0.55), 1, Paint()..color = const Color(0xFFFFFFFF).withOpacity(0.35));
    }

    // === LAYER 9: Healing particles (catching rain light) ===
    for (int i = 0; i < 25; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.8;
      final particleSize = 1 + random.nextDouble() * 2.5;
      canvas.drawCircle(Offset(px, py), particleSize * 2.5, Paint()..color = glowColor.withOpacity(0.06));
      canvas.drawCircle(Offset(px, py), particleSize, Paint()..color = glowColor.withOpacity(0.18 + random.nextDouble() * 0.12));
    }

    // === SIMPLE ICONIC DOVE ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    final s = size.width * 0.32; // STANDARD SIZE UNIT

    // Body (gentle oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.05), width: s * 0.6, height: s * 0.45));
    
    // Head (circle)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.22), width: s * 0.4, height: s * 0.35));
    
    // Small beak
    final beak = Path()
      ..moveTo(cx - s * 0.05, cy - s * 0.2)
      ..lineTo(cx, cy - s * 0.12)
      ..lineTo(cx + s * 0.05, cy - s * 0.2);
    
    // Left wing (gentle curve)
    final leftWing = Path()
      ..moveTo(cx - s * 0.2, cy - s * 0.05)
      ..quadraticBezierTo(cx - s * 0.45, cy - s * 0.1, cx - s * 0.5, cy + s * 0.15)
      ..quadraticBezierTo(cx - s * 0.35, cy + s * 0.2, cx - s * 0.2, cy + s * 0.15);
    
    // Right wing (gentle curve)
    final rightWing = Path()
      ..moveTo(cx + s * 0.2, cy - s * 0.05)
      ..quadraticBezierTo(cx + s * 0.45, cy - s * 0.1, cx + s * 0.5, cy + s * 0.15)
      ..quadraticBezierTo(cx + s * 0.35, cy + s * 0.2, cx + s * 0.2, cy + s * 0.15);
    
    // Tail (simple fan)
    final tail = Path()
      ..moveTo(cx - s * 0.1, cy + s * 0.25)
      ..quadraticBezierTo(cx - s * 0.15, cy + s * 0.4, cx - s * 0.1, cy + s * 0.45)
      ..quadraticBezierTo(cx, cy + s * 0.42, cx + s * 0.1, cy + s * 0.45)
      ..quadraticBezierTo(cx + s * 0.15, cy + s * 0.4, cx + s * 0.1, cy + s * 0.25);

    // === DRAW with soft glow ===
    final dovePath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(tail, Offset.zero);
    drawShadowBlendGlow(canvas, dovePath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(beak, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(rightWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    // === LARGE GLOWING PEEKING EYES (STANDARD) ===
    final eyeY = cy - s * 0.22;
    final eyeSpacing = s * 0.12;
    final eyeSize = s * 0.08;
    
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFF50D890));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFF50D890));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.22);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Magician Archetype - Simple Iconic Raven
/// Minimal oval body with angular wings and curved beak - represents transformation
class MagicianArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  MagicianArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(511);
    final glowColor = accentColor;
    
    // === MAGICIAN: NIGHT + CLEAR MYSTICAL ===
    
    // === LAYER 1: Deep mystical void gradient ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF030210), // Almost black void
          const Color(0xFF0A0520),
          const Color(0xFF1A1040),
          const Color(0xFF251555),
          const Color(0xFF2A1860),
          const Color(0xFF1A1040),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Arcane circle (transformation symbol) ===
    final circleCenter = Offset(size.width * 0.5, size.height * 0.5);
    // Outer circle
    canvas.drawCircle(circleCenter, size.width * 0.35, 
      Paint()..color = glowColor.withOpacity(0.15)..strokeWidth = 1.5..style = PaintingStyle.stroke);
    // Inner circle
    canvas.drawCircle(circleCenter, size.width * 0.28, 
      Paint()..color = glowColor.withOpacity(0.12)..strokeWidth = 1..style = PaintingStyle.stroke);
    // Arcane symbols (triangles)
    for (int t = 0; t < 6; t++) {
      final angle = t * 3.14159 / 3;
      final tx = circleCenter.dx + math.cos(angle) * size.width * 0.32;
      final ty = circleCenter.dy + math.sin(angle) * size.width * 0.32;
      final symbolPath = Path()
        ..moveTo(tx, ty - 6)
        ..lineTo(tx - 5, ty + 4)
        ..lineTo(tx + 5, ty + 4)
        ..close();
      canvas.drawPath(symbolPath, Paint()..color = glowColor.withOpacity(0.25));
    }

    // === LAYER 3: Moon phases across top ===
    final phases = [0.0, 0.25, 0.5, 0.75, 1.0];
    for (int p = 0; p < 5; p++) {
      final moonX = size.width * (0.15 + p * 0.175);
      final moonY = size.height * 0.1;
      final moonR = 6.0;
      // Full moon base
      canvas.drawCircle(Offset(moonX, moonY), moonR, Paint()..color = const Color(0xFFE8E0F0).withOpacity(0.5));
      // Shadow for phase
      if (phases[p] < 1) {
        final shadowOffset = (1 - phases[p]) * moonR * 2;
        canvas.drawCircle(Offset(moonX + shadowOffset - moonR, moonY), moonR, Paint()..color = const Color(0xFF0A0520));
      }
    }

    // === LAYER 4: Central mystical energy glow ===
    for (int g = 5; g >= 0; g--) {
      canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.48), size.width * 0.2 + g * 10,
        Paint()..color = glowColor.withOpacity(0.1 - g * 0.015));
    }
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.48), size.width * 0.15,
      Paint()..shader = RadialGradient(colors: [glowColor.withOpacity(0.25), glowColor.withOpacity(0.1), Colors.transparent])
        .createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.48), radius: size.width * 0.15)));

    // === LAYER 5: Crystal formations ===
    // Left crystal cluster
    final leftCrystal = [
      [size.width * 0.08, size.height * 0.92, size.height * 0.7],
      [size.width * 0.12, size.height * 0.92, size.height * 0.75],
      [size.width * 0.05, size.height * 0.92, size.height * 0.8],
    ];
    for (final c in leftCrystal) {
      final crystalPath = Path()
        ..moveTo(c[0] - 4, c[1])
        ..lineTo(c[0], c[2])
        ..lineTo(c[0] + 4, c[1])
        ..close();
      canvas.drawPath(crystalPath, Paint()..color = const Color(0xFF4030A0).withOpacity(0.5));
      canvas.drawPath(crystalPath, Paint()..color = glowColor.withOpacity(0.2)..strokeWidth = 1..style = PaintingStyle.stroke);
    }
    // Right crystal cluster
    final rightCrystal = [
      [size.width * 0.88, size.height * 0.92, size.height * 0.72],
      [size.width * 0.92, size.height * 0.92, size.height * 0.78],
      [size.width * 0.95, size.height * 0.92, size.height * 0.82],
    ];
    for (final c in rightCrystal) {
      final crystalPath = Path()
        ..moveTo(c[0] - 3, c[1])
        ..lineTo(c[0], c[2])
        ..lineTo(c[0] + 3, c[1])
        ..close();
      canvas.drawPath(crystalPath, Paint()..color = const Color(0xFF4030A0).withOpacity(0.5));
      canvas.drawPath(crystalPath, Paint()..color = glowColor.withOpacity(0.2)..strokeWidth = 1..style = PaintingStyle.stroke);
    }

    // === LAYER 6: Floating magical particles/orbs ===
    for (int i = 0; i < 30; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.8;
      final orbSize = 1.5 + random.nextDouble() * 3.5;
      // Orbit trail hint
      if (i % 5 == 0) {
        canvas.drawArc(Rect.fromCenter(center: Offset(px, py), width: 20, height: 10), 0, 2, false,
          Paint()..color = glowColor.withOpacity(0.08)..strokeWidth = 1..style = PaintingStyle.stroke);
      }
      canvas.drawCircle(Offset(px, py), orbSize * 2, Paint()..color = glowColor.withOpacity(0.08));
      canvas.drawCircle(Offset(px, py), orbSize, Paint()..color = glowColor.withOpacity(0.2 + random.nextDouble() * 0.2));
    }

    // === LAYER 7: Energy lines connecting crystals ===
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.78), circleCenter,
      Paint()..color = glowColor.withOpacity(0.08)..strokeWidth = 1);
    canvas.drawLine(Offset(size.width * 0.9, size.height * 0.78), circleCenter,
      Paint()..color = glowColor.withOpacity(0.08)..strokeWidth = 1);

    // Branch
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.78),
      Offset(size.width * 0.85, size.height * 0.72),
      Paint()..color = ShadowColors.shadow..strokeWidth = 6..strokeCap = StrokeCap.round,
    );

    // === SIMPLE ICONIC RAVEN ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    final s = size.width * 0.32; // STANDARD SIZE UNIT

    // Body (sleek oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.1), width: s * 0.55, height: s * 0.5));
    
    // Head (circle)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.18), width: s * 0.42, height: s * 0.38));
    
    // Curved beak (distinctive raven beak)
    final beak = Path()
      ..moveTo(cx - s * 0.12, cy - s * 0.18)
      ..quadraticBezierTo(cx - s * 0.25, cy - s * 0.12, cx - s * 0.22, cy - s * 0.05)
      ..quadraticBezierTo(cx - s * 0.18, cy - s * 0.1, cx - s * 0.1, cy - s * 0.15);
    
    // Left wing (angular)
    final leftWing = Path()
      ..moveTo(cx - s * 0.2, cy)
      ..quadraticBezierTo(cx - s * 0.45, cy - s * 0.15, cx - s * 0.55, cy + s * 0.1)
      ..quadraticBezierTo(cx - s * 0.4, cy + s * 0.15, cx - s * 0.25, cy + s * 0.12);
    
    // Right wing (angular)
    final rightWing = Path()
      ..moveTo(cx + s * 0.2, cy)
      ..quadraticBezierTo(cx + s * 0.45, cy - s * 0.15, cx + s * 0.55, cy + s * 0.1)
      ..quadraticBezierTo(cx + s * 0.4, cy + s * 0.15, cx + s * 0.25, cy + s * 0.12);
    
    // Tail (angular fan)
    final tail = Path()
      ..moveTo(cx - s * 0.1, cy + s * 0.32)
      ..lineTo(cx - s * 0.18, cy + s * 0.5)
      ..quadraticBezierTo(cx, cy + s * 0.45, cx + s * 0.18, cy + s * 0.5)
      ..lineTo(cx + s * 0.1, cy + s * 0.32);

    // === DRAW with mystical glow ===
    final ravenPath = Path()..addPath(body, Offset.zero)..addPath(head, Offset.zero)..addPath(tail, Offset.zero);
    drawShadowBlendGlow(canvas, ravenPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.18);

    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(beak, Paint()..color = ShadowColors.shadow..strokeWidth = 5..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);
    canvas.drawPath(rightWing, Paint()..color = ShadowColors.shadow..strokeWidth = 8..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    // === LARGE GLOWING PEEKING EYES (STANDARD) ===
    final eyeY = cy - s * 0.18;
    final eyeSpacing = s * 0.12;
    final eyeSize = s * 0.08;
    
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFB080E0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFB080E0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.25);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Authority Archetype - Simple Iconic Lion
/// Minimal oval body with circle mane around head - represents leadership
class AuthorityArchetypePainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  AuthorityArchetypePainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(512);
    final glowColor = accentColor;
    
    // === AUTHORITY: LATE AFTERNOON + HAZY/DUSTY ===
    
    // === LAYER 1: Majestic savanna sunset gradient (late afternoon) ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0A0510), // Deep twilight
          const Color(0xFF1A1020),
          const Color(0xFF2A1525),
          const Color(0xFF452030), // Warm sunset tones
          const Color(0xFF6A3040),
          const Color(0xFF8A4050),
        ],
        stops: const [0.0, 0.15, 0.35, 0.55, 0.75, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === LAYER 2: Dramatic sunset sun ===
    final sunCenter = Offset(size.width * 0.5, size.height * 0.88);
    // Sun glow layers
    for (int g = 6; g >= 0; g--) {
      canvas.drawCircle(sunCenter, size.width * 0.2 + g * 15, 
        Paint()..color = const Color(0xFFFFB040).withOpacity(0.06 - g * 0.008));
    }
    // Sun core
    canvas.drawCircle(sunCenter, size.width * 0.15, 
      Paint()..shader = RadialGradient(colors: [const Color(0xFFFFE080), const Color(0xFFFFB040), const Color(0xFFE87040)])
        .createShader(Rect.fromCircle(center: sunCenter, radius: size.width * 0.15)));

    // === LAYER 3: Scattered stars (twilight) ===
    for (int i = 0; i < 20; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.35;
      canvas.drawCircle(Offset(sx, sy), 0.5 + random.nextDouble() * 0.8, 
        Paint()..color = Colors.white.withOpacity(0.15 + random.nextDouble() * 0.2));
    }

    // === LAYER 4: Acacia tree silhouette ===
    final treeX = size.width * 0.15;
    // Trunk
    final trunk = Path()
      ..moveTo(treeX - 4, size.height)
      ..lineTo(treeX - 3, size.height * 0.6)
      ..lineTo(treeX + 3, size.height * 0.6)
      ..lineTo(treeX + 4, size.height)
      ..close();
    canvas.drawPath(trunk, Paint()..color = const Color(0xFF0A0510));
    // Umbrella canopy
    canvas.drawOval(Rect.fromCenter(center: Offset(treeX, size.height * 0.55), width: 50, height: 18),
      Paint()..color = const Color(0xFF0A0510));
    canvas.drawOval(Rect.fromCenter(center: Offset(treeX - 12, size.height * 0.53), width: 35, height: 14),
      Paint()..color = const Color(0xFF0A0510));
    canvas.drawOval(Rect.fromCenter(center: Offset(treeX + 15, size.height * 0.54), width: 38, height: 15),
      Paint()..color = const Color(0xFF0A0510));

    // === LAYER 5: Distant acacia on right ===
    final tree2X = size.width * 0.88;
    canvas.drawRect(Rect.fromLTWH(tree2X - 2, size.height * 0.65, 4, size.height * 0.35), Paint()..color = const Color(0xFF15101A).withOpacity(0.8));
    canvas.drawOval(Rect.fromCenter(center: Offset(tree2X, size.height * 0.62), width: 35, height: 12), Paint()..color = const Color(0xFF15101A).withOpacity(0.8));

    // === LAYER 6: Royal golden glow behind lion ===
    for (int g = 4; g >= 0; g--) {
      canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.48), size.width * 0.25 + g * 12,
        Paint()..color = glowColor.withOpacity(0.1 - g * 0.018));
    }
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.48), size.width * 0.2,
      Paint()..shader = RadialGradient(colors: [glowColor.withOpacity(0.2), glowColor.withOpacity(0.08), Colors.transparent])
        .createShader(Rect.fromCircle(center: Offset(size.width * 0.5, size.height * 0.48), radius: size.width * 0.2)));

    // === LAYER 7: Rolling savanna hills ===
    final hills = Path()
      ..moveTo(0, size.height * 0.78)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.72, size.width * 0.4, size.height * 0.76)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.7, size.width * 0.8, size.height * 0.74)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.72, size.width, size.height * 0.75)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(hills, Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
      colors: [const Color(0xFF251520), const Color(0xFF1A1015)])
      .createShader(Rect.fromLTWH(0, size.height * 0.7, size.width, size.height * 0.3)));

    // === LAYER 8: Tall grass silhouettes ===
    for (int gr = 0; gr < 15; gr++) {
      final gx = random.nextDouble() * size.width;
      final gy = size.height * 0.82 + random.nextDouble() * size.height * 0.12;
      final grassH = 8 + random.nextDouble() * 12;
      canvas.drawLine(Offset(gx, gy), Offset(gx + 2, gy - grassH), 
        Paint()..color = const Color(0xFF2A1A25).withOpacity(0.6)..strokeWidth = 1.5..strokeCap = StrokeCap.round);
      canvas.drawLine(Offset(gx + 3, gy), Offset(gx + 5, gy - grassH * 0.8), 
        Paint()..color = const Color(0xFF2A1A25).withOpacity(0.5)..strokeWidth = 1..strokeCap = StrokeCap.round);
    }

    // === LAYER 9: Dust particles in golden light ===
    for (int d = 0; d < 15; d++) {
      final dx = random.nextDouble() * size.width;
      final dy = size.height * 0.5 + random.nextDouble() * size.height * 0.35;
      canvas.drawCircle(Offset(dx, dy), 0.5 + random.nextDouble() * 1, 
        Paint()..color = const Color(0xFFFFD080).withOpacity(0.15 + random.nextDouble() * 0.15));
    }

    // === SIMPLE ICONIC LION ===
    final cx = size.width * 0.5;
    final cy = size.height * 0.48;
    final s = size.width * 0.32; // STANDARD SIZE UNIT

    // Mane (large circle behind head)
    final mane = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.1), width: s * 0.85, height: s * 0.8));
    
    // Body (oval)
    final body = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.25), width: s * 0.7, height: s * 0.45));
    
    // Head (circle in center of mane)
    final head = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy - s * 0.1), width: s * 0.5, height: s * 0.45));
    
    // Ears (small circles at top of mane)
    final leftEar = Path()..addOval(Rect.fromCenter(center: Offset(cx - s * 0.28, cy - s * 0.35), width: s * 0.15, height: s * 0.12));
    final rightEar = Path()..addOval(Rect.fromCenter(center: Offset(cx + s * 0.28, cy - s * 0.35), width: s * 0.15, height: s * 0.12));
    
    // Snout (small oval)
    final snout = Path()..addOval(Rect.fromCenter(center: Offset(cx, cy + s * 0.08), width: s * 0.22, height: s * 0.15));
    
    // Front legs
    final legs = Path()
      ..addRect(Rect.fromLTWH(cx - s * 0.22, cy + s * 0.42, s * 0.12, s * 0.2))
      ..addRect(Rect.fromLTWH(cx + s * 0.1, cy + s * 0.42, s * 0.12, s * 0.2));
    
    // Tail
    final tail = Path()
      ..moveTo(cx + s * 0.3, cy + s * 0.35)
      ..quadraticBezierTo(cx + s * 0.55, cy + s * 0.25, cx + s * 0.5, cy + s * 0.1)
      ..quadraticBezierTo(cx + s * 0.48, cy + s * 0.2, cx + s * 0.35, cy + s * 0.3);

    // === DRAW with regal glow ===
    final lionPath = Path()..addPath(mane, Offset.zero)..addPath(body, Offset.zero)..addPath(head, Offset.zero);
    drawShadowBlendGlow(canvas, lionPath, glowColor, layers: 5, baseSpread: 12, maxOpacity: 0.15);

    canvas.drawPath(mane, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(body, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(head, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(leftEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(rightEar, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(snout, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(legs, Paint()..color = ShadowColors.shadow);
    canvas.drawPath(tail, Paint()..color = ShadowColors.shadow..strokeWidth = 6..style = PaintingStyle.stroke..strokeCap = StrokeCap.round);

    // === LARGE GLOWING PEEKING EYES (STANDARD) ===
    final eyeY = cy - s * 0.12;
    final eyeSpacing = s * 0.14;
    final eyeSize = s * 0.085;
    
    for (int i = 5; i >= 0; i--) {
      final glowSize = eyeSize * 2.5 + i * 4;
      canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
      canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), glowSize, Paint()..color = glowColor.withOpacity(0.06 - i * 0.008));
    }
    
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 1.5, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFE8B830));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.9, Paint()..color = const Color(0xFFE8B830));
    canvas.drawCircle(Offset(cx - eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + eyeSpacing, eyeY), eyeSize * 0.4, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx - eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + eyeSpacing - eyeSize * 0.3, eyeY - eyeSize * 0.3), eyeSize * 0.2, Paint()..color = Colors.white);

    drawVignette(canvas, size, intensity: 0.22);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Shadow variant painter - adds dark/mysterious feel to any archetype
/// Used for shadow energies
class ShadowArchetypePainter extends CustomPainter {
  final CustomPainter basePainter;
  final Color shadowTint;

  ShadowArchetypePainter({required this.basePainter, this.shadowTint = const Color(0xFF4A0E4E)});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw base archetype
    basePainter.paint(canvas, size);
    
    // Add shadow overlay
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = shadowTint.withOpacity(0.25),
    );
    
    // Add extra vignette for shadow feel
    final vignetteGradient = RadialGradient(
      colors: [Colors.transparent, shadowTint.withOpacity(0.4)],
      stops: const [0.4, 1.0],
    );
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = vignetteGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

// =============================================================================
// ARCHETYPE CARD CONFIGS
// =============================================================================

/// Returns the appropriate painter for an archetype motif
CustomPainter getArchetypePainter(String motif, Color accentColor, bool isDark, {bool isShadow = false}) {
  CustomPainter basePainter;
  
  switch (motif.toUpperCase()) {
    case 'HERO':
      basePainter = HeroArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'TRICKSTER':
      basePainter = TricksterArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'WISE_OLD_MAN':
      basePainter = SageArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'GREAT_MOTHER':
      basePainter = NurturerArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'WARRIOR':
      basePainter = WarriorArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'LOVER_EROS':
      basePainter = LoverArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'OUTLAW_REBEL':
      basePainter = RebelArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'SEEKER_WANDERER':
      basePainter = SeekerArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'CHILD':
      basePainter = ChildArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'CAREGIVER_HEALER':
      basePainter = HealerArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'MAGICIAN':
      basePainter = MagicianArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    case 'FATHER_AUTHORITY':
      basePainter = AuthorityArchetypePainter(accentColor: accentColor, isDark: isDark);
      break;
    default:
      basePainter = SageArchetypePainter(accentColor: accentColor, isDark: isDark);
  }
  
  if (isShadow) {
    return ShadowArchetypePainter(basePainter: basePainter);
  }
  return basePainter;
}

/// Color mapping for archetypes
Color getArchetypeColor(String motif) {
  switch (motif.toUpperCase()) {
    case 'HERO': return const Color(0xFFDC2626); // Red - courage
    case 'TRICKSTER': return const Color(0xFFF59E0B); // Amber - playful
    case 'WISE_OLD_MAN': return const Color(0xFF6366F1); // Indigo - wisdom
    case 'GREAT_MOTHER': return const Color(0xFFEC4899); // Pink - nurturing
    case 'WARRIOR': return const Color(0xFF7C3AED); // Purple - strength
    case 'LOVER_EROS': return const Color(0xFFF472B6); // Rose - passion
    case 'OUTLAW_REBEL': return const Color(0xFFEF4444); // Bright red - rebellion
    case 'SEEKER_WANDERER': return const Color(0xFF14B8A6); // Teal - exploration
    case 'CHILD': return const Color(0xFF8B5CF6); // Light purple - wonder
    case 'CAREGIVER_HEALER': return const Color(0xFF10B981); // Emerald - healing
    case 'MAGICIAN': return const Color(0xFF8B5CF6); // Purple - transformation
    case 'FATHER_AUTHORITY': return const Color(0xFFD97706); // Gold - authority
    default: return const Color(0xFF6366F1);
  }
}

/// Label mapping for archetypes
String getArchetypeLabel(String motif) {
  switch (motif.toUpperCase()) {
    case 'HERO': return 'Hero';
    case 'TRICKSTER': return 'Trickster';
    case 'WISE_OLD_MAN': return 'Sage';
    case 'GREAT_MOTHER': return 'Nurturer';
    case 'FATHER_AUTHORITY': return 'Authority';
    case 'CHILD': return 'Inner Child';
    case 'LOVER_EROS': return 'Lover';
    case 'WARRIOR': return 'Warrior';
    case 'MAGICIAN': return 'Transformer';
    case 'CAREGIVER_HEALER': return 'Healer';
    case 'OUTLAW_REBEL': return 'Rebel';
    case 'SEEKER_WANDERER': return 'Seeker';
    default: return motif.replaceAll('_', ' ').split(' ').map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}' : '').join(' ');
  }
}

/// Description mapping for archetypes
String getArchetypeDescription(String motif) {
  switch (motif.toUpperCase()) {
    case 'HERO': return 'Courage to face challenges and transform through adversity. You are driven to overcome obstacles and prove your worth.';
    case 'TRICKSTER': return 'Playful boundary-crossing and creative disruption. You challenge conventions and find unconventional solutions.';
    case 'WISE_OLD_MAN': return 'Deep wisdom, guidance, and accumulated knowledge. You seek understanding and offer insight to others.';
    case 'GREAT_MOTHER': return 'Nurturing presence, protection, and unconditional acceptance. You care deeply for others\' wellbeing.';
    case 'FATHER_AUTHORITY': return 'Structure, discipline, and principled leadership. You establish order and uphold standards.';
    case 'CHILD': return 'Innocence, wonder, and the capacity for new beginnings. You maintain curiosity and openness to possibility.';
    case 'LOVER_EROS': return 'Passion, connection, and the pursuit of intimacy. You value deep relationships and aesthetic beauty.';
    case 'WARRIOR': return 'Strength, discipline, and protective courage. You fight for what you believe in and defend others.';
    case 'MAGICIAN': return 'Transformation, vision, and manifesting possibility. You see potential others miss and make things happen.';
    case 'CAREGIVER_HEALER': return 'Compassionate service and the gift of restoration. You help others heal and find wholeness.';
    case 'OUTLAW_REBEL': return 'Liberation, authenticity, and creative destruction. You break rules that don\'t serve and forge your own path.';
    case 'SEEKER_WANDERER': return 'Quest for meaning and exploration of the unknown. You are driven to discover truth and find yourself.';
    default: return 'An archetypal energy that shapes your psychological patterns.';
  }
}

// =============================================================================
// PSYCHE POSITION CARDS - Dynamic character-based cards for Identity tab
// =============================================================================

/// Configuration for a psyche position card
class PsychePositionConfig {
  final String id;
  final String title;
  final String infoText;
  final Color accentColor;
  final IconData icon;

  const PsychePositionConfig({
    required this.id,
    required this.title,
    required this.infoText,
    required this.accentColor,
    required this.icon,
  });
}

/// All psyche position configurations
class PsychePositionConfigs {
  static const ego = PsychePositionConfig(
    id: 'ego',
    title: 'Ego Position',
    infoText: 'Your conscious sense of self - who you believe yourself to be at your core.',
    accentColor: Color(0xFF7C3AED),
    icon: Icons.person,
  );
  
  static const persona = PsychePositionConfig(
    id: 'persona',
    title: 'Persona Position',
    infoText: 'The social mask you wear - how you present yourself to the world.',
    accentColor: Color(0xFF6366F1),
    icon: Icons.masks,
  );
  
  static const shadow = PsychePositionConfig(
    id: 'shadow',
    title: 'Shadow Position',
    infoText: 'The hidden aspects of yourself - traits you\'ve rejected or denied.',
    accentColor: Color(0xFF4B5563),
    icon: Icons.visibility_off,
  );
  
  static const feelingFunction = PsychePositionConfig(
    id: 'feelingFunction',
    title: 'Feeling Function',
    infoText: 'Your inner opposite - the contrasexual energy that balances your psyche.',
    accentColor: Color(0xFFEC4899),
    icon: Icons.favorite,
  );
  
  static const erosAxis = PsychePositionConfig(
    id: 'erosAxis',
    title: 'Eros Axis',
    infoText: 'Your life force and vitality - what makes you feel most alive.',
    accentColor: Color(0xFFF59E0B),
    icon: Icons.connect_without_contact,
  );
  
  static const selfDirection = PsychePositionConfig(
    id: 'selfDirection',
    title: 'Self Direction',
    infoText: 'Your path toward integration - the direction of your psychological growth.',
    accentColor: Color(0xFF10B981),
    icon: Icons.explore,
  );

  static List<PsychePositionConfig> get all => [ego, persona, shadow, feelingFunction, erosAxis, selfDirection];
}

/// Dynamic position card that shows a character-based illustration
/// The character silhouette is based on the user's entered character for that position
class PsychePositionCard extends StatefulWidget {
  final PsychePositionConfig config;
  final String? characterName;
  final String? content;
  final List<dynamic>? examples;
  final bool isLoading;
  final double? confidence;
  final List<OrbitEntryData> orbitEntries;
  final List<CompensationEntryData> compensationEntries;
  final String? iconicShape;

  const PsychePositionCard({
    super.key,
    required this.config,
    this.characterName,
    this.content,
    this.examples,
    this.isLoading = false,
    this.confidence,
    this.orbitEntries = const [],
    this.compensationEntries = const [],
    this.iconicShape,
  });

  @override
  State<PsychePositionCard> createState() => _PsychePositionCardState();
}

class _PsychePositionCardState extends State<PsychePositionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.content != null ? () => _openDetailView(context) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _isHovered 
                    ? widget.config.accentColor.withOpacity(0.3) 
                    : Colors.black.withOpacity(0.2),
                blurRadius: _isHovered ? 15 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Background with dynamic character illustration
                Positioned.fill(
                  child: widget.isLoading
                      ? Container(
                          color: widget.config.accentColor.withOpacity(0.2),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(widget.config.accentColor),
                            ),
                          ),
                        )
                      : PsycheSvgIcon(
                          positionId: widget.config.id,
                          accentColor: widget.config.accentColor,
                          isDark: isDark,
                        ),
                ),
                // Gradient overlay for text readability
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                      ),
                    ),
                  ),
                ),
                // Character name chip (if available)
                if (widget.characterName != null && widget.characterName!.isNotEmpty)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: widget.config.accentColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.characterName!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                // Confidence indicator (if available)
                if (widget.confidence != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${(widget.confidence! * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                // Title at bottom
                Positioned(
                  bottom: 10,
                  left: 12,
                  right: 12,
                  child: Text(
                    widget.config.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: const Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDetailView(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black54,
        pageBuilder: (context, animation, secondaryAnimation) => PsychePositionDetailView(
          config: widget.config,
          characterName: widget.characterName,
          content: widget.content!,
          examples: widget.examples ?? [],
          confidence: widget.confidence,
          orbitEntries: widget.orbitEntries,
          compensationEntries: widget.compensationEntries,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
          child: child,
        ),
      ),
    );
  }
}

/// SVG-based psyche icon widget
/// Renders high-quality SVG icons as shadow silhouettes with peeking eyes
class PsycheSvgIcon extends StatelessWidget {
  final String positionId;
  final Color accentColor;
  final bool isDark;
  
  const PsycheSvgIcon({
    super.key,
    required this.positionId,
    required this.accentColor,
    required this.isDark,
  });
  
  // SVG file mapping
  static const _iconMap = {
    'ego': 'assets/icons/psyche/crown.svg',
    'persona': 'assets/icons/psyche/mask.svg',
    'shadow': 'assets/icons/psyche/lantern.svg',
    'feelingFunction': 'assets/icons/psyche/heart.svg',
    'erosAxis': 'assets/icons/psyche/flame.svg',
    'selfDirection': 'assets/icons/psyche/compass.svg',
  };
  
  // Eye positions relative to icon center (normalized 0-1)
  static const _eyePositions = {
    'ego': Offset(0.5, 0.75),        // In the crown band
    'persona': Offset(0.5, 0.42),    // In the eye holes
    'shadow': Offset(0.5, 0.5),      // In the lantern glass
    'feelingFunction': Offset(0.5, 0.35), // Upper heart area
    'erosAxis': Offset(0.5, 0.55),   // Center of flame
    'selfDirection': Offset(0.5, 0.5), // Center of compass
  };
  
  // Icon size as fraction of card width
  static const _iconSizes = {
    'ego': 0.55,
    'persona': 0.6,
    'shadow': 0.65,     // Lantern is taller
    'feelingFunction': 0.55,
    'erosAxis': 0.65,   // Flame is taller
    'selfDirection': 0.55,
  };

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        final iconPath = _iconMap[positionId] ?? _iconMap['ego']!;
        final eyePos = _eyePositions[positionId] ?? const Offset(0.5, 0.5);
        final iconSize = (_iconSizes[positionId] ?? 0.55) * size.width;
        
        return Stack(
          children: [
            // Background environment
            CustomPaint(
              size: size,
              painter: _PsycheBackgroundPainter(
                positionId: positionId,
                accentColor: accentColor,
              ),
            ),
            // SVG Icon as shadow silhouette
            Positioned(
              left: (size.width - iconSize) / 2,
              top: (size.height - iconSize) / 2 - size.height * 0.05,
              width: iconSize,
              height: iconSize,
              child: Stack(
                children: [
                  // Glow layers behind icon
                  ...List.generate(5, (i) {
                    return Positioned.fill(
                      child: Transform.scale(
                        scale: 1.0 + (5 - i) * 0.04,
                        child: SvgPicture.asset(
                          iconPath,
                          colorFilter: ColorFilter.mode(
                            accentColor.withOpacity(0.08 - i * 0.015),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    );
                  }),
                  // Main shadow icon
                  Positioned.fill(
                    child: SvgPicture.asset(
                      iconPath,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF0A0A15),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Peeking eyes overlay
            CustomPaint(
              size: size,
              painter: _PsycheEyesPainter(
                positionId: positionId,
                accentColor: accentColor,
                eyePosition: eyePos,
                iconSize: iconSize,
              ),
            ),
            // Vignette
            CustomPaint(
              size: size,
              painter: _VignettePainter(),
            ),
          ],
        );
      },
    );
  }
}

/// Background painter for psyche positions
class _PsycheBackgroundPainter extends CustomPainter {
  final String positionId;
  final Color accentColor;
  
  _PsycheBackgroundPainter({
    required this.positionId,
    required this.accentColor,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(positionId.hashCode);
    
    switch (positionId) {
      case 'ego':
        _drawEgoBackground(canvas, size, random);
        break;
      case 'persona':
        _drawPersonaBackground(canvas, size, random);
        break;
      case 'shadow':
        _drawShadowBackground(canvas, size, random);
        break;
      case 'feelingFunction':
        _drawFeelingBackground(canvas, size, random);
        break;
      case 'erosAxis':
        _drawErosBackground(canvas, size, random);
        break;
      case 'selfDirection':
        _drawCompassBackground(canvas, size, random);
        break;
      default:
        _drawEgoBackground(canvas, size, random);
    }
  }
  
  void _drawEgoBackground(Canvas canvas, Size size, math.Random random) {
    // Dawn sky gradient
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A2540), Color(0xFF3A4565), Color(0xFFE8A060), Color(0xFFFFD0A0)],
        stops: [0.0, 0.35, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Rising sun
    final sunY = size.height * 0.55;
    for (int i = 8; i >= 0; i--) {
      canvas.drawCircle(
        Offset(size.width * 0.5, sunY),
        25 + i * 12.0,
        Paint()..color = const Color(0xFFFFD080).withOpacity(0.1 - i * 0.01),
      );
    }
    canvas.drawCircle(Offset(size.width * 0.5, sunY), 20, Paint()..color = const Color(0xFFFFE8C0));
    
    // Distant mountains
    final mtn1 = Path()
      ..moveTo(0, size.height * 0.65)
      ..lineTo(size.width * 0.25, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.55)
      ..lineTo(size.width * 0.75, size.height * 0.35)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(mtn1, Paint()..color = const Color(0xFF2A3A50).withOpacity(0.5));
    
    // Foreground
    final peak = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.5, size.height * 0.55)
      ..lineTo(size.width * 0.8, size.height)
      ..close();
    canvas.drawPath(peak, Paint()..color = const Color(0xFF1A2535));
  }
  
  void _drawPersonaBackground(Canvas canvas, Size size, math.Random random) {
    // Stage lighting
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2A1A35), Color(0xFF4A2A55), Color(0xFF6A4070), Color(0xFF8A5590)],
        stops: [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Spotlight
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.4), width: size.width * 0.7, height: size.height * 0.5),
      Paint()..shader = RadialGradient(
        colors: [Colors.white.withOpacity(0.15), Colors.transparent],
      ).createShader(Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.4), width: size.width * 0.7, height: size.height * 0.5)),
    );
    
    // Stage curtains
    final curtainL = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width * 0.15, size.height * 0.3, size.width * 0.08, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(curtainL, Paint()..color = const Color(0xFF8B0000).withOpacity(0.7));
    
    final curtainR = Path()
      ..moveTo(size.width, 0)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.3, size.width * 0.92, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(curtainR, Paint()..color = const Color(0xFF8B0000).withOpacity(0.7));
    
    // Stage floor
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25),
      Paint()..color = const Color(0xFF1A0A15),
    );
  }
  
  void _drawShadowBackground(Canvas canvas, Size size, math.Random random) {
    // Dusk twilight
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A2545), Color(0xFF2A3A60), Color(0xFF3A4A70), Color(0xFF4A5A80)],
        stops: [0.0, 0.4, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Mist layers
    for (int i = 0; i < 5; i++) {
      final y = size.height * (0.3 + i * 0.12);
      canvas.drawRect(
        Rect.fromLTWH(0, y, size.width, size.height * 0.18),
        Paint()..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.08 - i * 0.012), Colors.transparent],
        ).createShader(Rect.fromLTWH(0, y, size.width, size.height * 0.18)),
      );
    }
    
    // Dark trees
    for (int i = 0; i < 8; i++) {
      final x = size.width * (i * 0.14 - 0.05);
      final h = 50 + random.nextDouble() * 30;
      final treePath = Path()
        ..moveTo(x, size.height * 0.8)
        ..lineTo(x - 8, size.height * 0.8)
        ..lineTo(x - 3, size.height * 0.8 - h)
        ..lineTo(x + 3, size.height * 0.8 - h)
        ..lineTo(x + 8, size.height * 0.8)
        ..close();
      canvas.drawPath(treePath, Paint()..color = const Color(0xFF151D30).withOpacity(0.7 + random.nextDouble() * 0.2));
    }
    
    // Ground
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.78, size.width, size.height * 0.22),
      Paint()..color = const Color(0xFF101825),
    );
  }
  
  void _drawFeelingBackground(Canvas canvas, Size size, math.Random random) {
    // Golden hour warmth
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4A3030), Color(0xFF6A4540), Color(0xFFA06555), Color(0xFFD08570)],
        stops: [0.0, 0.35, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Soft clouds
    for (int i = 0; i < 3; i++) {
      final cx = size.width * (0.2 + i * 0.3);
      final cy = size.height * (0.12 + random.nextDouble() * 0.1);
      for (int j = 0; j < 4; j++) {
        canvas.drawOval(
          Rect.fromCenter(center: Offset(cx + (j - 1.5) * 15, cy), width: 25 + random.nextDouble() * 15, height: 12),
          Paint()..color = const Color(0xFFFFD0B0).withOpacity(0.25),
        );
      }
    }
    
    // Rolling hills
    final hill1 = Path()
      ..moveTo(0, size.height * 0.72)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.62, size.width * 0.6, size.height * 0.68)
      ..quadraticBezierTo(size.width * 0.8, size.height * 0.65, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(hill1, Paint()..color = const Color(0xFF3A5535).withOpacity(0.5));
    
    // Foreground garden
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.72, size.width, size.height * 0.28),
      Paint()..color = const Color(0xFF2A4030),
    );
    
    // Flowers
    for (int i = 0; i < 15; i++) {
      final fx = size.width * (0.05 + i * 0.065);
      final fy = size.height * (0.75 + random.nextDouble() * 0.15);
      final stemH = 15 + random.nextDouble() * 20;
      canvas.drawLine(Offset(fx, fy), Offset(fx, fy - stemH), Paint()..color = const Color(0xFF1A3020)..strokeWidth = 1.5);
      canvas.drawCircle(Offset(fx, fy - stemH), 4 + random.nextDouble() * 3, Paint()..color = accentColor.withOpacity(0.4 + random.nextDouble() * 0.3));
    }
  }
  
  void _drawErosBackground(Canvas canvas, Size size, math.Random random) {
    // Sunset passion
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2A1525), Color(0xFF5A2535), Color(0xFF8A3545), Color(0xFFBA5050)],
        stops: [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Warm ambient glow
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.6), width: size.width * 0.9, height: size.height * 0.7),
      Paint()..shader = RadialGradient(
        colors: [const Color(0xFFFF6030).withOpacity(0.2), const Color(0xFFFF4020).withOpacity(0.05), Colors.transparent],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.6), width: size.width * 0.9, height: size.height * 0.7)),
    );
    
    // Stone hearth base
    final hearthPath = Path()
      ..moveTo(size.width * 0.15, size.height)
      ..lineTo(size.width * 0.2, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.65, size.width * 0.8, size.height * 0.7)
      ..lineTo(size.width * 0.85, size.height)
      ..close();
    canvas.drawPath(hearthPath, Paint()..color = const Color(0xFF2A1A15));
    
    // Embers
    for (int i = 0; i < 12; i++) {
      final ex = size.width * (0.35 + random.nextDouble() * 0.3);
      final ey = size.height * (0.45 + random.nextDouble() * 0.25);
      canvas.drawCircle(Offset(ex, ey), 1 + random.nextDouble() * 2, Paint()..color = Color.lerp(const Color(0xFFFF6030), const Color(0xFFFFD080), random.nextDouble())!.withOpacity(0.5 + random.nextDouble() * 0.4));
    }
  }
  
  void _drawCompassBackground(Canvas canvas, Size size, math.Random random) {
    // Night sky
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0A1020), Color(0xFF152035), Color(0xFF1A2A45), Color(0xFF253550)],
        stops: [0.0, 0.4, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Stars
    for (int i = 0; i < 40; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.6;
      final sr = 0.5 + random.nextDouble() * 1.2;
      canvas.drawCircle(Offset(sx, sy), sr, Paint()..color = Colors.white.withOpacity(0.4 + random.nextDouble() * 0.5));
    }
    
    // North star
    final northStar = Offset(size.width * 0.5, size.height * 0.08);
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(northStar, 3 + i * 4.0, Paint()..color = Colors.white.withOpacity(0.1 - i * 0.02));
    }
    canvas.drawCircle(northStar, 3, Paint()..color = Colors.white);
    
    // Constellation lines
    final constPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.15)
      ..lineTo(size.width * 0.4, size.height * 0.22)
      ..lineTo(size.width * 0.5, size.height * 0.18)
      ..lineTo(size.width * 0.6, size.height * 0.25)
      ..lineTo(size.width * 0.7, size.height * 0.2);
    canvas.drawPath(constPath, Paint()..color = Colors.white.withOpacity(0.15)..strokeWidth = 1..style = PaintingStyle.stroke);
    
    // Horizon trees
    for (int i = 0; i < 12; i++) {
      final tx = size.width * (i * 0.09 - 0.02);
      final th = 20 + random.nextDouble() * 25;
      final treePath = Path()
        ..moveTo(tx, size.height * 0.75)
        ..lineTo(tx - 6, size.height * 0.75)
        ..lineTo(tx - 2, size.height * 0.75 - th)
        ..lineTo(tx + 2, size.height * 0.75 - th)
        ..lineTo(tx + 6, size.height * 0.75)
        ..close();
      canvas.drawPath(treePath, Paint()..color = const Color(0xFF0A1525));
    }
    
    // Ground
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25),
      Paint()..color = const Color(0xFF0A1520),
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Eyes overlay painter for psyche icons
class _PsycheEyesPainter extends CustomPainter {
  final String positionId;
  final Color accentColor;
  final Offset eyePosition;
  final double iconSize;
  
  _PsycheEyesPainter({
    required this.positionId,
    required this.accentColor,
    required this.eyePosition,
    required this.iconSize,
  });
  
  @override
  void paint(Canvas canvas, Size size) {
    // Calculate actual eye position
    final iconCenterX = size.width / 2;
    final iconCenterY = size.height / 2 - size.height * 0.05;
    final eyeX = iconCenterX + (eyePosition.dx - 0.5) * iconSize;
    final eyeY = iconCenterY + (eyePosition.dy - 0.5) * iconSize;
    
    // Get eye style
    final style = switch (positionId) {
      'ego' => EyeStyle.standard,
      'persona' => EyeStyle.standard,
      'shadow' => EyeStyle.mysterious,
      'feelingFunction' => EyeStyle.sleepy,
      'erosAxis' => EyeStyle.curious,
      'selfDirection' => EyeStyle.curious,
      _ => EyeStyle.standard,
    };
    
    drawPeekingEyesProportional(
      canvas,
      Offset(eyeX, eyeY),
      size.width,
      glowColor: accentColor,
      style: style,
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Vignette painter
class _VignettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    drawVignette(canvas, size, intensity: 0.25);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Static painter for psyche position cards
/// Uses simple, iconic shapes that are easy to draw and look great as shadows
/// Each position has a unique icon and thematic environment
class PsychePositionPainter extends CustomPainter {
  final String positionId;
  final String? characterName;
  final Color accentColor;
  final bool isDark;

  PsychePositionPainter({
    required this.positionId,
    this.characterName,
    String? iconicShape, // Kept for API compatibility but not used
    required this.accentColor,
    required this.isDark,
  });

  // POSITION -> ICON MAPPING (static, meaningful icons)
  // Crown = Ego (ruler of self)
  // Mask = Persona (social face)
  // Lantern = Shadow (illuminating hidden)
  // Heart = Feeling Function (emotions)
  // Flame = Eros Axis (passion/connection)
  // Compass = Self Direction (guidance)

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(positionId.hashCode);
    
    // Draw rich, thematic environment for each position
    switch (positionId) {
      case 'ego':
        _drawEgoScene(canvas, size, random);
        break;
      case 'persona':
        _drawPersonaScene(canvas, size, random);
        break;
      case 'shadow':
        _drawShadowScene(canvas, size, random);
        break;
      case 'feelingFunction':
        _drawFeelingScene(canvas, size, random);
        break;
      case 'erosAxis':
        _drawErosScene(canvas, size, random);
        break;
      case 'selfDirection':
        _drawSelfDirectionScene(canvas, size, random);
        break;
      default:
        _drawEgoScene(canvas, size, random);
    }
    
    // Vignette
    drawVignette(canvas, size, intensity: 0.25);
  }

  // ========== EGO: Crown on Mountain at Dawn ==========
  void _drawEgoScene(Canvas canvas, Size size, math.Random random) {
    // Dawn sky gradient
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A2540), Color(0xFF3A4565), Color(0xFFE8A060), Color(0xFFFFD0A0)],
        stops: [0.0, 0.35, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Rising sun
    final sunY = size.height * 0.55;
    for (int i = 8; i >= 0; i--) {
      canvas.drawCircle(
        Offset(size.width * 0.5, sunY),
        25 + i * 12.0,
        Paint()..color = const Color(0xFFFFD080).withOpacity(0.1 - i * 0.01),
      );
    }
    canvas.drawCircle(Offset(size.width * 0.5, sunY), 20, Paint()..color = const Color(0xFFFFE8C0));
    
    // Distant mountains
    final mtn1 = Path()
      ..moveTo(0, size.height * 0.65)
      ..lineTo(size.width * 0.25, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.55)
      ..lineTo(size.width * 0.75, size.height * 0.35)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(mtn1, Paint()..color = const Color(0xFF2A3A50).withOpacity(0.5));
    
    // Foreground mountain peak
    final peak = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..lineTo(size.width * 0.5, size.height * 0.45)
      ..lineTo(size.width * 0.8, size.height)
      ..close();
    canvas.drawPath(peak, Paint()..color = const Color(0xFF1A2535));
    
    // Crown icon on peak
    final crownCenter = Offset(size.width * 0.5, size.height * 0.38);
    final eyePos = _drawCrownIcon(canvas, crownCenter, size.width * 0.28);
    
    // Eyes
    drawPeekingEyesProportional(canvas, eyePos, size.width, glowColor: accentColor, style: EyeStyle.standard);
  }

  // ========== PERSONA: Mask with Theatrical Setting ==========
  void _drawPersonaScene(Canvas canvas, Size size, math.Random random) {
    // Morning stage lighting
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2A1A35), Color(0xFF4A2A55), Color(0xFF6A4070), Color(0xFF8A5590)],
        stops: [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Spotlight from above
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.4), width: size.width * 0.7, height: size.height * 0.5),
      Paint()..shader = RadialGradient(
        colors: [Colors.white.withOpacity(0.15), Colors.transparent],
      ).createShader(Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.4), width: size.width * 0.7, height: size.height * 0.5)),
    );
    
    // Stage curtains left
    final curtainL = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width * 0.15, size.height * 0.3, size.width * 0.08, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(curtainL, Paint()..color = const Color(0xFF8B0000).withOpacity(0.7));
    
    // Stage curtains right
    final curtainR = Path()
      ..moveTo(size.width, 0)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.3, size.width * 0.92, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(curtainR, Paint()..color = const Color(0xFF8B0000).withOpacity(0.7));
    
    // Stage floor
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25),
      Paint()..color = const Color(0xFF1A0A15),
    );
    
    // Mask icon
    final maskCenter = Offset(size.width * 0.5, size.height * 0.42);
    final eyePos = _drawMaskIcon(canvas, maskCenter, size.width * 0.3);
    
    // Eyes
    drawPeekingEyesProportional(canvas, eyePos, size.width, glowColor: accentColor, style: EyeStyle.standard);
  }

  // ========== SHADOW: Lantern in Misty Forest ==========
  void _drawShadowScene(Canvas canvas, Size size, math.Random random) {
    // Dusk twilight
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1A2545), Color(0xFF2A3A60), Color(0xFF3A4A70), Color(0xFF4A5A80)],
        stops: [0.0, 0.4, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Mist layers
    for (int i = 0; i < 5; i++) {
      final y = size.height * (0.3 + i * 0.12);
      canvas.drawRect(
        Rect.fromLTWH(0, y, size.width, size.height * 0.18),
        Paint()..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.08 - i * 0.012), Colors.transparent],
        ).createShader(Rect.fromLTWH(0, y, size.width, size.height * 0.18)),
      );
    }
    
    // Dark trees silhouettes
    for (int i = 0; i < 8; i++) {
      final x = size.width * (i * 0.14 - 0.05);
      final h = 50 + random.nextDouble() * 30;
      final treePath = Path()
        ..moveTo(x, size.height * 0.8)
        ..lineTo(x - 8, size.height * 0.8)
        ..lineTo(x - 3, size.height * 0.8 - h)
        ..lineTo(x + 3, size.height * 0.8 - h)
        ..lineTo(x + 8, size.height * 0.8)
        ..close();
      canvas.drawPath(treePath, Paint()..color = const Color(0xFF151D30).withOpacity(0.7 + random.nextDouble() * 0.2));
    }
    
    // Ground
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.78, size.width, size.height * 0.22),
      Paint()..color = const Color(0xFF101825),
    );
    
    // Foggy path suggestion
    final pathLine = Path()
      ..moveTo(size.width * 0.3, size.height)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.7, size.width * 0.55, size.height * 0.5);
    canvas.drawPath(pathLine, Paint()..color = const Color(0xFF3A4A60).withOpacity(0.3)..strokeWidth = 20..style = PaintingStyle.stroke);
    
    // Lantern icon with glow
    final lanternCenter = Offset(size.width * 0.5, size.height * 0.4);
    final eyePos = _drawLanternIcon(canvas, lanternCenter, size.width * 0.22);
    
    // Eyes
    drawPeekingEyesProportional(canvas, eyePos, size.width, glowColor: const Color(0xFFFFAA40), style: EyeStyle.mysterious);
  }

  // ========== FEELING FUNCTION: Heart in Garden ==========
  void _drawFeelingScene(Canvas canvas, Size size, math.Random random) {
    // Golden hour warmth
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF4A3030), Color(0xFF6A4540), Color(0xFFA06555), Color(0xFFD08570)],
        stops: [0.0, 0.35, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Soft clouds
    for (int i = 0; i < 3; i++) {
      final cx = size.width * (0.2 + i * 0.3);
      final cy = size.height * (0.12 + random.nextDouble() * 0.1);
      for (int j = 0; j < 4; j++) {
        canvas.drawOval(
          Rect.fromCenter(center: Offset(cx + (j - 1.5) * 15, cy), width: 25 + random.nextDouble() * 15, height: 12),
          Paint()..color = const Color(0xFFFFD0B0).withOpacity(0.25),
        );
      }
    }
    
    // Rolling hills
    final hill1 = Path()
      ..moveTo(0, size.height * 0.72)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.62, size.width * 0.6, size.height * 0.68)
      ..quadraticBezierTo(size.width * 0.8, size.height * 0.65, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(hill1, Paint()..color = const Color(0xFF3A5535).withOpacity(0.5));
    
    // Foreground garden
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.72, size.width, size.height * 0.28),
      Paint()..color = const Color(0xFF2A4030),
    );
    
    // Flowers
    for (int i = 0; i < 15; i++) {
      final fx = size.width * (0.05 + i * 0.065);
      final fy = size.height * (0.75 + random.nextDouble() * 0.15);
      final stemH = 15 + random.nextDouble() * 20;
      // Stem
      canvas.drawLine(Offset(fx, fy), Offset(fx, fy - stemH), Paint()..color = const Color(0xFF1A3020)..strokeWidth = 1.5);
      // Flower
      canvas.drawCircle(Offset(fx, fy - stemH), 4 + random.nextDouble() * 3, Paint()..color = accentColor.withOpacity(0.4 + random.nextDouble() * 0.3));
    }
    
    // Heart icon
    final heartCenter = Offset(size.width * 0.5, size.height * 0.4);
    final eyePos = _drawHeartIcon(canvas, heartCenter, size.width * 0.26);
    
    // Eyes
    drawPeekingEyesProportional(canvas, eyePos, size.width, glowColor: accentColor, style: EyeStyle.sleepy);
  }

  // ========== EROS AXIS: Flame with Warm Hearth ==========
  void _drawErosScene(Canvas canvas, Size size, math.Random random) {
    // Sunset passion
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2A1525), Color(0xFF5A2535), Color(0xFF8A3545), Color(0xFFBA5050)],
        stops: [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Warm ambient glow
    canvas.drawOval(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.6), width: size.width * 0.9, height: size.height * 0.7),
      Paint()..shader = RadialGradient(
        colors: [const Color(0xFFFF6030).withOpacity(0.2), const Color(0xFFFF4020).withOpacity(0.05), Colors.transparent],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.6), width: size.width * 0.9, height: size.height * 0.7)),
    );
    
    // Stone hearth base
    final hearthPath = Path()
      ..moveTo(size.width * 0.15, size.height)
      ..lineTo(size.width * 0.2, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.65, size.width * 0.8, size.height * 0.7)
      ..lineTo(size.width * 0.85, size.height)
      ..close();
    canvas.drawPath(hearthPath, Paint()..color = const Color(0xFF2A1A15));
    
    // Embers/sparks
    for (int i = 0; i < 12; i++) {
      final ex = size.width * (0.35 + random.nextDouble() * 0.3);
      final ey = size.height * (0.45 + random.nextDouble() * 0.25);
      canvas.drawCircle(Offset(ex, ey), 1 + random.nextDouble() * 2, Paint()..color = Color.lerp(const Color(0xFFFF6030), const Color(0xFFFFD080), random.nextDouble())!.withOpacity(0.5 + random.nextDouble() * 0.4));
    }
    
    // Flame icon
    final flameCenter = Offset(size.width * 0.5, size.height * 0.4);
    final eyePos = _drawFlameIcon(canvas, flameCenter, size.width * 0.24);
    
    // Eyes
    drawPeekingEyesProportional(canvas, eyePos, size.width, glowColor: const Color(0xFFFF8040), style: EyeStyle.curious);
  }

  // ========== SELF DIRECTION: Compass under Stars ==========
  void _drawSelfDirectionScene(Canvas canvas, Size size, math.Random random) {
    // Night sky
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF0A1020), Color(0xFF152035), Color(0xFF1A2A45), Color(0xFF253550)],
        stops: [0.0, 0.4, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    
    // Stars
    for (int i = 0; i < 40; i++) {
      final sx = random.nextDouble() * size.width;
      final sy = random.nextDouble() * size.height * 0.6;
      final sr = 0.5 + random.nextDouble() * 1.2;
      canvas.drawCircle(Offset(sx, sy), sr, Paint()..color = Colors.white.withOpacity(0.4 + random.nextDouble() * 0.5));
    }
    
    // North star (brighter)
    final northStar = Offset(size.width * 0.5, size.height * 0.08);
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(northStar, 3 + i * 4.0, Paint()..color = Colors.white.withOpacity(0.1 - i * 0.02));
    }
    canvas.drawCircle(northStar, 3, Paint()..color = Colors.white);
    
    // Constellation lines suggestion
    final constPath = Path()
      ..moveTo(size.width * 0.3, size.height * 0.15)
      ..lineTo(size.width * 0.4, size.height * 0.22)
      ..lineTo(size.width * 0.5, size.height * 0.18)
      ..lineTo(size.width * 0.6, size.height * 0.25)
      ..lineTo(size.width * 0.7, size.height * 0.2);
    canvas.drawPath(constPath, Paint()..color = Colors.white.withOpacity(0.15)..strokeWidth = 1..style = PaintingStyle.stroke);
    
    // Horizon tree line
    for (int i = 0; i < 12; i++) {
      final tx = size.width * (i * 0.09 - 0.02);
      final th = 20 + random.nextDouble() * 25;
      final treePath = Path()
        ..moveTo(tx, size.height * 0.75)
        ..lineTo(tx - 6, size.height * 0.75)
        ..lineTo(tx - 2, size.height * 0.75 - th)
        ..lineTo(tx + 2, size.height * 0.75 - th)
        ..lineTo(tx + 6, size.height * 0.75)
        ..close();
      canvas.drawPath(treePath, Paint()..color = const Color(0xFF0A1525));
    }
    
    // Ground
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.75, size.width, size.height * 0.25),
      Paint()..color = const Color(0xFF0A1520),
    );
    
    // Compass icon
    final compassCenter = Offset(size.width * 0.5, size.height * 0.45);
    final eyePos = _drawCompassIcon(canvas, compassCenter, size.width * 0.26);
    
    // Eyes
    drawPeekingEyesProportional(canvas, eyePos, size.width, glowColor: accentColor, style: EyeStyle.curious);
  }

  // ========== ICON DRAWING METHODS ==========
  
  Offset _drawCrownIcon(Canvas canvas, Offset center, double s) {
    const shadowColor = Color(0xFF0A0A15);
    
    final path = Path();
    // Crown base
    path.moveTo(center.dx - s * 0.4, center.dy + s * 0.25);
    path.lineTo(center.dx - s * 0.35, center.dy - s * 0.05);
    // Left point
    path.lineTo(center.dx - s * 0.25, center.dy - s * 0.35);
    path.lineTo(center.dx - s * 0.15, center.dy - s * 0.1);
    // Center point (tallest)
    path.lineTo(center.dx, center.dy - s * 0.45);
    path.lineTo(center.dx + s * 0.15, center.dy - s * 0.1);
    // Right point
    path.lineTo(center.dx + s * 0.25, center.dy - s * 0.35);
    path.lineTo(center.dx + s * 0.35, center.dy - s * 0.05);
    path.lineTo(center.dx + s * 0.4, center.dy + s * 0.25);
    // Base band
    path.lineTo(center.dx + s * 0.38, center.dy + s * 0.35);
    path.lineTo(center.dx - s * 0.38, center.dy + s * 0.35);
    path.close();
    
    // Glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawPath(path, Paint()..color = accentColor.withOpacity(0.04 - i * 0.006)..maskFilter = MaskFilter.blur(BlurStyle.normal, 6.0 + i * 2));
    }
    canvas.drawPath(path, Paint()..color = shadowColor);
    
    // Eye position in crown band area
    return Offset(center.dx, center.dy + s * 0.15);
  }

  Offset _drawMaskIcon(Canvas canvas, Offset center, double s) {
    const shadowColor = Color(0xFF0A0A15);
    
    final path = Path();
    // Mask outline - theatrical comedy/drama style
    path.moveTo(center.dx, center.dy - s * 0.4);
    // Right side
    path.quadraticBezierTo(center.dx + s * 0.45, center.dy - s * 0.35, center.dx + s * 0.45, center.dy);
    path.quadraticBezierTo(center.dx + s * 0.42, center.dy + s * 0.25, center.dx + s * 0.25, center.dy + s * 0.38);
    // Chin
    path.quadraticBezierTo(center.dx, center.dy + s * 0.45, center.dx - s * 0.25, center.dy + s * 0.38);
    // Left side
    path.quadraticBezierTo(center.dx - s * 0.42, center.dy + s * 0.25, center.dx - s * 0.45, center.dy);
    path.quadraticBezierTo(center.dx - s * 0.45, center.dy - s * 0.35, center.dx, center.dy - s * 0.4);
    path.close();
    
    // Eye holes (cutouts represented by lighter areas - but we'll draw eyes there)
    
    // Glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawPath(path, Paint()..color = accentColor.withOpacity(0.04 - i * 0.006)..maskFilter = MaskFilter.blur(BlurStyle.normal, 6.0 + i * 2));
    }
    canvas.drawPath(path, Paint()..color = shadowColor);
    
    // Eye position - in the eye hole area of mask
    return Offset(center.dx, center.dy - s * 0.08);
  }

  Offset _drawLanternIcon(Canvas canvas, Offset center, double s) {
    const shadowColor = Color(0xFF0A0A15);
    
    // Lantern glow first (behind)
    canvas.drawOval(
      Rect.fromCenter(center: center, width: s * 1.2, height: s * 1.0),
      Paint()..shader = RadialGradient(
        colors: [const Color(0xFFFFAA40).withOpacity(0.3), const Color(0xFFFF8020).withOpacity(0.1), Colors.transparent],
        stops: const [0.0, 0.4, 1.0],
      ).createShader(Rect.fromCenter(center: center, width: s * 1.2, height: s * 1.0)),
    );
    
    final path = Path();
    // Top cap
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(center.dx, center.dy - s * 0.38), width: s * 0.35, height: s * 0.1),
      const Radius.circular(3),
    ));
    // Handle
    path.moveTo(center.dx - s * 0.08, center.dy - s * 0.42);
    path.quadraticBezierTo(center.dx, center.dy - s * 0.55, center.dx + s * 0.08, center.dy - s * 0.42);
    path.lineTo(center.dx + s * 0.05, center.dy - s * 0.42);
    path.quadraticBezierTo(center.dx, center.dy - s * 0.5, center.dx - s * 0.05, center.dy - s * 0.42);
    path.close();
    // Body (glass area)
    path.moveTo(center.dx - s * 0.25, center.dy - s * 0.32);
    path.lineTo(center.dx - s * 0.22, center.dy + s * 0.25);
    path.quadraticBezierTo(center.dx, center.dy + s * 0.35, center.dx + s * 0.22, center.dy + s * 0.25);
    path.lineTo(center.dx + s * 0.25, center.dy - s * 0.32);
    path.close();
    // Base
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(center.dx, center.dy + s * 0.38), width: s * 0.3, height: s * 0.08),
      const Radius.circular(2),
    ));
    
    // Glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawPath(path, Paint()..color = const Color(0xFFFFAA40).withOpacity(0.05 - i * 0.007)..maskFilter = MaskFilter.blur(BlurStyle.normal, 6.0 + i * 2));
    }
    canvas.drawPath(path, Paint()..color = shadowColor);
    
    // Eye position - in the glass body
    return Offset(center.dx, center.dy);
  }

  Offset _drawHeartIcon(Canvas canvas, Offset center, double s) {
    const shadowColor = Color(0xFF0A0A15);
    
    final path = Path();
    // Heart shape
    path.moveTo(center.dx, center.dy + s * 0.35);
    // Left curve
    path.cubicTo(
      center.dx - s * 0.5, center.dy + s * 0.1,
      center.dx - s * 0.5, center.dy - s * 0.25,
      center.dx - s * 0.25, center.dy - s * 0.35,
    );
    // Left top lobe
    path.quadraticBezierTo(center.dx - s * 0.1, center.dy - s * 0.45, center.dx, center.dy - s * 0.25);
    // Right top lobe
    path.quadraticBezierTo(center.dx + s * 0.1, center.dy - s * 0.45, center.dx + s * 0.25, center.dy - s * 0.35);
    // Right curve
    path.cubicTo(
      center.dx + s * 0.5, center.dy - s * 0.25,
      center.dx + s * 0.5, center.dy + s * 0.1,
      center.dx, center.dy + s * 0.35,
    );
    path.close();
    
    // Glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawPath(path, Paint()..color = accentColor.withOpacity(0.04 - i * 0.006)..maskFilter = MaskFilter.blur(BlurStyle.normal, 6.0 + i * 2));
    }
    canvas.drawPath(path, Paint()..color = shadowColor);
    
    // Eye position - upper center of heart
    return Offset(center.dx, center.dy - s * 0.15);
  }

  Offset _drawFlameIcon(Canvas canvas, Offset center, double s) {
    const shadowColor = Color(0xFF0A0A15);
    
    // Outer glow
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx, center.dy + s * 0.1), width: s * 1.0, height: s * 1.2),
      Paint()..shader = RadialGradient(
        colors: [const Color(0xFFFF6030).withOpacity(0.25), const Color(0xFFFF4020).withOpacity(0.08), Colors.transparent],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromCenter(center: Offset(center.dx, center.dy + s * 0.1), width: s * 1.0, height: s * 1.2)),
    );
    
    final path = Path();
    // Flame shape - organic, flickering
    path.moveTo(center.dx, center.dy + s * 0.45);
    // Right base
    path.quadraticBezierTo(center.dx + s * 0.15, center.dy + s * 0.35, center.dx + s * 0.28, center.dy + s * 0.15);
    // Right flicker
    path.quadraticBezierTo(center.dx + s * 0.35, center.dy - s * 0.1, center.dx + s * 0.22, center.dy - s * 0.25);
    // Right to tip
    path.quadraticBezierTo(center.dx + s * 0.15, center.dy - s * 0.35, center.dx + s * 0.08, center.dy - s * 0.42);
    // Tip
    path.quadraticBezierTo(center.dx, center.dy - s * 0.55, center.dx - s * 0.08, center.dy - s * 0.42);
    // Left side
    path.quadraticBezierTo(center.dx - s * 0.15, center.dy - s * 0.35, center.dx - s * 0.22, center.dy - s * 0.25);
    path.quadraticBezierTo(center.dx - s * 0.35, center.dy - s * 0.1, center.dx - s * 0.28, center.dy + s * 0.15);
    path.quadraticBezierTo(center.dx - s * 0.15, center.dy + s * 0.35, center.dx, center.dy + s * 0.45);
    path.close();
    
    // Glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawPath(path, Paint()..color = const Color(0xFFFF6030).withOpacity(0.06 - i * 0.008)..maskFilter = MaskFilter.blur(BlurStyle.normal, 6.0 + i * 2));
    }
    canvas.drawPath(path, Paint()..color = shadowColor);
    
    // Eye position - center of flame
    return Offset(center.dx, center.dy - s * 0.05);
  }

  Offset _drawCompassIcon(Canvas canvas, Offset center, double s) {
    const shadowColor = Color(0xFF0A0A15);
    
    final path = Path();
    // Outer circle
    path.addOval(Rect.fromCircle(center: center, radius: s * 0.42));
    // Inner circle
    path.addOval(Rect.fromCircle(center: center, radius: s * 0.35));
    
    // Cardinal points
    // North arrow (prominent)
    path.moveTo(center.dx, center.dy - s * 0.32);
    path.lineTo(center.dx + s * 0.08, center.dy - s * 0.08);
    path.lineTo(center.dx, center.dy - s * 0.15);
    path.lineTo(center.dx - s * 0.08, center.dy - s * 0.08);
    path.close();
    
    // South
    path.moveTo(center.dx, center.dy + s * 0.32);
    path.lineTo(center.dx + s * 0.06, center.dy + s * 0.1);
    path.lineTo(center.dx - s * 0.06, center.dy + s * 0.1);
    path.close();
    
    // East
    path.moveTo(center.dx + s * 0.32, center.dy);
    path.lineTo(center.dx + s * 0.1, center.dy + s * 0.06);
    path.lineTo(center.dx + s * 0.1, center.dy - s * 0.06);
    path.close();
    
    // West
    path.moveTo(center.dx - s * 0.32, center.dy);
    path.lineTo(center.dx - s * 0.1, center.dy + s * 0.06);
    path.lineTo(center.dx - s * 0.1, center.dy - s * 0.06);
    path.close();
    
    // Center pivot
    path.addOval(Rect.fromCircle(center: center, radius: s * 0.06));
    
    // Glow
    for (int i = 5; i >= 0; i--) {
      canvas.drawPath(path, Paint()..color = accentColor.withOpacity(0.04 - i * 0.006)..maskFilter = MaskFilter.blur(BlurStyle.normal, 6.0 + i * 2));
    }
    canvas.drawPath(path, Paint()..color = shadowColor);
    
    // Eye position - center
    return Offset(center.dx, center.dy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OrbitEntryData {
  final String triggerName;
  final List<String> triggerTags;
  final List<String> characters;
  final String? pattern;
  final String? costRisk;
  final String? stabilizer;

  OrbitEntryData({
    required this.triggerName,
    this.triggerTags = const [],
    this.characters = const [],
    this.pattern,
    this.costRisk,
    this.stabilizer,
  });
}

/// Data class for compensation entry display
class CompensationEntryData {
  final String name;
  final String? when;
  final List<String> expression;
  final String? risk;
  final String? returnPath;
  final List<String> characters;

  CompensationEntryData({
    required this.name,
    this.when,
    this.expression = const [],
    this.risk,
    this.returnPath,
    this.characters = const [],
  });
}

/// Detail view for psyche position cards - follows 3-tab pattern
class PsychePositionDetailView extends StatefulWidget {
  final PsychePositionConfig config;
  final String? characterName;
  final String content;
  final List<dynamic> examples;
  final double? confidence;
  final List<OrbitEntryData> orbitEntries;
  final List<CompensationEntryData> compensationEntries;

  const PsychePositionDetailView({
    super.key,
    required this.config,
    this.characterName,
    required this.content,
    required this.examples,
    this.confidence,
    this.orbitEntries = const [],
    this.compensationEntries = const [],
  });

  @override
  State<PsychePositionDetailView> createState() => _PsychePositionDetailViewState();
}

class _PsychePositionDetailViewState extends State<PsychePositionDetailView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF1A1225) : Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Header with illustration
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: PsychePositionPainter(
                        positionId: widget.config.id,
                        characterName: widget.characterName,
                        accentColor: widget.config.accentColor,
                        isDark: isDark,
                      ),
                      size: Size.infinite,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: 12,
                    left: 12,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.close, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                  // Title and character
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.characterName != null && widget.characterName!.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: widget.config.accentColor.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              widget.characterName!,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        Text(
                          widget.config.title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(offset: const Offset(1, 1), blurRadius: 4, color: Colors.black.withOpacity(0.5))],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // TabBar - 3 tabs
            Container(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: widget.config.accentColor,
                indicatorWeight: 3,
                labelColor: widget.config.accentColor,
                unselectedLabelColor: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                labelStyle: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.psychology, size: 18), SizedBox(width: 6), Text('About')])),
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.visibility, size: 18), SizedBox(width: 6), Text('In Your Life')])),
                  Tab(child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.movie_outlined, size: 18), SizedBox(width: 6), Text('Examples')])),
                ],
              ),
            ),
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAboutTab(context, isDark),
                  _buildInYourLifeTab(context, isDark),
                  _buildExamplesTab(context, isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.config.accentColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(widget.config.icon, color: widget.config.accentColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'What is ${widget.config.title}?',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.config.infoText,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.7,
                    fontSize: 16,
                    color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.config.accentColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: widget.config.accentColor.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: widget.config.accentColor, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _getExtendedDescription(),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark ? Colors.white.withOpacity(0.8) : Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInYourLifeTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Main content section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF2D1F42) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.config.accentColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.person_outline, color: widget.config.accentColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'How This Shows Up For You',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.characterName != null && widget.characterName!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: widget.config.accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.movie, size: 16, color: widget.config.accentColor),
                        const SizedBox(width: 8),
                        Text(
                          'Embodied by: ${widget.characterName}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: widget.config.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Text(
                  widget.content,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.8,
                    fontSize: 16,
                    color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Character Shifts (Orbit) section
          if (widget.orbitEntries.isNotEmpty) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF2D1F42) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.amber.withOpacity(0.3)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.sync_alt, color: Colors.amber, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'When You Shift Character',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Under certain triggers, you may shift from your center position to a different character mode:',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? Colors.white.withOpacity(0.7) : Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...widget.orbitEntries.map((orbit) => _buildOrbitCard(context, orbit, isDark)),
                ],
              ),
            ),
          ],

          // Compensation section
          if (widget.compensationEntries.isNotEmpty) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF2D1F42) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.08), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Compensation Patterns',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'When off balance, you may compensate in these ways:',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? Colors.white.withOpacity(0.7) : Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...widget.compensationEntries.map((comp) => _buildCompensationCard(context, comp, isDark)),
                ],
              ),
            ),
          ],
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildOrbitCard(BuildContext context, OrbitEntryData orbit, bool isDark) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF352540) : Colors.amber.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trigger
          Row(
            children: [
              Icon(Icons.flash_on, size: 18, color: Colors.amber),
              const SizedBox(width: 8),
              Text(
                'Trigger: ${orbit.triggerName}',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          if (orbit.triggerTags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: orbit.triggerTags.map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(tag, style: theme.textTheme.labelSmall?.copyWith(color: Colors.amber)),
              )).toList(),
            ),
          ],
          // Shift to characters
          if (orbit.characters.isNotEmpty) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.arrow_forward, size: 16, color: isDark ? Colors.white54 : Colors.black45),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Shifts to: ${orbit.characters.join(", ")}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ],
          // Pattern
          if (orbit.pattern != null && orbit.pattern!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              orbit.pattern!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark ? Colors.white.withOpacity(0.8) : Colors.black87,
                height: 1.5,
              ),
            ),
          ],
          // Cost/Risk
          if (orbit.costRisk != null && orbit.costRisk!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline, size: 16, color: Colors.red.shade300),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Risk: ${orbit.costRisk}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.red.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          // Stabilizer
          if (orbit.stabilizer != null && orbit.stabilizer!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.healing, size: 16, color: Colors.green.shade300),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Stabilizer: ${orbit.stabilizer}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCompensationCard(BuildContext context, CompensationEntryData comp, bool isDark) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF402535) : Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            comp.name,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.red.shade400,
            ),
          ),
          // When
          if (comp.when != null && comp.when!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.schedule, size: 14, color: isDark ? Colors.white54 : Colors.black45),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'When: ${comp.when}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark ? Colors.white70 : Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
          // Expression
          if (comp.expression.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...comp.expression.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(color: isDark ? Colors.white70 : Colors.black54)),
                  Expanded(
                    child: Text(
                      e,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDark ? Colors.white.withOpacity(0.8) : Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
          // Characters
          if (comp.characters.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: comp.characters.map((c) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: widget.config.accentColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(c, style: theme.textTheme.labelSmall?.copyWith(color: widget.config.accentColor)),
              )).toList(),
            ),
          ],
          // Risk
          if (comp.risk != null && comp.risk!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning, size: 14, color: Colors.orange.shade300),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      comp.risk!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.orange.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          // Return path
          if (comp.returnPath != null && comp.returnPath!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.undo, size: 14, color: Colors.green.shade300),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Return path: ${comp.returnPath}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildExamplesTab(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    if (widget.examples.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_outlined, size: 64, color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No examples available',
              style: theme.textTheme.titleMedium?.copyWith(color: isDark ? Colors.grey.shade400 : Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Text(
              'Pop culture examples will appear here',
              style: theme.textTheme.bodySmall?.copyWith(color: isDark ? Colors.grey.shade500 : Colors.grey.shade500),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.examples.length,
      itemBuilder: (context, index) {
        final example = widget.examples[index];
        final character = example is Map ? (example['character'] ?? example['name'] ?? 'Character') : 'Character';
        final description = example is Map ? (example['description'] ?? example['text'] ?? example.toString()) : example.toString();
        final franchise = example is Map ? (example['franchise'] ?? '') : '';
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2D1F42) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: widget.config.accentColor.withOpacity(0.3)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.2 : 0.05), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.config.accentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.person, size: 20, color: widget.config.accentColor),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(character.toString(), style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
                        if (franchise.isNotEmpty)
                          Text(franchise.toString(), style: theme.textTheme.bodySmall?.copyWith(color: widget.config.accentColor.withOpacity(0.8))),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(description.toString(), style: theme.textTheme.bodyMedium?.copyWith(height: 1.6, color: isDark ? Colors.white.withOpacity(0.8) : Colors.black87)),
            ],
          ),
        );
      },
    );
  }

  String _getExtendedDescription() {
    switch (widget.config.id) {
      case 'ego':
        return 'In Jungian psychology, the Ego is the center of consciousness. It\'s the "I" that navigates daily life, makes decisions, and maintains your sense of identity. The character who embodies your Ego represents the traits you most identify with.';
      case 'persona':
        return 'The Persona is the social mask you wear in different contexts. It\'s not fake - it\'s an adaptive interface between your inner world and society. Your Persona character shows how you\'ve learned to present yourself for acceptance and success.';
      case 'shadow':
        return 'The Shadow contains everything you\'ve rejected, suppressed, or denied about yourself. It\'s not evil - it\'s simply unconscious. Your Shadow character may represent traits you judge harshly, but also holds untapped potential and energy.';
      case 'feelingFunction':
        return 'This represents your inner opposite - the Anima (for men) or Animus (for women). It\'s the bridge to your unconscious and often appears in dreams and projections. This character embodies qualities you need to integrate for wholeness.';
      case 'erosAxis':
        return 'The Eros Axis represents your life force, passion, and what makes you feel most alive. It\'s connected to creativity, vitality, and deep engagement with life. This character embodies your capacity for love, connection, and meaning.';
      case 'selfDirection':
        return 'This position represents the direction of your psychological growth - where your Self is guiding you. It often manifests through meaningful coincidences, dreams, and a sense of destiny or calling.';
      default:
        return 'This represents an important aspect of your psychological structure.';
    }
  }
}
