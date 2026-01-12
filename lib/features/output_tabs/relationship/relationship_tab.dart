import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/relationship.dart';
import '../../../core/utils/constants.dart';
import '../../../app/theme/app_theme.dart';

class RelationshipTab extends ConsumerStatefulWidget {
  const RelationshipTab({super.key});

  @override
  ConsumerState<RelationshipTab> createState() => _RelationshipTabState();
}

class _RelationshipTabState extends ConsumerState<RelationshipTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedType = AppConstants.relationshipTypePlatonic;

  final List<_TabItem> _tabItems = const [
    _TabItem(title: 'Myth', icon: Icons.auto_stories),
    _TabItem(title: 'Field', icon: Icons.blur_on),
    _TabItem(title: 'Bonding', icon: Icons.favorite),
    _TabItem(title: 'Shadow', icon: Icons.contrast),
    _TabItem(title: 'Masks', icon: Icons.masks),
    _TabItem(title: 'Conflict', icon: Icons.forum),
    _TabItem(title: 'Needs', icon: Icons.lock_open),
    _TabItem(title: 'Growth', icon: Icons.trending_up),
    _TabItem(title: 'Flags', icon: Icons.flag),
    _TabItem(title: 'Next', icon: Icons.directions),
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

  void _changeRelationshipType(String type) {
    if (type != _selectedType) {
      setState(() => _selectedType = type);
      ref.read(relationshipRepositoryProvider.notifier).updateRelationshipType(type);
    }
  }

  Color get _accentColor => _selectedType == AppConstants.relationshipTypeRomantic
      ? const Color(0xFFE91E63)
      : const Color(0xFF2196F3);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final relationshipAsync = ref.watch(relationshipRepositoryProvider);
    final outputAsync = ref.watch(relationshipOutputRepositoryProvider);

    return relationshipAsync.when(
      loading: () => _buildScaffold(context, isDark, null, true),
      error: (e, _) => _buildErrorState(context, e.toString()),
      data: (relationship) {
        if (relationship == null || !relationship.enabled) {
          return _buildNotEnabledState(context);
        }

        _selectedType = relationship.relationshipType;

        return outputAsync.when(
          loading: () => _buildScaffold(context, isDark, null, true),
          error: (e, _) => _buildScaffold(context, isDark, null, false, error: e.toString()),
          data: (output) => _buildScaffold(context, isDark, output, false),
        );
      },
    );
  }

  Widget _buildScaffold(BuildContext context, bool isDark, RelationshipOutput? output, bool isLoading, {String? error}) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_accentColor, _accentColor.withOpacity(0.7)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                _selectedType == AppConstants.relationshipTypeRomantic
                    ? Icons.favorite
                    : Icons.people,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(_selectedType == AppConstants.relationshipTypeRomantic
                ? 'Romantic Bond'
                : 'Friendship Bond'),
          ],
        ),
        actions: [
          // Type switcher popup
          PopupMenuButton<String>(
            icon: const Icon(Icons.swap_horiz),
            tooltip: 'Change Type',
            onSelected: _changeRelationshipType,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: AppConstants.relationshipTypeRomantic,
                child: Row(
                  children: [
                    Icon(Icons.favorite, 
                      color: _selectedType == AppConstants.relationshipTypeRomantic 
                          ? const Color(0xFFE91E63) : null,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text('Romantic'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: AppConstants.relationshipTypePlatonic,
                child: Row(
                  children: [
                    Icon(Icons.people,
                      color: _selectedType == AppConstants.relationshipTypePlatonic
                          ? const Color(0xFF2196F3) : null,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text('Platonic'),
                  ],
                ),
              ),
            ],
          ),
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
              ref.read(relationshipOutputRepositoryProvider.notifier).regenerate();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          labelColor: _accentColor,
          unselectedLabelColor: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          indicatorColor: _accentColor,
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
      body: Column(
        children: [
          // Disclaimer banner
          _buildDisclaimer(context),
          // Content
          Expanded(
            child: error != null
                ? _buildErrorContent(context, error)
                : isLoading
                    ? _buildLoadingContent(context)
                    : output == null
                        ? _buildLoadingContent(context)
                        : TabBarView(
                            controller: _tabController,
                            children: [
                              _RelationshipMythTab(output: output, accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'relationalField', title: 'Relational Field', accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'attractionBonding', title: 'Attraction & Bonding', accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'projectionShadow', title: 'Projection & Shadow', accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'egoPersonaMismatch', title: 'Ego-Persona', accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'communicationConflict', title: 'Communication', accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'needsBoundaries', title: 'Needs & Boundaries', accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'growthPath', title: 'Growth Path', accentColor: _accentColor),
                              _RelationshipModuleTab(output: output, moduleKey: 'redFlagsRepair', title: 'Red Flags & Repair', accentColor: _accentColor),
                              _RelationshipNextStepsTab(output: output, accentColor: _accentColor),
                            ],
                          ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber.shade700, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Based on your perception. Accuracy improves if they make their own profile.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.amber.shade800,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingContent(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: _accentColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Analyzing relationship dynamics...',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'This may take a moment',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, String error) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text('Error', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(error, textAlign: TextAlign.center, style: TextStyle(color: theme.colorScheme.error)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => ref.read(relationshipOutputRepositoryProvider.notifier).regenerate(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotEnabledState(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Relationship')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.people_outline, size: 80, color: theme.colorScheme.outline),
              const SizedBox(height: 24),
              Text(
                'Relationship Not Enabled',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Text(
                'Add partner or friend characters on the character entry screen to explore relationship dynamics.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => context.push('/characters'),
                icon: const Icon(Icons.add),
                label: const Text('Add Characters'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Relationship')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
              const SizedBox(height: 16),
              Text('Error loading relationship', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(error, textAlign: TextAlign.center, style: TextStyle(color: theme.colorScheme.error)),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => ref.read(relationshipOutputRepositoryProvider.notifier).regenerate(),
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabItem {
  final String title;
  final IconData icon;
  const _TabItem({required this.title, required this.icon});
}

// ============================================================================
// MYTH TAB
// ============================================================================

class _RelationshipMythTab extends StatefulWidget {
  final RelationshipOutput output;
  final Color accentColor;

  const _RelationshipMythTab({required this.output, required this.accentColor});

  @override
  State<_RelationshipMythTab> createState() => _RelationshipMythTabState();
}

class _RelationshipMythTabState extends State<_RelationshipMythTab> {
  final Set<int> _revealedSections = {};

  @override
  void initState() {
    super.initState();
    _startProgressiveReveal();
  }

  void _startProgressiveReveal() {
    for (int i = 0; i < 4; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        if (mounted) setState(() => _revealedSections.add(i));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final myth = widget.output.myth;

    if (myth == null) {
      return const Center(child: Text('No myth data available'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Title card
        _buildAnimatedCard(
          0,
          _buildSectionCard(
            context,
            title: myth.title ?? 'Your Relationship Myth',
            content: myth.summary ?? '',
            icon: Icons.auto_stories,
            accentColor: widget.accentColor,
            isHighlighted: true,
          ),
        ),
        const SizedBox(height: 12),
        // Story card
        _buildAnimatedCard(
          1,
          _buildSectionCard(
            context,
            title: 'The Story',
            content: myth.story ?? '',
            icon: Icons.menu_book,
            accentColor: const Color(0xFF8B5CF6),
          ),
        ),
        const SizedBox(height: 12),
        // Themes card
        if (myth.themes.isNotEmpty)
          _buildAnimatedCard(
            2,
            _buildThemesCard(context, myth.themes),
          ),
      ],
    );
  }

  Widget _buildAnimatedCard(int index, Widget child) {
    final isRevealed = _revealedSections.contains(index);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: isRevealed ? 1.0 : 0.3,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        transform: Matrix4.translationValues(isRevealed ? 0 : 20, 0, 0),
        child: child,
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    required Color accentColor,
    bool isHighlighted = false,
  }) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: isHighlighted ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isHighlighted
            ? BorderSide(color: accentColor.withOpacity(0.3), width: 1.5)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: accentColor, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.6,
                fontStyle: isHighlighted ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemesCard(BuildContext context, List<String> themes) {
    final theme = Theme.of(context);
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF14B8A6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.tag, color: Color(0xFF14B8A6), size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'Themes',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: themes.map((t) => Chip(
                label: Text(t),
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// MODULE TAB (Generic for most modules)
// ============================================================================

class _RelationshipModuleTab extends StatefulWidget {
  final RelationshipOutput output;
  final String moduleKey;
  final String title;
  final Color accentColor;

  const _RelationshipModuleTab({
    required this.output,
    required this.moduleKey,
    required this.title,
    required this.accentColor,
  });

  @override
  State<_RelationshipModuleTab> createState() => _RelationshipModuleTabState();
}

class _RelationshipModuleTabState extends State<_RelationshipModuleTab> {
  final Set<int> _revealedSections = {};

  @override
  void initState() {
    super.initState();
    _startProgressiveReveal();
  }

  void _startProgressiveReveal() {
    for (int i = 0; i < 5; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        if (mounted) setState(() => _revealedSections.add(i));
      });
    }
  }

  ModuleNarrative? _getNarrative() {
    final narrative = widget.output.narrative;
    if (narrative == null) return null;
    
    switch (widget.moduleKey) {
      case 'relationalField': return narrative.relationalField;
      case 'attractionBonding': return narrative.attractionBonding;
      case 'projectionShadow': return narrative.projectionShadow;
      case 'egoPersonaMismatch': return narrative.egoPersonaMismatch;
      case 'communicationConflict': return narrative.communicationConflict;
      case 'needsBoundaries': return narrative.needsBoundaries;
      case 'growthPath': return narrative.growthPath;
      case 'redFlagsRepair': return narrative.redFlagsRepair;
      default: return null;
    }
  }

  List<RelationshipExampleRef>? _getExamples() {
    final examples = widget.output.examples;
    if (examples == null) return null;
    
    switch (widget.moduleKey) {
      case 'relationalField': return examples.relationalField;
      case 'attractionBonding': return examples.attractionBonding;
      case 'projectionShadow': return examples.projectionShadow;
      case 'egoPersonaMismatch': return examples.egoPersonaMismatch;
      case 'communicationConflict': return examples.communicationConflict;
      case 'needsBoundaries': return examples.needsBoundaries;
      case 'growthPath': return examples.growthPath;
      case 'redFlagsRepair': return examples.redFlagsRepair;
      default: return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final narrative = _getNarrative();
    final examples = _getExamples();

    if (narrative == null) {
      return Center(child: Text('No ${widget.title} data available'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Summary card
        if (narrative.summary != null)
          _buildAnimatedCard(0, _buildSummaryCard(context, narrative.summary!)),
        
        const SizedBox(height: 12),
        
        // Story card
        if (narrative.story != null)
          _buildAnimatedCard(1, _buildStoryCard(context, narrative.story!)),
        
        const SizedBox(height: 12),
        
        // Analysis bullets
        if (narrative.analysisBullets.isNotEmpty)
          _buildAnimatedCard(2, _buildBulletsCard(context, narrative.analysisBullets)),
        
        // Examples
        if (examples != null && examples.isNotEmpty) ...[
          const SizedBox(height: 20),
          _buildAnimatedCard(3, _buildExamplesSection(context, examples)),
        ],
      ],
    );
  }

  Widget _buildAnimatedCard(int index, Widget child) {
    final isRevealed = _revealedSections.contains(index);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: isRevealed ? 1.0 : 0.3,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        transform: Matrix4.translationValues(isRevealed ? 0 : 20, 0, 0),
        child: child,
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, String summary) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: widget.accentColor.withOpacity(0.3), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.summarize, color: widget.accentColor, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'Summary',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              summary,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryCard(BuildContext context, String story) {
    final theme = Theme.of(context);
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.menu_book, color: Color(0xFF8B5CF6), size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'The Narrative',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(story, style: theme.textTheme.bodyMedium?.copyWith(height: 1.7)),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletsCard(BuildContext context, List<String> bullets) {
    final theme = Theme.of(context);
    
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF14B8A6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.checklist, color: Color(0xFF14B8A6), size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'Key Points',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...bullets.map((bullet) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_right, size: 20, color: widget.accentColor),
                  const SizedBox(width: 8),
                  Expanded(child: Text(bullet, style: theme.textTheme.bodyMedium)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildExamplesSection(BuildContext context, List<RelationshipExampleRef> examples) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Row(
            children: [
              Icon(Icons.movie_creation, color: widget.accentColor, size: 20),
              const SizedBox(width: 8),
              Text(
                'Examples from Their Stories',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        ...examples.map((ex) => _buildExampleCard(context, ex)),
      ],
    );
  }

  Widget _buildExampleCard(BuildContext context, RelationshipExampleRef example) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    example.characterName ?? 'Character',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: widget.accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (example.reference != null)
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
            ),
            const SizedBox(height: 12),
            // Situation
            if (example.situation != null)
              Text(example.situation!, style: theme.textTheme.bodyMedium),
            // Actions
            if (example.actions.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...example.actions.map((action) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(color: widget.accentColor)),
                    Expanded(child: Text(action, style: theme.textTheme.bodySmall)),
                  ],
                ),
              )),
            ],
            // Outcome
            if (example.outcomeAndCost.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: example.outcomeAndCost.map((o) => Text(
                    o,
                    style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                  )).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// NEXT STEPS TAB
// ============================================================================

class _RelationshipNextStepsTab extends StatefulWidget {
  final RelationshipOutput output;
  final Color accentColor;

  const _RelationshipNextStepsTab({required this.output, required this.accentColor});

  @override
  State<_RelationshipNextStepsTab> createState() => _RelationshipNextStepsTabState();
}

class _RelationshipNextStepsTabState extends State<_RelationshipNextStepsTab> {
  final Set<int> _revealedSections = {};

  @override
  void initState() {
    super.initState();
    _startProgressiveReveal();
  }

  void _startProgressiveReveal() {
    final count = (widget.output.narrative?.nextSteps?.length ?? 0) + 1;
    for (int i = 0; i < count; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        if (mounted) setState(() => _revealedSections.add(i));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nextSteps = widget.output.narrative?.nextSteps;
    final examples = widget.output.examples?.nextSteps;

    if (nextSteps == null || nextSteps.isEmpty) {
      return const Center(child: Text('No next steps available'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: nextSteps.length + (examples?.isNotEmpty == true ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < nextSteps.length) {
          final step = nextSteps[index];
          final isRevealed = _revealedSections.contains(index);
          
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: isRevealed ? 1.0 : 0.3,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              transform: Matrix4.translationValues(isRevealed ? 0 : 20, 0, 0),
              child: Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [widget.accentColor, widget.accentColor.withOpacity(0.7)],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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
                        const SizedBox(height: 16),
                        Text(
                          step.guidance!,
                          style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        
        // Examples section
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 12),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: widget.accentColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Related Examples',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            ...examples!.map((ex) => _RelationshipModuleTabState()._buildExampleCard(context, ex)),
          ],
        );
      },
    );
  }
}
