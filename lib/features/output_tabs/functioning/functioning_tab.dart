import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/widgets/output_card.dart';
import '../../../core/widgets/examples_sheet.dart';
import '../../../core/widgets/progressive_output_page.dart';

class FunctioningTab extends ConsumerWidget {
  final bool embedded;
  
  const FunctioningTab({super.key, this.embedded = false});

  static const _loadingSections = [
    SectionDefinition(title: 'Core Traits', icon: Icons.psychology, accentColor: Color(0xFF6366F1)),
    SectionDefinition(title: 'Symbolic Essence', icon: Icons.auto_awesome, accentColor: Color(0xFFD97706)),
    SectionDefinition(title: 'Narrative Arc', icon: Icons.timeline, accentColor: Color(0xFF7C3AED)),
    SectionDefinition(title: 'Redemption Arc', icon: Icons.arrow_upward, accentColor: Color(0xFF10B981)),
    SectionDefinition(title: 'Costs & Compensations', icon: Icons.balance, accentColor: Color(0xFFF59E0B)),
    SectionDefinition(title: 'Power Stance', icon: Icons.flash_on, accentColor: Color(0xFFEF4444)),
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
        title: const Text('Functioning'),
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

    final functioning = output.functioning;
    // Get section-specific examples
    final funcExamples = output.examples?.functioning ?? const FunctioningExamples();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AnimatedContentCard(
          index: 0,
          child: OutputCard(
            title: 'Core Traits',
            preview: functioning.coreTraits.join(', '),
            icon: Icons.psychology,
            accentColor: const Color(0xFF6366F1),
            onTap: () => _showListDetail(context, 'Core Traits', functioning.coreTraits, funcExamples.coreTraits),
            onShowExamples: funcExamples.coreTraits.isNotEmpty ? () => showExamplesSheet(
              context: context,
              examples: funcExamples.coreTraits,
              sectionTitle: 'Core Traits',
            ) : null,
          ),
        ),
        AnimatedContentCard(
          index: 1,
          child: OutputCard(
            title: 'Symbolic Essence',
            preview: functioning.symbolicEssence,
            icon: Icons.auto_awesome,
            accentColor: const Color(0xFFD97706),
            onTap: () => _showTextDetail(context, 'Symbolic Essence', functioning.symbolicEssence, funcExamples.symbolicEssence),
            onShowExamples: funcExamples.symbolicEssence.isNotEmpty ? () => showExamplesSheet(
              context: context,
              examples: funcExamples.symbolicEssence,
              sectionTitle: 'Symbolic Essence',
            ) : null,
          ),
        ),
        AnimatedContentCard(
          index: 2,
          child: OutputCard(
            title: 'Narrative Arc',
            preview: functioning.narrativeArc,
            icon: Icons.timeline,
            accentColor: const Color(0xFF7C3AED),
            onTap: () => _showTextDetail(context, 'Narrative Arc', functioning.narrativeArc, funcExamples.narrativeArc),
            onShowExamples: funcExamples.narrativeArc.isNotEmpty ? () => showExamplesSheet(
              context: context,
              examples: funcExamples.narrativeArc,
              sectionTitle: 'Narrative Arc',
            ) : null,
          ),
        ),
        AnimatedContentCard(
          index: 3,
          child: OutputCard(
            title: 'Redemption Arc',
            preview: functioning.redemptionArc,
            icon: Icons.arrow_upward,
            accentColor: const Color(0xFF10B981),
            onTap: () => _showTextDetail(context, 'Redemption Arc', functioning.redemptionArc, funcExamples.redemptionArc),
            onShowExamples: funcExamples.redemptionArc.isNotEmpty ? () => showExamplesSheet(
              context: context,
              examples: funcExamples.redemptionArc,
              sectionTitle: 'Redemption Arc',
            ) : null,
          ),
        ),
        if (functioning.costsAndCompensations != null)
          AnimatedContentCard(
            index: 4,
            child: OutputCard(
              title: 'Costs & Compensations',
              preview: functioning.costsAndCompensations!,
              icon: Icons.balance,
              accentColor: const Color(0xFFF59E0B),
              onTap: () => _showTextDetail(context, 'Costs & Compensations', functioning.costsAndCompensations!, funcExamples.costsAndCompensations),
              onShowExamples: funcExamples.costsAndCompensations.isNotEmpty ? () => showExamplesSheet(
                context: context,
                examples: funcExamples.costsAndCompensations,
                sectionTitle: 'Costs & Compensations',
              ) : null,
            ),
          ),
        if (functioning.powerStance != null)
          AnimatedContentCard(
            index: 5,
            child: OutputCard(
              title: 'Power Stance',
              preview: functioning.powerStance!,
              icon: Icons.account_balance,
              accentColor: const Color(0xFFDC2626),
              onTap: () => _showTextDetail(context, 'Power Stance', functioning.powerStance!, []),
            ),
          ),
        if (functioning.alignmentIndicators != null)
          AnimatedContentCard(
            index: 6,
            child: OutputCard(
              title: 'Alignment Indicators',
              preview: _buildAlignmentPreview(functioning.alignmentIndicators!),
              icon: Icons.check_circle_outline,
              accentColor: const Color(0xFF14B8A6),
              onTap: () => _showAlignmentDetail(context, functioning.alignmentIndicators!, funcExamples.alignmentIndicators),
              onShowExamples: funcExamples.alignmentIndicators.isNotEmpty ? () => showExamplesSheet(
                context: context,
                examples: funcExamples.alignmentIndicators,
                sectionTitle: 'Alignment Indicators',
              ) : null,
            ),
          ),
      ],
    );
  }

  String _buildAlignmentPreview(AlignmentIndicators alignment) {
    final alignedCount = alignment.aligned.length;
    final unalignedCount = alignment.unaligned.length;
    if (alignedCount > 0 && unalignedCount > 0) {
      return '${alignment.aligned.first} • ${alignment.unaligned.first}';
    } else if (alignedCount > 0) {
      return alignment.aligned.first;
    } else if (unalignedCount > 0) {
      return alignment.unaligned.first;
    }
    return 'Aligned and unaligned signals';
  }

  void _showTextDetail(BuildContext context, String title, String content, List<ExampleItem> examples) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (examples.isNotEmpty) ...[
                        const SizedBox(height: 24),
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
            ],
          ),
        ),
      ),
    );
  }

  void _showListDetail(BuildContext context, String title, List<String> items, List<ExampleItem> examples) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
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
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: items.length + (examples.isNotEmpty ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == items.length && examples.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton.icon(
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
                      );
                    }
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(items[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlignmentDetail(
    BuildContext context,
    AlignmentIndicators alignment,
    List<ExampleItem> examples,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alignment Indicators',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Text(
                'Aligned',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.green,
                    ),
              ),
              const SizedBox(height: 8),
              ...alignment.aligned.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
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
                'Unaligned',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.orange,
                    ),
              ),
              const SizedBox(height: 8),
              ...alignment.unaligned.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
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
                      sectionTitle: 'Alignment Indicators',
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
    );
  }
}
