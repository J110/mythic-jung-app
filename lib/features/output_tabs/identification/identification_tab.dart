import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/generated_output.dart';
import '../../../core/models/psyche_model.dart';
import '../../shared/redesign/redesign.dart';
import '../../shared/redesign/sub_header.dart';
import '../../shared/redesign/content_card.dart';

class IdentificationTab extends ConsumerWidget {
  final bool embedded;
  
  const IdentificationTab({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outputAsync = ref.watch(outputRepositoryProvider);
    final effectiveOutput = ref.watch(effectiveMeOutputProvider);
    final psycheModelAsync = ref.watch(mePsycheModelProvider);
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
            data: (_) => _buildContent(context, ref, effectiveOutput, psycheModelAsync.valueOrNull),
            loading: () => _buildLoadingState(context),
            error: (error, stack) => _buildErrorState(context, ref, error),
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
        title: const Text('Identity'),
      ),
      body: content,
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Sub-header
          const PsycheSubHeader(),
          
          const SizedBox(height: 16),
          
          // Loading cards grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              itemCount: PsychePositionConfigs.all.length,
              itemBuilder: (context, index) {
                final config = PsychePositionConfigs.all[index];
                return PsychePositionCard(
                  config: config,
                  isLoading: true,
                );
              },
            ),
          ),
          
          const SizedBox(height: 24),
        ],
      ),
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

    final structuralPositions = psycheModel?.structuralPositions;
    final v2 = output.identificationV2;
    
    // Get identification content
    final identification = v2 ?? output.identification;
    final examples = output.examples?.identification;

    // Helper to convert OrbitEntry to OrbitEntryData
    OrbitEntryData convertOrbit(OrbitEntry o) => OrbitEntryData(
      triggerName: o.trigger.name,
      triggerTags: o.trigger.tags,
      characters: o.characters,
      pattern: o.pattern,
      costRisk: o.costRisk,
      stabilizer: o.stabilizer,
    );

    // Helper to convert CompensationEntry to CompensationEntryData
    CompensationEntryData convertCompensation(CompensationEntry c) => CompensationEntryData(
      name: c.name,
      when: c.when,
      expression: c.expression,
      risk: c.risk,
      returnPath: c.returnPath,
      characters: c.characters,
    );

    // Build position data map
    final positionData = <String, _PositionData>{};
    
    if (v2 != null) {
      // V2 format with dynamics (includes orbit and compensation)
      if (v2.ego != null) {
        positionData['ego'] = _PositionData(
          character: structuralPositions?.ego?.primary,
          content: '${v2.ego!.center.summary}\n\n${v2.ego!.center.details ?? ""}',
          examples: examples?.ego ?? [],
          confidence: structuralPositions?.ego?.confidence,
          orbitEntries: v2.ego!.orbit.map(convertOrbit).toList(),
          compensationEntries: v2.ego!.compensations.map(convertCompensation).toList(),
          iconicShape: structuralPositions?.ego?.iconicShape,
        );
      }
      if (v2.persona != null) {
        positionData['persona'] = _PositionData(
          character: structuralPositions?.persona?.primary,
          content: '${v2.persona!.center.summary}\n\n${v2.persona!.center.details ?? ""}',
          examples: examples?.persona ?? [],
          confidence: structuralPositions?.persona?.confidence,
          orbitEntries: v2.persona!.orbit.map(convertOrbit).toList(),
          compensationEntries: v2.persona!.compensations.map(convertCompensation).toList(),
          iconicShape: structuralPositions?.persona?.iconicShape,
        );
      }
      if (v2.shadow != null) {
        positionData['shadow'] = _PositionData(
          character: structuralPositions?.shadow?.primary,
          content: '${v2.shadow!.center.summary}\n\n${v2.shadow!.center.details ?? ""}',
          examples: examples?.shadow ?? [],
          confidence: structuralPositions?.shadow?.confidence,
          orbitEntries: v2.shadow!.orbit.map(convertOrbit).toList(),
          compensationEntries: v2.shadow!.compensations.map(convertCompensation).toList(),
          iconicShape: structuralPositions?.shadow?.iconicShape,
        );
      }
      if (v2.feelingFunction != null) {
        positionData['feelingFunction'] = _PositionData(
          character: structuralPositions?.feelingFunction?.primary,
          content: '${v2.feelingFunction!.center.summary}\n\n${v2.feelingFunction!.center.details ?? ""}',
          examples: examples?.feelingFunction ?? [],
          confidence: structuralPositions?.feelingFunction?.confidence,
          orbitEntries: v2.feelingFunction!.orbit.map(convertOrbit).toList(),
          compensationEntries: v2.feelingFunction!.compensations.map(convertCompensation).toList(),
          iconicShape: structuralPositions?.feelingFunction?.iconicShape,
        );
      }
      if (v2.erosAxis != null) {
        positionData['erosAxis'] = _PositionData(
          character: structuralPositions?.erosAxis?.primary,
          content: '${v2.erosAxis!.center.summary}\n\n${v2.erosAxis!.center.details ?? ""}',
          examples: examples?.erosAxis ?? [],
          confidence: structuralPositions?.erosAxis?.confidence,
          orbitEntries: v2.erosAxis!.orbit.map(convertOrbit).toList(),
          compensationEntries: v2.erosAxis!.compensations.map(convertCompensation).toList(),
          iconicShape: structuralPositions?.erosAxis?.iconicShape,
        );
      }
    } else {
      // Legacy format
      final legacyId = output.identification;
      positionData['ego'] = _PositionData(
        character: structuralPositions?.ego?.primary ?? legacyId.ego.characters.firstOrNull,
        content: '${legacyId.ego.summary}\n\n${legacyId.ego.details ?? ""}',
        examples: examples?.ego ?? [],
        confidence: structuralPositions?.ego?.confidence,
        iconicShape: structuralPositions?.ego?.iconicShape,
      );
      positionData['persona'] = _PositionData(
        character: structuralPositions?.persona?.primary ?? legacyId.persona.characters.firstOrNull,
        content: '${legacyId.persona.summary}\n\n${legacyId.persona.details ?? ""}',
        examples: examples?.persona ?? [],
        confidence: structuralPositions?.persona?.confidence,
        iconicShape: structuralPositions?.persona?.iconicShape,
      );
      positionData['shadow'] = _PositionData(
        character: structuralPositions?.shadow?.primary ?? legacyId.shadow.characters.firstOrNull,
        content: '${legacyId.shadow.summary}\n\n${legacyId.shadow.details ?? ""}',
        examples: examples?.shadow ?? [],
        confidence: structuralPositions?.shadow?.confidence,
        iconicShape: structuralPositions?.shadow?.iconicShape,
      );
      positionData['feelingFunction'] = _PositionData(
        character: structuralPositions?.feelingFunction?.primary ?? legacyId.feelingFunction.characters.firstOrNull,
        content: '${legacyId.feelingFunction.summary}\n\n${legacyId.feelingFunction.details ?? ""}',
        examples: examples?.feelingFunction ?? [],
        confidence: structuralPositions?.feelingFunction?.confidence,
        iconicShape: structuralPositions?.feelingFunction?.iconicShape,
      );
      if (legacyId.erosAxis != null) {
        positionData['erosAxis'] = _PositionData(
          character: structuralPositions?.erosAxis?.primary ?? legacyId.erosAxis!.characters.firstOrNull,
          content: '${legacyId.erosAxis!.summary}\n\n${legacyId.erosAxis!.details ?? ""}',
          examples: examples?.erosAxis ?? [],
          confidence: structuralPositions?.erosAxis?.confidence,
          iconicShape: structuralPositions?.erosAxis?.iconicShape,
        );
      }
    }

    // Self Direction from psyche model
    if (structuralPositions?.selfDirection != null) {
      final vector = structuralPositions!.selfDirection!.vector;
      positionData['selfDirection'] = _PositionData(
        character: null,
        content: 'Your psychological growth is oriented toward: ${vector.join(", ")}.\n\nThis represents the direction your Self is guiding you - the path of integration and wholeness that emerges from your unique pattern of archetypal energies.',
        examples: [],
        confidence: structuralPositions.selfDirection!.confidence,
      );
    }

    // Convert examples to the format expected by detail view
    Map<String, dynamic> exampleToMap(ExampleItem e) => {
      'character': e.characterName,
      'franchise': '${e.reference.title} (${e.reference.year}) • ${e.reference.medium}',
      'description': '${e.situation}\n\n${e.actions.join('\n')}\n\n${e.outcomeAndCost.join('\n')}',
    };

    // Filter configs to only show positions with data
    final availableConfigs = PsychePositionConfigs.all
        .where((config) => positionData.containsKey(config.id) && positionData[config.id]!.content.isNotEmpty)
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Sub-header with full-bleed background
          const PsycheSubHeader(),
          
          const SizedBox(height: 16),
          
          // Position cards grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              itemCount: availableConfigs.length,
              itemBuilder: (context, index) {
                final config = availableConfigs[index];
                final data = positionData[config.id]!;
                return PsychePositionCard(
                  config: config,
                  characterName: data.character,
                  content: data.content.trim(),
                  examples: data.examples.map(exampleToMap).toList(),
                  confidence: data.confidence,
                  orbitEntries: data.orbitEntries,
                  compensationEntries: data.compensationEntries,
                  iconicShape: data.iconicShape,
                );
              },
            ),
          ),
          
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

/// Helper class to hold position data including orbit and compensation
class _PositionData {
  final String? character;
  final String content;
  final List<ExampleItem> examples;
  final double? confidence;
  final List<OrbitEntryData> orbitEntries;
  final List<CompensationEntryData> compensationEntries;
  final String? iconicShape;

  _PositionData({
    this.character,
    required this.content,
    required this.examples,
    this.confidence,
    this.orbitEntries = const [],
    this.compensationEntries = const [],
    this.iconicShape,
  });
}
