import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'me/me_tab.dart';
import 'relationship/relationship_tab.dart';
import '../../features/assessment/assessment_tab.dart';
import '../../core/storage/repositories.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  void _showUserMenu(BuildContext context) {
    final sessionState = ref.read(userSessionProvider);
    final user = sessionState.user;
    
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // User info header
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      (user?.displayName ?? 'U').substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.displayName ?? 'User',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@${user?.username ?? 'unknown'}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Re-enter characters option
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Re-enter Characters'),
              subtitle: const Text('Start fresh with new characters'),
              onTap: () async {
                Navigator.pop(context);
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Re-enter Characters?'),
                    content: const Text(
                      'This will clear your current analysis and let you enter new characters. Your account will be preserved.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Continue'),
                      ),
                    ],
                  ),
                );
                if (confirm == true && mounted) {
                  await ref.read(userSessionProvider.notifier).clearDataAndStartFresh();
                  if (mounted) {
                    context.go('/characters');
                  }
                }
              },
            ),
            // Logout option
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Switch User', style: TextStyle(color: Colors.red)),
              subtitle: const Text('Login with a different username'),
              onTap: () async {
                Navigator.pop(context);
                await ref.read(userSessionProvider.notifier).logout();
                if (mounted) {
                  context.go('/login');
                }
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final relationshipAsync = ref.watch(relationshipRepositoryProvider);
    final isRelationshipEnabled = relationshipAsync.valueOrNull?.enabled ?? false;
    final sessionState = ref.watch(userSessionProvider);
    
    final tabs = <Widget>[
      const MeTab(),
      if (isRelationshipEnabled) const RelationshipTab(),
      const AssessmentTab(),
    ];
    
    final destinations = <NavigationDestination>[
      const NavigationDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: 'Me',
      ),
      if (isRelationshipEnabled)
        const NavigationDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: 'Relations',
        ),
      const NavigationDestination(
        icon: Icon(Icons.quiz_outlined),
        selectedIcon: Icon(Icons.quiz),
        label: 'Assessments',
      ),
    ];
    
    final railDestinations = <NavigationRailDestination>[
      const NavigationRailDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: Text('Me'),
      ),
      if (isRelationshipEnabled)
        const NavigationRailDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: Text('Relations'),
        ),
      const NavigationRailDestination(
        icon: Icon(Icons.quiz_outlined),
        selectedIcon: Icon(Icons.quiz),
        label: Text('Assessments'),
      ),
    ];
    
    // Ensure current index is valid
    if (_currentIndex >= tabs.length) {
      _currentIndex = 0;
    }
    
    final isWeb = MediaQuery.of(context).size.width > 600;

    // User avatar button
    Widget userButton = IconButton(
      icon: CircleAvatar(
        radius: 16,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Text(
          (sessionState.user?.displayName ?? 'U').substring(0, 1).toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () => _showUserMenu(context),
      tooltip: sessionState.user?.displayName ?? 'User menu',
    );

    if (isWeb) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      size: 32,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    userButton,
                  ],
                ),
              ),
              destinations: railDestinations,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: tabs[_currentIndex],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 
              ? 'Me' 
              : _currentIndex == 1 && isRelationshipEnabled 
                  ? 'Relations' 
                  : 'Assessments',
        ),
        actions: [
          userButton,
          const SizedBox(width: 8),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: destinations,
      ),
    );
  }
}
