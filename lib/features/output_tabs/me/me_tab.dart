import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../story/story_tab.dart';
import '../identification/identification_tab.dart';
import '../functioning/functioning_tab.dart';
import '../actions/actions_tab.dart';
import '../life_domains/life_domains_tab.dart';
import '../../../core/storage/repositories.dart';
import '../../../app/theme/app_theme.dart';

class MeTab extends ConsumerStatefulWidget {
  const MeTab({super.key});

  @override
  ConsumerState<MeTab> createState() => _MeTabState();
}

class _MeTabState extends ConsumerState<MeTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<_TabItem> _tabItems = const [
    _TabItem(title: 'Story', icon: Icons.auto_stories),
    _TabItem(title: 'Identity', icon: Icons.person),
    _TabItem(title: 'Functioning', icon: Icons.psychology),
    _TabItem(title: 'Actions', icon: Icons.directions_run),
    _TabItem(title: 'Life', icon: Icons.domain),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabItems.length, vsync: this);
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
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text('My Mythic Self'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit Characters',
            onPressed: () {
              context.push('/characters');
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Regenerate',
            onPressed: () {
              ref.read(outputRepositoryProvider.notifier).regenerate();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          indicatorColor: theme.colorScheme.primary,
          tabs: _tabItems.map((item) => Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.icon, size: 18),
                const SizedBox(width: 6),
                Text(item.title),
              ],
            ),
          )).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          StoryTab(embedded: true),
          IdentificationTab(embedded: true),
          FunctioningTab(embedded: true),
          ActionsTab(embedded: true),
          LifeDomainsTab(embedded: true),
        ],
      ),
    );
  }
}

class _TabItem {
  final String title;
  final IconData icon;

  const _TabItem({required this.title, required this.icon});
}
