import 'package:go_router/go_router.dart';
import '../features/onboarding/welcome_screen.dart';
import '../features/onboarding/character_entry_screen.dart';
import '../features/output_tabs/home_screen.dart';

final router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/characters',
      builder: (context, state) => const CharacterEntryScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
