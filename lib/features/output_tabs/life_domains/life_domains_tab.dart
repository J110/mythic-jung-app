import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/widgets/output_card.dart';
import '../../../core/widgets/examples_sheet.dart';
import '../../../core/widgets/progressive_output_page.dart';

class LifeDomainsTab extends ConsumerWidget {
  final bool embedded;
  
  const LifeDomainsTab({super.key, this.embedded = false});

  static const _loadingSections = [
    SectionDefinition(title: 'Work & Purpose', icon: Icons.work, accentColor: Color(0xFF6366F1)),
    SectionDefinition(title: 'Leadership & Authority', icon: Icons.groups, accentColor: Color(0xFF7C3AED)),
    SectionDefinition(title: 'Truth & Moral Courage', icon: Icons.gavel, accentColor: Color(0xFFD97706)),
    SectionDefinition(title: 'Relationships & Intimacy', icon: Icons.favorite, accentColor: Color(0xFFEC4899)),
    SectionDefinition(title: 'Friendships & Social', icon: Icons.people, accentColor: Color(0xFF14B8A6)),
    SectionDefinition(title: 'Emotional & Inner Life', icon: Icons.self_improvement, accentColor: Color(0xFF10B981)),
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
        title: const Text('Life Domains'),
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

    final domains = output.lifeDomains;
    final examples = output.examples?.lifeDomains;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AnimatedContentCard(index: 0, child: _buildDomainCard(context, domains.work, examples?.work ?? [], 'work')),
        AnimatedContentCard(index: 1, child: _buildDomainCard(context, domains.leadership, examples?.leadership ?? [], 'leadership')),
        AnimatedContentCard(index: 2, child: _buildDomainCard(context, domains.truth, examples?.truth ?? [], 'truth')),
        AnimatedContentCard(index: 3, child: _buildDomainCard(context, domains.intimacy, examples?.intimacy ?? [], 'intimacy')),
        AnimatedContentCard(index: 4, child: _buildDomainCard(context, domains.social, examples?.social ?? [], 'social')),
        AnimatedContentCard(index: 5, child: _buildDomainCard(context, domains.innerLife, examples?.innerLife ?? [], 'innerLife')),
      ],
    );
  }

  Widget _buildDomainCard(BuildContext context, DomainBlock domain, List<ExampleItem> examples, String domainKey) {
    final preview = domain.iAm.isNotEmpty
        ? domain.iAm.first
        : 'Tap to explore this life domain';

    final iconMap = {
      'Work & Purpose': Icons.work,
      'Leadership & Authority': Icons.groups,
      'Truth, Rules & Moral Courage': Icons.gavel,
      'Relationships & Intimacy': Icons.favorite,
      'Friendships & Social Life': Icons.people,
      'Emotional & Inner Life': Icons.self_improvement,
    };

    final colorMap = {
      'Work & Purpose': const Color(0xFF6366F1),
      'Leadership & Authority': const Color(0xFF7C3AED),
      'Truth, Rules & Moral Courage': const Color(0xFFD97706),
      'Relationships & Intimacy': const Color(0xFFEC4899),
      'Friendships & Social Life': const Color(0xFF14B8A6),
      'Emotional & Inner Life': const Color(0xFF10B981),
    };

    return OutputCard(
      title: domain.title,
      preview: preview,
      icon: iconMap[domain.title],
      accentColor: colorMap[domain.title],
      onTap: () => _showDomainDetail(context, domain, examples),
      onShowExamples: examples.isNotEmpty ? () => showExamplesSheet(
        context: context,
        examples: examples,
        sectionTitle: domain.title,
      ) : null,
    );
  }

  void _showDomainDetail(BuildContext context, DomainBlock domain, List<ExampleItem> examples) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                domain.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (domain.iAm.isNotEmpty) ...[
                        _buildSection(
                          context,
                          'I Am',
                          domain.iAm,
                          Icons.person,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (domain.iTendTo.isNotEmpty) ...[
                        _buildSection(
                          context,
                          'I Tend To',
                          domain.iTendTo,
                          Icons.trending_up,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (domain.typicalSituations.isNotEmpty) ...[
                        _buildSection(
                          context,
                          'Typical Situations',
                          domain.typicalSituations,
                          Icons.event,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (domain.watchOuts.isNotEmpty) ...[
                        _buildSection(
                          context,
                          'Watch Outs',
                          domain.watchOuts,
                          Icons.warning,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (domain.toRealizePotential.isNotEmpty) ...[
                        _buildSection(
                          context,
                          'To Realize Potential',
                          domain.toRealizePotential,
                          Icons.lightbulb,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (domain.selfDirection.isNotEmpty) ...[
                        Text(
                          'Self Direction',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          domain.selfDirection,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (examples.isNotEmpty) ...[
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            showExamplesSheet(
                              context: context,
                              examples: examples,
                              sectionTitle: domain.title,
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

  Widget _buildSection(
    BuildContext context,
    String title,
    List<String> items,
    IconData icon, {
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 28),
                Expanded(
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
