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
      loading: () => _buildLoadingStructure(context, null),
      error: (e, _) => _buildErrorState(context, e.toString()),
      data: (relationship) {
        if (relationship == null || !relationship.enabled) {
          return _buildNotEnabledState(context);
        }

        _selectedType = relationship.relationshipType;

        return outputAsync.when(
          loading: () => _buildLoadingStructure(context, relationship),
          error: (e, _) => _buildErrorState(context, e.toString()),
          data: (output) {
            if (output == null) {
              return _buildLoadingStructure(context, relationship);
            }
            return _buildContent(context, relationship, output);
          },
        );
      },
    );
  }

  /// Progressive loading - shows the structure while content is loading
  Widget _buildLoadingStructure(BuildContext context, RelationshipCharacterSet? relationship) {
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
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Regenerate',
                onPressed: () {
                  ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: _buildTypeSelector(context, accentColor),
                  ),
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
          _buildDisclaimer(context),
          // Loading indicator
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: accentColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Analyzing relationship dynamics...',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    relationship != null 
                        ? 'Processing ${relationship.characters.length} characters'
                        : 'Loading relationship data',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Progress hints
                  _buildProgressHint(context, 'Recognizing characters', true),
                  _buildProgressHint(context, 'Discovering profiles', true),
                  _buildProgressHint(context, 'Building relationship model', false),
                  _buildProgressHint(context, 'Generating narrative', false),
                  _buildProgressHint(context, 'Creating examples', false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressHint(BuildContext context, String text, bool complete) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            complete ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 16,
            color: complete ? Colors.green : theme.colorScheme.outline,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: complete ? Colors.green : theme.colorScheme.outline,
            ),
          ),
        ],
      ),
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
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Regenerate',
                onPressed: () {
                  ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: _buildTypeSelector(context, accentColor),
                  ),
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
          _buildDisclaimer(context),
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
    switch (moduleKey) {
      case 'myth':
        return _buildMythModule(context, output.myth, output.examples);
      case 'relationalField':
        return _buildNarrativeModule(context, output.narrative?.relationalField, 'Relational Field', output.examples?.relationalField);
      case 'attractionBonding':
        return _buildNarrativeModule(context, output.narrative?.attractionBonding, 'Attraction & Bonding', output.examples?.attractionBonding);
      case 'projectionShadow':
        return _buildNarrativeModule(context, output.narrative?.projectionShadow, 'Projection & Shadow', output.examples?.projectionShadow);
      case 'egoPersonaMismatch':
        return _buildNarrativeModule(context, output.narrative?.egoPersonaMismatch, 'Ego-Persona Mismatch', output.examples?.egoPersonaMismatch);
      case 'communicationConflict':
        return _buildNarrativeModule(context, output.narrative?.communicationConflict, 'Communication & Conflict', output.examples?.communicationConflict);
      case 'needsBoundaries':
        return _buildNarrativeModule(context, output.narrative?.needsBoundaries, 'Needs & Boundaries', output.examples?.needsBoundaries);
      case 'growthPath':
        return _buildNarrativeModule(context, output.narrative?.growthPath, 'Growth Path', output.examples?.growthPath);
      case 'redFlagsRepair':
        return _buildNarrativeModule(context, output.narrative?.redFlagsRepair, 'Red Flags & Repair', output.examples?.redFlagsRepair);
      case 'nextSteps':
        return _buildNextStepsModule(context, output.narrative?.nextSteps, output.examples?.nextSteps);
      default:
        return Center(child: Text('Module: $moduleKey'));
    }
  }

  Widget _buildMythModule(BuildContext context, RelationshipMyth? myth, RelationshipExamples? examples) {
    final theme = Theme.of(context);

    if (myth == null) {
      return const Center(child: Text('No myth data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (myth.title != null) ...[
            Text(
              myth.title!,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
          ],
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
          if (myth.story != null) ...[
            Text(
              myth.story!,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 24),
          ],
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
              children: myth.themes.map((t) => Chip(label: Text(t))).toList(),
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
    List<RelationshipExampleRef>? examples,
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
          if (narrative.story != null) ...[
            Text(
              narrative.story!,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 24),
          ],
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
            const SizedBox(height: 24),
          ],
          // Examples section
          if (examples != null && examples.isNotEmpty) ...[
            Text(
              'Examples',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...examples.map((example) => _buildExampleCard(context, example)),
          ],
        ],
      ),
    );
  }

  Widget _buildExampleCard(BuildContext context, RelationshipExampleRef example) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Character and reference
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    example.characterName ?? 'Character',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (example.reference != null) ...[
                  Expanded(
                    child: Text(
                      '${example.reference!.title ?? ''} (${example.reference!.year ?? ''})',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
                if (example.tier != null && example.tier != 'B') ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      example.tier!,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.amber.shade800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 12),
            // Situation
            if (example.situation != null) ...[
              Text(
                example.situation!,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
            ],
            // Actions
            if (example.actions.isNotEmpty) ...[
              ...example.actions.map((action) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(color: theme.colorScheme.primary)),
                    Expanded(
                      child: Text(
                        action,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              )),
            ],
            // Outcome
            if (example.outcomeAndCost.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: example.outcomeAndCost.map((outcome) => Text(
                    outcome,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  )).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNextStepsModule(
    BuildContext context,
    List<SituationalGuidance>? nextSteps,
    List<RelationshipExampleRef>? examples,
  ) {
    final theme = Theme.of(context);

    if (nextSteps == null || nextSteps.isEmpty) {
      return const Center(child: Text('No next steps available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: nextSteps.length + (examples?.isNotEmpty == true ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < nextSteps.length) {
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
        }
        
        // Examples section at the end
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Examples',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...examples!.map((example) => _buildExampleCard(context, example)),
          ],
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
