import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/models/constellation.dart';
import '../../../core/models/psyche_model.dart';
import '../../../core/widgets/output_card.dart';
import '../../../core/widgets/examples_sheet.dart';
import '../../../core/widgets/progressive_output_page.dart';
import '../../shared/constellation_card.dart';

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
    // Use effective output which includes tone-rendered content when available
    final effectiveOutput = ref.watch(effectiveMeOutputProvider);
    // Watch PsycheModel - SINGLE SOURCE OF TRUTH for structural positions
    final psycheModelAsync = ref.watch(mePsycheModelProvider);
    // Watch tone state for loading state
    final toneState = ref.watch(toneRepositoryProvider);
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
      child: Stack(
        children: [
          outputAsync.when(
            data: (_) => _buildContent(context, ref, effectiveOutput, psycheModelAsync.valueOrNull),
            loading: () => ProgressiveLoadingWidget(sections: _loadingSections),
            error: (error, stack) => _buildErrorState(context, ref, error),
          ),
          // Tone loading overlay
          if (toneState.isLoading)
            Positioned.fill(
              child: Container(
                color: theme.scaffoldBackgroundColor.withOpacity(0.85),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Adjusting narrative tone...'),
                    ],
                  ),
                ),
              ),
            ),
        ],
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

  Widget _buildContent(BuildContext context, WidgetRef ref, GeneratedOutput? output, PsycheModel? psycheModel) {
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

    // Use PsycheModel as SINGLE SOURCE OF TRUTH for structural positions
    // This ensures Identification and Archetypes pages show the same character assignments
    final structuralPositions = psycheModel?.structuralPositions;
    
    // Use identification_v2 if available (Center/Orbit system)
    final v2 = output.identificationV2;
    if (v2 != null) {
      return _buildV2Content(context, output, v2, structuralPositions);
    }

    // Fallback to legacy identification
    return _buildLegacyContent(context, output, structuralPositions);
  }

  /// Build the new Center/Orbit/Compensation UI
  Widget _buildV2Content(BuildContext context, GeneratedOutput output, IdentificationV2 v2, StructuralPositions? structuralPositions) {
    final examples = output.examples?.identification;
    
    // Get character overrides from PsycheModel (single source of truth)
    // This ensures consistency between Identification and Archetypes pages
    final characterOverrides = <String, String?>{
      'ego': structuralPositions?.ego?.primary,
      'persona': structuralPositions?.persona?.primary,
      'shadow': structuralPositions?.shadow?.primary,
      'feelingFunction': structuralPositions?.feelingFunction?.primary,
      'erosAxis': structuralPositions?.erosAxis?.primary,
    };
    
    final archetypes = [
      ('ego', v2.ego, examples?.ego ?? []),
      ('persona', v2.persona, examples?.persona ?? []),
      ('shadow', v2.shadow, examples?.shadow ?? []),
      ('shadowVirtue', v2.shadowVirtue, examples?.shadowVirtue ?? []),
      ('feelingFunction', v2.feelingFunction, examples?.feelingFunction ?? []),
      ('erosAxis', v2.erosAxis, examples?.erosAxis ?? []),
    ];

    final sections = <Widget>[
      // Constellation Card at the top
      _ConstellationSection(),
      const SizedBox(height: 8),
    ];
    int index = 0;
    
    for (final (key, dynamics, exampleList) in archetypes) {
      if (dynamics != null) {
        sections.add(AnimatedContentCard(
          index: index++,
          child: _buildDynamicsCard(context, key, dynamics, exampleList, characterOverrides[key]),
        ));
      }
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: sections,
    );
  }

  /// Build the legacy identification UI (fallback)
  Widget _buildLegacyContent(BuildContext context, GeneratedOutput output, StructuralPositions? structuralPositions) {
    final identification = output.identification;
    final examples = output.examples?.identification;
    
    // Get character overrides from PsycheModel (single source of truth)
    final characterOverrides = <String, String?>{
      'Ego': structuralPositions?.ego?.primary,
      'Persona': structuralPositions?.persona?.primary,
      'Shadow': structuralPositions?.shadow?.primary,
      'Feeling Function': structuralPositions?.feelingFunction?.primary,
      'Eros Axis': structuralPositions?.erosAxis?.primary,
    };

    final sections = <Widget>[
      // Constellation Card at the top (for legacy UI too)
      _ConstellationSection(),
      const SizedBox(height: 8),
      AnimatedContentCard(index: 0, child: _buildArchetypeCard(context, 'Ego', identification.ego, examples?.ego ?? [], characterOverrides['Ego'])),
      AnimatedContentCard(index: 1, child: _buildArchetypeCard(context, 'Persona', identification.persona, examples?.persona ?? [], characterOverrides['Persona'])),
      AnimatedContentCard(index: 2, child: _buildArchetypeCard(context, 'Shadow', identification.shadow, examples?.shadow ?? [], characterOverrides['Shadow'])),
      if (identification.shadowVirtue != null)
        AnimatedContentCard(index: 3, child: _buildArchetypeCard(context, 'Shadow Virtue', identification.shadowVirtue!, examples?.shadowVirtue ?? [], null)),
      AnimatedContentCard(index: 4, child: _buildArchetypeCard(context, 'Feeling Function', identification.feelingFunction, examples?.feelingFunction ?? [], characterOverrides['Feeling Function'])),
      if (identification.erosAxis != null)
        AnimatedContentCard(index: 5, child: _buildArchetypeCard(context, 'Eros Axis', identification.erosAxis!, examples?.erosAxis ?? [], characterOverrides['Eros Axis'])),
      if (identification.moralOrientation != null)
        AnimatedContentCard(index: 6, child: _buildArchetypeCard(context, 'Moral Orientation', identification.moralOrientation!, [], null)),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: sections,
    );
  }

  /// Build a card for the new dynamics structure (Center/Orbit/Compensation)
  /// [characterOverride] - from PsycheModel to ensure consistency with Archetypes page
  Widget _buildDynamicsCard(
    BuildContext context,
    String key,
    ArchetypeDynamics dynamics,
    List<ExampleItem> examples,
    String? characterOverride,
  ) {
    final color = _colorMap[key] ?? const Color(0xFF7C3AED);
    final icon = _iconMap[key] ?? Icons.person;
    final label = _labelMap[key] ?? key;
    final center = dynamics.center;
    
    // Use character from PsycheModel if available (single source of truth)
    // Otherwise fall back to original center.characters
    // Filter out duplicates to avoid showing the same character twice
    List<String> displayCharacters;
    if (characterOverride != null && characterOverride.isNotEmpty) {
      final otherCharacters = center.characters
          .where((c) => c.toLowerCase() != characterOverride.toLowerCase())
          .toList();
      displayCharacters = _deduplicateCharacters([characterOverride, ...otherCharacters]);
    } else {
      displayCharacters = _deduplicateCharacters(center.characters);
    }
    
    // Also replace wrong character name in preview/summary text
    final displayPreview = _replaceCharacterInText(center.summary, characterOverride, center.characters);

    return OutputCard(
      title: center.label,
      preview: displayPreview,
      icon: icon,
      accentColor: color,
      onTap: () => _showDynamicsDetail(context, key, dynamics, examples, label, characterOverride),
      onShowExamples: examples.isNotEmpty ? () => showExamplesSheet(
        context: context,
        examples: examples,
        sectionTitle: label,
      ) : null,
      trailing: Wrap(
        spacing: 6,
        children: [
          // Character chips - uses PsycheModel character if available
          ...displayCharacters.take(2).map((char) => Container(
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

  /// Build archetype card for legacy identification
  /// [characterOverride] - from PsycheModel to ensure consistency with Archetypes page
  Widget _buildArchetypeCard(
    BuildContext context,
    String label,
    ArchetypeBlock archetype,
    List<ExampleItem> examples,
    String? characterOverride,
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
    
    // Use character from PsycheModel if available (single source of truth)
    // Otherwise fall back to original archetype.characters
    // Filter out duplicates to avoid showing the same character twice
    List<String> displayCharacters;
    if (characterOverride != null && characterOverride.isNotEmpty) {
      final otherCharacters = archetype.characters
          .where((c) => c.toLowerCase() != characterOverride.toLowerCase())
          .toList();
      displayCharacters = _deduplicateCharacters([characterOverride, ...otherCharacters]);
    } else {
      displayCharacters = _deduplicateCharacters(archetype.characters);
    }
    
    // Also replace wrong character name in preview/summary text
    final displayPreview = _replaceCharacterInText(archetype.summary, characterOverride, archetype.characters);
    
    return OutputCard(
      title: archetype.title,
      preview: displayPreview,
      icon: iconMap[label] ?? Icons.person,
      accentColor: colorMap[label],
      onTap: () => _showArchetypeDetail(
        context,
        archetype,
        examples,
        label,
        characterOverride,
      ),
      onShowExamples: examples.isNotEmpty ? () => showExamplesSheet(
        context: context,
        examples: examples,
        sectionTitle: label,
      ) : null,
      trailing: displayCharacters.isEmpty
          ? null
          : Wrap(
              spacing: 6,
              children: displayCharacters
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
  /// [characterOverride] - from PsycheModel if available
  void _showDynamicsDetail(
    BuildContext context,
    String key,
    ArchetypeDynamics dynamics,
    List<ExampleItem> examples,
    String label,
    String? characterOverride,
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
                      _buildCenterCard(context, dynamics.center, color, characterOverride),
                      
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

  /// Helper to replace wrong character name in narrative text with correct one
  String _replaceCharacterInText(String text, String? correctChar, List<String> originalChars) {
    if (correctChar == null || correctChar.isEmpty) return text;
    if (originalChars.isEmpty) return text;
    
    String result = text;
    final correctCharLower = correctChar.toLowerCase();
    
    // Replace each original character name that doesn't match the correct one
    for (final origChar in originalChars) {
      if (origChar.toLowerCase() != correctCharLower) {
        // Use case-insensitive replacement
        result = result.replaceAll(RegExp(RegExp.escape(origChar), caseSensitive: false), correctChar);
      }
    }
    return result;
  }
  
  /// Helper to deduplicate characters list (case-insensitive)
  List<String> _deduplicateCharacters(List<String> characters) {
    final seen = <String>{};
    final result = <String>[];
    for (final char in characters) {
      final lower = char.toLowerCase();
      if (!seen.contains(lower)) {
        seen.add(lower);
        result.add(char);
      }
    }
    return result;
  }

  Widget _buildCenterCard(BuildContext context, CenterPosition center, Color color, String? characterOverride) {
    final theme = Theme.of(context);
    
    // Use character from PsycheModel if available (single source of truth)
    // Filter out duplicates to avoid showing the same character twice
    List<String> displayCharacters;
    if (characterOverride != null && characterOverride.isNotEmpty) {
      // Start with the override, then add other characters that aren't duplicates
      final otherCharacters = center.characters
          .where((c) => c.toLowerCase() != characterOverride.toLowerCase())
          .toList();
      displayCharacters = _deduplicateCharacters([characterOverride, ...otherCharacters]);
    } else {
      displayCharacters = _deduplicateCharacters(center.characters);
    }
    
    // Also replace wrong character name in narrative text
    final displaySummary = _replaceCharacterInText(center.summary, characterOverride, center.characters);
    final displayDetails = center.details != null 
        ? _replaceCharacterInText(center.details!, characterOverride, center.characters)
        : null;
    
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
          // Characters - uses PsycheModel character if available
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: displayCharacters.map((char) => Chip(
              label: Text(char, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
              backgroundColor: color.withOpacity(0.15),
              side: BorderSide.none,
            )).toList(),
          ),
          const SizedBox(height: 12),
          // Summary - with corrected character name
          Text(displaySummary, style: theme.textTheme.bodyLarge),
          // Details - with corrected character name
          if (displayDetails != null && displayDetails.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(displayDetails, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700)),
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

  /// Show detailed view for legacy archetype
  /// [characterOverride] - from PsycheModel if available
  void _showArchetypeDetail(
    BuildContext context,
    ArchetypeBlock archetype,
    List<ExampleItem> examples,
    String label,
    String? characterOverride,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          // Use character from PsycheModel if available (single source of truth)
          // Filter out duplicates to avoid showing the same character twice
          List<String> displayCharacters;
          if (characterOverride != null && characterOverride.isNotEmpty) {
            final otherCharacters = archetype.characters
                .where((c) => c.toLowerCase() != characterOverride.toLowerCase())
                .toList();
            displayCharacters = _deduplicateCharacters([characterOverride, ...otherCharacters]);
          } else {
            displayCharacters = _deduplicateCharacters(archetype.characters);
          }
          
          // Also replace wrong character name in narrative text
          final displaySummary = _replaceCharacterInText(archetype.summary, characterOverride, archetype.characters);
          final displayDetails = archetype.details != null 
              ? _replaceCharacterInText(archetype.details!, characterOverride, archetype.characters)
              : null;
          
          return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                archetype.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              if (displayCharacters.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  children: displayCharacters
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
                displaySummary,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              if (displayDetails != null && displayDetails.isNotEmpty) ...[
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
                      displayDetails,
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
        );
        },
      ),
    );
  }
}

/// Widget to display constellation data in the Identification tab
/// Uses mePsycheModelProvider for consistency with the Archetypes tab (single source of truth)
class _ConstellationSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use PsycheModel as the single source of truth (same as ConstellationTab)
    final psycheModelAsync = ref.watch(mePsycheModelProvider);
    final theme = Theme.of(context);

    return psycheModelAsync.when(
      data: (psycheModel) {
        print('🔮 [Constellation] PsycheModel received: ${psycheModel != null}');
        if (psycheModel == null) {
          // Show a placeholder if no data
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Icon(Icons.auto_awesome, color: theme.colorScheme.primary.withOpacity(0.5)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Archetype constellation will appear here after generating your profile.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        // Build constellation display from PsycheModel
        return _buildConstellationFromPsyche(context, psycheModel);
      },
      loading: () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(strokeWidth: 2),
              SizedBox(height: 12),
              Text('Loading constellation...'),
            ],
          ),
        ),
      ),
      error: (error, stack) {
        print('❌ [Constellation] Error: $error');
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.red.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Could not load constellation: $error',
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildConstellationFromPsyche(BuildContext context, PsycheModel psycheModel) {
    final theme = Theme.of(context);
    final positions = psycheModel.structuralPositions;
    final motifs = psycheModel.motifDistribution;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.05),
            theme.colorScheme.secondary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'Archetype Constellation',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Show structural positions as chips (with null safety)
          if (positions != null) Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (positions.ego?.primary != null)
                _buildPositionChip(context, 'Ego', positions.ego!.primary!, Colors.purple),
              if (positions.persona?.primary != null)
                _buildPositionChip(context, 'Persona', positions.persona!.primary!, Colors.blue),
              if (positions.shadow?.primary != null)
                _buildPositionChip(context, 'Shadow', positions.shadow!.primary!, Colors.grey.shade700),
              if (positions.feelingFunction?.primary != null)
                _buildPositionChip(context, 'Feeling', positions.feelingFunction!.primary!, Colors.pink),
              if (positions.erosAxis?.primary != null)
                _buildPositionChip(context, 'Eros', positions.erosAxis!.primary!, Colors.orange),
            ],
          ),
          if (motifs.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Text(
              'Top Archetypal Energies',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 8),
            ...motifs.take(3).map((motif) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _formatMotifName(motif.motif),
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 6,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: motif.score.clamp(0.0, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 35,
                    child: Text(
                      '${(motif.score * 100).toInt()}%',
                      style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ],
      ),
    );
  }
  
  Widget _buildPositionChip(BuildContext context, String role, String character, Color color) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            role,
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            character,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
  
  String _formatMotifName(String motif) {
    // Convert SNAKE_CASE to Title Case
    return motif
        .split('_')
        .map((word) => word.isNotEmpty 
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : '')
        .join(' ');
  }
}
