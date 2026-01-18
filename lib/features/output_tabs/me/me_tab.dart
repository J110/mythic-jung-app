import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../story/story_tab.dart';
import '../identification/identification_tab.dart';
import '../scenarios/scenarios_tab.dart';
import '../affirmations/affirmations_tab.dart';
import '../constellation/constellation_tab.dart';
import '../../../core/storage/repositories.dart';
import '../../shared/tone_selector.dart';
import '../../shared/redesign/redesign.dart';

class MeTab extends ConsumerStatefulWidget {
  const MeTab({super.key});

  @override
  ConsumerState<MeTab> createState() => _MeTabState();
}

class _MeTabState extends ConsumerState<MeTab> {
  int _selectedTabIndex = 0;

  // Functioning tab merged into Story tab
  final List<TabPillConfig> _tabConfigs = const [
    TabPillConfig(label: 'Story', icon: Icons.auto_stories),
    TabPillConfig(label: 'Archetypes', icon: Icons.auto_awesome),
    TabPillConfig(label: 'Psyche', icon: Icons.psychology),
    TabPillConfig(label: 'Scenarios', icon: Icons.theater_comedy),
    TabPillConfig(label: 'Affirmations', icon: Icons.auto_awesome),
  ];

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const StoryTab(embedded: true); // Now includes Functioning content
      case 1:
        return const ConstellationTab(embedded: true, isRelationship: false);
      case 2:
        return const IdentificationTab(embedded: true);
      case 3:
        return const ScenariosTab(embedded: true);
      case 4:
        return const AffirmationsTab(embedded: true);
      default:
        return const StoryTab(embedded: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          // Full-width illustrated Page Header
          PageHeader(
            title: 'Your Inner World',
            tagline: 'Discover the mythic patterns and archetypal energies that shape who you are',
            tabs: _tabConfigs,
            selectedTabIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            backgroundPainter: MeHeaderBackgroundPainter(isDark: isDark),
            height: 320,
            actions: [
              // Tone selector
              const ToneSelector(compact: true),
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                ),
                tooltip: 'Edit Characters',
                onPressed: () {
                  context.push('/characters');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                tooltip: 'Regenerate',
                onPressed: () {
                  ref.read(outputRepositoryProvider.notifier).regenerate();
                },
              ),
            ],
          ),

          // Tab content
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildTabContent(),
            ),
          ),
        ],
      ),
    );
  }
}
