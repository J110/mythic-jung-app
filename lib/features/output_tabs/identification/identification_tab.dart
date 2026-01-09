import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/widgets/output_card.dart';
import '../../../core/widgets/examples_sheet.dart';
import '../../../core/widgets/progressive_output_page.dart';

class IdentificationTab extends ConsumerWidget {
  final bool embedded;
  
  const IdentificationTab({super.key, this.embedded = false});

  static const _loadingSections = [
    SectionDefinition(title: 'Ego', icon: Icons.person, accentColor: Color(0xFF7C3AED)),
    SectionDefinition(title: 'Persona', icon: Icons.masks, accentColor: Color(0xFF6366F1)),
    SectionDefinition(title: 'Shadow', icon: Icons.visibility_off, accentColor: Color(0xFF4B5563)),
    SectionDefinition(title: 'Shadow Virtue', icon: Icons.self_improvement, accentColor: Color(0xFF10B981)),
    SectionDefinition(title: 'Feeling Function', icon: Icons.favorite, accentColor: Color(0xFFEC4899)),
    SectionDefinition(title: 'Eros Axis', icon: Icons.connect_without_contact, accentColor: Color(0xFFF59E0B)),
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
        title: const Text('Identification'),
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

    final identification = output.identification;
    final examples = output.examples?.identification;

    final sections = <Widget>[
      AnimatedContentCard(index: 0, child: _buildArchetypeCard(context, 'Ego', identification.ego, examples?.ego ?? [])),
      AnimatedContentCard(index: 1, child: _buildArchetypeCard(context, 'Persona', identification.persona, examples?.persona ?? [])),
      AnimatedContentCard(index: 2, child: _buildArchetypeCard(context, 'Shadow', identification.shadow, examples?.shadow ?? [])),
      if (identification.shadowVirtue != null)
        AnimatedContentCard(index: 3, child: _buildArchetypeCard(context, 'Shadow Virtue', identification.shadowVirtue!, examples?.shadowVirtue ?? [])),
      AnimatedContentCard(index: 4, child: _buildArchetypeCard(context, 'Feeling Function', identification.feelingFunction, examples?.feelingFunction ?? [])),
      if (identification.erosAxis != null)
        AnimatedContentCard(index: 5, child: _buildArchetypeCard(context, 'Eros Axis', identification.erosAxis!, examples?.erosAxis ?? [])),
      if (identification.moralOrientation != null)
        AnimatedContentCard(index: 6, child: _buildArchetypeCard(context, 'Moral Orientation', identification.moralOrientation!, [])),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: sections,
    );
  }

  Widget _buildArchetypeCard(
    BuildContext context,
    String label,
    ArchetypeBlock archetype,
    List<ExampleItem> examples,
  ) {
    final iconMap = {
      'Ego': Icons.person,
      'Persona': Icons.masks,
      'Shadow': Icons.visibility_off,
      'Shadow Virtue': Icons.self_improvement,
      'Feeling Function': Icons.favorite,
      'Eros Axis': Icons.connect_without_contact,
      'Moral Orientation': Icons.gavel,
    };
    
    final colorMap = {
      'Ego': const Color(0xFF7C3AED),
      'Persona': const Color(0xFF6366F1),
      'Shadow': const Color(0xFF4B5563),
      'Shadow Virtue': const Color(0xFF10B981),
      'Feeling Function': const Color(0xFFEC4899),
      'Eros Axis': const Color(0xFFF59E0B),
      'Moral Orientation': const Color(0xFF06B6D4),
    };
    
    return OutputCard(
      title: archetype.title,
      preview: archetype.summary,
      icon: iconMap[label] ?? Icons.person,
      accentColor: colorMap[label],
      onTap: () => _showArchetypeDetail(
        context,
        archetype,
        examples,
        label,
      ),
      onShowExamples: examples.isNotEmpty ? () => showExamplesSheet(
        context: context,
        examples: examples,
        sectionTitle: label,
      ) : null,
      trailing: archetype.characters.isEmpty
          ? null
          : Wrap(
              spacing: 6,
              children: archetype.characters
                  .take(3)
                  .map((char) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: (colorMap[label] ?? const Color(0xFF7C3AED))
                              .withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: (colorMap[label] ?? const Color(0xFF7C3AED))
                                .withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          char,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: colorMap[label] ?? const Color(0xFF7C3AED),
                          ),
                        ),
                      ))
                  .toList(),
            ),
    );
  }

  void _showArchetypeDetail(
    BuildContext context,
    ArchetypeBlock archetype,
    List<ExampleItem> examples,
    String label,
  ) {
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
                archetype.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              if (archetype.characters.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  children: archetype.characters
                      .map((char) => Chip(label: Text(char)))
                      .toList(),
                ),
                const SizedBox(height: 16),
              ],
              Text(
                'Summary',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                archetype.summary,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (archetype.details != null && archetype.details!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Details',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Text(
                      archetype.details!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
              if (examples.isNotEmpty) ...[
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    showExamplesSheet(
                      context: context,
                      examples: examples,
                      sectionTitle: label,
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
