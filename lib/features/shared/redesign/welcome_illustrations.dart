import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Welcome screen - TWO SLEEPING SHADOW CREATURES with SLEEPY PEEKING EYES
/// Follows the new design standard: shadow silhouettes with glowing eyes
/// Even sleeping creatures have that signature glow - just dimmer/half-closed

class WelcomeScenePainter extends CustomPainter {
  final bool isDark;

  WelcomeScenePainter({this.isDark = true});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);

    // === LAYER 1: Deep mystical night sky gradient ===
    final skyGradient = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color(0xFF050510), // Near black
          Color(0xFF0D1B2A), // Deep navy
          Color(0xFF1B2838), // Dark blue
          Color(0xFF243B53), // Slightly lighter
        ],
        stops: const [0.0, 0.25, 0.55, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyGradient);

    // === LAYER 2: Subtle aurora/nebula glow ===
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.2),
      size.width * 0.35,
      Paint()..shader = RadialGradient(
        colors: [const Color(0xFF667EEA).withOpacity(0.1), Colors.transparent],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.7, size.height * 0.2), radius: size.width * 0.35)),
    );
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.35),
      size.width * 0.3,
      Paint()..shader = RadialGradient(
        colors: [const Color(0xFF9AE6B4).withOpacity(0.08), Colors.transparent],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.2, size.height * 0.35), radius: size.width * 0.3)),
    );

    // === LAYER 3: Stars (varying sizes and brightness) ===
    for (int i = 0; i < 70; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.7;
      final radius = random.nextDouble() * 1.5 + 0.3;
      final opacity = random.nextDouble() * 0.6 + 0.2;
      
      // Some stars have a subtle glow
      if (i % 8 == 0) {
        canvas.drawCircle(Offset(x, y), radius * 3.5, Paint()..color = Colors.white.withOpacity(opacity * 0.25));
      }
      canvas.drawCircle(Offset(x, y), radius, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 4: Crescent Moon with enhanced glow ===
    final moonCenter = Offset(size.width * 0.22, size.height * 0.08);
    for (int i = 5; i >= 0; i--) {
      canvas.drawCircle(moonCenter, 32 + i * 12, Paint()..color = const Color(0xFFFFFFF0).withOpacity(0.07 - i * 0.01));
    }
    canvas.drawCircle(moonCenter, 28, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(moonCenter.dx + 12, moonCenter.dy - 5), 22, Paint()..color = const Color(0xFF050510));

    // === LAYER 5: Soft clouds ===
    _drawCloud(canvas, Offset(size.width * 0.05, size.height * 0.12), 42, const Color(0xFF4A5568).withOpacity(0.22));
    _drawCloud(canvas, Offset(size.width * 0.88, size.height * 0.18), 38, const Color(0xFF4A5568).withOpacity(0.18));
    _drawCloud(canvas, Offset(size.width * 0.65, size.height * 0.07), 28, const Color(0xFF4A5568).withOpacity(0.14));
    _drawCloud(canvas, Offset(size.width * 0.4, size.height * 0.22), 32, const Color(0xFF4A5568).withOpacity(0.16));

    // === LAYER 6: Tree/Branch (shadow style) ===
    final branchY = size.height * 0.58;
    
    // Main branch - thicker, more prominent
    final branchPath = Path();
    branchPath.moveTo(-20, branchY + 25);
    branchPath.quadraticBezierTo(size.width * 0.15, branchY - 10, size.width * 0.35, branchY + 5);
    branchPath.quadraticBezierTo(size.width * 0.55, branchY + 15, size.width * 0.75, branchY);
    branchPath.quadraticBezierTo(size.width * 0.9, branchY - 10, size.width + 20, branchY - 15);
    canvas.drawPath(branchPath, Paint()..color = const Color(0xFF0A0508)..style = PaintingStyle.stroke..strokeWidth = 12..strokeCap = StrokeCap.round);
    
    // Secondary branches
    canvas.drawLine(Offset(size.width * 0.2, branchY - 5), Offset(size.width * 0.12, branchY - 40), Paint()..color = const Color(0xFF0A0508)..strokeWidth = 6..strokeCap = StrokeCap.round);
    canvas.drawLine(Offset(size.width * 0.7, branchY + 5), Offset(size.width * 0.78, branchY + 35), Paint()..color = const Color(0xFF0A0508)..strokeWidth = 5..strokeCap = StrokeCap.round);

    // === LAYER 7: Leaves on branch (shadow style) ===
    _drawShadowLeaf(canvas, Offset(size.width * 0.08, branchY + 20), 14, const Color(0xFF0A0508), -0.3);
    _drawShadowLeaf(canvas, Offset(size.width * 0.15, branchY + 12), 12, const Color(0xFF0A0508), 0.2);
    _drawShadowLeaf(canvas, Offset(size.width * 0.1, branchY - 35), 13, const Color(0xFF0A0508), -0.5);
    _drawShadowLeaf(canvas, Offset(size.width * 0.75, branchY + 30), 12, const Color(0xFF0A0508), 0.4);
    _drawShadowLeaf(canvas, Offset(size.width * 0.82, branchY + 38), 11, const Color(0xFF0A0508), -0.2);
    _drawShadowLeaf(canvas, Offset(size.width * 0.88, branchY - 8), 13, const Color(0xFF0A0508), 0.3);
    _drawShadowLeaf(canvas, Offset(size.width * 0.28, branchY + 22), 12, const Color(0xFF0A0508), -0.4);
    _drawShadowLeaf(canvas, Offset(size.width * 0.95, branchY - 20), 14, const Color(0xFF0A0508), 0.1);

    // === LAYER 8: Two SLEEPING SHADOW CREATURES with SLEEPY PEEKING EYES ===
    // Left creature - Mint glow accent
    _drawSleepingShadowCreature(
      canvas,
      center: Offset(size.width * 0.35, branchY - 50),
      glowColor: const Color(0xFF9AE6B4), // Mint glow
      creatureSize: 55,
      facingRight: false,
    );
    
    // Right creature - Pink glow accent
    _drawSleepingShadowCreature(
      canvas,
      center: Offset(size.width * 0.6, branchY - 45),
      glowColor: const Color(0xFFFBB6CE), // Pink glow
      creatureSize: 50,
      facingRight: true,
    );

    // === LAYER 9: Zzz (golden, glowing) ===
    _drawGlowingZzz(canvas, Offset(size.width * 0.47, branchY - 115));

    // === LAYER 10: Floating sparkles/particles ===
    for (int i = 0; i < 18; i++) {
      final x = size.width * 0.15 + random.nextDouble() * size.width * 0.7;
      final y = size.height * 0.25 + random.nextDouble() * size.height * 0.4;
      final particleColor = [
        const Color(0xFF9AE6B4),
        const Color(0xFFFBB6CE),
        const Color(0xFFFBD38D),
        const Color(0xFF667EEA),
      ][i % 4].withOpacity(random.nextDouble() * 0.4 + 0.2);
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 2.5 + 0.8, Paint()..color = particleColor);
    }

    // === LAYER 11: Vignette for depth ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.45)],
        stops: const [0.45, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
  }

  void _drawCloud(Canvas canvas, Offset center, double size, Color color) {
    final paint = Paint()..color = color;
    canvas.drawCircle(center, size * 0.5, paint);
    canvas.drawCircle(Offset(center.dx - size * 0.35, center.dy + size * 0.1), size * 0.35, paint);
    canvas.drawCircle(Offset(center.dx + size * 0.4, center.dy + size * 0.05), size * 0.4, paint);
    canvas.drawCircle(Offset(center.dx + size * 0.15, center.dy + size * 0.15), size * 0.3, paint);
  }

  void _drawShadowLeaf(Canvas canvas, Offset center, double size, Color color, double rotation) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);
    
    final path = Path();
    path.moveTo(0, -size);
    path.quadraticBezierTo(size * 0.8, 0, 0, size);
    path.quadraticBezierTo(-size * 0.8, 0, 0, -size);
    canvas.drawPath(path, Paint()..color = color);
    
    canvas.restore();
  }

  /// Draw a sleeping shadow creature with sleepy peeking eyes
  void _drawSleepingShadowCreature(
    Canvas canvas, {
    required Offset center,
    required Color glowColor,
    required double creatureSize,
    required bool facingRight,
  }) {
    final direction = facingRight ? 1.0 : -1.0;
    
    // === Outer glow (accent color) ===
    for (int i = 4; i >= 0; i--) {
      _drawBirdSilhouette(canvas, center, creatureSize + i * 5, direction, 
        Paint()..color = glowColor.withOpacity(0.1 - i * 0.018)..style = PaintingStyle.stroke..strokeWidth = 3);
    }
    
    // === Solid shadow body ===
    _drawBirdSilhouette(canvas, center, creatureSize, direction, Paint()..color = const Color(0xFF0A0508));
    
    // === Sleeping cap (shadow) with slight glow ===
    final capPath = Path();
    final capBase = Offset(center.dx - direction * creatureSize * 0.05, center.dy - creatureSize * 0.35);
    capPath.moveTo(capBase.dx - creatureSize * 0.2, capBase.dy);
    capPath.quadraticBezierTo(
      capBase.dx - creatureSize * 0.05,
      capBase.dy - creatureSize * 0.3,
      capBase.dx + direction * creatureSize * 0.4,
      capBase.dy - creatureSize * 0.35,
    );
    capPath.lineTo(capBase.dx + direction * creatureSize * 0.35, capBase.dy - creatureSize * 0.15);
    capPath.quadraticBezierTo(
      capBase.dx + direction * creatureSize * 0.1,
      capBase.dy - creatureSize * 0.1,
      capBase.dx - creatureSize * 0.2,
      capBase.dy,
    );
    capPath.close();
    
    // Cap glow
    for (int i = 2; i >= 0; i--) {
      canvas.drawPath(capPath, Paint()..color = const Color(0xFFE53E3E).withOpacity(0.15 - i * 0.04)..style = PaintingStyle.stroke..strokeWidth = 3 + i * 2.0);
    }
    canvas.drawPath(capPath, Paint()..color = const Color(0xFF0A0508));
    
    // Pom pom (shadow with glow)
    final pomPos = Offset(capBase.dx + direction * creatureSize * 0.42, capBase.dy - creatureSize * 0.38);
    for (int i = 2; i >= 0; i--) {
      canvas.drawCircle(pomPos, creatureSize * 0.1 + i * 3, Paint()..color = const Color(0xFFFF6B35).withOpacity(0.12 - i * 0.03));
    }
    canvas.drawCircle(pomPos, creatureSize * 0.1, Paint()..color = const Color(0xFF0A0508));
    
    // === SLEEPY PEEKING EYES (half-closed, dimmer glow) ===
    final eyeY = center.dy - creatureSize * 0.15;
    final eyeX = center.dx - direction * creatureSize * 0.08;
    final eyeSpacing = creatureSize * 0.12;
    final eyeSize = creatureSize * 0.055;
    _drawSleepyPeekingEyes(canvas, eyeX, eyeY, eyeSpacing, eyeSize, glowColor);
  }

  /// Draw bird-like silhouette shape
  void _drawBirdSilhouette(Canvas canvas, Offset center, double size, double direction, Paint paint) {
    final path = Path();
    
    // Body (round, chubby)
    path.addOval(Rect.fromCenter(center: center, width: size * 0.85, height: size * 0.75));
    
    // Head bump
    path.addOval(Rect.fromCenter(
      center: Offset(center.dx - direction * size * 0.15, center.dy - size * 0.25),
      width: size * 0.45,
      height: size * 0.4,
    ));
    
    // Small wing
    final wingPath = Path();
    wingPath.moveTo(center.dx + direction * size * 0.15, center.dy - size * 0.05);
    wingPath.quadraticBezierTo(
      center.dx + direction * size * 0.45,
      center.dy + size * 0.05,
      center.dx + direction * size * 0.3,
      center.dy + size * 0.3,
    );
    wingPath.quadraticBezierTo(
      center.dx + direction * size * 0.15,
      center.dy + size * 0.2,
      center.dx + direction * size * 0.15,
      center.dy - size * 0.05,
    );
    path.addPath(wingPath, Offset.zero);
    
    // Tail feathers
    final tailPath = Path();
    tailPath.moveTo(center.dx - direction * size * 0.35, center.dy + size * 0.15);
    tailPath.lineTo(center.dx - direction * size * 0.55, center.dy + size * 0.25);
    tailPath.lineTo(center.dx - direction * size * 0.5, center.dy + size * 0.35);
    tailPath.lineTo(center.dx - direction * size * 0.35, center.dy + size * 0.28);
    tailPath.close();
    path.addPath(tailPath, Offset.zero);
    
    canvas.drawPath(path, paint);
  }

  /// THE SLEEPY PEEKING EYES - half-closed with gentle glow
  void _drawSleepyPeekingEyes(Canvas canvas, double cx, double cy, double spacing, double eyeSize, Color glowColor) {
    // Eye glow (dimmer than awake eyes)
    for (int i = 2; i >= 0; i--) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2.5 + i * 4, height: eyeSize * 1.2 + i * 2),
        Paint()..color = glowColor.withOpacity(0.1 - i * 0.025),
      );
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2.5 + i * 4, height: eyeSize * 1.2 + i * 2),
        Paint()..color = glowColor.withOpacity(0.1 - i * 0.025),
      );
    }
    
    // Half-closed eye shape (crescent/slit)
    final eyeWhite = Paint()..color = const Color(0xFFFFFFF0);
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2.5, height: eyeSize * 1.0), eyeWhite);
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2.5, height: eyeSize * 1.0), eyeWhite);
    
    // Sleepy irises (golden amber, partially visible)
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy + eyeSize * 0.1), width: eyeSize * 1.4, height: eyeSize * 0.7), Paint()..color = const Color(0xFFFBD38D));
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy + eyeSize * 0.1), width: eyeSize * 1.4, height: eyeSize * 0.7), Paint()..color = const Color(0xFFFBD38D));
    
    // Tiny pupils (barely visible in sleepy state)
    canvas.drawCircle(Offset(cx - spacing, cy + eyeSize * 0.1), eyeSize * 0.25, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + spacing, cy + eyeSize * 0.1), eyeSize * 0.25, Paint()..color = const Color(0xFF1A1A1A));
    
    // Small eye shine
    canvas.drawCircle(Offset(cx - spacing - eyeSize * 0.3, cy - eyeSize * 0.05), eyeSize * 0.12, Paint()..color = Colors.white.withOpacity(0.8));
    canvas.drawCircle(Offset(cx + spacing - eyeSize * 0.3, cy - eyeSize * 0.05), eyeSize * 0.12, Paint()..color = Colors.white.withOpacity(0.8));
  }

  /// Draw glowing "Zzz" above sleeping creatures
  void _drawGlowingZzz(Canvas canvas, Offset start) {
    final zzzColor = const Color(0xFFFBD38D);
    
    final offsets = [
      Offset(start.dx, start.dy),
      Offset(start.dx + 14, start.dy - 18),
      Offset(start.dx + 26, start.dy - 38),
    ];
    final sizes = [9.0, 11.0, 14.0];
    
    for (int i = 0; i < 3; i++) {
      final o = offsets[i];
      final s = sizes[i];
      
      // Glow behind Z
      for (int g = 2; g >= 0; g--) {
        final glowPaint = Paint()
          ..color = zzzColor.withOpacity(0.12 - g * 0.03)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3 + g * 2.0
          ..strokeCap = StrokeCap.round;
        _drawZShape(canvas, o, s, glowPaint);
      }
      
      // Z shape
      final zPaint = Paint()
        ..color = zzzColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round;
      _drawZShape(canvas, o, s, zPaint);
    }
  }

  void _drawZShape(Canvas canvas, Offset o, double s, Paint paint) {
    final path = Path();
    path.moveTo(o.dx - s * 0.5, o.dy - s * 0.4);
    path.lineTo(o.dx + s * 0.5, o.dy - s * 0.4);
    path.lineTo(o.dx - s * 0.5, o.dy + s * 0.4);
    path.lineTo(o.dx + s * 0.5, o.dy + s * 0.4);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Login screen - SHADOW OWL with PEEKING EYES
/// Follows the new design standard: shadow silhouettes with glowing eyes
class LoginScenePainter extends CustomPainter {
  final bool isDark;

  LoginScenePainter({this.isDark = true});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(55);

    // === LAYER 1: Deep mystical night sky ===
    final skyGradient = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color(0xFF050510), // Near black
          Color(0xFF0D1B2A), // Deep navy
          Color(0xFF1B2838), // Dark blue
          Color(0xFF243B53), // Slightly lighter
        ],
        stops: const [0.0, 0.3, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyGradient);

    // === LAYER 2: Nebula glow (purple) ===
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.25),
      size.width * 0.4,
      Paint()..shader = RadialGradient(
        colors: [const Color(0xFF805AD5).withOpacity(0.12), Colors.transparent],
      ).createShader(Rect.fromCircle(center: Offset(size.width * 0.3, size.height * 0.25), radius: size.width * 0.4)),
    );

    // === LAYER 3: Stars (varying sizes and brightness) ===
    for (int i = 0; i < 60; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.65;
      final radius = random.nextDouble() * 1.3 + 0.3;
      final opacity = random.nextDouble() * 0.5 + 0.2;
      
      // Some stars have a subtle glow
      if (i % 10 == 0) {
        canvas.drawCircle(Offset(x, y), radius * 4, Paint()..color = Colors.white.withOpacity(opacity * 0.2));
      }
      canvas.drawCircle(Offset(x, y), radius, Paint()..color = Colors.white.withOpacity(opacity));
    }

    // === LAYER 4: Crescent Moon with glow ===
    final moonCenter = Offset(size.width * 0.82, size.height * 0.1);
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(moonCenter, 28 + i * 10, Paint()..color = const Color(0xFFFFFFF0).withOpacity(0.06 - i * 0.01));
    }
    canvas.drawCircle(moonCenter, 24, Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawCircle(Offset(moonCenter.dx + 10, moonCenter.dy - 5), 19, Paint()..color = const Color(0xFF050510));

    // === LAYER 5: Soft clouds ===
    _drawCloud(canvas, Offset(size.width * 0.08, size.height * 0.15), 40, const Color(0xFF4A5568).withOpacity(0.2));
    _drawCloud(canvas, Offset(size.width * 0.92, size.height * 0.12), 35, const Color(0xFF4A5568).withOpacity(0.15));
    _drawCloud(canvas, Offset(size.width * 0.5, size.height * 0.08), 25, const Color(0xFF4A5568).withOpacity(0.12));

    // === LAYER 6: Ground/Platform with texture ===
    final groundPath = Path();
    groundPath.moveTo(0, size.height * 0.72);
    groundPath.quadraticBezierTo(size.width * 0.25, size.height * 0.68, size.width * 0.5, size.height * 0.7);
    groundPath.quadraticBezierTo(size.width * 0.75, size.height * 0.73, size.width, size.height * 0.68);
    groundPath.lineTo(size.width, size.height);
    groundPath.lineTo(0, size.height);
    groundPath.close();
    canvas.drawPath(groundPath, Paint()..shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xFF1A202C), const Color(0xFF0A0510)],
    ).createShader(Rect.fromLTWH(0, size.height * 0.65, size.width, size.height * 0.35)));
    
    // Ground grass hints
    for (int i = 0; i < 20; i++) {
      final gx = random.nextDouble() * size.width;
      final gy = size.height * 0.7 + random.nextDouble() * size.height * 0.08;
      canvas.drawLine(
        Offset(gx, gy + 5),
        Offset(gx + (random.nextDouble() - 0.5) * 4, gy - 5 - random.nextDouble() * 8),
        Paint()..color = const Color(0xFF2D3748).withOpacity(0.5)..strokeWidth = 1.5..strokeCap = StrokeCap.round,
      );
    }

    // === LAYER 7: OWL SHADOW SILHOUETTE with PEEKING EYES ===
    final owlCenter = Offset(size.width * 0.5, size.height * 0.52);
    final owlSize = size.width * 0.38;
    
    // Owl outer glow (purple accent)
    final glowColor = const Color(0xFF805AD5);
    for (int i = 5; i >= 0; i--) {
      _drawOwlSilhouette(canvas, owlCenter, owlSize + i * 6, Paint()..color = glowColor.withOpacity(0.08 - i * 0.012)..style = PaintingStyle.stroke..strokeWidth = 4);
    }
    
    // Owl solid shadow body
    _drawOwlSilhouette(canvas, owlCenter, owlSize, Paint()..color = const Color(0xFF0A0508));
    
    // PEEKING EYES (the signature feature!)
    final eyeY = owlCenter.dy - owlSize * 0.12;
    final eyeSpacing = owlSize * 0.15;
    final eyeSize = owlSize * 0.08;
    _drawPeekingEyes(canvas, owlCenter.dx, eyeY, eyeSpacing, eyeSize, glowColor);

    // === LAYER 8: Floating magical particles ===
    for (int i = 0; i < 20; i++) {
      final x = size.width * 0.15 + random.nextDouble() * size.width * 0.7;
      final y = size.height * 0.2 + random.nextDouble() * size.height * 0.45;
      final particleColor = [
        const Color(0xFF9AE6B4),
        const Color(0xFFFBB6CE),
        const Color(0xFFFBD38D),
        const Color(0xFF805AD5),
      ][i % 4].withOpacity(random.nextDouble() * 0.4 + 0.2);
      canvas.drawCircle(Offset(x, y), random.nextDouble() * 2.5 + 0.8, Paint()..color = particleColor);
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

  void _drawCloud(Canvas canvas, Offset center, double size, Color color) {
    final paint = Paint()..color = color;
    canvas.drawCircle(center, size * 0.5, paint);
    canvas.drawCircle(Offset(center.dx - size * 0.35, center.dy + size * 0.1), size * 0.35, paint);
    canvas.drawCircle(Offset(center.dx + size * 0.4, center.dy + size * 0.05), size * 0.4, paint);
    canvas.drawCircle(Offset(center.dx + size * 0.15, center.dy + size * 0.12), size * 0.3, paint);
  }

  /// Draw owl silhouette shape (body, head, ear tufts, wings)
  void _drawOwlSilhouette(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    
    // Body (oval)
    final bodyRect = Rect.fromCenter(
      center: Offset(center.dx, center.dy + size * 0.15),
      width: size * 0.75,
      height: size * 0.8,
    );
    path.addOval(bodyRect);
    
    // Head (circle on top)
    final headCenter = Offset(center.dx, center.dy - size * 0.2);
    final headRadius = size * 0.3;
    path.addOval(Rect.fromCircle(center: headCenter, radius: headRadius));
    
    // Left ear tuft
    final leftEarPath = Path();
    leftEarPath.moveTo(headCenter.dx - headRadius * 0.6, headCenter.dy - headRadius * 0.5);
    leftEarPath.lineTo(headCenter.dx - headRadius * 0.9, headCenter.dy - headRadius * 1.3);
    leftEarPath.lineTo(headCenter.dx - headRadius * 0.3, headCenter.dy - headRadius * 0.6);
    leftEarPath.close();
    path.addPath(leftEarPath, Offset.zero);
    
    // Right ear tuft
    final rightEarPath = Path();
    rightEarPath.moveTo(headCenter.dx + headRadius * 0.6, headCenter.dy - headRadius * 0.5);
    rightEarPath.lineTo(headCenter.dx + headRadius * 0.9, headCenter.dy - headRadius * 1.3);
    rightEarPath.lineTo(headCenter.dx + headRadius * 0.3, headCenter.dy - headRadius * 0.6);
    rightEarPath.close();
    path.addPath(rightEarPath, Offset.zero);
    
    // Left wing (slightly raised, welcoming)
    final leftWingPath = Path();
    leftWingPath.moveTo(center.dx - size * 0.3, center.dy);
    leftWingPath.quadraticBezierTo(center.dx - size * 0.55, center.dy - size * 0.1, center.dx - size * 0.5, center.dy + size * 0.25);
    leftWingPath.quadraticBezierTo(center.dx - size * 0.35, center.dy + size * 0.2, center.dx - size * 0.3, center.dy + size * 0.1);
    leftWingPath.close();
    path.addPath(leftWingPath, Offset.zero);
    
    // Right wing
    final rightWingPath = Path();
    rightWingPath.moveTo(center.dx + size * 0.3, center.dy);
    rightWingPath.quadraticBezierTo(center.dx + size * 0.55, center.dy - size * 0.1, center.dx + size * 0.5, center.dy + size * 0.25);
    rightWingPath.quadraticBezierTo(center.dx + size * 0.35, center.dy + size * 0.2, center.dx + size * 0.3, center.dy + size * 0.1);
    rightWingPath.close();
    path.addPath(rightWingPath, Offset.zero);
    
    canvas.drawPath(path, paint);
  }

  /// THE SIGNATURE PEEKING EYES with glow
  void _drawPeekingEyes(Canvas canvas, double cx, double cy, double spacing, double eyeSize, Color glowColor) {
    // Eye glow (3 layers of accent color)
    for (int i = 2; i >= 0; i--) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2.2 + i * 5, height: eyeSize * 1.8 + i * 4),
        Paint()..color = glowColor.withOpacity(0.15 - i * 0.04),
      );
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2.2 + i * 5, height: eyeSize * 1.8 + i * 4),
        Paint()..color = glowColor.withOpacity(0.15 - i * 0.04),
      );
    }
    
    // Eye whites (cream ovals)
    canvas.drawOval(Rect.fromCenter(center: Offset(cx - spacing, cy), width: eyeSize * 2.2, height: eyeSize * 1.8), Paint()..color = const Color(0xFFFFFFF0));
    canvas.drawOval(Rect.fromCenter(center: Offset(cx + spacing, cy), width: eyeSize * 2.2, height: eyeSize * 1.8), Paint()..color = const Color(0xFFFFFFF0));
    
    // Irises (golden amber - warm and inviting)
    canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.75, Paint()..color = const Color(0xFFFBD38D));
    canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.75, Paint()..color = const Color(0xFFFBD38D));
    
    // Pupils (dark, looking at viewer)
    canvas.drawCircle(Offset(cx - spacing, cy), eyeSize * 0.38, Paint()..color = const Color(0xFF1A1A1A));
    canvas.drawCircle(Offset(cx + spacing, cy), eyeSize * 0.38, Paint()..color = const Color(0xFF1A1A1A));
    
    // Eye shine (ESSENTIAL - gives life!)
    canvas.drawCircle(Offset(cx - spacing - eyeSize * 0.28, cy - eyeSize * 0.28), eyeSize * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(cx + spacing - eyeSize * 0.28, cy - eyeSize * 0.28), eyeSize * 0.2, Paint()..color = Colors.white);
    
    // Secondary smaller shine
    canvas.drawCircle(Offset(cx - spacing + eyeSize * 0.2, cy + eyeSize * 0.15), eyeSize * 0.08, Paint()..color = Colors.white.withOpacity(0.6));
    canvas.drawCircle(Offset(cx + spacing + eyeSize * 0.2, cy + eyeSize * 0.15), eyeSize * 0.08, Paint()..color = Colors.white.withOpacity(0.6));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
