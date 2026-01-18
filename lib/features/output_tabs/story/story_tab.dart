import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/models/tone.dart';
import '../../shared/redesign/redesign.dart';

class StoryTab extends ConsumerStatefulWidget {
  final bool embedded;
  
  const StoryTab({super.key, this.embedded = false});

  @override
  ConsumerState<StoryTab> createState() => _StoryTabState();
}

class _StoryTabState extends ConsumerState<StoryTab> {
  @override
  Widget build(BuildContext context) {
    final outputAsync = ref.watch(outputRepositoryProvider);
    // Use effective output which includes tone-rendered content when available
    final effectiveOutput = ref.watch(effectiveMeOutputProvider);
    // Watch tone state for loading state
    final toneState = ref.watch(toneRepositoryProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final content = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [
                  const Color(0xFF1E1B2E),
                  const Color(0xFF1E1B2E).withOpacity(0.5),
                ]
              : [
                  const Color(0xFFFAF5FF),
                  Colors.white,
                ],
        ),
      ),
      child: Stack(
        children: [
          outputAsync.when(
            data: (_) => _buildContent(context, effectiveOutput),
            loading: () => _buildLoadingState(context),
            error: (error, stack) => _buildErrorState(context, error),
          ),
          // Tone loading overlay
          if (toneState.isLoading)
            Positioned.fill(
              child: Container(
                color: theme.scaffoldBackgroundColor.withOpacity(0.85),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Adjusting narrative tone...',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Rewriting in ${toneState.currentTone.label} style',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
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
    final allConfigs = [...StoryCardConfigs.all, ...FunctioningCardConfigs.all];
    return SingleChildScrollView(
      child: Column(
        children: [
          // Sub-header
          const StorySubHeader(),
          
          const SizedBox(height: 16),
          
          // Loading cards grid
          ContentCardGrid(
            configs: allConfigs,
            contents: const {},
            isLoading: true,
          ),
          
          const SizedBox(height: 24),
        ],
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
    final functioning = output.functioning;
    // Get section-specific examples
    final storyExamples = output.examples?.story ?? const StoryExamples();
    final funcExamples = output.examples?.functioning ?? const FunctioningExamples();
    
    // Build contents map - Story content
    final contents = <String, String?>{
      // Story sections
      'mythSummary': story.mythSummary,
      'centralTension': story.centralTension,
      'guidingSentence': story.guidingSentence,
      'northStarScene': story.northStarScene,
      'currentChapter': story.currentChapter,
      // Functioning sections
      'coreTraits': functioning.coreTraits.isNotEmpty ? functioning.coreTraits.join('\n\n• ') : null,
      'symbolicEssence': functioning.symbolicEssence.isNotEmpty ? functioning.symbolicEssence : null,
      'narrativeArc': functioning.narrativeArc.isNotEmpty ? functioning.narrativeArc : null,
      'redemptionArc': functioning.redemptionArc.isNotEmpty ? functioning.redemptionArc : null,
      'costsAndCompensations': functioning.costsAndCompensations,
      'powerStance': functioning.powerStance,
      'alignmentIndicators': functioning.alignmentIndicators != null 
          ? _formatAlignmentIndicators(functioning.alignmentIndicators!) 
          : null,
    };

    // Build examples map - convert ExampleItem to Map for the detail view
    Map<String, dynamic> exampleToMap(ExampleItem e) => {
      'character': e.characterName,
      'franchise': '${e.reference.title} (${e.reference.year}) • ${e.reference.medium}',
      'description': '${e.situation}\n\n${e.actions.join('\n')}\n\n${e.outcomeAndCost.join('\n')}',
    };

    final examples = <String, List<dynamic>>{
      // Story examples
      'mythSummary': storyExamples.mythSummary.map(exampleToMap).toList(),
      'centralTension': storyExamples.centralTension.map(exampleToMap).toList(),
      'guidingSentence': storyExamples.guidingSentence.map(exampleToMap).toList(),
      'northStarScene': storyExamples.northStarScene.map(exampleToMap).toList(),
      'currentChapter': storyExamples.currentChapter.map(exampleToMap).toList(),
      // Functioning examples
      'coreTraits': funcExamples.coreTraits.map(exampleToMap).toList(),
      'symbolicEssence': funcExamples.symbolicEssence.map(exampleToMap).toList(),
      'narrativeArc': funcExamples.narrativeArc.map(exampleToMap).toList(),
      'redemptionArc': funcExamples.redemptionArc.map(exampleToMap).toList(),
      'costsAndCompensations': funcExamples.costsAndCompensations.map(exampleToMap).toList(),
      'alignmentIndicators': funcExamples.alignmentIndicators.map(exampleToMap).toList(),
    };

    // Combine all configs and filter by available content
    final allConfigs = [...StoryCardConfigs.all, ...FunctioningCardConfigs.all];
    final availableConfigs = allConfigs.where((c) => contents[c.id] != null).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Sub-header with illustration
          const StorySubHeader(),
          
          const SizedBox(height: 16),
          
          // Content cards grid - now handles its own detail view with tabs
          ContentCardGrid(
            configs: availableConfigs,
            contents: contents,
            examples: examples,
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  String _formatAlignmentIndicators(AlignmentIndicators alignment) {
    final buffer = StringBuffer();
    
    if (alignment.aligned.isNotEmpty) {
      buffer.writeln('✓ ALIGNED BEHAVIORS:');
      for (final item in alignment.aligned) {
        buffer.writeln('• $item');
      }
    }
    
    if (alignment.unaligned.isNotEmpty) {
      if (buffer.isNotEmpty) buffer.writeln();
      buffer.writeln('⚠ MISALIGNED BEHAVIORS:');
      for (final item in alignment.unaligned) {
        buffer.writeln('• $item');
      }
    }
    
    return buffer.toString().trim();
  }
}
