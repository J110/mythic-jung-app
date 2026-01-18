import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/redesign/welcome_illustrations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    
    return Scaffold(
      body: Stack(
        children: [
          // === FULL-SCREEN ILLUSTRATED BACKGROUND ===
          Positioned.fill(
            child: CustomPaint(
              painter: WelcomeScenePainter(isDark: true),
              size: Size.infinite,
            ),
          ),
          
          // === CONTENT OVERLAY ===
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 3),
                
                // === TITLE SECTION ===
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      // Main title
                      Text(
                        'Welcome to Bliss',
                        style: theme.textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                          shadows: [
                            Shadow(
                              offset: const Offset(2, 2),
                              blurRadius: 8,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Subtitle
                      Text(
                        'Discover your inner mythology through\ncharacter-based Jungian exploration.',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.85),
                          height: 1.6,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                
                const Spacer(flex: 5),
                
                // === BOTTOM SECTION ===
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                  child: Column(
                    children: [
                      // Mindful reminder (subtle)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.self_improvement,
                              color: Colors.white.withOpacity(0.7),
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'A reflective journey, not a clinical assessment',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // GET STARTED BUTTON (matching the inspiration)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.go('/characters'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7C8CFF).withOpacity(0.85),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'GET STARTED',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
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
}
