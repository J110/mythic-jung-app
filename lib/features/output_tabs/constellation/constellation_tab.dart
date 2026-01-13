import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/models/constellation.dart';
import '../../../core/models/psyche_model.dart';
import '../../../app/theme/app_theme.dart';

/// Dedicated tab for displaying Archetype Constellation data
/// Uses PsycheModel as the single source of truth for both
/// Constellation and Identification
class ConstellationTab extends ConsumerWidget {
  final bool embedded;
  final bool isRelationship;

  const ConstellationTab({
    super.key,
    this.embedded = false,
    this.isRelationship = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // Use PsycheModel as the single source of truth
    final psycheModelAsync = isRelationship
        ? ref.watch(relationshipPsycheModelProvider)
        : ref.watch(mePsycheModelProvider);

    Widget content = psycheModelAsync.when(
      data: (psycheModel) {
        if (psycheModel == null) {
          // No PsycheModel yet - show waiting state
          return _buildWaitingState(context);
        }

        if (isRelationship) {
          return _buildRelationshipContentFromPsyche(context, psycheModel);
        } else {
          return _buildMeContentFromPsyche(context, psycheModel);
        }
      },
      loading: () => _buildLoadingState(context),
      error: (error, stack) => _buildWaitingState(context), // Show waiting on error
    );

    if (embedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Text(isRelationship ? 'Shared Archetypes' : 'My Archetype Constellation'),
          ],
        ),
      ),
      body: content,
    );
  }

  Widget _buildWaitingState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.1),
                    theme.colorScheme.secondary.withOpacity(0.1),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.auto_awesome,
                size: 64,
                color: theme.colorScheme.primary.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              isRelationship
                  ? 'Shared Archetypes'
                  : 'Archetype Constellation',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              isRelationship
                  ? 'Enter characters and generate your relationship profile to see shared archetypal energies.'
                  : 'Enter characters and generate your profile to reveal the archetypal energies that shape your psyche.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(theme.colorScheme.primary),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Computing your constellation...',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Mapping archetypal energies',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Could not load constellation',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$error',
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeContent(BuildContext context, MeConstellationResponse response) {
    final theme = Theme.of(context);
    final constellation = response.meConstellation;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Header card
        _buildHeaderCard(context, 'Your Archetype Constellation'),
        const SizedBox(height: 16),

        // Structural Archetypes Section
        if (constellation.structural != null) ...[
          _buildSectionHeader(context, 'Structural Positions', Icons.account_tree),
          const SizedBox(height: 12),
          _buildStructuralCard(context, constellation.structural!),
          const SizedBox(height: 24),
        ],

        // Motif Section
        if (constellation.motifs != null) ...[
          _buildSectionHeader(context, 'Archetypal Energies', Icons.auto_awesome),
          const SizedBox(height: 12),
          _buildMotifsCard(context, constellation.motifs!),

          // Shadow motifs
          if (constellation.motifs!.shadow.isNotEmpty) ...[
            const SizedBox(height: 16),
            _buildSectionHeader(context, 'Shadow Energies', Icons.contrast, isShadow: true),
            const SizedBox(height: 12),
            _buildShadowMotifsCard(context, constellation.motifs!.shadow),
          ],
        ],
      ],
    );
  }

  Widget _buildRelationshipContent(BuildContext context, RelationshipConstellationResponse response) {
    final theme = Theme.of(context);
    final relConstellation = response.relationshipConstellation;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Field Header
        if (relConstellation?.field != null)
          _buildFieldHeader(context, relConstellation!.field!),
        const SizedBox(height: 24),

        // Shared Energies
        if (relConstellation?.shared.isNotEmpty == true) ...[
          _buildSectionHeader(context, 'Shared Energies', Icons.handshake),
          const SizedBox(height: 12),
          _buildSharedCard(context, relConstellation!.shared),
          const SizedBox(height: 24),
        ],

        // Complementary
        if (relConstellation?.complementary.isNotEmpty == true) ...[
          _buildSectionHeader(context, 'Complementary Strengths', Icons.balance),
          const SizedBox(height: 12),
          _buildComplementaryCard(context, relConstellation!.complementary),
          const SizedBox(height: 24),
        ],

        // Tensions / Growth Edges
        if (relConstellation?.tensions.isNotEmpty == true) ...[
          _buildSectionHeader(context, 'Growth Edges', Icons.flash_on, isTension: true),
          const SizedBox(height: 12),
          _buildTensionsCard(context, relConstellation!.tensions),
          const SizedBox(height: 24),
        ],

        // Risk Loops
        if (relConstellation?.field?.riskLoops.isNotEmpty == true) ...[
          _buildRiskLoopsCard(context, relConstellation!.field!.riskLoops),
          const SizedBox(height: 24),
        ],

        // Individual Constellations
        if (response.meConstellation != null) ...[
          _buildSectionHeader(context, 'Your Constellation', Icons.person),
          const SizedBox(height: 12),
          _buildMiniConstellationCard(context, response.meConstellation!, 'You'),
          const SizedBox(height: 16),
        ],

        if (response.partnerConstellation != null) ...[
          _buildSectionHeader(context, 'Partner Constellation', Icons.person_outline),
          const SizedBox(height: 12),
          _buildMiniConstellationCard(context, response.partnerConstellation!, 'Partner'),
        ],
      ],
    );
  }

  // =========================================================================
  // PsycheModel-based content builders (Single Source of Truth)
  // =========================================================================

  Widget _buildMeContentFromPsyche(BuildContext context, PsycheModel psycheModel) {
    final theme = Theme.of(context);
    final positions = psycheModel.structuralPositions;
    final motifs = psycheModel.motifDistribution;
    final shadowMotifs = psycheModel.shadowMotifs;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Header card
        _buildHeaderCard(context, 'Your Archetype Constellation'),
        const SizedBox(height: 16),

        // Structural Archetypes from PsycheModel
        if (positions != null) ...[
          _buildSectionHeader(context, 'Structural Positions', Icons.account_tree),
          const SizedBox(height: 12),
          _buildStructuralFromPsyche(context, positions),
          const SizedBox(height: 24),
        ],

        // Motif Section from PsycheModel
        if (motifs.isNotEmpty) ...[
          _buildSectionHeader(context, 'Archetypal Energies', Icons.auto_awesome),
          const SizedBox(height: 12),
          _buildMotifsFromPsyche(context, motifs),
          const SizedBox(height: 16),
        ],

        // Shadow motifs from PsycheModel
        if (shadowMotifs.isNotEmpty) ...[
          _buildSectionHeader(context, 'Shadow Energies', Icons.contrast, isShadow: true),
          const SizedBox(height: 12),
          _buildShadowMotifsFromPsyche(context, shadowMotifs),
        ],

        // Quality flags (for debugging/UX warnings)
        if (psycheModel.qualityFlags.isNotEmpty) ...[
          const SizedBox(height: 24),
          _buildQualityFlagsCard(context, psycheModel.qualityFlags),
        ],
      ],
    );
  }

  Widget _buildRelationshipContentFromPsyche(BuildContext context, PsycheModel psycheModel) {
    final theme = Theme.of(context);
    final relConstellation = psycheModel.relationshipConstellation;
    final partnerPositions = psycheModel.partnerStructuralPositions;
    final partnerMotifs = psycheModel.partnerMotifDistribution;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Field Header
        if (relConstellation?.field != null)
          _buildFieldHeaderFromPsyche(context, relConstellation!.field!),
        const SizedBox(height: 24),

        // Shared Energies
        if (relConstellation?.shared.isNotEmpty == true) ...[
          _buildSectionHeader(context, 'Shared Energies', Icons.handshake),
          const SizedBox(height: 12),
          _buildSharedFromPsyche(context, relConstellation!.shared),
          const SizedBox(height: 24),
        ],

        // Complementary
        if (relConstellation?.complementary.isNotEmpty == true) ...[
          _buildSectionHeader(context, 'Complementary Strengths', Icons.balance),
          const SizedBox(height: 12),
          _buildComplementaryFromPsyche(context, relConstellation!.complementary),
          const SizedBox(height: 24),
        ],

        // Tensions / Growth Edges
        if (relConstellation?.tensions.isNotEmpty == true) ...[
          _buildSectionHeader(context, 'Growth Edges', Icons.flash_on, isTension: true),
          const SizedBox(height: 12),
          _buildTensionsFromPsyche(context, relConstellation!.tensions),
          const SizedBox(height: 24),
        ],

        // Risk Loops
        if (relConstellation?.field?.riskLoops.isNotEmpty == true) ...[
          _buildRiskLoopsCard(context, relConstellation!.field!.riskLoops),
          const SizedBox(height: 24),
        ],

        // Partner Structural Positions
        if (partnerPositions != null) ...[
          _buildSectionHeader(context, 'Partner\'s Constellation', Icons.person_outline),
          const SizedBox(height: 12),
          _buildStructuralFromPsyche(context, partnerPositions, isPartner: true),
          const SizedBox(height: 16),
        ],

        // Partner Motifs
        if (partnerMotifs.isNotEmpty) ...[
          _buildSectionHeader(context, 'Partner\'s Energies', Icons.auto_awesome),
          const SizedBox(height: 12),
          _buildMotifsFromPsyche(context, partnerMotifs),
        ],
      ],
    );
  }

  Widget _buildStructuralFromPsyche(BuildContext context, StructuralPositions positions, {bool isPartner = false}) {
    final theme = Theme.of(context);

    final roleData = <Map<String, dynamic>>[
      {'role': 'Core Self (Ego)', 'position': positions.ego, 'icon': Icons.star, 'color': Colors.amber},
      {'role': 'Social Self (Persona)', 'position': positions.persona, 'icon': Icons.masks, 'color': Colors.blue},
      {'role': 'Hidden Self (Shadow)', 'position': positions.shadow, 'icon': Icons.dark_mode, 'color': Colors.deepPurple},
      {'role': 'Inner Opposite (Anima/Animus)', 'position': positions.feelingFunction, 'icon': Icons.favorite, 'color': Colors.pink},
      {'role': 'Vitality (Eros)', 'position': positions.erosAxis, 'icon': Icons.bolt, 'color': Colors.orange},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...roleData.map((data) {
              final position = data['position'] as StructuralPosition?;
              if (position == null || position.primary == null) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (data['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(data['icon'] as IconData, color: data['color'] as Color, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['role'] as String,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                          Text(
                            position.primary!,
                            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          if (position.secondary.isNotEmpty)
                            Text(
                              '+ ${position.secondary.join(", ")}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                        ],
                      ),
                    ),
                    // Confidence indicator
                    _buildConfidenceChip(context, position.confidence),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildConfidenceChip(BuildContext context, double confidence) {
    final theme = Theme.of(context);
    final color = confidence >= 0.8
        ? Colors.green
        : confidence >= 0.6
            ? Colors.amber
            : Colors.orange;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        '${(confidence * 100).toInt()}%',
        style: theme.textTheme.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMotifsFromPsyche(BuildContext context, List<MotifEntry> motifs) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: motifs.take(5).map((motif) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      _formatMotifName(motif.motif),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: motif.score,
                        minHeight: 8,
                        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                        valueColor: AlwaysStoppedAnimation(
                          theme.colorScheme.primary.withOpacity(0.3 + motif.score * 0.7),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 40,
                    child: Text(
                      '${(motif.score * 100).toInt()}%',
                      style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildShadowMotifsFromPsyche(BuildContext context, List<MotifEntry> shadowMotifs) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surface,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepPurple.withOpacity(0.3)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.contrast, color: Colors.deepPurple, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Hidden Potential',
                  style: theme.textTheme.titleSmall?.copyWith(color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...shadowMotifs.take(3).map((motif) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Text(
                      _formatMotifName(motif.motif),
                      style: theme.textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    Text(
                      '${(motif.score * 100).toInt()}%',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldHeaderFromPsyche(BuildContext context, FieldSummary field) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.1),
            theme.colorScheme.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(Icons.electric_bolt, color: theme.colorScheme.primary, size: 32),
          const SizedBox(height: 8),
          Text(
            field.label,
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          if (field.primaryThemes.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: field.primaryThemes.map((theme) => Chip(
                label: Text(theme),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSharedFromPsyche(BuildContext context, List<SharedMotifEntry> shared) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: shared.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(Icons.handshake, color: Colors.green, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_formatMotifName(entry.motif), style: theme.textTheme.titleSmall),
                        Text(
                          'You: ${(entry.meScore * 100).toInt()}% • Partner: ${(entry.partnerScore * 100).toInt()}%',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildComplementaryFromPsyche(BuildContext context, List<ComplementaryMotifEntry> complementary) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: complementary.map((entry) {
            final isMe = entry.highSide == 'me';
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(Icons.balance, color: Colors.blue, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_formatMotifName(entry.motif), style: theme.textTheme.titleSmall),
                        Text(
                          '${isMe ? "You" : "Partner"} brings this energy (Δ${(entry.delta * 100).toInt()}%)',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTensionsFromPsyche(BuildContext context, List<TensionEntry> tensions) {
    final theme = Theme.of(context);

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange.withOpacity(0.3)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: tensions.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(Icons.flash_on, color: Colors.orange, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_formatMotifName(entry.pair[0])} ↔ ${_formatMotifName(entry.pair[1])}',
                          style: theme.textTheme.titleSmall,
                        ),
                        if (entry.themeLabel != null)
                          Text(
                            entry.themeLabel!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.orange,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    '${(entry.strength * 100).toInt()}%',
                    style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildQualityFlagsCard(BuildContext context, List<String> flags) {
    final theme = Theme.of(context);

    return Card(
      color: Colors.amber.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.amber.shade700, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Analysis notes: ${flags.join(", ")}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.amber.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatMotifName(String motif) {
    return motif
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}' : '')
        .join(' ');
  }

  Widget _buildHeaderCard(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withOpacity(0.15),
            theme.colorScheme.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.auto_awesome,
            size: 40,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Jung identified archetypal patterns that appear across all human experience. These energies shape how you navigate life.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFieldHeader(BuildContext context, RelationalField? field) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple.withOpacity(0.15),
            Colors.pink.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.purple.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.link, size: 28, color: Colors.purple),
              const SizedBox(width: 12),
              Text(
                field?.label ?? 'Relational Field',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (field?.primaryThemes.isNotEmpty == true) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: field!.primaryThemes.map((theme2) => Chip(
                label: Text(theme2),
                backgroundColor: Colors.purple.withOpacity(0.1),
                side: BorderSide.none,
                padding: EdgeInsets.zero,
              )).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon, {bool isShadow = false, bool isTension = false}) {
    final theme = Theme.of(context);
    final color = isShadow
        ? theme.colorScheme.error
        : isTension
            ? Colors.orange
            : theme.colorScheme.primary;

    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildStructuralCard(BuildContext context, StructuralArchetypes structural) {
    final theme = Theme.of(context);

    final positions = <_PositionItem>[
      if (structural.ego?.primary != null)
        _PositionItem(
          label: 'Core Self (Ego)',
          character: structural.ego!.primary!,
          icon: Icons.center_focus_strong,
          description: 'Your conscious center — how you see yourself',
        ),
      if (structural.persona?.primary != null)
        _PositionItem(
          label: 'Social Self (Persona)',
          character: structural.persona!.primary!,
          icon: Icons.masks,
          description: 'The face you show the world',
        ),
      if (structural.shadow?.primary != null)
        _PositionItem(
          label: 'Hidden Self (Shadow)',
          character: structural.shadow!.primary!,
          icon: Icons.contrast,
          description: 'What you deny or project onto others',
        ),
      if (structural.animaAnimus?.primary != null)
        _PositionItem(
          label: 'Inner Opposite (Anima/Animus)',
          character: structural.animaAnimus!.primary!,
          icon: Icons.favorite,
          description: 'The contrasexual energy within',
        ),
    ];

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          ...positions.map((pos) => _buildPositionTile(context, pos)),
          // Self Direction
          if (structural.selfDirection?.vector.isNotEmpty == true)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.colorScheme.outline.withOpacity(0.1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.trending_up,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Direction of Growth',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          structural.selfDirection!.vector.join(' → '),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPositionTile(BuildContext context, _PositionItem pos) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(pos.icon, size: 20, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pos.label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                Text(
                  pos.character,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  pos.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMotifsCard(BuildContext context, MotifDistribution motifs) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: motifs.top.take(5).map((m) => _buildMotifBar(context, m)).toList(),
        ),
      ),
    );
  }

  Widget _buildMotifBar(BuildContext context, MotifScore motif, {bool isShadow = false}) {
    final theme = Theme.of(context);
    final label = _getMotifLabel(motif.motif);
    final description = _getMotifDescription(motif.motif);
    final icon = _getMotifIcon(motif.motif);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18,
                color: isShadow ? theme.colorScheme.error : theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          label,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${(motif.score * 100).toInt()}%',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: motif.score,
              minHeight: 8,
              backgroundColor: isShadow
                  ? theme.colorScheme.error.withOpacity(0.1)
                  : theme.colorScheme.primary.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation(
                isShadow ? theme.colorScheme.error : theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShadowMotifsCard(BuildContext context, List<MotifScore> shadowMotifs) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.error.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.error.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'These energies may be suppressed or projected onto others',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error.withOpacity(0.8),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            ...shadowMotifs.take(2).map((m) => _buildMotifBar(context, m, isShadow: true)),
          ],
        ),
      ),
    );
  }

  Widget _buildSharedCard(BuildContext context, List<SharedMotif> shared) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: Colors.green.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.green.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Archetypal energies you both carry strongly',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.green.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            ...shared.map((s) => _buildSharedTile(context, s)),
          ],
        ),
      ),
    );
  }

  Widget _buildSharedTile(BuildContext context, SharedMotif shared) {
    final theme = Theme.of(context);
    final label = shared.label ?? _getMotifLabel(shared.motif);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getMotifIcon(shared.motif),
              size: 20,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'You: ${(shared.meScore * 100).toInt()}% • Partner: ${(shared.partnerScore * 100).toInt()}%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComplementaryCard(BuildContext context, List<ComplementaryMotif> complementary) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: Colors.blue.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.blue.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where you balance each other',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.blue.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            ...complementary.map((c) => _buildComplementaryTile(context, c)),
          ],
        ),
      ),
    );
  }

  Widget _buildComplementaryTile(BuildContext context, ComplementaryMotif comp) {
    final theme = Theme.of(context);
    final label = comp.label ?? _getMotifLabel(comp.motif);
    final isMe = comp.highSide == 'me';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getMotifIcon(comp.motif),
              size: 20,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  isMe ? 'You bring more of this energy' : 'Partner brings more of this energy',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isMe ? Icons.person : Icons.person_outline,
            size: 18,
            color: Colors.blue.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildTensionsCard(BuildContext context, List<TensionPair> tensions) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: Colors.orange.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.orange.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dynamic tensions that create growth opportunities',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.orange.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),
            ...tensions.map((t) => _buildTensionTile(context, t)),
          ],
        ),
      ),
    );
  }

  Widget _buildTensionTile(BuildContext context, TensionPair tension) {
    final theme = Theme.of(context);
    final labels = tension.labels.isNotEmpty
        ? tension.labels.join(' vs ')
        : tension.pair.map(_getMotifLabel).join(' vs ');
    final themeLabel = tension.themeLabel ?? _formatTheme(tension.theme ?? '');

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Icon(Icons.flash_on, size: 24, color: Colors.orange),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labels,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (themeLabel.isNotEmpty)
                    Text(
                      themeLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.orange.shade700,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskLoopsCard(BuildContext context, List<String> riskLoops) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: Colors.red.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.red.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber, size: 20, color: Colors.red),
                const SizedBox(width: 8),
                Text(
                  'Watch For',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...riskLoops.map((loop) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(color: Colors.red)),
                  Expanded(
                    child: Text(
                      _formatTheme(loop),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniConstellationCard(BuildContext context, Constellation constellation, String label) {
    final theme = Theme.of(context);
    final topMotifs = constellation.motifs?.top.take(3).toList() ?? [];

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label\'s Top Energies',
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: topMotifs.map((m) => Chip(
                avatar: Icon(
                  _getMotifIcon(m.motif),
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
                label: Text(_getMotifLabel(m.motif)),
                backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                side: BorderSide.none,
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  String _getMotifLabel(String motif) {
    const labels = {
      'HERO': 'Hero',
      'TRICKSTER': 'Trickster',
      'WISE_OLD_MAN': 'Sage',
      'GREAT_MOTHER': 'Nurturer',
      'FATHER_AUTHORITY': 'Authority',
      'CHILD': 'Inner Child',
      'LOVER_EROS': 'Lover',
      'WARRIOR': 'Warrior',
      'MAGICIAN': 'Transformer',
      'CAREGIVER_HEALER': 'Healer',
      'OUTLAW_REBEL': 'Rebel',
      'SEEKER_WANDERER': 'Seeker',
    };
    return labels[motif] ?? motif;
  }

  String _getMotifDescription(String motif) {
    const descriptions = {
      'HERO': 'Courage to face challenges and transform through adversity',
      'TRICKSTER': 'Playful boundary-crossing and creative disruption',
      'WISE_OLD_MAN': 'Deep wisdom, guidance, and accumulated knowledge',
      'GREAT_MOTHER': 'Nurturing presence, protection, and unconditional acceptance',
      'FATHER_AUTHORITY': 'Structure, discipline, and principled leadership',
      'CHILD': 'Innocence, wonder, and the capacity for new beginnings',
      'LOVER_EROS': 'Passion, connection, and the pursuit of intimacy',
      'WARRIOR': 'Strength, discipline, and protective courage',
      'MAGICIAN': 'Transformation, vision, and manifesting possibility',
      'CAREGIVER_HEALER': 'Compassionate service and the gift of restoration',
      'OUTLAW_REBEL': 'Liberation, authenticity, and creative destruction',
      'SEEKER_WANDERER': 'Quest for meaning and exploration of the unknown',
    };
    return descriptions[motif] ?? '';
  }

  IconData _getMotifIcon(String motif) {
    const icons = {
      'HERO': Icons.shield,
      'TRICKSTER': Icons.theater_comedy,
      'WISE_OLD_MAN': Icons.psychology,
      'GREAT_MOTHER': Icons.favorite,
      'FATHER_AUTHORITY': Icons.gavel,
      'CHILD': Icons.child_care,
      'LOVER_EROS': Icons.favorite_border,
      'WARRIOR': Icons.security,
      'MAGICIAN': Icons.auto_fix_high,
      'CAREGIVER_HEALER': Icons.healing,
      'OUTLAW_REBEL': Icons.flash_on,
      'SEEKER_WANDERER': Icons.explore,
    };
    return icons[motif] ?? Icons.auto_awesome;
  }

  String _formatTheme(String theme) {
    return theme
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : w)
        .join(' ');
  }
}

class _PositionItem {
  final String label;
  final String character;
  final IconData icon;
  final String description;

  const _PositionItem({
    required this.label,
    required this.character,
    required this.icon,
    required this.description,
  });
}
