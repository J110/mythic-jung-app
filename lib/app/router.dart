import 'package:go_router/go_router.dart';
import '../features/onboarding/login_screen.dart';
import '../features/onboarding/welcome_screen.dart';
import '../features/onboarding/character_entry_screen.dart';
import '../features/onboarding/clarification_screen.dart';
import '../features/output_tabs/home_screen.dart';
import '../core/models/resonance.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/characters',
      builder: (context, state) => const CharacterEntryScreen(),
    ),
    GoRoute(
      path: '/clarification',
      builder: (context, state) {
        final extra = state.extra;
        
        // Handle new format with character ownership context
        if (extra is Map<String, dynamic>) {
          final response = extra['response'] as ResonanceAnalysisResponse?;
          if (response == null) {
            return const CharacterEntryScreen();
          }
          return ClarificationScreen(
            analysisResponse: response,
            meCount: extra['meCount'] as int? ?? response.characters.length,
            otherCount: extra['otherCount'] as int? ?? 0,
            relationshipEnabled: extra['relationshipEnabled'] as bool? ?? false,
            relationshipType: extra['relationshipType'] as String?,
          );
        }
        
        // Legacy format (ResonanceAnalysisResponse directly)
        final analysisResponse = extra as ResonanceAnalysisResponse?;
        if (analysisResponse == null) {
          return const CharacterEntryScreen();
        }
        return ClarificationScreen(
          analysisResponse: analysisResponse,
          meCount: analysisResponse.characters.length,
          otherCount: 0,
          relationshipEnabled: false,
        );
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
