import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../shared/redesign/redesign.dart';
import '../../shared/redesign/shadow_utils.dart';

/// ============================================================================
/// AFFIRMATION DOMAIN DEFINITIONS
/// Life domains with icon-based shadow themes and rich environments
/// ============================================================================

class AffirmationDomain {
  final String id;
  final String title;
  final String tagline;
  final IconData icon;
  final Color accentColor;
  final String iconType; // 'anvil', 'pillar', 'lighthouse', 'rose', 'campfire', 'tree'
  final AffirmationEnvironment environment;

  const AffirmationDomain({
    required this.id,
    required this.title,
    required this.tagline,
    required this.icon,
    required this.accentColor,
    required this.iconType,
    required this.environment,
  });
}

class AffirmationEnvironment {
  final TimeOfDay timeOfDay;
  final WeatherCondition weather;
  final List<Color> skyGradient;
  final Color groundColor;

  const AffirmationEnvironment({
    required this.timeOfDay,
    required this.weather,
    required this.skyGradient,
    required this.groundColor,
  });
}

enum TimeOfDay { dawn, morning, noon, afternoon, dusk, night }
enum WeatherCondition { clear, cloudy, foggy, stormy, rainy, snowy }

/// All affirmation domains with unique environments
class AffirmationDomains {
  static const List<AffirmationDomain> all = [
    // Work & Purpose - MORNING CLEAR (bright, energetic)
    AffirmationDomain(
      id: 'work',
      title: 'Work & Purpose',
      tagline: 'Your authentic expression in the world',
      icon: Icons.work,
      accentColor: Color(0xFF6366F1),
      iconType: 'anvil', // Changed from compass (used in Psyche)
      environment: AffirmationEnvironment(
        timeOfDay: TimeOfDay.morning,
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF3B82F6), Color(0xFF60A5FA), Color(0xFFFBBF24)],
        groundColor: Color(0xFF1E3A5F),
      ),
    ),
    
    // Leadership & Authority - NOON CLEAR (powerful, commanding)
    AffirmationDomain(
      id: 'leadership',
      title: 'Leadership & Authority',
      tagline: 'How you guide and influence others',
      icon: Icons.groups,
      accentColor: Color(0xFF7C3AED),
      iconType: 'pillar', // Changed from crown (used in Psyche)
      environment: AffirmationEnvironment(
        timeOfDay: TimeOfDay.noon,
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF1E40AF), Color(0xFF3B82F6), Color(0xFF93C5FD)],
        groundColor: Color(0xFF1E3A5F),
      ),
    ),
    
    // Truth & Moral Courage - DUSK CLOUDY (contemplative)
    AffirmationDomain(
      id: 'truth',
      title: 'Truth & Moral Courage',
      tagline: 'Your relationship with integrity and honesty',
      icon: Icons.gavel,
      accentColor: Color(0xFFD97706),
      iconType: 'lighthouse',
      environment: AffirmationEnvironment(
        timeOfDay: TimeOfDay.dusk,
        weather: WeatherCondition.cloudy,
        skyGradient: [Color(0xFF5A4A70), Color(0xFF9A7A90), Color(0xFFD4A574)],
        groundColor: Color(0xFF2A2530),
      ),
    ),
    
    // Relationships & Intimacy - DAWN CLEAR (warm, tender)
    AffirmationDomain(
      id: 'intimacy',
      title: 'Relationships & Intimacy',
      tagline: 'How you connect deeply with others',
      icon: Icons.favorite,
      accentColor: Color(0xFFEC4899),
      iconType: 'rose', // Changed from heart (used in Psyche)
      environment: AffirmationEnvironment(
        timeOfDay: TimeOfDay.dawn,
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF2D3A52), Color(0xFF6B4A6A), Color(0xFFE8A87C)],
        groundColor: Color(0xFF2A2530),
      ),
    ),
    
    // Friendships & Social - AFTERNOON CLEAR (warm, social)
    AffirmationDomain(
      id: 'social',
      title: 'Friendships & Social Life',
      tagline: 'Your place in community and connection',
      icon: Icons.people,
      accentColor: Color(0xFF14B8A6),
      iconType: 'campfire', // Changed from bridge (used in Scenarios)
      environment: AffirmationEnvironment(
        timeOfDay: TimeOfDay.afternoon,
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF4A6FA5), Color(0xFF7B9FB8), Color(0xFFBFA87A)],
        groundColor: Color(0xFF2A3540),
      ),
    ),
    
    // Emotional & Inner Life - NIGHT CLEAR (introspective)
    AffirmationDomain(
      id: 'innerLife',
      title: 'Emotional & Inner Life',
      tagline: 'Your relationship with yourself',
      icon: Icons.self_improvement,
      accentColor: Color(0xFF10B981),
      iconType: 'tree',
      environment: AffirmationEnvironment(
        timeOfDay: TimeOfDay.night,
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF0D1B2A), Color(0xFF1B2838), Color(0xFF2D3A4A)],
        groundColor: Color(0xFF0D1520),
      ),
    ),
  ];

  static AffirmationDomain getById(String id) {
    return all.firstWhere((d) => d.id == id, orElse: () => all.first);
  }
}

/// ============================================================================
/// AFFIRMATION CARD PAINTERS
/// ============================================================================

class AffirmationCardPainter extends CustomPainter {
  final AffirmationDomain domain;
  final bool isDark;

  AffirmationCardPainter({required this.domain, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final env = domain.environment;
    final random = math.Random(domain.id.hashCode);

    // === Sky background ===
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: env.skyGradient,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // === Weather effects ===
    _drawWeatherEffects(canvas, size, env.weather, random);

    // === Time-based ambient lighting ===
    _drawAmbientLighting(canvas, size, env.timeOfDay, domain.accentColor);

    // === Ground ===
    final groundPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.7, size.width, size.height * 0.75)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(groundPath, Paint()..color = env.groundColor);

    // === Environment details ===
    _drawEnvironmentDetails(canvas, size, env.timeOfDay, random);

    // === Icon-based shadow character ===
    _drawAffirmationIcon(canvas, size, domain.iconType, domain.accentColor);

    // === Vignette ===
    drawVignette(canvas, size, intensity: 0.35);
  }

  void _drawWeatherEffects(Canvas canvas, Size size, WeatherCondition weather, math.Random random) {
    switch (weather) {
      case WeatherCondition.foggy:
        for (int i = 0; i < 5; i++) {
          final y = size.height * (0.3 + i * 0.12);
          final opacity = 0.08 - i * 0.01;
          canvas.drawRect(
            Rect.fromLTWH(0, y, size.width, size.height * 0.15),
            Paint()..color = Colors.white.withOpacity(opacity),
          );
        }
        break;
      case WeatherCondition.cloudy:
        for (int i = 0; i < 4; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height * 0.25;
          canvas.drawOval(
            Rect.fromCenter(center: Offset(x, y), width: 70 + random.nextDouble() * 50, height: 20 + random.nextDouble() * 10),
            Paint()..color = Colors.white.withOpacity(0.1),
          );
        }
        break;
      case WeatherCondition.stormy:
        for (int i = 0; i < 4; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height * 0.3;
          canvas.drawOval(
            Rect.fromCenter(center: Offset(x, y), width: 80 + random.nextDouble() * 60, height: 25 + random.nextDouble() * 15),
            Paint()..color = const Color(0xFF1A1A25).withOpacity(0.6),
          );
        }
        break;
      case WeatherCondition.clear:
      default:
        break;
    }
  }

  void _drawAmbientLighting(Canvas canvas, Size size, TimeOfDay time, Color accent) {
    switch (time) {
      case TimeOfDay.dawn:
        canvas.drawRect(
          Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.3),
          Paint()..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, const Color(0xFFFFA07A).withOpacity(0.2)],
          ).createShader(Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.3)),
        );
        break;
      case TimeOfDay.morning:
        canvas.drawRect(
          Rect.fromLTWH(size.width * 0.6, 0, size.width * 0.4, size.height * 0.5),
          Paint()..shader = RadialGradient(
            center: const Alignment(1.0, -0.5),
            radius: 1.0,
            colors: [const Color(0xFFFFD700).withOpacity(0.15), Colors.transparent],
          ).createShader(Rect.fromLTWH(size.width * 0.6, 0, size.width * 0.4, size.height * 0.5)),
        );
        break;
      case TimeOfDay.noon:
        // Bright overhead light
        canvas.drawRect(
          Rect.fromLTWH(size.width * 0.3, 0, size.width * 0.4, size.height * 0.4),
          Paint()..shader = RadialGradient(
            center: const Alignment(0.0, -1.0),
            radius: 1.2,
            colors: [Colors.white.withOpacity(0.1), Colors.transparent],
          ).createShader(Rect.fromLTWH(size.width * 0.3, 0, size.width * 0.4, size.height * 0.4)),
        );
        break;
      case TimeOfDay.afternoon:
        canvas.drawRect(
          Rect.fromLTWH(size.width * 0.5, 0, size.width * 0.5, size.height * 0.6),
          Paint()..shader = RadialGradient(
            center: const Alignment(0.8, -0.3),
            radius: 1.0,
            colors: [const Color(0xFFFFD700).withOpacity(0.1), Colors.transparent],
          ).createShader(Rect.fromLTWH(size.width * 0.5, 0, size.width * 0.5, size.height * 0.6)),
        );
        break;
      case TimeOfDay.dusk:
        canvas.drawRect(
          Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.35),
          Paint()..shader = LinearGradient(
            colors: [Colors.transparent, const Color(0xFFFF6B6B).withOpacity(0.12), const Color(0xFF7C3AED).withOpacity(0.08)],
          ).createShader(Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.35)),
        );
        break;
      case TimeOfDay.night:
        // Stars
        for (int i = 0; i < 20; i++) {
          final x = math.Random(i * 7).nextDouble() * size.width;
          final y = math.Random(i * 11).nextDouble() * size.height * 0.5;
          canvas.drawCircle(Offset(x, y), math.Random(i * 13).nextDouble() * 1.5 + 0.5, Paint()..color = Colors.white.withOpacity(0.6));
        }
        // Moon glow
        canvas.drawCircle(
          Offset(size.width * 0.8, size.height * 0.15),
          25,
          Paint()..shader = RadialGradient(
            colors: [Colors.white.withOpacity(0.25), Colors.transparent],
          ).createShader(Rect.fromCircle(center: Offset(size.width * 0.8, size.height * 0.15), radius: 25)),
        );
        break;
    }
  }

  void _drawEnvironmentDetails(Canvas canvas, Size size, TimeOfDay time, math.Random random) {
    // Atmospheric particles
    for (int i = 0; i < 8; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.6;
      final opacity = time == TimeOfDay.night ? 0.4 : 0.2;
      canvas.drawCircle(Offset(x, y), 1 + random.nextDouble(), Paint()..color = Colors.white.withOpacity(opacity * random.nextDouble()));
    }
  }

  void _drawAffirmationIcon(Canvas canvas, Size size, String iconType, Color accent) {
    final center = Offset(size.width * 0.5, size.height * 0.45);
    final s = size.width * 0.42; // 42% of card width per standards

    switch (iconType) {
      case 'anvil':
        _drawAnvilIcon(canvas, center, s, accent);
        break;
      case 'pillar':
        _drawPillarIcon(canvas, center, s, accent);
        break;
      case 'lighthouse':
        _drawLighthouseIcon(canvas, center, s, accent);
        break;
      case 'rose':
        _drawRoseIcon(canvas, center, s, accent);
        break;
      case 'campfire':
        _drawCampfireIcon(canvas, center, s, accent);
        break;
      case 'tree':
        _drawTreeIcon(canvas, center, s, accent);
        break;
    }
  }

  void _drawAnvilIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.12);
    
    // Anvil top (flat work surface)
    final topPath = Path()
      ..moveTo(center.dx - s * 0.4, center.dy - s * 0.15)
      ..lineTo(center.dx - s * 0.45, center.dy - s * 0.25)
      ..lineTo(center.dx + s * 0.35, center.dy - s * 0.25)
      ..lineTo(center.dx + s * 0.4, center.dy - s * 0.1)
      ..lineTo(center.dx + s * 0.25, center.dy - s * 0.1)
      ..lineTo(center.dx + s * 0.2, center.dy - s * 0.15)
      ..close();
    drawBlendedShadow(canvas, topPath);
    
    // Anvil body
    final bodyPath = Path()
      ..moveTo(center.dx - s * 0.3, center.dy - s * 0.15)
      ..lineTo(center.dx - s * 0.25, center.dy + s * 0.15)
      ..lineTo(center.dx + s * 0.2, center.dy + s * 0.15)
      ..lineTo(center.dx + s * 0.2, center.dy - s * 0.15)
      ..close();
    drawBlendedShadow(canvas, bodyPath);
    
    // Base
    final basePath = Path()
      ..moveTo(center.dx - s * 0.35, center.dy + s * 0.15)
      ..lineTo(center.dx - s * 0.35, center.dy + s * 0.35)
      ..lineTo(center.dx + s * 0.3, center.dy + s * 0.35)
      ..lineTo(center.dx + s * 0.3, center.dy + s * 0.15)
      ..close();
    drawBlendedShadow(canvas, basePath);
    
    // Hammer silhouette (leaning against)
    final hammerPath = Path()
      ..moveTo(center.dx + s * 0.25, center.dy - s * 0.35)
      ..lineTo(center.dx + s * 0.35, center.dy - s * 0.4)
      ..lineTo(center.dx + s * 0.45, center.dy - s * 0.3)
      ..lineTo(center.dx + s * 0.35, center.dy - s * 0.25)
      ..close();
    drawBlendedShadow(canvas, hammerPath);
    
    // Hammer handle
    canvas.drawLine(
      Offset(center.dx + s * 0.3, center.dy - s * 0.35),
      Offset(center.dx + s * 0.4, center.dy + s * 0.1),
      Paint()..color = const Color(0xFF0A0A15)..strokeWidth = 3,
    );

    // Eyes
    drawPeekingEyesProportional(canvas, Offset(center.dx - s * 0.05, center.dy), s * 2.5, glowColor: accent, style: EyeStyle.standard);
  }

  void _drawPillarIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.12);
    
    // Pillar capital (top ornament)
    final capitalPath = Path()
      ..moveTo(center.dx - s * 0.25, center.dy - s * 0.3)
      ..lineTo(center.dx - s * 0.3, center.dy - s * 0.4)
      ..lineTo(center.dx + s * 0.3, center.dy - s * 0.4)
      ..lineTo(center.dx + s * 0.25, center.dy - s * 0.3)
      ..close();
    drawBlendedShadow(canvas, capitalPath);
    
    // Scroll detail on capital
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx - s * 0.22, center.dy - s * 0.35), width: s * 0.1, height: s * 0.06),
      Paint()..color = const Color(0xFF0A0A15),
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx + s * 0.22, center.dy - s * 0.35), width: s * 0.1, height: s * 0.06),
      Paint()..color = const Color(0xFF0A0A15),
    );
    
    // Pillar shaft with fluting
    final shaftPath = Path()
      ..moveTo(center.dx - s * 0.15, center.dy - s * 0.3)
      ..lineTo(center.dx - s * 0.18, center.dy + s * 0.3)
      ..lineTo(center.dx + s * 0.18, center.dy + s * 0.3)
      ..lineTo(center.dx + s * 0.15, center.dy - s * 0.3)
      ..close();
    drawBlendedShadow(canvas, shaftPath);
    
    // Fluting lines
    for (int i = -2; i <= 2; i++) {
      canvas.drawLine(
        Offset(center.dx + i * s * 0.06, center.dy - s * 0.28),
        Offset(center.dx + i * s * 0.07, center.dy + s * 0.28),
        Paint()..color = accent.withOpacity(0.15)..strokeWidth = 1,
      );
    }
    
    // Base
    final basePath = Path()
      ..moveTo(center.dx - s * 0.25, center.dy + s * 0.3)
      ..lineTo(center.dx - s * 0.3, center.dy + s * 0.4)
      ..lineTo(center.dx + s * 0.3, center.dy + s * 0.4)
      ..lineTo(center.dx + s * 0.25, center.dy + s * 0.3)
      ..close();
    drawBlendedShadow(canvas, basePath);

    // Eyes
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.05), s * 2.5, glowColor: accent, style: EyeStyle.standard);
  }

  void _drawLighthouseIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow (light beam)
    final beamPath = Path()
      ..moveTo(center.dx, center.dy - s * 0.35)
      ..lineTo(center.dx - s * 0.5, center.dy - s * 0.5)
      ..lineTo(center.dx + s * 0.5, center.dy - s * 0.5)
      ..close();
    canvas.drawPath(beamPath, Paint()..color = accent.withOpacity(0.15));
    
    // Tower
    final towerPath = Path()
      ..moveTo(center.dx - s * 0.15, center.dy + s * 0.45)
      ..lineTo(center.dx - s * 0.12, center.dy - s * 0.2)
      ..lineTo(center.dx + s * 0.12, center.dy - s * 0.2)
      ..lineTo(center.dx + s * 0.15, center.dy + s * 0.45)
      ..close();
    drawShadowBlendGlow(canvas, towerPath, accent, layers: 3, baseSpread: 4, maxOpacity: 0.1);
    drawBlendedShadow(canvas, towerPath);
    
    // Lantern room
    final lanternPath = Path()
      ..addRect(Rect.fromCenter(center: Offset(center.dx, center.dy - s * 0.28), width: s * 0.2, height: s * 0.15));
    drawBlendedShadow(canvas, lanternPath);
    
    // Roof
    final roofPath = Path()
      ..moveTo(center.dx - s * 0.12, center.dy - s * 0.35)
      ..lineTo(center.dx, center.dy - s * 0.45)
      ..lineTo(center.dx + s * 0.12, center.dy - s * 0.35)
      ..close();
    drawBlendedShadow(canvas, roofPath);
    
    // Stripes on tower
    for (int i = 0; i < 3; i++) {
      final y = center.dy + s * 0.1 - i * s * 0.15;
      canvas.drawLine(
        Offset(center.dx - s * 0.13, y),
        Offset(center.dx + s * 0.13, y),
        Paint()..color = accent.withOpacity(0.2)..strokeWidth = 2,
      );
    }

    // Eyes in lantern room
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.28), s * 2.5, glowColor: accent, style: EyeStyle.curious);
  }

  void _drawRoseIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.15);
    
    // Stem
    canvas.drawLine(
      Offset(center.dx, center.dy + s * 0.15),
      Offset(center.dx + s * 0.05, center.dy + s * 0.45),
      Paint()..color = const Color(0xFF0A0A15)..strokeWidth = 3,
    );
    
    // Leaves on stem
    final leaf1 = Path()
      ..moveTo(center.dx + s * 0.02, center.dy + s * 0.3)
      ..quadraticBezierTo(center.dx + s * 0.15, center.dy + s * 0.25, center.dx + s * 0.18, center.dy + s * 0.35)
      ..quadraticBezierTo(center.dx + s * 0.1, center.dy + s * 0.35, center.dx + s * 0.02, center.dy + s * 0.3);
    drawBlendedShadow(canvas, leaf1);
    
    final leaf2 = Path()
      ..moveTo(center.dx, center.dy + s * 0.38)
      ..quadraticBezierTo(center.dx - s * 0.12, center.dy + s * 0.35, center.dx - s * 0.12, center.dy + s * 0.42)
      ..quadraticBezierTo(center.dx - s * 0.05, center.dy + s * 0.4, center.dx, center.dy + s * 0.38);
    drawBlendedShadow(canvas, leaf2);
    
    // Rose petals (outer layer)
    for (int i = 0; i < 5; i++) {
      final angle = i * math.pi * 2 / 5 - math.pi / 2;
      final petalPath = Path();
      final petalCenter = Offset(
        center.dx + math.cos(angle) * s * 0.15,
        center.dy - s * 0.1 + math.sin(angle) * s * 0.15,
      );
      petalPath.addOval(Rect.fromCenter(
        center: petalCenter,
        width: s * 0.25,
        height: s * 0.3,
      ));
      drawBlendedShadow(canvas, petalPath);
    }
    
    // Rose center (inner spiral)
    final centerPath = Path()
      ..addOval(Rect.fromCircle(center: Offset(center.dx, center.dy - s * 0.1), radius: s * 0.15));
    drawBlendedShadow(canvas, centerPath);
    
    // Spiral detail
    canvas.drawArc(
      Rect.fromCircle(center: Offset(center.dx, center.dy - s * 0.1), radius: s * 0.08),
      0, math.pi * 1.5,
      false,
      Paint()..color = accent.withOpacity(0.2)..style = PaintingStyle.stroke..strokeWidth = 2,
    );

    // Eyes
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.08), s * 2.5, glowColor: accent, style: EyeStyle.sleepy);
  }

  void _drawCampfireIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.15);
    
    // Logs crossing
    final log1 = Path()
      ..moveTo(center.dx - s * 0.45, center.dy + s * 0.35)
      ..lineTo(center.dx - s * 0.4, center.dy + s * 0.25)
      ..lineTo(center.dx + s * 0.2, center.dy + s * 0.15)
      ..lineTo(center.dx + s * 0.25, center.dy + s * 0.25)
      ..close();
    drawBlendedShadow(canvas, log1);
    
    final log2 = Path()
      ..moveTo(center.dx + s * 0.45, center.dy + s * 0.35)
      ..lineTo(center.dx + s * 0.4, center.dy + s * 0.25)
      ..lineTo(center.dx - s * 0.2, center.dy + s * 0.15)
      ..lineTo(center.dx - s * 0.25, center.dy + s * 0.25)
      ..close();
    drawBlendedShadow(canvas, log2);
    
    // Stones around fire
    for (int i = 0; i < 6; i++) {
      final angle = i * math.pi / 3 + math.pi / 6;
      final stoneX = center.dx + math.cos(angle) * s * 0.4;
      final stoneY = center.dy + s * 0.25 + math.sin(angle) * s * 0.12;
      canvas.drawOval(
        Rect.fromCenter(center: Offset(stoneX, stoneY), width: s * 0.12, height: s * 0.08),
        Paint()..color = const Color(0xFF0A0A15),
      );
    }
    
    // Flames (layered)
    final flame1 = Path()
      ..moveTo(center.dx - s * 0.15, center.dy + s * 0.15)
      ..quadraticBezierTo(center.dx - s * 0.2, center.dy - s * 0.1, center.dx - s * 0.05, center.dy - s * 0.35)
      ..quadraticBezierTo(center.dx, center.dy - s * 0.2, center.dx + s * 0.05, center.dy - s * 0.35)
      ..quadraticBezierTo(center.dx + s * 0.2, center.dy - s * 0.1, center.dx + s * 0.15, center.dy + s * 0.15)
      ..close();
    drawBlendedShadow(canvas, flame1);
    
    // Inner flame
    final flame2 = Path()
      ..moveTo(center.dx - s * 0.08, center.dy + s * 0.1)
      ..quadraticBezierTo(center.dx - s * 0.1, center.dy - s * 0.05, center.dx, center.dy - s * 0.2)
      ..quadraticBezierTo(center.dx + s * 0.1, center.dy - s * 0.05, center.dx + s * 0.08, center.dy + s * 0.1)
      ..close();
    canvas.drawPath(flame2, Paint()..color = accent.withOpacity(0.3));
    
    // Sparks
    for (int i = 0; i < 5; i++) {
      final sparkX = center.dx + (math.Random(i * 7).nextDouble() - 0.5) * s * 0.3;
      final sparkY = center.dy - s * 0.2 - math.Random(i * 11).nextDouble() * s * 0.25;
      canvas.drawCircle(Offset(sparkX, sparkY), 2, Paint()..color = accent.withOpacity(0.5));
    }

    // Eyes in flames
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.1), s * 2.5, glowColor: accent, style: EyeStyle.curious);
  }

  void _drawTreeIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: Offset(center.dx, center.dy - s * 0.1), radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.1);
    
    // Trunk
    final trunkPath = Path()
      ..moveTo(center.dx - s * 0.08, center.dy + s * 0.45)
      ..lineTo(center.dx - s * 0.06, center.dy + s * 0.1)
      ..lineTo(center.dx + s * 0.06, center.dy + s * 0.1)
      ..lineTo(center.dx + s * 0.08, center.dy + s * 0.45)
      ..close();
    drawBlendedShadow(canvas, trunkPath);
    
    // Foliage layers
    final foliage1 = Path()
      ..moveTo(center.dx - s * 0.35, center.dy + s * 0.15)
      ..quadraticBezierTo(center.dx - s * 0.4, center.dy - s * 0.1, center.dx - s * 0.2, center.dy - s * 0.2)
      ..quadraticBezierTo(center.dx - s * 0.15, center.dy - s * 0.35, center.dx, center.dy - s * 0.4)
      ..quadraticBezierTo(center.dx + s * 0.15, center.dy - s * 0.35, center.dx + s * 0.2, center.dy - s * 0.2)
      ..quadraticBezierTo(center.dx + s * 0.4, center.dy - s * 0.1, center.dx + s * 0.35, center.dy + s * 0.15)
      ..quadraticBezierTo(center.dx + s * 0.2, center.dy + s * 0.1, center.dx, center.dy + s * 0.12)
      ..quadraticBezierTo(center.dx - s * 0.2, center.dy + s * 0.1, center.dx - s * 0.35, center.dy + s * 0.15)
      ..close();
    drawBlendedShadow(canvas, foliage1);
    
    // Roots
    canvas.drawLine(
      Offset(center.dx - s * 0.08, center.dy + s * 0.45),
      Offset(center.dx - s * 0.18, center.dy + s * 0.5),
      Paint()..color = const Color(0xFF0A0A15)..strokeWidth = 3,
    );
    canvas.drawLine(
      Offset(center.dx + s * 0.08, center.dy + s * 0.45),
      Offset(center.dx + s * 0.18, center.dy + s * 0.5),
      Paint()..color = const Color(0xFF0A0A15)..strokeWidth = 3,
    );

    // Eyes in foliage
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.15), s * 2.5, glowColor: accent, style: EyeStyle.mysterious);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// ============================================================================
/// AFFIRMATION CARD WIDGET
/// ============================================================================

class AffirmationCard extends StatelessWidget {
  final AffirmationDomain domain;
  final DomainBlock? data;
  final List<dynamic> examples;
  final VoidCallback onTap;
  final bool isLoading;

  const AffirmationCard({
    super.key,
    required this.domain,
    this.data,
    this.examples = const [],
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: domain.accentColor.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background illustration
              Positioned.fill(
                child: CustomPaint(
                  painter: AffirmationCardPainter(domain: domain, isDark: isDark),
                ),
              ),
              
              // Gradient overlay for text readability
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: const [0.3, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
              
              // Content
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(domain.icon, size: 18, color: domain.accentColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            domain.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      domain.tagline,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Loading overlay
              if (isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(domain.accentColor),
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ============================================================================
/// AFFIRMATION DETAIL VIEW
/// Full-screen view with tabs: About, In Your Life, Examples
/// ============================================================================

class AffirmationDetailView extends StatefulWidget {
  final AffirmationDomain domain;
  final DomainBlock? data;
  final List<dynamic> examples;

  const AffirmationDetailView({
    super.key,
    required this.domain,
    this.data,
    this.examples = const [],
  });

  @override
  State<AffirmationDetailView> createState() => _AffirmationDetailViewState();
}

class _AffirmationDetailViewState extends State<AffirmationDetailView> with SingleTickerProviderStateMixin {
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
      backgroundColor: isDark ? const Color(0xFF0D0D15) : Colors.white,
      body: Column(
        children: [
          // Header with illustration
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                // Background illustration
                Positioned.fill(
                  child: CustomPaint(
                    painter: AffirmationCardPainter(domain: widget.domain, isDark: isDark),
                  ),
                ),
                
                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.0, 0.3, 1.0],
                      ),
                    ),
                  ),
                ),
                
                // Back button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                
                // Title and tagline
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(widget.domain.icon, size: 24, color: widget.domain.accentColor),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.domain.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.domain.tagline,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Tab bar
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1A1A25) : Colors.white,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: widget.domain.accentColor,
                      unselectedLabelColor: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                      indicatorColor: widget.domain.accentColor,
                      indicatorWeight: 3,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                      tabs: const [
                        Tab(text: 'About'),
                        Tab(text: 'In Your Life'),
                        Tab(text: 'Examples'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Tab content
          Expanded(
            child: Container(
              color: isDark ? const Color(0xFF1A1A25) : Colors.white,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAboutTab(context, isDark),
                  _buildInYourLifeTab(context, isDark),
                  _buildExamplesTab(context, isDark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTab(BuildContext context, bool isDark) {
    if (widget.data == null) {
      return _buildEmptyState('About this domain loading...', Icons.hourglass_empty);
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // I Am - Core identity affirmations
        if (widget.data!.iAm.isNotEmpty) ...[
          _buildAffirmationSection(
            'I Am',
            'Your core identity in this domain',
            widget.data!.iAm,
            Icons.person,
            widget.domain.accentColor,
            isDark,
          ),
          const SizedBox(height: 24),
        ],
        
        // I Tend To - Behavioral patterns
        if (widget.data!.iTendTo.isNotEmpty) ...[
          _buildAffirmationSection(
            'I Tend To',
            'Your natural patterns and tendencies',
            widget.data!.iTendTo,
            Icons.trending_up,
            widget.domain.accentColor,
            isDark,
          ),
        ],
      ],
    );
  }

  Widget _buildInYourLifeTab(BuildContext context, bool isDark) {
    if (widget.data == null) {
      return _buildEmptyState('Personal insights loading...', Icons.hourglass_empty);
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // To Realize Potential - Growth guidance
        if (widget.data!.toRealizePotential.isNotEmpty) ...[
          _buildAffirmationSection(
            'To Realize Your Potential',
            'Guidance for growth and development',
            widget.data!.toRealizePotential,
            Icons.lightbulb,
            Colors.green,
            isDark,
          ),
          const SizedBox(height: 24),
        ],
        
        // Self Direction - Personal compass
        if (widget.data!.selfDirection.isNotEmpty) ...[
          _buildTextSection(
            'Self Direction',
            'Your inner compass in this domain',
            widget.data!.selfDirection,
            Icons.explore,
            widget.domain.accentColor,
            isDark,
          ),
        ],
      ],
    );
  }

  Widget _buildExamplesTab(BuildContext context, bool isDark) {
    if (widget.examples.isEmpty) {
      return _buildEmptyState('No examples available yet', Icons.movie_outlined);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.examples.length,
      itemBuilder: (context, index) {
        final example = widget.examples[index];
        final character = example is Map ? (example['character'] ?? 'Character') : 'Character';
        final description = example is Map ? (example['description'] ?? example.toString()) : example.toString();
        final franchise = example is Map ? (example['franchise'] ?? '') : '';

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF2D2D3A) : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: widget.domain.accentColor.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.domain.accentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.person, size: 20, color: widget.domain.accentColor),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                        if (franchise.isNotEmpty)
                          Text(
                            franchise.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.domain.accentColor.withOpacity(0.8),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description.toString(),
                style: TextStyle(
                  height: 1.6,
                  color: isDark ? Colors.white.withOpacity(0.85) : Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(String message, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(message, style: TextStyle(color: Colors.grey.shade500)),
        ],
      ),
    );
  }

  Widget _buildAffirmationSection(String title, String subtitle, List<String> items, IconData icon, Color color, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: isDark ? Colors.white.withOpacity(0.85) : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildTextSection(String title, String subtitle, String content, IconData icon, Color color, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: TextStyle(
            fontSize: 15,
            height: 1.6,
            color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
          ),
        ),
      ],
    );
  }
}

/// ============================================================================
/// AFFIRMATIONS SUB-HEADER BACKGROUND PAINTER
/// ============================================================================

class AffirmationsBackgroundPainter extends CustomPainter {
  final bool isDark;
  final Color primaryColor;
  final Color accentColor;

  AffirmationsBackgroundPainter({
    required this.isDark,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(55);

    // Warm, uplifting gradient - sunrise/golden hour feel
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? [
                const Color(0xFF1A1A2E),
                const Color(0xFF2D2A4A),
                const Color(0xFF4A3A5A),
                const Color(0xFF5A4A6A),
              ]
            : [
                const Color(0xFF667eea),
                const Color(0xFF764ba2),
                const Color(0xFFf093fb),
                const Color(0xFFf5576c),
              ],
        stops: const [0.0, 0.35, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Warm glow - sunrise effect
    final sunGlow = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.6, 0.8),
        radius: 1.0,
        colors: [
          const Color(0xFFFFD700).withOpacity(0.3),
          const Color(0xFFFFA07A).withOpacity(0.15),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), sunGlow);

    // Floating light particles (representing affirmations/positive energy)
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2 + 1;
      final opacity = random.nextDouble() * 0.4 + 0.2;
      canvas.drawCircle(
        Offset(x, y),
        radius,
        Paint()..color = Colors.white.withOpacity(opacity),
      );
    }

    // Rising sun/light source
    final sunCenter = Offset(size.width * 0.7, size.height * 0.9);
    for (int i = 4; i >= 0; i--) {
      canvas.drawCircle(
        sunCenter,
        30 + i * 15,
        Paint()..color = const Color(0xFFFFD700).withOpacity(0.08 - i * 0.012),
      );
    }
    canvas.drawCircle(sunCenter, 25, Paint()..color = const Color(0xFFFFD700).withOpacity(0.4));

    // Light rays emanating from sun
    for (int i = 0; i < 8; i++) {
      final angle = i * math.pi / 4 - math.pi / 2;
      final rayLength = 60 + random.nextDouble() * 40;
      final rayPath = Path()
        ..moveTo(sunCenter.dx, sunCenter.dy)
        ..lineTo(
          sunCenter.dx + math.cos(angle) * rayLength,
          sunCenter.dy + math.sin(angle) * rayLength,
        );
      canvas.drawPath(
        rayPath,
        Paint()
          ..color = const Color(0xFFFFD700).withOpacity(0.15)
          ..strokeWidth = 2 + random.nextDouble() * 2
          ..style = PaintingStyle.stroke,
      );
    }

    // Ground silhouette - gentle hills
    final groundPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.72, size.width * 0.4, size.height * 0.78)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.85, size.width * 0.75, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.9, size.height * 0.68, size.width, size.height * 0.72)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(groundPath, Paint()..color = const Color(0xFF0A0A15).withOpacity(0.7));

    // Figure silhouette - person with arms raised in affirmation pose
    final figureX = size.width * 0.35;
    final figureY = size.height * 0.78;
    
    final figurePaint = Paint()
      ..color = const Color(0xFF0A0A15)
      ..style = PaintingStyle.fill;
    
    // Head
    canvas.drawCircle(Offset(figureX, figureY - 30), 6, figurePaint);
    
    // Body and arms raised
    final bodyPath = Path()
      ..moveTo(figureX - 8, figureY)
      ..lineTo(figureX - 4, figureY - 23)
      ..lineTo(figureX - 15, figureY - 40) // Left arm up
      ..lineTo(figureX - 13, figureY - 42)
      ..lineTo(figureX - 3, figureY - 26)
      ..lineTo(figureX, figureY - 24)
      ..lineTo(figureX + 3, figureY - 26)
      ..lineTo(figureX + 13, figureY - 42) // Right arm up
      ..lineTo(figureX + 15, figureY - 40)
      ..lineTo(figureX + 4, figureY - 23)
      ..lineTo(figureX + 8, figureY)
      ..close();
    canvas.drawPath(bodyPath, figurePaint);

    // Peeking eyes
    final eyeGlow = Paint()..color = accentColor.withOpacity(0.8);
    canvas.drawCircle(Offset(figureX - 2.5, figureY - 30), 2, eyeGlow);
    canvas.drawCircle(Offset(figureX + 2.5, figureY - 30), 2, eyeGlow);
    canvas.drawCircle(Offset(figureX - 2.5, figureY - 30), 1, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(figureX + 2.5, figureY - 30), 1, Paint()..color = Colors.white);

    // Small tree silhouette
    final treeX = size.width * 0.85;
    final treeY = size.height * 0.72;
    final treePath = Path()
      ..moveTo(treeX - 3, treeY)
      ..lineTo(treeX - 2, treeY - 15)
      ..quadraticBezierTo(treeX - 15, treeY - 20, treeX - 10, treeY - 30)
      ..quadraticBezierTo(treeX - 8, treeY - 40, treeX, treeY - 45)
      ..quadraticBezierTo(treeX + 8, treeY - 40, treeX + 10, treeY - 30)
      ..quadraticBezierTo(treeX + 15, treeY - 20, treeX + 2, treeY - 15)
      ..lineTo(treeX + 3, treeY)
      ..close();
    canvas.drawPath(treePath, figurePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// ============================================================================
/// AFFIRMATIONS SUB-HEADER WIDGET
/// ============================================================================

class AffirmationsSubHeader extends StatelessWidget {
  const AffirmationsSubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SubHeader(
      title: 'Life Affirmations',
      purpose: 'Declarations of who you are and how you show up in each domain of life',
      backgroundPainter: AffirmationsBackgroundPainter(
        isDark: isDark,
        primaryColor: theme.colorScheme.primary,
        accentColor: const Color(0xFFF59E0B), // Warm amber for affirmations
      ),
    );
  }
}

/// ============================================================================
/// AFFIRMATIONS TAB (Main Page)
/// ============================================================================

class AffirmationsTab extends ConsumerWidget {
  final bool embedded;
  
  const AffirmationsTab({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outputAsync = ref.watch(outputRepositoryProvider);
    final effectiveOutput = ref.watch(effectiveMeOutputProvider);
    final toneState = ref.watch(toneRepositoryProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final content = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [const Color(0xFF1A1A25), const Color(0xFF1A1A25).withOpacity(0.5)]
              : [const Color(0xFFFAF5FF), Colors.white],
        ),
      ),
      child: Stack(
        children: [
          outputAsync.when(
            data: (_) => _buildContent(context, effectiveOutput),
            loading: () => _buildLoadingState(context),
            error: (error, stack) => _buildErrorState(context, ref, error),
          ),
          // Tone loading overlay
          if (toneState.isLoading)
            Positioned.fill(
              child: Container(
                color: theme.scaffoldBackgroundColor.withOpacity(0.85),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Adjusting narrative tone...'),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    if (embedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Affirmations')),
      body: content,
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AffirmationsSubHeader(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: AffirmationDomains.all.length,
              itemBuilder: (context, index) {
                return AffirmationCard(
                  domain: AffirmationDomains.all[index],
                  onTap: () {},
                  isLoading: true,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text('Error: $error', textAlign: TextAlign.center, style: TextStyle(color: Colors.red.shade300)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => ref.read(outputRepositoryProvider.notifier).regenerate(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, GeneratedOutput? output) {
    if (output == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('No output available.\nPlease complete character entry.', textAlign: TextAlign.center),
        ),
      );
    }

    final domains = output.lifeDomains;
    final examples = output.examples?.lifeDomains;

    // Map domain data to our domain configs
    final domainDataMap = <String, DomainBlock>{
      'work': domains.work,
      'leadership': domains.leadership,
      'truth': domains.truth,
      'intimacy': domains.intimacy,
      'social': domains.social,
      'innerLife': domains.innerLife,
    };

    final examplesMap = <String, List<dynamic>>{
      'work': (examples?.work ?? []).map(_exampleToMap).toList(),
      'leadership': (examples?.leadership ?? []).map(_exampleToMap).toList(),
      'truth': (examples?.truth ?? []).map(_exampleToMap).toList(),
      'intimacy': (examples?.intimacy ?? []).map(_exampleToMap).toList(),
      'social': (examples?.social ?? []).map(_exampleToMap).toList(),
      'innerLife': (examples?.innerLife ?? []).map(_exampleToMap).toList(),
    };

    return SingleChildScrollView(
      child: Column(
        children: [
          const AffirmationsSubHeader(),
          const SizedBox(height: 16),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: AffirmationDomains.all.length,
              itemBuilder: (context, index) {
                final domain = AffirmationDomains.all[index];
                return AffirmationCard(
                  domain: domain,
                  data: domainDataMap[domain.id],
                  examples: examplesMap[domain.id] ?? [],
                  onTap: () => _openAffirmationDetail(
                    context,
                    domain,
                    domainDataMap[domain.id],
                    examplesMap[domain.id] ?? [],
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Map<String, dynamic> _exampleToMap(ExampleItem e) => {
    'character': e.characterName,
    'franchise': '${e.reference.title} (${e.reference.year}) • ${e.reference.medium}',
    'description': '${e.situation}\n\n${e.actions.join('\n')}\n\n${e.outcomeAndCost.join('\n')}',
  };

  void _openAffirmationDetail(BuildContext context, AffirmationDomain domain, DomainBlock? data, List<dynamic> examples) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AffirmationDetailView(
          domain: domain,
          data: data,
          examples: examples,
        ),
      ),
    );
  }
}
