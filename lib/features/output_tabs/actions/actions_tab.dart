import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/widgets/output_card.dart';
import '../../../core/widgets/examples_sheet.dart';
import '../../../core/widgets/progressive_output_page.dart';

class ActionsTab extends ConsumerWidget {
  final bool embedded;
  
  const ActionsTab({super.key, this.embedded = false});

  static const _loadingSections = [
    SectionDefinition(title: 'Situation 1', icon: Icons.settings, accentColor: Color(0xFF7C3AED)),
    SectionDefinition(title: 'Situation 2', icon: Icons.settings, accentColor: Color(0xFF6366F1)),
    SectionDefinition(title: 'Situation 3', icon: Icons.settings, accentColor: Color(0xFF8B5CF6)),
    SectionDefinition(title: 'Situation 4', icon: Icons.settings, accentColor: Color(0xFFA855F7)),
    SectionDefinition(title: 'Guiding Question', icon: Icons.help_outline, accentColor: Color(0xFF14B8A6)),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        loading: () => ProgressiveLoadingWidget(sections: _loadingSections),
        error: (error, stack) => _buildErrorState(context, ref, error),
      ),
    );

    if (embedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actions'),
      ),
      body: content,
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
            const SizedBox(height: 16),
            Text('Error: $error', textAlign: TextAlign.center, style: TextStyle(color: Colors.red.shade300)),
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
          child: Text('No output available.\nPlease complete character entry.', textAlign: TextAlign.center),
        ),
      );
    }

    final actions = output.actions;
    final examples = output.examples?.actions ?? [];
    final colors = [
      const Color(0xFF7C3AED),
      const Color(0xFF6366F1),
      const Color(0xFF8B5CF6),
      const Color(0xFFA855F7),
      const Color(0xFFC084FC),
      const Color(0xFFE879F9),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...actions.situationBlocks.asMap().entries.map(
          (entry) {
            // Get example for this situation if available
            final situationExample = entry.key < examples.length ? [examples[entry.key]] : <ExampleItem>[];
            
            return AnimatedContentCard(
              index: entry.key,
              child: OutputCard(
                title: entry.value.title ?? 'Situation ${entry.key + 1}',
                preview: entry.value.situation,
                icon: Icons.settings,
                accentColor: colors[entry.key % colors.length],
                onTap: () => _showSituationDetail(context, entry.value, situationExample),
                onShowExamples: situationExample.isNotEmpty ? () => showExamplesSheet(
                  context: context,
                  examples: situationExample,
                  sectionTitle: entry.value.title ?? 'Situation ${entry.key + 1}',
                ) : null,
              ),
            );
          },
        ),
        AnimatedContentCard(
          index: actions.situationBlocks.length,
          child: OutputCard(
            title: 'Guiding Question',
            preview: actions.guidingQuestion,
            icon: Icons.help_outline,
            accentColor: const Color(0xFF14B8A6),
            onTap: () => _showTextDetail(context, 'Guiding Question', actions.guidingQuestion),
          ),
        ),
      ],
    );
  }

  void _showSituationDetail(BuildContext context, SituationBlock block, List<ExampleItem> examples) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                block.title ?? 'Situation',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'Situation',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                block.situation,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Text(
                'Aligned Response',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.green,
                    ),
              ),
              const SizedBox(height: 8),
              ...block.alignedResponse.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(item)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Be Wary Of',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.orange,
                    ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ...block.beWaryOf.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.warning, color: Colors.orange, size: 20),
                              const SizedBox(width: 8),
                              Expanded(child: Text(item)),
                            ],
                          ),
                        ),
                      ),
                      if (examples.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            showExamplesSheet(
                              context: context,
                              examples: examples,
                              sectionTitle: block.title ?? 'Situation',
                            );
                          },
                          icon: const Icon(Icons.movie_outlined),
                          label: Text('View ${examples.length} Example${examples.length > 1 ? 's' : ''}'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTextDetail(BuildContext context, String title, String content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Text(
                    content,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
