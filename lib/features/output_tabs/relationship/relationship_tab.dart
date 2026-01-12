import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/relationship.dart';
import '../../../core/utils/constants.dart';

class RelationshipTab extends ConsumerStatefulWidget {
  const RelationshipTab({super.key});

  @override
  ConsumerState<RelationshipTab> createState() => _RelationshipTabState();
}

class _RelationshipTabState extends ConsumerState<RelationshipTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedType = AppConstants.relationshipTypePlatonic;

  final List<_ModuleInfo> _modules = const [
    _ModuleInfo('Myth', Icons.auto_stories, 'myth'),
    _ModuleInfo('Field', Icons.blur_on, 'relationalField'),
    _ModuleInfo('Bonding', Icons.favorite, 'attractionBonding'),
    _ModuleInfo('Shadow', Icons.contrast, 'projectionShadow'),
    _ModuleInfo('Masks', Icons.masks, 'egoPersonaMismatch'),
    _ModuleInfo('Conflict', Icons.message, 'communicationConflict'),
    _ModuleInfo('Needs', Icons.lock, 'needsBoundaries'),
    _ModuleInfo('Growth', Icons.trending_up, 'growthPath'),
    _ModuleInfo('Flags', Icons.flag, 'redFlagsRepair'),
    _ModuleInfo('Next', Icons.directions, 'nextSteps'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _modules.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _changeRelationshipType(String type) {
    if (type != _selectedType) {
      setState(() => _selectedType = type);
      ref.read(relationshipRepositoryProvider.notifier).updateRelationshipType(type);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final relationshipAsync = ref.watch(relationshipRepositoryProvider);
    final outputAsync = ref.watch(relationshipOutputRepositoryProvider);

    return relationshipAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _buildErrorState(context, e.toString()),
      data: (relationship) {
        if (relationship == null || !relationship.enabled) {
          return _buildNotEnabledState(context);
        }

        _selectedType = relationship.relationshipType;

        return outputAsync.when(
          loading: () => _buildLoadingState(context),
          error: (e, _) => _buildErrorState(context, e.toString()),
          data: (output) {
            if (output == null) {
              return _buildGeneratingState(context);
            }
            return _buildContent(context, relationship, output);
          },
        );
      },
    );
  }

  Widget _buildNotEnabledState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people_outline,
              size: 80,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: 24),
            Text(
              'Relationship Not Enabled',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Add partner or friend characters on the character entry screen to explore relationship dynamics.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Analyzing relationship dynamics...'),
        ],
      ),
    );
  }

  Widget _buildGeneratingState(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Generating relationship insights...'),
          SizedBox(height: 8),
          Text(
            'This may take a moment',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading relationship',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    RelationshipCharacterSet relationship,
    RelationshipOutput output,
  ) {
    final theme = Theme.of(context);
    final isRomantic = _selectedType == AppConstants.relationshipTypeRomantic;
    final accentColor = isRomantic ? const Color(0xFFE91E63) : const Color(0xFF2196F3);

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: Text(
              isRomantic ? 'Romantic Relationship' : 'Friendship',
              style: TextStyle(color: accentColor),
            ),
            floating: true,
            snap: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Column(
                children: [
                  // Relationship type selector
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: _buildTypeSelector(context, accentColor),
                  ),
                  // Tab bar
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: accentColor,
                    unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                    indicatorColor: accentColor,
                    tabs: _modules.map((m) => Tab(
                      icon: Icon(m.icon, size: 20),
                      text: m.label,
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: Column(
        children: [
          // Disclaimer
          _buildDisclaimer(context),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _modules.map((module) {
                return _buildModuleContent(context, output, module.key);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSelector(BuildContext context, Color accentColor) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Expanded(
          child: _buildTypeButton(
            context,
            type: AppConstants.relationshipTypeRomantic,
            label: 'Romantic',
            icon: Icons.favorite,
            color: const Color(0xFFE91E63),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildTypeButton(
            context,
            type: AppConstants.relationshipTypePlatonic,
            label: 'Platonic',
            icon: Icons.people,
            color: const Color(0xFF2196F3),
          ),
        ),
      ],
    );
  }

  Widget _buildTypeButton(
    BuildContext context, {
    required String type,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    final theme = Theme.of(context);
    final isSelected = _selectedType == type;

    return Material(
      color: isSelected ? color.withOpacity(0.15) : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => _changeRelationshipType(type),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? color : theme.colorScheme.outline.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? color : Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isSelected ? color : theme.colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDisclaimer(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber.shade700, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Based on your perception of them. Accuracy improves if they make their own profile.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.amber.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleContent(
    BuildContext context,
    RelationshipOutput output,
    String moduleKey,
  ) {
    final theme = Theme.of(context);

    // Get module-specific content
    switch (moduleKey) {
      case 'myth':
        return _buildMythModule(context, output.myth);
      case 'relationalField':
        return _buildNarrativeModule(context, output.narrative?.relationalField, 'Relational Field');
      case 'attractionBonding':
        return _buildNarrativeModule(context, output.narrative?.attractionBonding, 'Attraction & Bonding');
      case 'projectionShadow':
        return _buildNarrativeModule(context, output.narrative?.projectionShadow, 'Projection & Shadow');
      case 'egoPersonaMismatch':
        return _buildNarrativeModule(context, output.narrative?.egoPersonaMismatch, 'Ego-Persona Mismatch');
      case 'communicationConflict':
        return _buildNarrativeModule(context, output.narrative?.communicationConflict, 'Communication & Conflict');
      case 'needsBoundaries':
        return _buildNarrativeModule(context, output.narrative?.needsBoundaries, 'Needs & Boundaries');
      case 'growthPath':
        return _buildNarrativeModule(context, output.narrative?.growthPath, 'Growth Path');
      case 'redFlagsRepair':
        return _buildNarrativeModule(context, output.narrative?.redFlagsRepair, 'Red Flags & Repair');
      case 'nextSteps':
        return _buildNextStepsModule(context, output.narrative?.nextSteps);
      default:
        return Center(child: Text('Module: $moduleKey'));
    }
  }

  Widget _buildMythModule(BuildContext context, RelationshipMyth? myth) {
    final theme = Theme.of(context);

    if (myth == null) {
      return const Center(child: Text('No myth data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          if (myth.title != null) ...[
            Text(
              myth.title!,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
          ],
          // Summary
          if (myth.summary != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                myth.summary!,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
          // Story
          if (myth.story != null) ...[
            Text(
              myth.story!,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 24),
          ],
          // Themes
          if (myth.themes.isNotEmpty) ...[
            Text(
              'Themes',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: myth.themes.map((theme) => Chip(label: Text(theme))).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNarrativeModule(
    BuildContext context,
    ModuleNarrative? narrative,
    String title,
  ) {
    final theme = Theme.of(context);

    if (narrative == null) {
      return Center(child: Text('No $title data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary
          if (narrative.summary != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                narrative.summary!,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
          // Story
          if (narrative.story != null) ...[
            Text(
              narrative.story!,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 24),
          ],
          // Analysis bullets
          if (narrative.analysisBullets.isNotEmpty) ...[
            Text(
              'Key Points',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...narrative.analysisBullets.map((bullet) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(child: Text(bullet)),
                ],
              ),
            )),
          ],
        ],
      ),
    );
  }

  Widget _buildNextStepsModule(
    BuildContext context,
    List<SituationalGuidance>? nextSteps,
  ) {
    final theme = Theme.of(context);

    if (nextSteps == null || nextSteps.isEmpty) {
      return const Center(child: Text('No next steps available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: nextSteps.length,
      itemBuilder: (context, index) {
        final step = nextSteps[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        step.situation ?? 'Situation ${index + 1}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                if (step.guidance != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    step.guidance!,
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ModuleInfo {
  final String label;
  final IconData icon;
  final String key;

  const _ModuleInfo(this.label, this.icon, this.key);
}
