import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Full-width illustrated background for the Me page header
/// Features: night sky, constellation, mirror silhouette, mystical atmosphere
class MeHeaderBackgroundPainter extends CustomPainter {
  final bool isDark;

  MeHeaderBackgroundPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    // Deep mystical sky gradient
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0D0221), // Deep purple-black
          const Color(0xFF1A0A2E), // Dark purple
          const Color(0xFF2D1B4E), // Mystical purple
          const Color(0xFF1E1B2E), // Fade to app background
        ],
        stops: const [0.0, 0.3, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    final random = math.Random(42);

    // Distant stars (small, twinkling)
    final starPaint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;
    
    for (int i = 0; i < 80; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.7;
      final radius = random.nextDouble() * 1.2 + 0.3;
      final opacity = random.nextDouble() * 0.5 + 0.3;
      starPaint.color = Colors.white.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, starPaint);
    }

    // Constellation pattern (representing inner world mapping)
    _drawConstellation(canvas, size);

    // Mystical glow orb (representing the self/mirror)
    _drawMysticalOrb(canvas, size);

    // Subtle mountain/landscape silhouette at bottom
    _drawLandscapeSilhouette(canvas, size);

    // Floating particles/energy
    _drawFloatingParticles(canvas, size, random);
  }

  void _drawConstellation(Canvas canvas, Size size) {
    final constellationPaint = Paint()
      ..color = const Color(0xFF7C3AED).withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final starPaint = Paint()
      ..color = const Color(0xFFD4AF37) // Gold stars
      ..style = PaintingStyle.fill;

    // Define constellation points (percentage-based for responsiveness)
    final points = [
      Offset(size.width * 0.15, size.height * 0.25),
      Offset(size.width * 0.25, size.height * 0.15),
      Offset(size.width * 0.35, size.height * 0.22),
      Offset(size.width * 0.30, size.height * 0.35),
      Offset(size.width * 0.20, size.height * 0.38),
      // Right side constellation
      Offset(size.width * 0.70, size.height * 0.18),
      Offset(size.width * 0.80, size.height * 0.12),
      Offset(size.width * 0.85, size.height * 0.25),
      Offset(size.width * 0.75, size.height * 0.30),
    ];

    // Draw constellation lines (left group)
    canvas.drawLine(points[0], points[1], constellationPaint);
    canvas.drawLine(points[1], points[2], constellationPaint);
    canvas.drawLine(points[2], points[3], constellationPaint);
    canvas.drawLine(points[3], points[4], constellationPaint);
    canvas.drawLine(points[4], points[0], constellationPaint);
    canvas.drawLine(points[0], points[3], constellationPaint);

    // Draw constellation lines (right group)
    canvas.drawLine(points[5], points[6], constellationPaint);
    canvas.drawLine(points[6], points[7], constellationPaint);
    canvas.drawLine(points[7], points[8], constellationPaint);
    canvas.drawLine(points[8], points[5], constellationPaint);

    // Draw stars at constellation points
    for (final point in points) {
      canvas.drawCircle(point, 3, starPaint);
      // Glow effect
      final glowPaint = Paint()
        ..color = const Color(0xFFD4AF37).withOpacity(0.3)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(point, 6, glowPaint);
    }
  }

  void _drawMysticalOrb(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.45);
    final radius = size.width * 0.12;

    // Outer glow
    for (int i = 4; i >= 0; i--) {
      final glowPaint = Paint()
        ..color = const Color(0xFF7C3AED).withOpacity(0.1 - i * 0.02)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, radius + i * 15, glowPaint);
    }

    // Mirror frame (oval)
    final framePaint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    
    final mirrorRect = Rect.fromCenter(
      center: center,
      width: radius * 1.4,
      height: radius * 1.8,
    );
    canvas.drawOval(mirrorRect, framePaint);

    // Inner mirror glow
    final innerGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFF7C3AED).withOpacity(0.4),
          const Color(0xFF7C3AED).withOpacity(0.1),
          Colors.transparent,
        ],
      ).createShader(mirrorRect);
    canvas.drawOval(mirrorRect.deflate(4), innerGlow);

    // Small stars inside mirror (representing inner constellation)
    final innerStarPaint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..style = PaintingStyle.fill;
    
    final innerPoints = [
      Offset(center.dx - 8, center.dy - 15),
      Offset(center.dx + 10, center.dy - 8),
      Offset(center.dx - 5, center.dy + 5),
      Offset(center.dx + 6, center.dy + 12),
      Offset(center.dx, center.dy + 20),
    ];
    
    for (final point in innerPoints) {
      canvas.drawCircle(point, 2, innerStarPaint);
    }

    // Connect inner stars
    final innerLinePaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    
    canvas.drawLine(innerPoints[0], innerPoints[1], innerLinePaint);
    canvas.drawLine(innerPoints[1], innerPoints[2], innerLinePaint);
    canvas.drawLine(innerPoints[2], innerPoints[3], innerLinePaint);
    canvas.drawLine(innerPoints[3], innerPoints[4], innerLinePaint);

    // Mirror handle
    final handlePaint = Paint()
      ..color = const Color(0xFFD4AF37).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    
    canvas.drawLine(
      Offset(center.dx, center.dy + radius * 0.9),
      Offset(center.dx, center.dy + radius * 1.3),
      handlePaint,
    );
  }

  void _drawLandscapeSilhouette(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0D0221).withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    
    // Gentle rolling hills
    path.lineTo(0, size.height * 0.88);
    path.quadraticBezierTo(
      size.width * 0.15, size.height * 0.82,
      size.width * 0.25, size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.4, size.height * 0.9,
      size.width * 0.5, size.height * 0.86,
    );
    path.quadraticBezierTo(
      size.width * 0.65, size.height * 0.8,
      size.width * 0.75, size.height * 0.84,
    );
    path.quadraticBezierTo(
      size.width * 0.9, size.height * 0.9,
      size.width, size.height * 0.85,
    );
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Subtle tree silhouettes
    final treePaint = Paint()
      ..color = const Color(0xFF0D0221)
      ..style = PaintingStyle.fill;
    
    _drawTree(canvas, Offset(size.width * 0.1, size.height * 0.88), 20, treePaint);
    _drawTree(canvas, Offset(size.width * 0.18, size.height * 0.86), 25, treePaint);
    _drawTree(canvas, Offset(size.width * 0.82, size.height * 0.87), 22, treePaint);
    _drawTree(canvas, Offset(size.width * 0.9, size.height * 0.85), 28, treePaint);
  }

  void _drawTree(Canvas canvas, Offset base, double height, Paint paint) {
    final path = Path();
    path.moveTo(base.dx, base.dy);
    path.lineTo(base.dx - height * 0.3, base.dy);
    path.lineTo(base.dx, base.dy - height);
    path.lineTo(base.dx + height * 0.3, base.dy);
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawFloatingParticles(Canvas canvas, Size size, math.Random random) {
    final particlePaint = Paint()
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 15; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height * 0.75;
      final radius = random.nextDouble() * 2 + 1;
      final opacity = random.nextDouble() * 0.4 + 0.1;
      
      particlePaint.color = const Color(0xFF7C3AED).withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// A pill-shaped tab button for the tab bar
class TabPill extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback onTap;

  const TabPill({
    super.key,
    required this.label,
    this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary
              : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.9),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Main page header widget with full-width illustrated background
class PageHeader extends StatelessWidget {
  final String title;
  final String tagline;
  final List<TabPillConfig> tabs;
  final int selectedTabIndex;
  final ValueChanged<int> onTabSelected;
  final List<Widget>? actions;
  final CustomPainter? backgroundPainter;
  final double height;

  const PageHeader({
    super.key,
    required this.title,
    required this.tagline,
    required this.tabs,
    required this.selectedTabIndex,
    required this.onTabSelected,
    this.actions,
    this.backgroundPainter,
    this.height = 320,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // Full-width illustrated background
          Positioned.fill(
            child: CustomPaint(
              painter: backgroundPainter ?? MeHeaderBackgroundPainter(isDark: isDark),
              size: Size.infinite,
            ),
          ),

          // Content overlay
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // Top row with actions
                  if (actions != null && actions!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actions!,
                      ),
                    )
                  else
                    const SizedBox(height: 16),
                  
                  const Spacer(),
                  
                  // Title
                  Text(
                    title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Tagline
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      tagline,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.85),
                        height: 1.4,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Tab pills
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(tabs.length, (index) {
                        final tab = tabs[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index < tabs.length - 1 ? 8 : 0,
                          ),
                          child: TabPill(
                            label: tab.label,
                            icon: tab.icon,
                            isSelected: selectedTabIndex == index,
                            onTap: () => onTabSelected(index),
                          ),
                        );
                      }),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Configuration for a tab pill
class TabPillConfig {
  final String label;
  final IconData? icon;

  const TabPillConfig({
    required this.label,
    this.icon,
  });
}

/// Pre-built header for the "Me" page (kept for backwards compatibility)
class MePageHeaderIcon extends StatelessWidget {
  const MePageHeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // This is now deprecated - use PageHeader with MeHeaderBackgroundPainter
    return const SizedBox.shrink();
  }
}
