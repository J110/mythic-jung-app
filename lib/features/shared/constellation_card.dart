import 'package:flutter/material.dart';
import '../../core/models/constellation.dart';
import '../../app/theme/app_theme.dart';

/// A card displaying archetype constellation data
/// Used in both Me tab and Relationship tab
class ConstellationCard extends StatelessWidget {
  final Constellation constellation;
  final String title;
  final bool showStructural;
  final bool showMotifs;
  final bool isPartner;

  const ConstellationCard({
    super.key,
    required this.constellation,
    this.title = 'Archetype Constellation',
    this.showStructural = true,
    this.showMotifs = true,
    this.isPartner = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isPartner
              ? [
                  theme.colorScheme.secondary.withOpacity(0.1),
                  theme.colorScheme.secondary.withOpacity(0.05),
                ]
              : [
                  theme.colorScheme.primary.withOpacity(0.1),
                  theme.colorScheme.primary.withOpacity(0.05),
                ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (isPartner ? theme.colorScheme.secondary : theme.colorScheme.primary)
              .withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: isPartner
                        ? LinearGradient(
                            colors: [
                              theme.colorScheme.secondary,
                              theme.colorScheme.secondary.withOpacity(0.7),
                            ],
                          )
                        : AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Archetypal energies and patterns',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Structural Archetypes
          if (showStructural && constellation.structural != null) ...[
            _buildStructuralSection(context, constellation.structural!),
            const SizedBox(height: 8),
          ],

          // Motif Archetypes
          if (showMotifs && constellation.motifs != null) ...[
            _buildMotifsSection(context, constellation.motifs!),
          ],

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildStructuralSection(BuildContext context, StructuralArchetypes structural) {
    final theme = Theme.of(context);

    final items = <_StructuralItem>[
      if (structural.ego?.primary != null)
        _StructuralItem(
          label: 'Core Self',
          icon: Icons.center_focus_strong,
          character: structural.ego!.primary!,
          confidence: structural.ego!.confidence,
        ),
      if (structural.persona?.primary != null)
        _StructuralItem(
          label: 'Social Self',
          icon: Icons.masks,
          character: structural.persona!.primary!,
          confidence: structural.persona!.confidence,
        ),
      if (structural.shadow?.primary != null)
        _StructuralItem(
          label: 'Hidden Self',
          icon: Icons.contrast,
          character: structural.shadow!.primary!,
          confidence: structural.shadow!.confidence,
        ),
      if (structural.animaAnimus?.primary != null)
        _StructuralItem(
          label: 'Inner Opposite',
          icon: Icons.favorite,
          character: structural.animaAnimus!.primary!,
          confidence: structural.animaAnimus!.confidence,
        ),
    ];

    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Structural Positions',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) => _buildStructuralChip(context, item)).toList(),
          ),
          // Self Direction
          if (structural.selfDirection?.vector.isNotEmpty == true) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  size: 16,
                  color: theme.colorScheme.primary.withOpacity(0.7),
                ),
                const SizedBox(width: 6),
                Text(
                  'Direction: ',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                Expanded(
                  child: Text(
                    structural.selfDirection!.vector.join(' • '),
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStructuralChip(BuildContext context, _StructuralItem item) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item.icon,
            size: 14,
            color: theme.colorScheme.primary.withOpacity(0.7),
          ),
          const SizedBox(width: 6),
          Text(
            '${item.label}: ',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          Text(
            item.character,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMotifsSection(BuildContext context, MotifDistribution motifs) {
    final theme = Theme.of(context);
    final topMotifs = motifs.top;
    final shadowMotifs = motifs.shadow;

    if (topMotifs.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'Archetypal Energies',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),

          // Top motifs
          ...topMotifs.take(4).map((m) => _buildMotifBar(context, m, false)),

          // Shadow motifs
          if (shadowMotifs.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Shadow Energies',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 4),
            ...shadowMotifs.take(2).map((m) => _buildMotifBar(context, m, true)),
          ],
        ],
      ),
    );
  }

  Widget _buildMotifBar(BuildContext context, MotifScore motif, bool isShadow) {
    final theme = Theme.of(context);
    final label = _getMotifLabel(motif.motif);
    final description = _getMotifDescription(motif.motif);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isShadow
                      ? theme.colorScheme.onSurface.withOpacity(0.7)
                      : theme.colorScheme.onSurface,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: motif.score,
              minHeight: 6,
              backgroundColor: isShadow
                  ? theme.colorScheme.error.withOpacity(0.1)
                  : theme.colorScheme.primary.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation(
                isShadow
                    ? theme.colorScheme.error.withOpacity(0.6)
                    : theme.colorScheme.primary,
              ),
            ),
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              description,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _getMotifLabel(String motif) {
    switch (motif) {
      case 'HERO':
        return 'Hero';
      case 'TRICKSTER':
        return 'Trickster';
      case 'WISE_OLD_MAN':
        return 'Sage';
      case 'GREAT_MOTHER':
        return 'Nurturer';
      case 'FATHER_AUTHORITY':
        return 'Authority';
      case 'CHILD':
        return 'Inner Child';
      case 'LOVER_EROS':
        return 'Lover';
      case 'WARRIOR':
        return 'Warrior';
      case 'MAGICIAN':
        return 'Transformer';
      case 'CAREGIVER_HEALER':
        return 'Healer';
      case 'OUTLAW_REBEL':
        return 'Rebel';
      case 'SEEKER_WANDERER':
        return 'Seeker';
      default:
        return motif;
    }
  }

  String _getMotifDescription(String motif) {
    switch (motif) {
      case 'HERO':
        return 'Courage, transformation through challenge';
      case 'TRICKSTER':
        return 'Boundary-crossing, playful subversion';
      case 'WISE_OLD_MAN':
        return 'Wisdom, guidance, knowledge';
      case 'GREAT_MOTHER':
        return 'Nurturing, protection, acceptance';
      case 'FATHER_AUTHORITY':
        return 'Structure, rules, discipline';
      case 'CHILD':
        return 'Innocence, wonder, new beginnings';
      case 'LOVER_EROS':
        return 'Passion, connection, intimacy';
      case 'WARRIOR':
        return 'Strength, discipline, protection';
      case 'MAGICIAN':
        return 'Transformation, vision, possibility';
      case 'CAREGIVER_HEALER':
        return 'Compassion, service, restoration';
      case 'OUTLAW_REBEL':
        return 'Liberation, authenticity, disruption';
      case 'SEEKER_WANDERER':
        return 'Quest, exploration, meaning-seeking';
      default:
        return '';
    }
  }
}

class _StructuralItem {
  final String label;
  final IconData icon;
  final String character;
  final double confidence;

  const _StructuralItem({
    required this.label,
    required this.icon,
    required this.character,
    required this.confidence,
  });
}

/// A card displaying relationship constellation (shared, complementary, tensions)
class RelationshipConstellationCard extends StatelessWidget {
  final RelationshipConstellation constellation;

  const RelationshipConstellationCard({
    super.key,
    required this.constellation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple.withOpacity(0.1),
            Colors.pink.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.purple.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with field label
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.pink],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.link,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        constellation.field?.label ?? 'Relational Field',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (constellation.field?.primaryThemes.isNotEmpty == true)
                        Text(
                          constellation.field!.primaryThemes.join(' • '),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Shared Motifs
          if (constellation.shared.isNotEmpty) ...[
            _buildSection(
              context,
              'Shared Energies',
              Icons.handshake,
              Colors.green,
              constellation.shared.map((s) => _MotifItem(
                label: s.label ?? s.motif,
                subtitle: '${(s.meScore * 100).toInt()}% / ${(s.partnerScore * 100).toInt()}%',
              )).toList(),
            ),
          ],

          // Complementary Motifs
          if (constellation.complementary.isNotEmpty) ...[
            _buildSection(
              context,
              'Complementary',
              Icons.balance,
              Colors.blue,
              constellation.complementary.map((c) => _MotifItem(
                label: c.label ?? c.motif,
                subtitle: c.highSide == 'me' ? 'You bring more' : 'They bring more',
              )).toList(),
            ),
          ],

          // Tensions
          if (constellation.tensions.isNotEmpty) ...[
            _buildSection(
              context,
              'Growth Edges',
              Icons.flash_on,
              Colors.orange,
              constellation.tensions.map((t) => _MotifItem(
                label: t.labels.join(' vs '),
                subtitle: t.themeLabel ?? t.theme ?? 'Dynamic tension',
              )).toList(),
            ),
          ],

          // Risk loops
          if (constellation.field?.riskLoops.isNotEmpty == true) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.red.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 18,
                      color: Colors.red.withOpacity(0.7),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Watch for: ${constellation.field!.riskLoops.map(_formatRiskLoop).join(', ')}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.red.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    List<_MotifItem> items,
  ) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color.withOpacity(0.7)),
              const SizedBox(width: 6),
              Text(
                title,
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color.withOpacity(0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (item.subtitle != null)
                    Text(
                      item.subtitle!,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  String _formatRiskLoop(String loop) {
    return loop
        .replaceAll('_', ' ')
        .replaceAll(' vs ', ' vs ')
        .split(' ')
        .map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : w)
        .join(' ');
  }
}

class _MotifItem {
  final String label;
  final String? subtitle;

  const _MotifItem({required this.label, this.subtitle});
}
