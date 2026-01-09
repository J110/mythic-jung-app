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

  static const _colorMap = {
    'ego': Color(0xFF7C3AED),
    'persona': Color(0xFF6366F1),
    'shadow': Color(0xFF4B5563),
    'shadowVirtue': Color(0xFF10B981),
    'feelingFunction': Color(0xFFEC4899),
    'erosAxis': Color(0xFFF59E0B),
  };

  static const _iconMap = {
    'ego': Icons.person,
    'persona': Icons.masks,
    'shadow': Icons.visibility_off,
    'shadowVirtue': Icons.self_improvement,
    'feelingFunction': Icons.favorite,
    'erosAxis': Icons.connect_without_contact,
  };

  static const _labelMap = {
    'ego': 'Ego',
    'persona': 'Persona',
    'shadow': 'Shadow',
    'shadowVirtue': 'Shadow Virtue',
    'feelingFunction': 'Feeling Function',
    'erosAxis': 'Eros Axis',
  };

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

    // Use identification_v2 if available (Center/Orbit system)
    final v2 = output.identificationV2;
    if (v2 != null) {
      return _buildV2Content(context, output, v2);
    }

    // Fallback to legacy identification
    return _buildLegacyContent(context, output);
  }

  /// Build the new Center/Orbit/Compensation UI
  Widget _buildV2Content(BuildContext context, GeneratedOutput output, IdentificationV2 v2) {
    final examples = output.examples?.identification;
    
    final archetypes = [
      ('ego', v2.ego, examples?.ego ?? []),
      ('persona', v2.persona, examples?.persona ?? []),
      ('shadow', v2.shadow, examples?.shadow ?? []),
      ('shadowVirtue', v2.shadowVirtue, examples?.shadowVirtue ?? []),
      ('feelingFunction', v2.feelingFunction, examples?.feelingFunction ?? []),
      ('erosAxis', v2.erosAxis, examples?.erosAxis ?? []),
    ];

    final sections = <Widget>[];
    int index = 0;
    
    for (final (key, dynamics, exampleList) in archetypes) {
      if (dynamics != null) {
        sections.add(AnimatedContentCard(
          index: index++,
          child: _buildDynamicsCard(context, key, dynamics, exampleList),
        ));
      }
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: sections,
    );
  }

  /// Build the legacy identification UI (fallback)
  Widget _buildLegacyContent(BuildContext context, GeneratedOutput output) {
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

  /// Build a card for the new dynamics structure (Center/Orbit/Compensation)
  Widget _buildDynamicsCard(
    BuildContext context,
    String key,
    ArchetypeDynamics dynamics,
    List<ExampleItem> examples,
  ) {
    final color = _colorMap[key] ?? const Color(0xFF7C3AED);
    final icon = _iconMap[key] ?? Icons.person;
    final label = _labelMap[key] ?? key;
    final center = dynamics.center;

    return OutputCard(
      title: center.label,
      preview: center.summary,
      icon: icon,
      accentColor: color,
      onTap: () => _showDynamicsDetail(context, key, dynamics, examples, label),
      onShowExamples: examples.isNotEmpty ? () => showExamplesSheet(
        context: context,
        examples: examples,
        sectionTitle: label,
      ) : null,
      trailing: Wrap(
        spacing: 6,
        children: [
          // Character chips
          ...center.characters.take(2).map((char) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withOpacity(0.3), width: 1),
            ),
            child: Text(
              char,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
            ),
          )),
          // Orbit/Compensation count badges
          if (dynamics.orbit.isNotEmpty)
            _buildBadge('${dynamics.orbit.length} shifts', Colors.blue),
          if (dynamics.compensations.isNotEmpty)
            _buildBadge('${dynamics.compensations.length} comps', Colors.orange),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: color),
      ),
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

  /// Show detailed view for dynamics (Center/Orbit/Compensation)
  void _showDynamicsDetail(
    BuildContext context,
    String key,
    ArchetypeDynamics dynamics,
    List<ExampleItem> examples,
    String label,
  ) {
    final color = _colorMap[key] ?? const Color(0xFF7C3AED);
    final theme = Theme.of(context);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(_iconMap[key], color: color, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(label, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    if (examples.isNotEmpty)
                      IconButton(
                        icon: Icon(Icons.movie_outlined, color: color),
                        onPressed: () {
                          Navigator.pop(context);
                          showExamplesSheet(context: context, examples: examples, sectionTitle: label);
                        },
                      ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // === CENTER SECTION ===
                      _buildSectionHeader(context, '🎯 Center', 'Where you stand most often', color),
                      const SizedBox(height: 12),
                      _buildCenterCard(context, dynamics.center, color),
                      
                      // === ORBIT SECTION ===
                      if (dynamics.orbit.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        _buildSectionHeader(context, '🌀 Contextual Shifts', 'Where you move depending on conditions', Colors.blue),
                        const SizedBox(height: 12),
                        ...dynamics.orbit.map((orbit) => _buildOrbitCard(context, orbit)),
                      ],
                      
                      // === COMPENSATION SECTION ===
                      if (dynamics.compensations.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        _buildSectionHeader(context, '⚠️ Compensations', 'When balance is lost', Colors.orange),
                        const SizedBox(height: 12),
                        ...dynamics.compensations.map((comp) => _buildCompensationCard(context, comp)),
                      ],
                      
                      const SizedBox(height: 32),
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

  Widget _buildSectionHeader(BuildContext context, String title, String subtitle, Color color) {
    return Row(
      children: [
        Container(width: 4, height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildCenterCard(BuildContext context, CenterPosition center, Color color) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Characters
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: center.characters.map((char) => Chip(
              label: Text(char, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
              backgroundColor: color.withOpacity(0.15),
              side: BorderSide.none,
            )).toList(),
          ),
          const SizedBox(height: 12),
          // Summary
          Text(center.summary, style: theme.textTheme.bodyLarge),
          // Details
          if (center.details != null && center.details!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(center.details!, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700)),
          ],
        ],
      ),
    );
  }

  Widget _buildOrbitCard(BuildContext context, OrbitEntry orbit) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trigger
          Row(
            children: [
              Icon(Icons.bolt, size: 18, color: Colors.blue.shade600),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  orbit.trigger.name,
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue.shade700),
                ),
              ),
            ],
          ),
          // Tags
          if (orbit.trigger.tags.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: orbit.trigger.tags.map((tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(tag, style: theme.textTheme.labelSmall?.copyWith(color: Colors.blue.shade600)),
              )).toList(),
            ),
          ],
          // Characters
          if (orbit.characters.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text('Shifts toward: ${orbit.characters.join(", ")}', style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic)),
          ],
          // Pattern
          if (orbit.pattern != null && orbit.pattern!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(orbit.pattern!, style: theme.textTheme.bodyMedium),
          ],
          // Cost Risk
          if (orbit.costRisk != null && orbit.costRisk!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning_amber, size: 14, color: Colors.orange.shade600),
                const SizedBox(width: 6),
                Expanded(child: Text(orbit.costRisk!, style: theme.textTheme.bodySmall?.copyWith(color: Colors.orange.shade700))),
              ],
            ),
          ],
          // Stabilizer
          if (orbit.stabilizer != null && orbit.stabilizer!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.anchor, size: 14, color: Colors.green.shade600),
                const SizedBox(width: 6),
                Expanded(child: Text(orbit.stabilizer!, style: theme.textTheme.bodySmall?.copyWith(color: Colors.green.shade700))),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCompensationCard(BuildContext context, CompensationEntry comp) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(comp.name, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.orange.shade800)),
          // When
          if (comp.when != null && comp.when!.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text('Activates ${comp.when}', style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic, color: Colors.grey.shade600)),
          ],
          // Characters
          if (comp.characters.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: comp.characters.map((char) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(char, style: theme.textTheme.labelSmall?.copyWith(color: Colors.orange.shade700, fontWeight: FontWeight.w600)),
              )).toList(),
            ),
          ],
          // Expression
          if (comp.expression.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text('Expression:', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            ...comp.expression.map((e) => Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(e, style: theme.textTheme.bodySmall)),
                ],
              ),
            )),
          ],
          // Risk
          if (comp.risk != null && comp.risk!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning, size: 16, color: Colors.red.shade600),
                  const SizedBox(width: 8),
                  Expanded(child: Text(comp.risk!, style: theme.textTheme.bodySmall?.copyWith(color: Colors.red.shade700))),
                ],
              ),
            ),
          ],
          // Return Path
          if (comp.returnPath != null && comp.returnPath!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.replay, size: 16, color: Colors.green.shade600),
                  const SizedBox(width: 8),
                  Expanded(child: Text(comp.returnPath!, style: theme.textTheme.bodySmall?.copyWith(color: Colors.green.shade700))),
                ],
              ),
            ),
          ],
        ],
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
