import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Custom painter for the Story tab sub-header background
/// Depicts a figure at the edge of a mythic forest with constellation arc
class StoryBackgroundPainter extends CustomPainter {
  final bool isDark;
  final Color primaryColor;
  final Color accentColor;

  StoryBackgroundPainter({
    required this.isDark,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Sky gradient
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [
                const Color(0xFF1a1a2e),
                const Color(0xFF16213e),
                const Color(0xFF0f3460),
              ]
            : [
                const Color(0xFF667eea),
                const Color(0xFF764ba2),
                const Color(0xFFf093fb),
              ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Stars
    final starPaint = Paint()
      ..color = Colors.white.withOpacity(isDark ? 0.8 : 0.6)
      ..style = PaintingStyle.fill;
    
    final random = math.Random(42); // Fixed seed for consistent pattern
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.6;
      final radius = random.nextDouble() * 1.5 + 0.5;
      canvas.drawCircle(Offset(x, y), radius, starPaint);
    }

    // Constellation arc (narrative arc)
    final arcPaint = Paint()
      ..color = accentColor.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    
    final arcPath = Path();
    arcPath.moveTo(size.width * 0.1, size.height * 0.4);
    arcPath.quadraticBezierTo(
      size.width * 0.5, size.height * 0.1,
      size.width * 0.9, size.height * 0.35,
    );
    canvas.drawPath(arcPath, arcPaint);

    // Stars along the arc
    final arcStarPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;
    
    final arcStarPositions = [
      Offset(size.width * 0.1, size.height * 0.4),
      Offset(size.width * 0.3, size.height * 0.22),
      Offset(size.width * 0.5, size.height * 0.15),
      Offset(size.width * 0.7, size.height * 0.2),
      Offset(size.width * 0.9, size.height * 0.35),
    ];
    for (final pos in arcStarPositions) {
      canvas.drawCircle(pos, 3, arcStarPaint);
    }

    // Forest silhouette at bottom
    final treePaint = Paint()
      ..color = isDark ? const Color(0xFF0a0a15) : const Color(0xFF2d1b4e)
      ..style = PaintingStyle.fill;
    
    final treePath = Path();
    treePath.moveTo(0, size.height);
    
    // Create tree silhouettes
    double x = 0;
    while (x < size.width) {
      final treeHeight = random.nextDouble() * 30 + 20;
      final treeWidth = random.nextDouble() * 15 + 10;
      
      treePath.lineTo(x, size.height - treeHeight * 0.3);
      treePath.lineTo(x + treeWidth / 2, size.height - treeHeight);
      treePath.lineTo(x + treeWidth, size.height - treeHeight * 0.3);
      
      x += treeWidth + random.nextDouble() * 5;
    }
    treePath.lineTo(size.width, size.height);
    treePath.close();
    canvas.drawPath(treePath, treePaint);

    // Figure silhouette (person looking at path)
    final figurePaint = Paint()
      ..color = isDark ? const Color(0xFF15152a) : const Color(0xFF1a0a2e)
      ..style = PaintingStyle.fill;
    
    final figureX = size.width * 0.15;
    final figureY = size.height * 0.75;
    
    // Simple figure shape
    final figurePath = Path();
    // Head
    canvas.drawCircle(Offset(figureX, figureY - 25), 6, figurePaint);
    // Body
    figurePath.moveTo(figureX - 5, figureY - 18);
    figurePath.lineTo(figureX + 5, figureY - 18);
    figurePath.lineTo(figureX + 7, figureY);
    figurePath.lineTo(figureX - 7, figureY);
    figurePath.close();
    canvas.drawPath(figurePath, figurePaint);

    // Glowing path ahead
    final pathPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          accentColor.withOpacity(0.0),
          accentColor.withOpacity(0.4),
          accentColor.withOpacity(0.1),
        ],
      ).createShader(Rect.fromLTWH(figureX, figureY - 5, size.width * 0.7, 10));
    
    final glowPath = Path();
    glowPath.moveTo(figureX + 10, figureY);
    glowPath.quadraticBezierTo(
      size.width * 0.5, figureY + 5,
      size.width * 0.85, figureY - 20,
    );
    glowPath.lineTo(size.width * 0.85, figureY - 15);
    glowPath.quadraticBezierTo(
      size.width * 0.5, figureY + 10,
      figureX + 10, figureY + 5,
    );
    glowPath.close();
    canvas.drawPath(glowPath, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Sub-header card that appears at the top of each tab
class SubHeader extends StatelessWidget {
  final String title;
  final String purpose;
  final CustomPainter? backgroundPainter;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double height;

  const SubHeader({
    super.key,
    required this.title,
    required this.purpose,
    this.backgroundPainter,
    this.gradientStartColor,
    this.gradientEndColor,
    this.height = 160,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Background (custom painter or gradient)
            Positioned.fill(
              child: backgroundPainter != null
                  ? CustomPaint(
                      painter: backgroundPainter,
                      size: Size.infinite,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            gradientStartColor ?? theme.colorScheme.primary,
                            gradientEndColor ?? theme.colorScheme.secondary,
                          ],
                        ),
                      ),
                    ),
            ),

            // Dark overlay gradient for text readability
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.7),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),

            // Content
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -0.3,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    purpose,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.3,
                      shadows: const [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Pre-configured sub-header for the Story tab
class StorySubHeader extends StatelessWidget {
  const StorySubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SubHeader(
      title: 'Your Mythic Narrative',
      purpose: 'The story your soul has been telling through every character you love',
      backgroundPainter: StoryBackgroundPainter(
        isDark: isDark,
        primaryColor: theme.colorScheme.primary,
        accentColor: const Color(0xFFD97706), // Golden accent
      ),
    );
  }
}

/// Custom painter for the Constellation/Archetypes tab sub-header background
/// Depicts a cosmic constellation with connected stars and nebula glow
class ConstellationBackgroundPainter extends CustomPainter {
  final bool isDark;
  final Color primaryColor;
  final Color accentColor;

  ConstellationBackgroundPainter({
    required this.isDark,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Deep cosmic background
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? [
                const Color(0xFF0D0D1A),
                const Color(0xFF1A1035),
                const Color(0xFF2D1F42),
              ]
            : [
                const Color(0xFF1E1B4B),
                const Color(0xFF312E81),
                const Color(0xFF4C1D95),
              ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Nebula glow effect
    final nebulaPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.3, -0.3),
        radius: 1.2,
        colors: [
          accentColor.withOpacity(0.3),
          primaryColor.withOpacity(0.15),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), nebulaPaint);

    // Second nebula
    final nebula2Paint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.5, 0.4),
        radius: 0.8,
        colors: [
          const Color(0xFF7C3AED).withOpacity(0.25),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), nebula2Paint);

    final random = math.Random(88); // Fixed seed for consistent pattern

    // Background stars (small, scattered)
    final starPaint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    
    for (int i = 0; i < 60; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.2 + 0.3;
      canvas.drawCircle(Offset(x, y), radius, starPaint);
    }

    // Main constellation - zodiac-inspired pattern
    final constellationStars = [
      Offset(size.width * 0.15, size.height * 0.35),
      Offset(size.width * 0.28, size.height * 0.22),
      Offset(size.width * 0.45, size.height * 0.18),
      Offset(size.width * 0.58, size.height * 0.28),
      Offset(size.width * 0.72, size.height * 0.20),
      Offset(size.width * 0.85, size.height * 0.32),
      Offset(size.width * 0.75, size.height * 0.45),
      Offset(size.width * 0.55, size.height * 0.52),
      Offset(size.width * 0.38, size.height * 0.48),
      Offset(size.width * 0.22, size.height * 0.55),
    ];

    // Draw constellation connections (lines between stars)
    final linePaint = Paint()
      ..color = accentColor.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final connections = [
      [0, 1], [1, 2], [2, 3], [3, 4], [4, 5],
      [3, 6], [6, 7], [7, 8], [8, 9], [8, 0],
    ];

    for (final conn in connections) {
      canvas.drawLine(
        constellationStars[conn[0]],
        constellationStars[conn[1]],
        linePaint,
      );
    }

    // Draw constellation stars with glow
    for (int i = 0; i < constellationStars.length; i++) {
      final pos = constellationStars[i];
      final isKey = i == 2 || i == 5 || i == 7; // Key stars are bigger
      
      // Outer glow
      for (int g = 3; g >= 0; g--) {
        final glowPaint = Paint()
          ..color = accentColor.withOpacity(0.08 - g * 0.015)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(pos, (isKey ? 12 : 8) + g * 3, glowPaint);
      }
      
      // Star core
      final starCorePaint = Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.white,
            accentColor.withOpacity(0.9),
          ],
        ).createShader(Rect.fromCircle(center: pos, radius: isKey ? 4 : 3));
      canvas.drawCircle(pos, isKey ? 4 : 3, starCorePaint);
    }

    // Central glowing figure silhouette (person reaching up)
    final figureX = size.width * 0.5;
    final figureY = size.height * 0.85;
    
    final figurePaint = Paint()
      ..color = const Color(0xFF0D0D1A).withOpacity(0.9)
      ..style = PaintingStyle.fill;
    
    // Figure silhouette - person with arms raised
    final figurePath = Path();
    // Head
    canvas.drawCircle(Offset(figureX, figureY - 28), 5, figurePaint);
    
    // Body and arms
    figurePath.moveTo(figureX - 8, figureY);
    figurePath.lineTo(figureX - 4, figureY - 22);
    figurePath.lineTo(figureX - 12, figureY - 35); // Left arm up
    figurePath.lineTo(figureX - 10, figureY - 37);
    figurePath.lineTo(figureX - 3, figureY - 24);
    figurePath.lineTo(figureX, figureY - 22);
    figurePath.lineTo(figureX + 3, figureY - 24);
    figurePath.lineTo(figureX + 10, figureY - 37); // Right arm up
    figurePath.lineTo(figureX + 12, figureY - 35);
    figurePath.lineTo(figureX + 4, figureY - 22);
    figurePath.lineTo(figureX + 8, figureY);
    figurePath.close();
    canvas.drawPath(figurePath, figurePaint);

    // Glow around figure (connection to stars)
    final figureGlowPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [
          accentColor.withOpacity(0.15),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(figureX, figureY - 20), radius: 40));
    canvas.drawCircle(Offset(figureX, figureY - 20), 35, figureGlowPaint);

    // Light beams from figure to key constellation stars
    final beamPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          accentColor.withOpacity(0.2),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    
    canvas.drawLine(Offset(figureX - 10, figureY - 35), constellationStars[2], beamPaint);
    canvas.drawLine(Offset(figureX + 10, figureY - 35), constellationStars[5], beamPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Pre-configured sub-header for the Archetypes/Constellation tab
class ConstellationSubHeader extends StatelessWidget {
  const ConstellationSubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SubHeader(
      title: 'Your Archetype Constellation',
      purpose: 'The archetypal energies that shape your inner world',
      backgroundPainter: ConstellationBackgroundPainter(
        isDark: isDark,
        primaryColor: theme.colorScheme.primary,
        accentColor: const Color(0xFFA78BFA), // Purple/violet accent for archetypes
      ),
    );
  }
}

/// Custom painter for the Psyche/Identity tab sub-header background
/// Depicts a layered mind with interconnected structures representing psychological positions
class PsycheBackgroundPainter extends CustomPainter {
  final bool isDark;
  final Color primaryColor;
  final Color accentColor;

  PsycheBackgroundPainter({
    required this.isDark,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(77);
    
    // Deep psychological gradient - warm to cool representing conscious to unconscious
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [
                const Color(0xFF1A0F2E), // Deep purple-black
                const Color(0xFF2D1B4E), // Rich purple
                const Color(0xFF1E3A5F), // Deep blue
                const Color(0xFF0D1B2A), // Dark navy
              ]
            : [
                const Color(0xFF4A1D96), // Vivid purple
                const Color(0xFF6B21A8), // Purple
                const Color(0xFF1E40AF), // Blue
                const Color(0xFF1E3A8A), // Deep blue
              ],
        stops: const [0.0, 0.35, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Nebula/consciousness glow - representing the psyche
    final nebulaGlow1 = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.0, -0.2),
        radius: 1.0,
        colors: [
          accentColor.withOpacity(0.25),
          primaryColor.withOpacity(0.1),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), nebulaGlow1);

    // Second glow - warmer tones
    final nebulaGlow2 = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.6, 0.3),
        radius: 0.7,
        colors: [
          const Color(0xFFEC4899).withOpacity(0.15), // Pink for feeling
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), nebulaGlow2);

    // Scattered particles representing thoughts/memories
    final particlePaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    
    for (int i = 0; i < 50; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.0 + 0.3;
      canvas.drawCircle(Offset(x, y), radius, particlePaint);
    }

    // Central psyche structure - layered circles representing different levels
    final centerX = size.width * 0.5;
    final centerY = size.height * 0.45;
    
    // Outer layer - Persona (how we present to the world)
    for (int i = 4; i >= 0; i--) {
      final layerPaint = Paint()
        ..color = const Color(0xFF6366F1).withOpacity(0.06 - i * 0.01)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(centerX, centerY), 70 + i * 8, layerPaint);
    }
    
    // Middle layer - Ego (conscious self)
    for (int i = 3; i >= 0; i--) {
      final layerPaint = Paint()
        ..color = const Color(0xFF7C3AED).withOpacity(0.1 - i * 0.02)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(centerX, centerY), 45 + i * 6, layerPaint);
    }
    
    // Inner layer - Shadow (unconscious)
    for (int i = 2; i >= 0; i--) {
      final layerPaint = Paint()
        ..color = const Color(0xFF1F2937).withOpacity(0.15 - i * 0.04)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(centerX, centerY), 25 + i * 4, layerPaint);
    }
    
    // Core - Self (integration point)
    final corePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withOpacity(0.9),
          accentColor.withOpacity(0.6),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(centerX, centerY), radius: 12));
    canvas.drawCircle(Offset(centerX, centerY), 10, corePaint);

    // Connecting lines representing psychological dynamics
    final linePaint = Paint()
      ..color = accentColor.withOpacity(0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Ego to Persona connection
    canvas.drawLine(
      Offset(centerX, centerY - 45),
      Offset(centerX, centerY - 70),
      linePaint,
    );
    
    // Ego to Shadow connection
    canvas.drawLine(
      Offset(centerX, centerY + 25),
      Offset(centerX, centerY + 50),
      linePaint,
    );
    
    // Feeling function connections (left side - traditionally feminine/anima)
    canvas.drawLine(
      Offset(centerX - 35, centerY),
      Offset(centerX - 60, centerY + 15),
      linePaint..color = const Color(0xFFEC4899).withOpacity(0.3),
    );
    
    // Eros axis connections (right side - vitality/life force)
    canvas.drawLine(
      Offset(centerX + 35, centerY),
      Offset(centerX + 60, centerY - 10),
      linePaint..color = const Color(0xFFF59E0B).withOpacity(0.3),
    );

    // Position markers with glowing dots
    final positions = [
      (Offset(centerX, centerY - 75), const Color(0xFF6366F1), 'Persona'),
      (Offset(centerX, centerY + 55), const Color(0xFF4B5563), 'Shadow'),
      (Offset(centerX - 65, centerY + 20), const Color(0xFFEC4899), 'Feeling'),
      (Offset(centerX + 65, centerY - 15), const Color(0xFFF59E0B), 'Eros'),
    ];
    
    for (final (pos, color, _) in positions) {
      // Glow
      for (int g = 3; g >= 0; g--) {
        canvas.drawCircle(
          pos,
          6 + g * 2,
          Paint()..color = color.withOpacity(0.08 - g * 0.015),
        );
      }
      // Core
      canvas.drawCircle(pos, 4, Paint()..color = color);
      canvas.drawCircle(pos, 2, Paint()..color = Colors.white.withOpacity(0.8));
    }

    // Shadow figure silhouette at bottom - representing the observer
    final figureX = size.width * 0.18;
    final figureY = size.height * 0.88;
    
    final figurePaint = Paint()
      ..color = const Color(0xFF0D0D1A).withOpacity(0.85)
      ..style = PaintingStyle.fill;
    
    // Head
    canvas.drawCircle(Offset(figureX, figureY - 22), 5, figurePaint);
    
    // Body
    final bodyPath = Path()
      ..moveTo(figureX - 6, figureY)
      ..lineTo(figureX - 3, figureY - 16)
      ..lineTo(figureX + 3, figureY - 16)
      ..lineTo(figureX + 6, figureY)
      ..close();
    canvas.drawPath(bodyPath, figurePaint);
    
    // Peeking eyes on the figure
    final eyeGlow = Paint()..color = accentColor.withOpacity(0.6);
    canvas.drawCircle(Offset(figureX - 2, figureY - 22), 1.5, eyeGlow);
    canvas.drawCircle(Offset(figureX + 2, figureY - 22), 1.5, eyeGlow);
    canvas.drawCircle(Offset(figureX - 2, figureY - 22), 0.8, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(figureX + 2, figureY - 22), 0.8, Paint()..color = Colors.white);

    // Light beam from figure to psyche center
    final beamPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          accentColor.withOpacity(0.15),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(figureX, figureY - 30, centerX - figureX, centerY - (figureY - 30)))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    
    canvas.drawLine(
      Offset(figureX + 5, figureY - 20),
      Offset(centerX - 10, centerY + 5),
      beamPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Pre-configured sub-header for the Identity/Psyche tab
class PsycheSubHeader extends StatelessWidget {
  const PsycheSubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SubHeader(
      title: 'Your Psyche Structure',
      purpose: 'The characters that embody different aspects of your psychological landscape',
      backgroundPainter: PsycheBackgroundPainter(
        isDark: isDark,
        primaryColor: theme.colorScheme.primary,
        accentColor: const Color(0xFF7C3AED), // Purple accent for psyche
      ),
    );
  }
}

/// Custom painter for the Scenarios tab sub-header background
/// Depicts a crossroads/decision point scene with multiple paths and watching figures
class ScenariosBackgroundPainter extends CustomPainter {
  final bool isDark;
  final Color primaryColor;
  final Color accentColor;

  ScenariosBackgroundPainter({
    required this.isDark,
    required this.primaryColor,
    required this.accentColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(99);
    
    // Dramatic sky with warm/cool tension
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: isDark
            ? [
                const Color(0xFF1A0A1E), // Dark magenta-purple
                const Color(0xFF2D1535), // Deep purple
                const Color(0xFF1E2A3A), // Blue-gray
                const Color(0xFF0D1520), // Dark navy
              ]
            : [
                const Color(0xFF7C2D9B), // Vivid purple
                const Color(0xFF6D28D9), // Purple
                const Color(0xFF2563EB), // Blue
                const Color(0xFF1E40AF), // Deep blue
              ],
        stops: const [0.0, 0.35, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Dramatic clouds/mist
    for (int i = 0; i < 6; i++) {
      final cloudX = random.nextDouble() * size.width;
      final cloudY = random.nextDouble() * size.height * 0.4;
      final cloudWidth = 60 + random.nextDouble() * 80;
      final cloudHeight = 20 + random.nextDouble() * 30;
      
      final cloudPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.transparent,
          ],
        ).createShader(Rect.fromCenter(center: Offset(cloudX, cloudY), width: cloudWidth, height: cloudHeight));
      
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cloudX, cloudY), width: cloudWidth, height: cloudHeight),
        cloudPaint,
      );
    }

    // Ground - barren crossroads area
    final groundPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.68, size.width * 0.5, size.height * 0.72)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.68, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..close();
    
    final groundPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark 
            ? [const Color(0xFF1A1520), const Color(0xFF0D0A10)]
            : [const Color(0xFF2D1B4E), const Color(0xFF1A0F2E)],
      ).createShader(Rect.fromLTWH(0, size.height * 0.65, size.width, size.height * 0.35));
    canvas.drawPath(groundPath, groundPaint);

    // Multiple diverging paths - representing choices
    final pathPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Left path (challenge)
    pathPaint.shader = LinearGradient(
      colors: [const Color(0xFFEF4444).withOpacity(0.4), Colors.transparent],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final leftPath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.75, size.width * 0.05, size.height * 0.6);
    canvas.drawPath(leftPath, pathPaint);

    // Right path (growth)
    pathPaint.shader = LinearGradient(
      colors: [const Color(0xFF10B981).withOpacity(0.4), Colors.transparent],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final rightPath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.75, size.width * 0.95, size.height * 0.6);
    canvas.drawPath(rightPath, pathPaint);

    // Center path (straight ahead - the balanced way)
    pathPaint.shader = LinearGradient(
      colors: [accentColor.withOpacity(0.5), Colors.transparent],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    final centerPath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.85)
      ..lineTo(size.width * 0.5, size.height * 0.4);
    canvas.drawPath(centerPath, pathPaint);

    // Crossroads marker/signpost
    final signpostPaint = Paint()..color = const Color(0xFF0A0A15);
    canvas.drawRect(
      Rect.fromCenter(center: Offset(size.width * 0.5, size.height * 0.7), width: 6, height: 50),
      signpostPaint,
    );
    
    // Signs pointing different directions
    final signLeft = Path()
      ..moveTo(size.width * 0.5 - 3, size.height * 0.55)
      ..lineTo(size.width * 0.5 - 35, size.height * 0.52)
      ..lineTo(size.width * 0.5 - 40, size.height * 0.55)
      ..lineTo(size.width * 0.5 - 35, size.height * 0.58)
      ..lineTo(size.width * 0.5 - 3, size.height * 0.58)
      ..close();
    canvas.drawPath(signLeft, signpostPaint);
    
    final signRight = Path()
      ..moveTo(size.width * 0.5 + 3, size.height * 0.52)
      ..lineTo(size.width * 0.5 + 35, size.height * 0.49)
      ..lineTo(size.width * 0.5 + 40, size.height * 0.52)
      ..lineTo(size.width * 0.5 + 35, size.height * 0.55)
      ..lineTo(size.width * 0.5 + 3, size.height * 0.55)
      ..close();
    canvas.drawPath(signRight, signpostPaint);

    // Figure silhouette standing at crossroads
    final figureX = size.width * 0.5;
    final figureY = size.height * 0.82;
    
    final figurePaint = Paint()
      ..color = const Color(0xFF0A0A15)
      ..style = PaintingStyle.fill;
    
    // Head
    canvas.drawCircle(Offset(figureX, figureY - 28), 6, figurePaint);
    
    // Body
    final bodyPath = Path()
      ..moveTo(figureX - 8, figureY)
      ..lineTo(figureX - 4, figureY - 21)
      ..lineTo(figureX + 4, figureY - 21)
      ..lineTo(figureX + 8, figureY)
      ..close();
    canvas.drawPath(bodyPath, figurePaint);

    // Peeking eyes
    final eyeGlow = Paint()..color = accentColor.withOpacity(0.8);
    canvas.drawCircle(Offset(figureX - 2.5, figureY - 28), 2, eyeGlow);
    canvas.drawCircle(Offset(figureX + 2.5, figureY - 28), 2, eyeGlow);
    canvas.drawCircle(Offset(figureX - 2.5, figureY - 28), 1, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(figureX + 2.5, figureY - 28), 1, Paint()..color = Colors.white);

    // Shadow figures watching from paths - representing past choices/possibilities
    _drawWatchingFigure(canvas, size.width * 0.15, size.height * 0.65, 0.7, const Color(0xFFEF4444));
    _drawWatchingFigure(canvas, size.width * 0.85, size.height * 0.65, 0.7, const Color(0xFF10B981));
    _drawWatchingFigure(canvas, size.width * 0.5, size.height * 0.45, 0.5, accentColor);

    // Atmospheric particles
    for (int i = 0; i < 20; i++) {
      final px = random.nextDouble() * size.width;
      final py = random.nextDouble() * size.height * 0.6;
      final opacity = random.nextDouble() * 0.3 + 0.1;
      canvas.drawCircle(Offset(px, py), 1 + random.nextDouble(), Paint()..color = Colors.white.withOpacity(opacity));
    }
  }

  void _drawWatchingFigure(Canvas canvas, double x, double y, double scale, Color glowColor) {
    final figurePaint = Paint()..color = const Color(0xFF0A0A15).withOpacity(0.7);
    
    // Head
    canvas.drawCircle(Offset(x, y - 15 * scale), 4 * scale, figurePaint);
    
    // Body silhouette
    final bodyPath = Path()
      ..moveTo(x - 5 * scale, y)
      ..lineTo(x - 3 * scale, y - 12 * scale)
      ..lineTo(x + 3 * scale, y - 12 * scale)
      ..lineTo(x + 5 * scale, y)
      ..close();
    canvas.drawPath(bodyPath, figurePaint);
    
    // Eyes
    canvas.drawCircle(Offset(x - 1.5 * scale, y - 15 * scale), 1.2 * scale, Paint()..color = glowColor.withOpacity(0.6));
    canvas.drawCircle(Offset(x + 1.5 * scale, y - 15 * scale), 1.2 * scale, Paint()..color = glowColor.withOpacity(0.6));
    canvas.drawCircle(Offset(x - 1.5 * scale, y - 15 * scale), 0.6 * scale, Paint()..color = Colors.white.withOpacity(0.8));
    canvas.drawCircle(Offset(x + 1.5 * scale, y - 15 * scale), 0.6 * scale, Paint()..color = Colors.white.withOpacity(0.8));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Pre-configured sub-header for the Scenarios tab
class ScenariosSubHeader extends StatelessWidget {
  const ScenariosSubHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SubHeader(
      title: 'Life Scenarios',
      purpose: 'Real situations where your patterns play out - and how to navigate them authentically',
      backgroundPainter: ScenariosBackgroundPainter(
        isDark: isDark,
        primaryColor: theme.colorScheme.primary,
        accentColor: const Color(0xFFF59E0B), // Amber accent for scenarios/decisions
      ),
    );
  }
}
