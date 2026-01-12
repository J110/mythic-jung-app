import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  Widget build(BuildContext context) {
    final relationshipAsync = ref.watch(relationshipRepositoryProvider);
    final isRelationshipEnabled = relationshipAsync.valueOrNull?.enabled ?? false;
    
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
                child: Icon(
                  Icons.auto_awesome,
                  size: 32,
                  color: Theme.of(context).colorScheme.primary,
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
