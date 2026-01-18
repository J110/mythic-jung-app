import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../shared/redesign/redesign.dart';
import '../../shared/redesign/shadow_utils.dart';

/// ============================================================================
/// SCENARIO DEFINITIONS
/// Real-life situations organized by theme, with concrete examples
/// ============================================================================

/// A single scenario theme with multiple concrete situations
class ScenarioTheme {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;
  final List<String> situations;
  final ScenarioEnvironment environment;

  const ScenarioTheme({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
    required this.situations,
    required this.environment,
  });
}

/// Environment configuration for scenario cards
class ScenarioEnvironment {
  final String iconType; // 'crossroads', 'mirror', 'threshold', 'door', 'storm', 'mountain', 'clock', 'theater', 'trophy'
  final TimeOfDay timeOfDay;
  final WeatherCondition weather;
  final List<Color> skyGradient;
  final Color groundColor;

  const ScenarioEnvironment({
    required this.iconType,
    required this.timeOfDay,
    required this.weather,
    required this.skyGradient,
    required this.groundColor,
  });
}

enum TimeOfDay { dawn, morning, noon, afternoon, dusk, night }
enum WeatherCondition { clear, cloudy, foggy, stormy, rainy, snowy }

/// All scenario themes with real-life situations
class ScenarioThemes {
  static const List<ScenarioTheme> all = [
    // Theme 1: Past Encounters - DUSK (orange/purple transition)
    ScenarioTheme(
      id: 'past_encounters',
      title: 'When The Past Returns',
      description: 'Moments when old wounds or unfinished business resurface',
      icon: Icons.history,
      accentColor: Color(0xFF7C3AED),
      situations: [
        'You run into a childhood bully at a reunion',
        'An ex reaches out after years of silence',
        'You discover old letters from a deceased parent',
        'A former friend wants to reconnect after betraying you',
        'You return to your hometown after many years',
        'Someone brings up a mistake you made long ago',
      ],
      environment: ScenarioEnvironment(
        iconType: 'mirror',
        timeOfDay: TimeOfDay.dusk,
        weather: WeatherCondition.foggy,
        skyGradient: [Color(0xFF4A3060), Color(0xFF8B4570), Color(0xFFD4708A)], // Dusk purple-pink
        groundColor: Color(0xFF2A1A30),
      ),
    ),
    
    // Theme 2: Authority Challenges - NOON STORMY (bright but dramatic)
    ScenarioTheme(
      id: 'authority_challenges',
      title: 'Standing Your Ground',
      description: 'Situations that test your boundaries with power figures',
      icon: Icons.gavel,
      accentColor: Color(0xFFEF4444),
      situations: [
        'Your boss takes credit for your work in a meeting',
        'A doctor dismisses your symptoms without proper examination',
        'A parent criticizes a major life decision you\'ve made',
        'A police officer treats you unfairly',
        'A mentor suggests you\'re not ready for an opportunity',
        'Someone in authority asks you to compromise your values',
      ],
      environment: ScenarioEnvironment(
        iconType: 'mountain',
        timeOfDay: TimeOfDay.noon,
        weather: WeatherCondition.stormy,
        skyGradient: [Color(0xFF4A5568), Color(0xFF718096), Color(0xFF2D3748)], // Stormy noon grays
        groundColor: Color(0xFF2D3748),
      ),
    ),
    
    // Theme 3: Intimacy & Vulnerability - DAWN (soft pinks/oranges)
    ScenarioTheme(
      id: 'intimacy_vulnerability',
      title: 'Opening Up',
      description: 'Moments requiring emotional exposure and trust',
      icon: Icons.favorite_border,
      accentColor: Color(0xFFEC4899),
      situations: [
        'Your partner asks why you never talk about your feelings',
        'A friend shares something deeply personal and waits for your response',
        'You need to ask for help when you always manage alone',
        'Someone says "I love you" and expects a response',
        'A therapist asks about your childhood',
        'You catch yourself about to cry in front of others',
      ],
      environment: ScenarioEnvironment(
        iconType: 'door',
        timeOfDay: TimeOfDay.dawn,
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF2D3A52), Color(0xFF6B4A6A), Color(0xFFE8A87C)], // Dawn soft rose/gold
        groundColor: Color(0xFF2A2530),
      ),
    ),
    
    // Theme 4: Success & Recognition - MORNING (bright golden)
    ScenarioTheme(
      id: 'success_recognition',
      title: 'In The Spotlight',
      description: 'Handling attention, praise, and achievement',
      icon: Icons.emoji_events,
      accentColor: Color(0xFFF59E0B),
      situations: [
        'You receive an award and must give an acceptance speech',
        'A project you led succeeds beyond everyone\'s expectations',
        'Someone publicly praises you in front of your peers',
        'You\'re promoted over colleagues who wanted the position',
        'An interviewer asks about your greatest achievement',
        'You outperform someone you care about',
      ],
      environment: ScenarioEnvironment(
        iconType: 'trophy', // Changed from crown (used in Psyche)
        timeOfDay: TimeOfDay.morning,
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF3B82F6), Color(0xFF60A5FA), Color(0xFFFBBF24)], // Bright morning blue/gold
        groundColor: Color(0xFF1E3A5F),
      ),
    ),
    
    // Theme 5: Failure & Setbacks - NIGHT STORMY (dark dramatic)
    ScenarioTheme(
      id: 'failure_setbacks',
      title: 'When Things Fall Apart',
      description: 'Navigating disappointment, loss, and failure',
      icon: Icons.crisis_alert,
      accentColor: Color(0xFF6366F1),
      situations: [
        'You\'re laid off from a job you loved',
        'A relationship ends despite your best efforts',
        'You fail an important exam or certification',
        'A business venture or investment fails',
        'You let someone down who was counting on you',
        'You realize you\'ve been living according to others\' expectations',
      ],
      environment: ScenarioEnvironment(
        iconType: 'storm',
        timeOfDay: TimeOfDay.night,
        weather: WeatherCondition.stormy,
        skyGradient: [Color(0xFF0D0D15), Color(0xFF1A1A2E), Color(0xFF2D2D42)], // Night storm
        groundColor: Color(0xFF0D0D15),
      ),
    ),
    
    // Theme 6: Ethical Dilemmas - DUSK CLOUDY (ambiguous light)
    ScenarioTheme(
      id: 'ethical_dilemmas',
      title: 'The Right Thing',
      description: 'Choices between competing values and loyalties',
      icon: Icons.balance,
      accentColor: Color(0xFF10B981),
      situations: [
        'You witness a colleague stealing and they beg you not to tell',
        'Telling the truth will hurt someone you love',
        'You can get ahead by bending the rules others follow',
        'A friend asks you to lie to cover for them',
        'You discover your company is doing something unethical',
        'Helping one person means letting another down',
      ],
      environment: ScenarioEnvironment(
        iconType: 'crossroads',
        timeOfDay: TimeOfDay.dusk,
        weather: WeatherCondition.cloudy,
        skyGradient: [Color(0xFF5A4A70), Color(0xFF9A7A90), Color(0xFFCBA890)], // Dusk amber/lavender
        groundColor: Color(0xFF2A2530),
      ),
    ),
    
    // Theme 7: Social Pressure - AFTERNOON CLOUDY (warm but overcast)
    ScenarioTheme(
      id: 'social_pressure',
      title: 'Fitting In vs. Being You',
      description: 'Navigating expectations and conformity',
      icon: Icons.groups,
      accentColor: Color(0xFF8B5CF6),
      situations: [
        'Everyone at a gathering holds a political view you disagree with',
        'Your friends mock something you secretly enjoy',
        'You\'re the only one not drinking at a party',
        'A group makes a cruel joke about someone not present',
        'You\'re asked to participate in office gossip',
        'Your lifestyle choices are questioned at a family dinner',
      ],
      environment: ScenarioEnvironment(
        iconType: 'theater', // Changed from mask (used in Psyche)
        timeOfDay: TimeOfDay.afternoon,
        weather: WeatherCondition.cloudy,
        skyGradient: [Color(0xFF6B7280), Color(0xFF9CA3AF), Color(0xFFD1A54A)], // Afternoon overcast warm
        groundColor: Color(0xFF2A2A30),
      ),
    ),
    
    // Theme 8: Transition & Change - DAWN FOGGY (hopeful/uncertain)
    ScenarioTheme(
      id: 'transition_change',
      title: 'Crossing Thresholds',
      description: 'Major life transitions and new beginnings',
      icon: Icons.door_front_door,
      accentColor: Color(0xFF06B6D4),
      situations: [
        'You\'re about to move to a new city where you know no one',
        'You\'re getting married and having cold feet',
        'You\'re becoming a parent for the first time',
        'You\'re retiring and don\'t know who you\'ll be',
        'You\'re leaving a stable career to pursue a dream',
        'You\'re ending a chapter of life that defined you',
      ],
      environment: ScenarioEnvironment(
        iconType: 'threshold', // Changed from bridge (used in Affirmation)
        timeOfDay: TimeOfDay.dawn,
        weather: WeatherCondition.foggy,
        skyGradient: [Color(0xFF374151), Color(0xFF7C9AA0), Color(0xFFE8B89A)], // Dawn misty soft
        groundColor: Color(0xFF2A3035),
      ),
    ),
    
    // Theme 9: Time Pressure - EVENING CLEAR (urgent twilight)
    ScenarioTheme(
      id: 'time_pressure',
      title: 'Racing Against Time',
      description: 'Decisions that can\'t wait and deadlines that loom',
      icon: Icons.timer,
      accentColor: Color(0xFFF97316),
      situations: [
        'You have 24 hours to decide on a job offer',
        'A loved one is in the hospital and you\'re far away',
        'You discover a serious health issue and must decide on treatment',
        'You must choose between two events happening at the same time',
        'An opportunity has a deadline and you\'re not ready',
        'You\'re running late for something that matters greatly',
      ],
      environment: ScenarioEnvironment(
        iconType: 'clock',
        timeOfDay: TimeOfDay.dusk, // Changed from night for variety
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF1E3A5F), Color(0xFF5A4A70), Color(0xFFF97316)], // Urgent sunset orange
        groundColor: Color(0xFF1E2A35),
      ),
    ),
    
    // Theme 10: Self-Discovery - AFTERNOON CLEAR (introspective light)
    ScenarioTheme(
      id: 'self_discovery',
      title: 'Meeting Yourself',
      description: 'Moments of unexpected self-revelation',
      icon: Icons.psychology,
      accentColor: Color(0xFFA78BFA),
      situations: [
        'You react to something in a way that surprises you',
        'You realize you\'ve become the person you said you\'d never be',
        'A stranger describes you differently than you see yourself',
        'You discover a hidden talent or passion late in life',
        'You catch yourself repeating a parent\'s pattern you swore to avoid',
        'A dream reveals something you\'ve been avoiding',
      ],
      environment: ScenarioEnvironment(
        iconType: 'mirror',
        timeOfDay: TimeOfDay.afternoon, // Changed from night for variety
        weather: WeatherCondition.clear,
        skyGradient: [Color(0xFF4A6FA5), Color(0xFF7B8FA8), Color(0xFFBFA87A)], // Afternoon golden blue
        groundColor: Color(0xFF2A3040),
      ),
    ),
  ];
}

/// ============================================================================
/// SCENARIO CARD PAINTERS
/// Icon-based characters with rich, thematic environments
/// ============================================================================

class ScenarioCardPainter extends CustomPainter {
  final ScenarioTheme theme;
  final bool isDark;

  ScenarioCardPainter({required this.theme, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final env = theme.environment;
    final random = math.Random(theme.id.hashCode);

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
    _drawAmbientLighting(canvas, size, env.timeOfDay, theme.accentColor);

    // === Ground ===
    final groundPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.7, size.width, size.height * 0.75)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(groundPath, Paint()..color = env.groundColor);

    // === Environment details based on time ===
    _drawEnvironmentDetails(canvas, size, env.timeOfDay, random);

    // === Icon-based character ===
    _drawScenarioIcon(canvas, size, env.iconType, theme.accentColor);

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
      case WeatherCondition.stormy:
        // Dark clouds
        for (int i = 0; i < 4; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height * 0.3;
          canvas.drawOval(
            Rect.fromCenter(center: Offset(x, y), width: 80 + random.nextDouble() * 60, height: 25 + random.nextDouble() * 15),
            Paint()..color = const Color(0xFF1A1A25).withOpacity(0.6),
          );
        }
        // Lightning flash (subtle)
        if (random.nextDouble() > 0.5) {
          canvas.drawLine(
            Offset(size.width * 0.7, size.height * 0.1),
            Offset(size.width * 0.65, size.height * 0.3),
            Paint()..color = Colors.white.withOpacity(0.1)..strokeWidth = 2,
          );
        }
        break;
      case WeatherCondition.cloudy:
        for (int i = 0; i < 3; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height * 0.25;
          canvas.drawOval(
            Rect.fromCenter(center: Offset(x, y), width: 70 + random.nextDouble() * 50, height: 20 + random.nextDouble() * 10),
            Paint()..color = Colors.white.withOpacity(0.08),
          );
        }
        break;
      case WeatherCondition.rainy:
        for (int i = 0; i < 20; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height * 0.8;
          canvas.drawLine(
            Offset(x, y),
            Offset(x - 3, y + 10),
            Paint()..color = Colors.white.withOpacity(0.15)..strokeWidth = 1,
          );
        }
        break;
      case WeatherCondition.snowy:
        for (int i = 0; i < 25; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height;
          canvas.drawCircle(Offset(x, y), 1 + random.nextDouble(), Paint()..color = Colors.white.withOpacity(0.3));
        }
        break;
      case WeatherCondition.clear:
        // Stars at night or sun rays during day
        break;
    }
  }

  void _drawAmbientLighting(Canvas canvas, Size size, TimeOfDay time, Color accent) {
    switch (time) {
      case TimeOfDay.dawn:
        // Warm glow on horizon
        canvas.drawRect(
          Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.3),
          Paint()..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, const Color(0xFFFFA07A).withOpacity(0.15)],
          ).createShader(Rect.fromLTWH(0, size.height * 0.5, size.width, size.height * 0.3)),
        );
        break;
      case TimeOfDay.morning:
        // Soft golden light
        canvas.drawRect(
          Rect.fromLTWH(size.width * 0.6, 0, size.width * 0.4, size.height * 0.5),
          Paint()..shader = RadialGradient(
            center: const Alignment(1.0, -0.5),
            radius: 1.0,
            colors: [const Color(0xFFFFD700).withOpacity(0.1), Colors.transparent],
          ).createShader(Rect.fromLTWH(size.width * 0.6, 0, size.width * 0.4, size.height * 0.5)),
        );
        break;
      case TimeOfDay.dusk:
        // Orange/purple gradient
        canvas.drawRect(
          Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.35),
          Paint()..shader = LinearGradient(
            colors: [Colors.transparent, const Color(0xFFFF6B6B).withOpacity(0.1), const Color(0xFF7C3AED).withOpacity(0.08)],
          ).createShader(Rect.fromLTWH(0, size.height * 0.4, size.width, size.height * 0.35)),
        );
        break;
      case TimeOfDay.night:
        // Stars
        final random = math.Random(42);
        for (int i = 0; i < 15; i++) {
          final x = random.nextDouble() * size.width;
          final y = random.nextDouble() * size.height * 0.5;
          canvas.drawCircle(Offset(x, y), random.nextDouble() * 1.5 + 0.5, Paint()..color = Colors.white.withOpacity(0.6));
        }
        // Moon glow
        canvas.drawCircle(
          Offset(size.width * 0.8, size.height * 0.15),
          25,
          Paint()..shader = RadialGradient(
            colors: [Colors.white.withOpacity(0.2), Colors.transparent],
          ).createShader(Rect.fromCircle(center: Offset(size.width * 0.8, size.height * 0.15), radius: 25)),
        );
        break;
      default:
        break;
    }
  }

  void _drawEnvironmentDetails(Canvas canvas, Size size, TimeOfDay time, math.Random random) {
    // Atmospheric particles
    for (int i = 0; i < 10; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.6;
      final opacity = time == TimeOfDay.night ? 0.4 : 0.2;
      canvas.drawCircle(Offset(x, y), 1 + random.nextDouble(), Paint()..color = Colors.white.withOpacity(opacity * random.nextDouble()));
    }
  }

  void _drawScenarioIcon(Canvas canvas, Size size, String iconType, Color accent) {
    final center = Offset(size.width * 0.5, size.height * 0.45);
    final iconSize = size.width * 0.42; // 42% of card width per design standards

    switch (iconType) {
      case 'crossroads':
        _drawCrossroadsIcon(canvas, center, iconSize, accent);
        break;
      case 'mirror':
        _drawMirrorIcon(canvas, center, iconSize, accent);
        break;
      case 'threshold':
        _drawThresholdIcon(canvas, center, iconSize, accent);
        break;
      case 'door':
        _drawDoorIcon(canvas, center, iconSize, accent);
        break;
      case 'storm':
        _drawStormIcon(canvas, center, iconSize, accent);
        break;
      case 'mountain':
        _drawMountainIcon(canvas, center, iconSize, accent);
        break;
      case 'clock':
        _drawClockIcon(canvas, center, iconSize, accent);
        break;
      case 'theater':
        _drawTheaterIcon(canvas, center, iconSize, accent);
        break;
      case 'trophy':
        _drawTrophyIcon(canvas, center, iconSize, accent);
        break;
    }
  }

  void _drawCrossroadsIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.12);
    
    // Signpost
    final postPath = Path()
      ..addRect(Rect.fromCenter(center: Offset(center.dx, center.dy + s * 0.15), width: s * 0.08, height: s * 0.7));
    drawBlendedShadow(canvas, postPath);
    
    // Left sign
    final leftSign = Path()
      ..moveTo(center.dx - s * 0.04, center.dy - s * 0.2)
      ..lineTo(center.dx - s * 0.4, center.dy - s * 0.25)
      ..lineTo(center.dx - s * 0.45, center.dy - s * 0.2)
      ..lineTo(center.dx - s * 0.4, center.dy - s * 0.15)
      ..lineTo(center.dx - s * 0.04, center.dy - s * 0.15)
      ..close();
    drawBlendedShadow(canvas, leftSign);
    
    // Right sign
    final rightSign = Path()
      ..moveTo(center.dx + s * 0.04, center.dy - s * 0.05)
      ..lineTo(center.dx + s * 0.4, center.dy - s * 0.1)
      ..lineTo(center.dx + s * 0.45, center.dy - s * 0.05)
      ..lineTo(center.dx + s * 0.4, center.dy)
      ..lineTo(center.dx + s * 0.04, center.dy)
      ..close();
    drawBlendedShadow(canvas, rightSign);

    // Eyes on the signpost
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.35), s * 2.5, glowColor: accent, style: EyeStyle.curious);
  }

  void _drawMirrorIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.55)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.12);
    
    // Mirror frame (oval)
    final framePath = Path()
      ..addOval(Rect.fromCenter(center: center, width: s * 0.8, height: s));
    drawBlendedShadow(canvas, framePath);
    
    // Inner reflection area
    final innerPath = Path()
      ..addOval(Rect.fromCenter(center: center, width: s * 0.65, height: s * 0.85));
    canvas.drawPath(innerPath, Paint()..color = accent.withOpacity(0.08));
    
    // Stand
    final standPath = Path()
      ..moveTo(center.dx - s * 0.2, center.dy + s * 0.5)
      ..lineTo(center.dx - s * 0.3, center.dy + s * 0.7)
      ..lineTo(center.dx + s * 0.3, center.dy + s * 0.7)
      ..lineTo(center.dx + s * 0.2, center.dy + s * 0.5)
      ..close();
    drawBlendedShadow(canvas, standPath);

    // Eyes in the mirror (looking back at you)
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.1), s * 2.5, glowColor: accent, style: EyeStyle.mysterious);
  }

  void _drawThresholdIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow through archway
    canvas.drawRect(
      Rect.fromCenter(center: center, width: s * 0.6, height: s * 0.9),
      Paint()..shader = RadialGradient(
        colors: [accent.withOpacity(0.15), Colors.transparent],
      ).createShader(Rect.fromCircle(center: center, radius: s * 0.5)),
    );
    
    // Archway silhouette
    final archPath = Path()
      ..moveTo(center.dx - s * 0.4, center.dy + s * 0.45)
      ..lineTo(center.dx - s * 0.4, center.dy - s * 0.2)
      ..quadraticBezierTo(center.dx - s * 0.4, center.dy - s * 0.45, center.dx, center.dy - s * 0.45)
      ..quadraticBezierTo(center.dx + s * 0.4, center.dy - s * 0.45, center.dx + s * 0.4, center.dy - s * 0.2)
      ..lineTo(center.dx + s * 0.4, center.dy + s * 0.45)
      ..lineTo(center.dx + s * 0.28, center.dy + s * 0.45)
      ..lineTo(center.dx + s * 0.28, center.dy - s * 0.1)
      ..quadraticBezierTo(center.dx + s * 0.28, center.dy - s * 0.32, center.dx, center.dy - s * 0.32)
      ..quadraticBezierTo(center.dx - s * 0.28, center.dy - s * 0.32, center.dx - s * 0.28, center.dy - s * 0.1)
      ..lineTo(center.dx - s * 0.28, center.dy + s * 0.45)
      ..close();
    drawBlendedShadow(canvas, archPath);
    
    // Steps leading through
    for (int i = 0; i < 3; i++) {
      final stepY = center.dy + s * 0.35 - i * s * 0.08;
      final stepWidth = s * 0.5 - i * s * 0.05;
      canvas.drawRect(
        Rect.fromCenter(center: Offset(center.dx, stepY), width: stepWidth, height: s * 0.04),
        Paint()..color = const Color(0xFF0A0A15).withOpacity(0.6 - i * 0.15),
      );
    }
    
    // Light beyond the threshold
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx, center.dy - s * 0.05), width: s * 0.3, height: s * 0.4),
      Paint()..color = accent.withOpacity(0.12),
    );

    // Eyes peeking through archway
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy), s * 2.5, glowColor: accent, style: EyeStyle.curious);
  }

  void _drawDoorIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Glow from door opening
    canvas.drawRect(
      Rect.fromCenter(center: center, width: s * 0.6, height: s),
      Paint()..shader = RadialGradient(
        colors: [accent.withOpacity(0.15), Colors.transparent],
      ).createShader(Rect.fromCircle(center: center, radius: s * 0.6)),
    );
    
    // Door frame
    final framePath = Path()
      ..addRect(Rect.fromCenter(center: center, width: s * 0.7, height: s * 1.1));
    drawBlendedShadow(canvas, framePath);
    
    // Door (slightly ajar)
    final doorPath = Path()
      ..moveTo(center.dx - s * 0.28, center.dy - s * 0.5)
      ..lineTo(center.dx + s * 0.15, center.dy - s * 0.48)
      ..lineTo(center.dx + s * 0.15, center.dy + s * 0.48)
      ..lineTo(center.dx - s * 0.28, center.dy + s * 0.5)
      ..close();
    canvas.drawPath(doorPath, Paint()..color = const Color(0xFF0A0A15));
    
    // Light ray coming through
    final lightPath = Path()
      ..moveTo(center.dx + s * 0.15, center.dy - s * 0.48)
      ..lineTo(center.dx + s * 0.5, center.dy - s * 0.3)
      ..lineTo(center.dx + s * 0.5, center.dy + s * 0.5)
      ..lineTo(center.dx + s * 0.15, center.dy + s * 0.48)
      ..close();
    canvas.drawPath(lightPath, Paint()..color = accent.withOpacity(0.1));
    
    // Door handle
    canvas.drawCircle(Offset(center.dx + s * 0.08, center.dy), s * 0.04, Paint()..color = accent.withOpacity(0.5));

    // Eyes peeking through the door gap
    drawPeekingEyesProportional(canvas, Offset(center.dx + s * 0.25, center.dy - s * 0.1), s * 2.5, glowColor: accent, style: EyeStyle.curious);
  }

  void _drawStormIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Storm clouds
    final cloudPath = Path();
    cloudPath.addOval(Rect.fromCenter(center: Offset(center.dx - s * 0.2, center.dy - s * 0.25), width: s * 0.5, height: s * 0.25));
    cloudPath.addOval(Rect.fromCenter(center: Offset(center.dx + s * 0.1, center.dy - s * 0.3), width: s * 0.6, height: s * 0.3));
    cloudPath.addOval(Rect.fromCenter(center: Offset(center.dx + s * 0.3, center.dy - s * 0.2), width: s * 0.4, height: s * 0.2));
    drawShadowBlendGlow(canvas, cloudPath, accent, layers: 3, baseSpread: 4, maxOpacity: 0.1);
    drawBlendedShadow(canvas, cloudPath);
    
    // Lightning bolt
    final lightningPath = Path()
      ..moveTo(center.dx + s * 0.1, center.dy - s * 0.1)
      ..lineTo(center.dx - s * 0.05, center.dy + s * 0.15)
      ..lineTo(center.dx + s * 0.05, center.dy + s * 0.15)
      ..lineTo(center.dx - s * 0.1, center.dy + s * 0.45)
      ..lineTo(center.dx + s * 0.15, center.dy + s * 0.1)
      ..lineTo(center.dx + s * 0.05, center.dy + s * 0.1)
      ..close();
    canvas.drawPath(lightningPath, Paint()..color = accent.withOpacity(0.8));
    canvas.drawPath(lightningPath, Paint()..color = Colors.white.withOpacity(0.4));

    // Eyes in the clouds
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.28), s * 2.5, glowColor: accent, style: EyeStyle.mysterious);
  }

  void _drawMountainIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Mountain glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: Offset(center.dx, center.dy - s * 0.1), radius: s * 0.6)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.1);
    
    // Main mountain
    final mountainPath = Path()
      ..moveTo(center.dx - s * 0.5, center.dy + s * 0.4)
      ..lineTo(center.dx - s * 0.1, center.dy - s * 0.4)
      ..lineTo(center.dx, center.dy - s * 0.35)
      ..lineTo(center.dx + s * 0.1, center.dy - s * 0.45)
      ..lineTo(center.dx + s * 0.5, center.dy + s * 0.4)
      ..close();
    drawBlendedShadow(canvas, mountainPath);
    
    // Snow cap
    final snowPath = Path()
      ..moveTo(center.dx - s * 0.12, center.dy - s * 0.25)
      ..lineTo(center.dx - s * 0.1, center.dy - s * 0.4)
      ..lineTo(center.dx, center.dy - s * 0.35)
      ..lineTo(center.dx + s * 0.1, center.dy - s * 0.45)
      ..lineTo(center.dx + s * 0.08, center.dy - s * 0.3)
      ..quadraticBezierTo(center.dx, center.dy - s * 0.28, center.dx - s * 0.12, center.dy - s * 0.25)
      ..close();
    canvas.drawPath(snowPath, Paint()..color = Colors.white.withOpacity(0.3));

    // Eyes on the mountain face
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.15), s * 2.5, glowColor: accent, style: EyeStyle.standard);
  }

  void _drawClockIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Clock glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.12);
    
    // Clock face
    final clockPath = Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.45));
    drawBlendedShadow(canvas, clockPath);
    
    // Inner circle
    canvas.drawCircle(center, s * 0.4, Paint()..color = const Color(0xFF0A0A15)..style = PaintingStyle.stroke..strokeWidth = 2);
    
    // Hour markers
    for (int i = 0; i < 12; i++) {
      final angle = i * math.pi / 6 - math.pi / 2;
      final inner = s * 0.32;
      final outer = s * 0.38;
      canvas.drawLine(
        Offset(center.dx + math.cos(angle) * inner, center.dy + math.sin(angle) * inner),
        Offset(center.dx + math.cos(angle) * outer, center.dy + math.sin(angle) * outer),
        Paint()..color = const Color(0xFF0A0A15)..strokeWidth = 2,
      );
    }
    
    // Clock hands (showing urgency - almost midnight/deadline)
    // Hour hand
    canvas.drawLine(center, Offset(center.dx, center.dy - s * 0.2), Paint()..color = const Color(0xFF0A0A15)..strokeWidth = 3);
    // Minute hand
    canvas.drawLine(center, Offset(center.dx + s * 0.05, center.dy - s * 0.3), Paint()..color = accent..strokeWidth = 2);
    // Center dot
    canvas.drawCircle(center, s * 0.04, Paint()..color = accent);

    // Eyes watching the clock
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy + s * 0.08), s * 2.5, glowColor: accent, style: EyeStyle.curious);
  }

  void _drawTheaterIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Theater glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: center, radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.1);
    
    // Stage curtain top
    final curtainTop = Path()
      ..moveTo(center.dx - s * 0.5, center.dy - s * 0.45)
      ..quadraticBezierTo(center.dx - s * 0.3, center.dy - s * 0.35, center.dx - s * 0.2, center.dy - s * 0.42)
      ..quadraticBezierTo(center.dx, center.dy - s * 0.35, center.dx + s * 0.2, center.dy - s * 0.42)
      ..quadraticBezierTo(center.dx + s * 0.3, center.dy - s * 0.35, center.dx + s * 0.5, center.dy - s * 0.45)
      ..lineTo(center.dx + s * 0.5, center.dy - s * 0.3)
      ..lineTo(center.dx - s * 0.5, center.dy - s * 0.3)
      ..close();
    drawBlendedShadow(canvas, curtainTop);
    
    // Left curtain
    final leftCurtain = Path()
      ..moveTo(center.dx - s * 0.5, center.dy - s * 0.3)
      ..quadraticBezierTo(center.dx - s * 0.35, center.dy, center.dx - s * 0.3, center.dy + s * 0.45)
      ..lineTo(center.dx - s * 0.5, center.dy + s * 0.45)
      ..close();
    drawBlendedShadow(canvas, leftCurtain);
    
    // Right curtain
    final rightCurtain = Path()
      ..moveTo(center.dx + s * 0.5, center.dy - s * 0.3)
      ..quadraticBezierTo(center.dx + s * 0.35, center.dy, center.dx + s * 0.3, center.dy + s * 0.45)
      ..lineTo(center.dx + s * 0.5, center.dy + s * 0.45)
      ..close();
    drawBlendedShadow(canvas, rightCurtain);
    
    // Stage floor
    canvas.drawRect(
      Rect.fromLTRB(center.dx - s * 0.4, center.dy + s * 0.35, center.dx + s * 0.4, center.dy + s * 0.45),
      Paint()..color = const Color(0xFF0A0A15).withOpacity(0.6),
    );
    
    // Spotlight glow
    canvas.drawOval(
      Rect.fromCenter(center: Offset(center.dx, center.dy + s * 0.1), width: s * 0.4, height: s * 0.25),
      Paint()..color = accent.withOpacity(0.15),
    );

    // Eyes on stage
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy + s * 0.05), s * 2.5, glowColor: accent, style: EyeStyle.mysterious);
  }

  void _drawTrophyIcon(Canvas canvas, Offset center, double s, Color accent) {
    // Trophy glow
    drawShadowBlendGlow(canvas, Path()..addOval(Rect.fromCircle(center: Offset(center.dx, center.dy - s * 0.1), radius: s * 0.5)), accent, layers: 4, baseSpread: 5, maxOpacity: 0.12);
    
    // Trophy cup
    final cupPath = Path()
      ..moveTo(center.dx - s * 0.25, center.dy - s * 0.35)
      ..lineTo(center.dx - s * 0.3, center.dy - s * 0.1)
      ..quadraticBezierTo(center.dx - s * 0.3, center.dy + s * 0.1, center.dx, center.dy + s * 0.15)
      ..quadraticBezierTo(center.dx + s * 0.3, center.dy + s * 0.1, center.dx + s * 0.3, center.dy - s * 0.1)
      ..lineTo(center.dx + s * 0.25, center.dy - s * 0.35)
      ..close();
    drawBlendedShadow(canvas, cupPath);
    
    // Handles
    final leftHandle = Path()
      ..moveTo(center.dx - s * 0.3, center.dy - s * 0.25)
      ..quadraticBezierTo(center.dx - s * 0.45, center.dy - s * 0.2, center.dx - s * 0.45, center.dy - s * 0.05)
      ..quadraticBezierTo(center.dx - s * 0.45, center.dy + s * 0.05, center.dx - s * 0.3, center.dy + s * 0.02);
    canvas.drawPath(leftHandle, Paint()..color = const Color(0xFF0A0A15)..style = PaintingStyle.stroke..strokeWidth = 4);
    
    final rightHandle = Path()
      ..moveTo(center.dx + s * 0.3, center.dy - s * 0.25)
      ..quadraticBezierTo(center.dx + s * 0.45, center.dy - s * 0.2, center.dx + s * 0.45, center.dy - s * 0.05)
      ..quadraticBezierTo(center.dx + s * 0.45, center.dy + s * 0.05, center.dx + s * 0.3, center.dy + s * 0.02);
    canvas.drawPath(rightHandle, Paint()..color = const Color(0xFF0A0A15)..style = PaintingStyle.stroke..strokeWidth = 4);
    
    // Stem
    canvas.drawRect(
      Rect.fromCenter(center: Offset(center.dx, center.dy + s * 0.25), width: s * 0.08, height: s * 0.15),
      Paint()..color = const Color(0xFF0A0A15),
    );
    
    // Base
    final basePath = Path()
      ..moveTo(center.dx - s * 0.2, center.dy + s * 0.32)
      ..lineTo(center.dx - s * 0.25, center.dy + s * 0.42)
      ..lineTo(center.dx + s * 0.25, center.dy + s * 0.42)
      ..lineTo(center.dx + s * 0.2, center.dy + s * 0.32)
      ..close();
    drawBlendedShadow(canvas, basePath);
    
    // Star on trophy
    canvas.drawCircle(Offset(center.dx, center.dy - s * 0.15), s * 0.08, Paint()..color = accent.withOpacity(0.4));

    // Eyes in the trophy
    drawPeekingEyesProportional(canvas, Offset(center.dx, center.dy - s * 0.05), s * 2.5, glowColor: accent, style: EyeStyle.standard);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// ============================================================================
/// SCENARIO CARD WIDGET
/// ============================================================================

class ScenarioCard extends StatelessWidget {
  final ScenarioTheme theme;
  final VoidCallback onTap;
  final bool isLoading;

  const ScenarioCard({
    super.key,
    required this.theme,
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
              color: theme.accentColor.withOpacity(0.2),
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
                  painter: ScenarioCardPainter(theme: theme, isDark: isDark),
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
                        Icon(theme.icon, size: 18, color: theme.accentColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            theme.title,
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
                      '${theme.situations.length} scenarios',
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
                        valueColor: AlwaysStoppedAnimation(theme.accentColor),
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
/// SCENARIO DETAIL VIEW
/// Full-screen view with tabs: About, In Your Life, Examples
/// ============================================================================

class ScenarioDetailView extends StatefulWidget {
  final ScenarioTheme theme;
  final SituationBlock? situationData;
  final List<dynamic> examples;

  const ScenarioDetailView({
    super.key,
    required this.theme,
    this.situationData,
    this.examples = const [],
  });

  @override
  State<ScenarioDetailView> createState() => _ScenarioDetailViewState();
}

class _ScenarioDetailViewState extends State<ScenarioDetailView> with SingleTickerProviderStateMixin {
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
                    painter: ScenarioCardPainter(theme: widget.theme, isDark: isDark),
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
                
                // Title and description
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(widget.theme.icon, size: 24, color: widget.theme.accentColor),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.theme.title,
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
                        widget.theme.description,
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
                      labelColor: widget.theme.accentColor,
                      unselectedLabelColor: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                      indicatorColor: widget.theme.accentColor,
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
    final situations = widget.theme.situations;
    
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Situations That Trigger This Theme',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        ...situations.map((situation) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: widget.theme.accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  situation,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: isDark ? Colors.white.withOpacity(0.9) : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildInYourLifeTab(BuildContext context, bool isDark) {
    if (widget.situationData == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Personal insights loading...',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // The Situation (moved from About tab)
        _buildSection(
          'The Situation',
          widget.situationData!.situation,
          isDark,
        ),
        const SizedBox(height: 24),
        // Aligned Response
        _buildResponseSection(
          'Aligned Response',
          'How you can respond authentically',
          widget.situationData!.alignedResponse,
          Colors.green,
          Icons.check_circle,
          isDark,
        ),
        const SizedBox(height: 24),
        // Be Wary Of
        _buildResponseSection(
          'Be Wary Of',
          'Patterns to watch out for',
          widget.situationData!.beWaryOf,
          Colors.orange,
          Icons.warning,
          isDark,
        ),
      ],
    );
  }

  Widget _buildExamplesTab(BuildContext context, bool isDark) {
    if (widget.examples.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_outlined, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'No examples available yet',
              style: TextStyle(color: Colors.grey.shade500),
            ),
            const SizedBox(height: 8),
            Text(
              'Pop culture examples will appear here',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
            ),
          ],
        ),
      );
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
            border: Border.all(color: widget.theme.accentColor.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: widget.theme.accentColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.person, size: 20, color: widget.theme.accentColor),
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
                              color: widget.theme.accentColor.withOpacity(0.8),
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

  Widget _buildSection(String title, String content, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: widget.theme.accentColor,
          ),
        ),
        const SizedBox(height: 8),
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

  Widget _buildResponseSection(String title, String subtitle, List<String> items, Color color, IconData icon, bool isDark) {
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
}

/// ============================================================================
/// SCENARIOS TAB (Main Page)
/// ============================================================================

class ScenariosTab extends ConsumerWidget {
  final bool embedded;
  
  const ScenariosTab({super.key, this.embedded = false});

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
      appBar: AppBar(title: const Text('Scenarios')),
      body: content,
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ScenariosSubHeader(),
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
              itemCount: ScenarioThemes.all.length,
              itemBuilder: (context, index) {
                return ScenarioCard(
                  theme: ScenarioThemes.all[index],
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

    final actions = output.actions;
    final examples = output.examples?.actions ?? [];

    // Map situation blocks to themes (first N themes get data)
    final situationMap = <String, SituationBlock>{};
    final exampleMap = <String, List<dynamic>>{};
    
    for (int i = 0; i < actions.situationBlocks.length && i < ScenarioThemes.all.length; i++) {
      final themeId = ScenarioThemes.all[i].id;
      situationMap[themeId] = actions.situationBlocks[i];
      if (i < examples.length) {
        exampleMap[themeId] = [_exampleToMap(examples[i])];
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const ScenariosSubHeader(),
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
              itemCount: ScenarioThemes.all.length,
              itemBuilder: (context, index) {
                final theme = ScenarioThemes.all[index];
                return ScenarioCard(
                  theme: theme,
                  onTap: () => _openScenarioDetail(
                    context,
                    theme,
                    situationMap[theme.id],
                    exampleMap[theme.id] ?? [],
                  ),
                );
              },
            ),
          ),
          
          // Guiding Question card at the bottom
          if (actions.guidingQuestion.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildGuidingQuestionCard(context, actions.guidingQuestion),
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

  void _openScenarioDetail(BuildContext context, ScenarioTheme theme, SituationBlock? situation, List<dynamic> examples) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScenarioDetailView(
          theme: theme,
          situationData: situation,
          examples: examples,
        ),
      ),
    );
  }

  Widget _buildGuidingQuestionCard(BuildContext context, String question) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark 
              ? [const Color(0xFF1A2A35), const Color(0xFF2A3A45)]
              : [const Color(0xFF667eea), const Color(0xFF764ba2)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.help_outline, color: Colors.white.withOpacity(0.9), size: 24),
              const SizedBox(width: 12),
              const Text(
                'Guiding Question',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            question,
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.white.withOpacity(0.95),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
