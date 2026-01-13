import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/tone.dart';
import '../../core/storage/repositories.dart';

/// Non-intrusive tone selector widget
/// Can be used as a dropdown button in app bars
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
      // Compact icon button that opens a bottom sheet
      return IconButton(
        icon: Icon(_getToneIcon(currentTone), color: color),
        tooltip: 'Change narrative tone',
        onPressed: () => _showToneSheet(context, ref, currentTone, color),
      );
    }

    // Dropdown button style
    return PopupMenuButton<NarrativeTone>(
      initialValue: currentTone,
      onSelected: (tone) => _setTone(context, ref, tone),
      tooltip: 'Change narrative tone',
      itemBuilder: (context) => NarrativeTone.values.map((tone) {
        final isSelected = tone == currentTone;
        return PopupMenuItem<NarrativeTone>(
          value: tone,
          child: ListTile(
            leading: Icon(
              _getToneIcon(tone),
              color: isSelected ? color : theme.colorScheme.onSurface,
            ),
            title: Text(
              tone.label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? color : null,
              ),
            ),
            subtitle: Text(
              tone.description,
              style: theme.textTheme.bodySmall,
            ),
            contentPadding: EdgeInsets.zero,
            dense: true,
          ),
        );
      }).toList(),
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
            Icon(Icons.arrow_drop_down, size: 18, color: color),
          ],
        ),
      ),
    );
  }

  void _showToneSheet(BuildContext context, WidgetRef ref, NarrativeTone currentTone, Color color) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onSurface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                // Title
                Text(
                  'Narrative Tone',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Choose how insights are presented. Content stays the same.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                // Tone options
                ...NarrativeTone.values.map((tone) {
                  final isSelected = tone == currentTone;
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? color.withOpacity(0.2) : theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _getToneIcon(tone),
                        color: isSelected ? color : theme.colorScheme.onSurface,
                      ),
                    ),
                    title: Text(
                      tone.label,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isSelected ? color : null,
                      ),
                    ),
                    subtitle: Text(tone.description),
                    trailing: isSelected
                        ? Icon(Icons.check_circle, color: color)
                        : null,
                    onTap: () {
                      _setTone(context, ref, tone);
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: isSelected ? color.withOpacity(0.05) : null,
                  );
                }),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  void _setTone(BuildContext context, WidgetRef ref, NarrativeTone tone) async {
    try {
      await ref.read(toneRepositoryProvider.notifier).setTone(tone);
      
      // Show completion feedback
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(_getToneIcon(tone), color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Tone set to ${tone.label}'),
                ),
              ],
            ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to change tone: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  IconData _getToneIcon(NarrativeTone tone) {
    switch (tone) {
      case NarrativeTone.plain:
        return Icons.text_fields;
      case NarrativeTone.mythic:
        return Icons.auto_stories;
      case NarrativeTone.reflective:
        return Icons.spa;
      case NarrativeTone.practical:
        return Icons.checklist;
      case NarrativeTone.analytical:
        return Icons.psychology;
    }
  }
}

/// Inline tone chips for quick selection
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
            child: ChoiceChip(
              label: Text(tone.label),
              selected: isSelected,
              onSelected: (_) async {
                await ref.read(toneRepositoryProvider.notifier).setTone(tone);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tone set to ${tone.label}'),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              selectedColor: color.withOpacity(0.2),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              side: BorderSide(
                color: isSelected ? color : theme.colorScheme.outlineVariant,
              ),
              labelStyle: TextStyle(
                color: isSelected ? color : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
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
