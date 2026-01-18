import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/tone.dart';
import '../../core/storage/repositories.dart';

/// Non-intrusive tone selector widget
/// When clicked, navigates to welcome screen for tone selection
class ToneSelector extends ConsumerWidget {
  final Color? accentColor;
  final bool compact;

  const ToneSelector({
    super.key,
    this.accentColor,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toneState = ref.watch(toneRepositoryProvider);
    final currentTone = toneState.currentTone;
    final theme = Theme.of(context);
    final color = accentColor ?? theme.colorScheme.primary;

    if (compact) {
      // Compact icon button that navigates to welcome
      return IconButton(
        icon: Icon(_getToneIcon(currentTone), color: color),
        tooltip: 'Change narrative tone',
        onPressed: () => _navigateToWelcome(context),
      );
    }

    // Dropdown-style button that navigates to welcome
    return GestureDetector(
      onTap: () => _navigateToWelcome(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_getToneIcon(currentTone), size: 18, color: color),
            const SizedBox(width: 6),
            Text(
              currentTone.label,
              style: theme.textTheme.labelLarge?.copyWith(color: color),
            ),
            const SizedBox(width: 4),
            Icon(Icons.edit, size: 14, color: color.withOpacity(0.7)),
          ],
        ),
      ),
    );
  }

  void _navigateToWelcome(BuildContext context) {
    // Navigate to welcome screen for tone selection
    context.go('/welcome');
  }

  IconData _getToneIcon(NarrativeTone tone) {
    switch (tone) {
      case NarrativeTone.minimal:
        return Icons.format_list_bulleted;
      case NarrativeTone.modern:
        return Icons.auto_stories;
      case NarrativeTone.mythical:
        return Icons.auto_awesome;
    }
  }
}

/// Inline tone display (read-only with edit button)
class ToneDisplay extends ConsumerWidget {
  final Color? accentColor;

  const ToneDisplay({super.key, this.accentColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toneState = ref.watch(toneRepositoryProvider);
    final currentTone = toneState.currentTone;
    final theme = Theme.of(context);
    final color = accentColor ?? theme.colorScheme.primary;

    return GestureDetector(
      onTap: () => context.go('/welcome'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_getToneIcon(currentTone), size: 20, color: color),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currentTone.label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  currentTone.shortDescription,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: color.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.edit, size: 16, color: color),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getToneIcon(NarrativeTone tone) {
    switch (tone) {
      case NarrativeTone.minimal:
        return Icons.format_list_bulleted;
      case NarrativeTone.modern:
        return Icons.auto_stories;
      case NarrativeTone.mythical:
        return Icons.auto_awesome;
    }
  }
}

/// Tone chips for quick selection (read-only display)
class ToneChips extends ConsumerWidget {
  final Color? accentColor;

  const ToneChips({super.key, this.accentColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toneState = ref.watch(toneRepositoryProvider);
    final currentTone = toneState.currentTone;
    final theme = Theme.of(context);
    final color = accentColor ?? theme.colorScheme.primary;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: NarrativeTone.values.map((tone) {
          final isSelected = tone == currentTone;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => context.go('/welcome'),
              child: Chip(
                label: Text(tone.label),
                backgroundColor: isSelected 
                    ? color.withOpacity(0.2) 
                    : theme.colorScheme.surfaceContainerHighest,
                side: BorderSide(
                  color: isSelected ? color : theme.colorScheme.outlineVariant,
                ),
                labelStyle: TextStyle(
                  color: isSelected ? color : theme.colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Loading indicator shown during tone rendering
class ToneLoadingOverlay extends ConsumerWidget {
  final Widget child;

  const ToneLoadingOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(toneRepositoryProvider.select((s) => s.isLoading));

    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Adjusting tone...'),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
