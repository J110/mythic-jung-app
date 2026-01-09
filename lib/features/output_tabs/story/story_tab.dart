import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/widgets/output_card.dart';
import '../../../core/widgets/examples_sheet.dart';
import '../../../app/theme/app_theme.dart';

/// Section configuration for loading state
class _StorySection {
  final String title;
  final IconData icon;
  final Color accentColor;
  final String? Function(StoryOutput) getValue;

  const _StorySection({
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.getValue,
  });
}

class StoryTab extends ConsumerStatefulWidget {
  final bool embedded;
  
  const StoryTab({super.key, this.embedded = false});

  @override
  ConsumerState<StoryTab> createState() => _StoryTabState();
}

class _StoryTabState extends ConsumerState<StoryTab> {
  // Track which sections have been "revealed" with animation
  final Set<int> _revealedSections = {};

  static const List<_StorySection> _sections = [
    _StorySection(
      title: 'Myth Summary',
      icon: Icons.auto_stories,
      accentColor: Color(0xFF7C3AED),
      getValue: _getMythSummary,
    ),
    _StorySection(
      title: 'Central Tension',
      icon: Icons.balance,
      accentColor: Color(0xFFD97706),
      getValue: _getCentralTension,
    ),
    _StorySection(
      title: 'Guiding Sentence',
      icon: Icons.navigation,
      accentColor: Color(0xFF14B8A6),
      getValue: _getGuidingSentence,
    ),
    _StorySection(
      title: 'North Star Scene',
      icon: Icons.star,
      accentColor: Color(0xFFF59E0B),
      getValue: _getNorthStarScene,
    ),
    _StorySection(
      title: 'Current Chapter',
      icon: Icons.book,
      accentColor: Color(0xFF8B5CF6),
      getValue: _getCurrentChapter,
    ),
  ];

  static String? _getMythSummary(StoryOutput s) => s.mythSummary;
  static String? _getCentralTension(StoryOutput s) => s.centralTension;
  static String? _getGuidingSentence(StoryOutput s) => s.guidingSentence;
  static String? _getNorthStarScene(StoryOutput s) => s.northStarScene;
  static String? _getCurrentChapter(StoryOutput s) => s.currentChapter;

  @override
  void initState() {
    super.initState();
    // Reveal sections progressively
    _startProgressiveReveal();
  }

  void _startProgressiveReveal() {
    for (int i = 0; i < _sections.length; i++) {
      Future.delayed(Duration(milliseconds: 200 * i), () {
        if (mounted) {
          setState(() => _revealedSections.add(i));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final outputAsync = ref.watch(outputRepositoryProvider);
    final theme = Theme.of(context);

    final content = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.scaffoldBackgroundColor,
            theme.scaffoldBackgroundColor.withOpacity(0.5),
          ],
        ),
      ),
      child: outputAsync.when(
        data: (output) => _buildContent(context, output),
        loading: () => _buildLoadingState(context),
        error: (error, stack) => _buildErrorState(context, error),
      ),
    );

    if (widget.embedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Story'),
      ),
      body: content,
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _sections.length,
      itemBuilder: (context, index) {
        final section = _sections[index];
        final isRevealed = _revealedSections.contains(index);

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: isRevealed ? 1.0 : 0.3,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.only(bottom: 12),
            transform: Matrix4.translationValues(isRevealed ? 0 : 20, 0, 0),
            child: _buildSkeletonCard(section, isDark, theme),
          ),
        );
      },
    );
  }

  Widget _buildSkeletonCard(_StorySection section, bool isDark, ThemeData theme) {
    return Card(
      elevation: 1,
      color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: section.accentColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: section.accentColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    section.icon,
                    color: section.accentColor.withOpacity(0.5),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  section.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(section.accentColor.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Skeleton text lines
            _buildShimmerLine(isDark, width: double.infinity),
            const SizedBox(height: 8),
            _buildShimmerLine(isDark, width: double.infinity),
            const SizedBox(height: 8),
            _buildShimmerLine(isDark, width: 180),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLine(bool isDark, {required double width}) {
    return Container(
      width: width,
      height: 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text(
              'Error: $error',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red.shade300),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => ref.read(outputRepositoryProvider.notifier).regenerate(),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, GeneratedOutput? output) {
    if (output == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No output available.\nPlease complete character entry.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final story = output.story;
    // Get section-specific examples
    final storyExamples = output.examples?.story ?? const StoryExamples();
    
    // Map section titles to their examples
    List<ExampleItem> getExamplesForSection(String title) {
      switch (title) {
        case 'Myth Summary':
          return storyExamples.mythSummary;
        case 'Central Tension':
          return storyExamples.centralTension;
        case 'Guiding Sentence':
          return storyExamples.guidingSentence;
        case 'North Star Scene':
          return storyExamples.northStarScene;
        default:
          return [];
      }
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _sections.length,
      itemBuilder: (context, index) {
        final section = _sections[index];
        final value = section.getValue(story);
        
        // Skip null optional sections
        if (value == null) return const SizedBox.shrink();
        
        // Get examples specific to this section
        final sectionExamples = getExamplesForSection(section.title);

        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 300 + (index * 100)),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, animation, child) {
            return Opacity(
              opacity: animation,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - animation)),
                child: child,
              ),
            );
          },
          child: OutputCard(
            title: section.title,
            preview: value,
            icon: section.icon,
            accentColor: section.accentColor,
            onTap: () => _showDetail(
              context,
              section.title,
              value,
              sectionExamples,
            ),
            onShowExamples: sectionExamples.isNotEmpty ? () => showExamplesSheet(
              context: context,
              examples: sectionExamples,
              sectionTitle: section.title,
            ) : null,
          ),
        );
      },
    );
  }

  void _showDetail(
    BuildContext context,
    String title,
    String content,
    List<ExampleItem> examples,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                  ? [
                      theme.colorScheme.surface,
                      theme.scaffoldBackgroundColor,
                    ]
                  : [
                      Colors.white,
                      theme.scaffoldBackgroundColor,
                    ],
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: AppTheme.primaryGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.auto_stories,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            title,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          content,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      if (examples.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            showExamplesSheet(
                              context: context,
                              examples: examples,
                              sectionTitle: title,
                            );
                          },
                          icon: const Icon(Icons.movie_outlined),
                          label: Text('View ${examples.length} Examples'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
