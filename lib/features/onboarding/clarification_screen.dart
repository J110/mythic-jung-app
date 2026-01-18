import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/resonance.dart';
import '../../core/storage/repositories.dart';
import '../../core/api/api_client.dart';
import '../shared/redesign/clarification_painters.dart';
import '../shared/redesign/character_entry_cards.dart';

/// Clarification Screen v5
/// 
/// New layout with:
/// - Character pills for navigation
/// - Version cards for selection
/// - Card detail view with positive/negative inputs
/// - Following UI design guidelines
class ClarificationScreen extends ConsumerStatefulWidget {
  final ResonanceAnalysisResponse analysisResponse;
  final int meCount;
  final int otherCount;
  final bool relationshipEnabled;
  final String? relationshipType;

  const ClarificationScreen({
    super.key,
    required this.analysisResponse,
    required this.meCount,
    this.otherCount = 0,
    this.relationshipEnabled = false,
    this.relationshipType,
  });

  @override
  ConsumerState<ClarificationScreen> createState() => _ClarificationScreenState();
}

class _ClarificationScreenState extends ConsumerState<ClarificationScreen> {
  late List<CharacterAmbiguityAnalysis> _characters;
  final Map<int, String?> _selectedVersions = {};
  final Map<int, String?> _selectedPhases = {};
  final Map<int, Set<String>> _excludedPhases = {};
  final Map<int, TextEditingController> _positiveTextControllers = {};
  final Map<int, TextEditingController> _negativeTextControllers = {};
  bool _isSubmitting = false;
  final Set<int> _loadingCharacters = {};
  final Set<int> _removedIndices = {};
  
  // Track selected character for each section
  int? _selectedMeCharacterIndex;
  int? _selectedPartnerCharacterIndex;

  @override
  void initState() {
    super.initState();
    _characters = List<CharacterAmbiguityAnalysis>.from(widget.analysisResponse.characters);
    
    for (int i = 0; i < _characters.length; i++) {
      _positiveTextControllers[i] = TextEditingController();
      _negativeTextControllers[i] = TextEditingController();
      _excludedPhases[i] = {};
      if (_characters[i].phaseOptions.isNotEmpty) {
        _selectedPhases[i] = 'phase_overall';
      }
    }
    
    // Initialize selected indices for each section
    final activeChars = _getActiveCharacters();
    final meChars = activeChars.where((e) => e.key < widget.meCount).toList();
    final partnerChars = activeChars.where((e) => e.key >= widget.meCount).toList();
    
    _selectedMeCharacterIndex = meChars.isNotEmpty ? meChars.first.key : null;
    _selectedPartnerCharacterIndex = partnerChars.isNotEmpty ? partnerChars.first.key : null;
  }

  @override
  void dispose() {
    for (final controller in _positiveTextControllers.values) {
      controller.dispose();
    }
    for (final controller in _negativeTextControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  List<MapEntry<int, CharacterAmbiguityAnalysis>> _getActiveCharacters() {
    return _characters
        .asMap()
        .entries
        .where((e) => !_removedIndices.contains(e.key))
        .toList();
  }

  bool _isMyCharacter(int index) => index < widget.meCount;

  Color _getAccentColor(int index) {
    if (_isMyCharacter(index)) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return widget.relationshipType == 'romantic'
          ? const Color(0xFFE91E63)
          : const Color(0xFF2196F3);
    }
  }

  List<ClarificationChoice> _buildClarifications() {
    return _characters.asMap().entries.map((entry) {
      final index = entry.key;
      final char = entry.value;
      
      if (_removedIndices.contains(index)) {
        return const ClarificationChoice(referenceMode: 'SKIP');
      }
      
      final selectedVersionId = _selectedVersions[index];
      final selectedPhaseId = _selectedPhases[index];
      final excludedPhaseIds = _excludedPhases[index]?.toList() ?? [];
      final positiveText = _positiveTextControllers[index]?.text.trim();
      final negativeText = _negativeTextControllers[index]?.text.trim();
      
      String referenceMode = 'NONE';
      List<String> tags = [];
      
      if (selectedVersionId != null || 
          (selectedPhaseId != null && selectedPhaseId != 'phase_overall') ||
          excludedPhaseIds.isNotEmpty ||
          (positiveText?.isNotEmpty ?? false) ||
          (negativeText?.isNotEmpty ?? false)) {
        referenceMode = 'GENERAL';
        
        if (selectedVersionId != null) {
          final version = char.versionOptions.firstWhere(
            (v) => v.versionId == selectedVersionId,
            orElse: () => const VersionOption(versionId: '', label: '', cue: ''),
          );
          tags.addAll(version.tags);
        }
        if (selectedPhaseId != null && selectedPhaseId != 'phase_overall') {
          final phase = char.phaseOptions.firstWhere(
            (p) => p.phaseId == selectedPhaseId,
            orElse: () => const PhaseOption(phaseId: '', label: '', cue: ''),
          );
          tags.addAll(phase.tags);
        }
      }
      
      return ClarificationChoice(
        referenceMode: referenceMode,
        versionId: selectedVersionId,
        phaseId: selectedPhaseId,
        excludedPhaseIds: excludedPhaseIds,
        referenceTags: tags,
        positiveText: positiveText?.isNotEmpty == true ? positiveText : null,
        negativeText: negativeText?.isNotEmpty == true ? negativeText : null,
      );
    }).toList();
  }

  Future<void> _confirmSelections() async {
    // Check if any character is still being re-recognized
    if (_loadingCharacters.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please wait for character recognition to complete'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    setState(() => _isSubmitting = true);
    
    try {
      final clarifications = _buildClarifications();
      
      final validClarifications = clarifications.where((c) => c.referenceMode != 'SKIP').toList();
      if (validClarifications.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please keep at least one character'),
            backgroundColor: Colors.orange,
          ),
        );
        setState(() => _isSubmitting = false);
        return;
      }
      
      await ref.read(resonanceRepositoryProvider.notifier).confirmClarifications(
        clarifications,
        meCount: widget.meCount,
        relationshipEnabled: widget.relationshipEnabled,
        relationshipType: widget.relationshipType ?? 'platonic',
      );
      
      if (!mounted) return;
      // Navigate to home screen where generation progress will be shown
      context.go('/home');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  void _removeCharacter(int index, CharacterAmbiguityAnalysis char) {
    final activeCount = _getActiveCharacters().length;
    
    if (activeCount <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must keep at least one character'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Character?'),
        content: Text('Remove "${char.characterName ?? char.input}" from your analysis?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _removedIndices.add(index);
                _selectedVersions.remove(index);
                _excludedPhases.remove(index);
                
                // Select next available character in the appropriate section
                final remaining = _getActiveCharacters();
                final isMe = _isMyCharacter(index);
                
                if (isMe) {
                  final meChars = remaining.where((e) => _isMyCharacter(e.key)).toList();
                  if (meChars.isEmpty || !meChars.any((e) => e.key == _selectedMeCharacterIndex)) {
                    _selectedMeCharacterIndex = meChars.isNotEmpty ? meChars.first.key : null;
                  }
                } else {
                  final partnerChars = remaining.where((e) => !_isMyCharacter(e.key)).toList();
                  if (partnerChars.isEmpty || !partnerChars.any((e) => e.key == _selectedPartnerCharacterIndex)) {
                    _selectedPartnerCharacterIndex = partnerChars.isNotEmpty ? partnerChars.first.key : null;
                  }
                }
              });
            },
            child: Text('Remove', style: TextStyle(color: Colors.red.shade700)),
          ),
        ],
      ),
    );
  }

  void _showRedoRecognitionDialog(int index, CharacterAmbiguityAnalysis char) {
    final referenceController = TextEditingController();
    final contextController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add More Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Show current character name (read-only)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 20, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Character',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            char.input,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Help us recognize this character better:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              // Reference/Source field
              TextField(
                controller: referenceController,
                decoration: InputDecoration(
                  labelText: 'From which movie, show, or book?',
                  hintText: 'e.g., "The Matrix", "Breaking Bad"',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.movie_outlined),
                  helperText: 'This helps identify the right character',
                  helperMaxLines: 2,
                ),
                autofocus: true,
              ),
              const SizedBox(height: 16),
              // Additional context (optional)
              TextField(
                controller: contextController,
                decoration: InputDecoration(
                  labelText: 'Additional details (optional)',
                  hintText: 'e.g., "The hacker", "Season 1 version"',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.info_outline),
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Combine character name with reference and context
              String enhanced = char.input;
              if (referenceController.text.trim().isNotEmpty) {
                enhanced += ' from ${referenceController.text.trim()}';
              }
              if (contextController.text.trim().isNotEmpty) {
                enhanced += ' (${contextController.text.trim()})';
              }
              _redoRecognition(index, enhanced);
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  Future<void> _redoRecognition(int index, String newInput) async {
    if (newInput.isEmpty) return;
    
    setState(() => _loadingCharacters.add(index));
    
    try {
      final apiClient = ref.read(apiClientProvider);
      final result = await apiClient.rerecognizeCharacter(
        characterIndex: index,
        originalInput: _characters[index].input,
        correctedInput: newInput,
      );
      
      if (!mounted) return;
      
      setState(() {
        _loadingCharacters.remove(index);
        if (result.success && result.updatedCharacter != null) {
          // Convert RerecognizedCharacter to CharacterAmbiguityAnalysis
          final updated = result.updatedCharacter!;
          _characters[index] = CharacterAmbiguityAnalysis(
            input: updated.input,
            characterName: updated.characterName,
            canonicalId: updated.canonicalId,
            franchise: updated.franchise,
            medium: updated.medium,
            needsClarification: updated.needsClarification,
            versionOptions: updated.versionOptions,
            phaseOptions: updated.phaseOptions,
          );
          _selectedVersions.remove(index);
        }
      });
      
      if (result.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.message!), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _loadingCharacters.remove(index));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}'), backgroundColor: Colors.red),
      );
    }
  }

  void _showCharacterDetail(int index, CharacterAmbiguityAnalysis char) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accentColor = _getAccentColor(index);
    final selectedVersion = _selectedVersions[index];
    
    // Find selected version info
    VersionOption? versionInfo;
    if (selectedVersion != null && char.versionOptions.isNotEmpty) {
      versionInfo = char.versionOptions.firstWhere(
        (v) => v.versionId == selectedVersion,
        orElse: () => char.versionOptions.first,
      );
    }
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1B2E) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Character header
                    Row(
                      children: [
                        // Portrait
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: accentColor.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CustomPaint(
                              painter: CharacterPortraitPainter(
                                accentColor: accentColor,
                                characterIndex: index,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                char.characterName ?? char.input,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (char.franchise != null)
                                Text(
                                  'from ${char.franchise}',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Character description
                    if (versionInfo?.cue.isNotEmpty == true || char.referenceDescription != null)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(isDark ? 0.15 : 0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: accentColor.withOpacity(0.2)),
                        ),
                        child: Text(
                          versionInfo?.cue ?? char.referenceDescription ?? 'A character that resonates with you.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                          ),
                        ),
                      ),
                    
                    // Selected version badge
                    if (versionInfo != null) ...[
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.auto_awesome, size: 14, color: accentColor),
                                const SizedBox(width: 6),
                                Text(
                                  versionInfo.label,
                                  style: TextStyle(
                                    color: accentColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                    
                    // Entry reference (if user provided one)
                    if (char.hasEntryReference && char.entryReferenceText != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.bookmark_outline, 
                                size: 18, 
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Reference',
                                    style: theme.textTheme.labelMedium?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    char.entryReferenceText!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    
                    // Medium info
                    if (char.medium != null) ...[
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  char.medium == 'tv' ? Icons.tv :
                                  char.medium == 'book' ? Icons.book :
                                  char.medium == 'game' ? Icons.sports_esports :
                                  char.medium == 'real-life' ? Icons.person :
                                  Icons.movie,
                                  size: 14,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  char.medium == 'tv' ? 'TV Show' :
                                  char.medium == 'book' ? 'Book' :
                                  char.medium == 'game' ? 'Video Game' :
                                  char.medium == 'real-life' ? 'Real Person' :
                                  'Movie',
                                  style: TextStyle(
                                    color: theme.colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                    
                    const SizedBox(height: 24),
                    
                    // Positive resonance input
                    _buildResonanceInput(
                      context,
                      title: 'What you connect with',
                      subtitle: 'The golden thread that draws you',
                      hintText: 'A moment, quality, or way of being...',
                      controller: _positiveTextControllers[index]!,
                      color: const Color(0xFFD4AF37),
                      icon: Icons.auto_awesome,
                      isDark: isDark,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Negative resonance input
                    _buildResonanceInput(
                      context,
                      title: 'What doesn\'t fit',
                      subtitle: 'Let fall what isn\'t you',
                      hintText: 'A quality, cost, or edge that doesn\'t fit...',
                      controller: _negativeTextControllers[index]!,
                      color: const Color(0xFFE85D04),
                      icon: Icons.spa_outlined,
                      isDark: isDark,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Done button
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: FilledButton.styleFrom(
                          backgroundColor: accentColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResonanceInput(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String hintText,
    required TextEditingController controller,
    required Color color,
    required IconData icon,
    required bool isDark,
  }) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(isDark ? 0.15 : 0.08),
            color.withOpacity(isDark ? 0.05 : 0.02),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: isDark ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: color.withOpacity(0.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: color.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: color, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            maxLines: 2,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final activeCharacters = _getActiveCharacters();
    
    // Split into Me and Partner characters
    final meCharacters = activeCharacters.where((e) => _isMyCharacter(e.key)).toList();
    final partnerCharacters = activeCharacters.where((e) => !_isMyCharacter(e.key)).toList();
    
    // Ensure selected indices are valid
    if (_selectedMeCharacterIndex != null && 
        !meCharacters.any((e) => e.key == _selectedMeCharacterIndex)) {
      _selectedMeCharacterIndex = meCharacters.isNotEmpty ? meCharacters.first.key : null;
    }
    if (_selectedPartnerCharacterIndex != null && 
        !partnerCharacters.any((e) => e.key == _selectedPartnerCharacterIndex)) {
      _selectedPartnerCharacterIndex = partnerCharacters.isNotEmpty ? partnerCharacters.first.key : null;
    }
    
    // Get current Me character info
    final currentMeChar = _selectedMeCharacterIndex != null && meCharacters.isNotEmpty
        ? meCharacters.firstWhere((e) => e.key == _selectedMeCharacterIndex, orElse: () => meCharacters.first).value
        : null;
    final meHasVersions = currentMeChar?.versionOptions.isNotEmpty ?? false;
    final meHasSelectedVersion = _selectedMeCharacterIndex != null && _selectedVersions[_selectedMeCharacterIndex!] != null;
    final meIsLoading = _selectedMeCharacterIndex != null && _loadingCharacters.contains(_selectedMeCharacterIndex!);
    
    // Get current Partner character info
    final currentPartnerChar = _selectedPartnerCharacterIndex != null && partnerCharacters.isNotEmpty
        ? partnerCharacters.firstWhere((e) => e.key == _selectedPartnerCharacterIndex, orElse: () => partnerCharacters.first).value
        : null;
    final partnerHasVersions = currentPartnerChar?.versionOptions.isNotEmpty ?? false;
    final partnerHasSelectedVersion = _selectedPartnerCharacterIndex != null && _selectedVersions[_selectedPartnerCharacterIndex!] != null;
    final partnerIsLoading = _selectedPartnerCharacterIndex != null && _loadingCharacters.contains(_selectedPartnerCharacterIndex!);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [const Color(0xFF1E1B2E), const Color(0xFF2D1B3D)]
                : [const Color(0xFFFAF5FF), Colors.white],
          ),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    // === HEADER ===
                    SliverToBoxAdapter(
                      child: _buildHeader(context, isDark),
                    ),
                    
                    // === MY CHARACTERS SECTION ===
                    if (meCharacters.isNotEmpty) ...[
                      // Sub-header
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                        sliver: SliverToBoxAdapter(
                          child: _buildSectionSubHeader(
                            context,
                            'My Characters',
                            'The fictional souls that mirror your own',
                            theme.colorScheme.primary,
                            Icons.person,
                            isDark,
                          ),
                        ),
                      ),
                      // Pills
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        sliver: SliverToBoxAdapter(
                          child: _buildCharacterPills(context, meCharacters, _selectedMeCharacterIndex, true),
                        ),
                      ),
                      // Content for selected Me character
                      if (currentMeChar != null && !meIsLoading)
                        _buildCharacterContentForSection(context, currentMeChar, _selectedMeCharacterIndex!, meHasVersions, meHasSelectedVersion, isDark),
                      // Loading state for Me
                      if (meIsLoading)
                        _buildLoadingState(context, _selectedMeCharacterIndex!),
                    ],
                    
                    // === PARTNER CHARACTERS SECTION ===
                    if (partnerCharacters.isNotEmpty) ...[
                      // Sub-header
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                        sliver: SliverToBoxAdapter(
                          child: _buildSectionSubHeader(
                            context,
                            widget.relationshipType == 'romantic' 
                                ? "Partner's Characters" 
                                : "Friend's Characters",
                            widget.relationshipType == 'romantic'
                                ? 'Characters that reflect their inner world'
                                : 'Characters that reveal their essence',
                            widget.relationshipType == 'romantic'
                                ? const Color(0xFFE91E63)
                                : const Color(0xFF2196F3),
                            widget.relationshipType == 'romantic'
                                ? Icons.favorite
                                : Icons.people,
                            isDark,
                          ),
                        ),
                      ),
                      // Pills
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        sliver: SliverToBoxAdapter(
                          child: _buildCharacterPills(context, partnerCharacters, _selectedPartnerCharacterIndex, false),
                        ),
                      ),
                      // Content for selected Partner character
                      if (currentPartnerChar != null && !partnerIsLoading)
                        _buildCharacterContentForSection(context, currentPartnerChar, _selectedPartnerCharacterIndex!, partnerHasVersions, partnerHasSelectedVersion, isDark),
                      // Loading state for Partner
                      if (partnerIsLoading)
                        _buildLoadingState(context, _selectedPartnerCharacterIndex!),
                    ],
                    
                    const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
                  ],
                ),
              ),
              
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildLoadingState(BuildContext context, int charIndex) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(color: _getAccentColor(charIndex)),
              const SizedBox(height: 16),
              Text('Recognizing character...', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildCharacterContentForSection(BuildContext context, CharacterAmbiguityAnalysis currentChar, int charIndex, bool hasVersions, bool hasSelectedVersion, bool isDark) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Column(
            key: ValueKey('$charIndex-$hasSelectedVersion'),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Instruction text
              _buildInstructionText(context, hasVersions, hasSelectedVersion),
              const SizedBox(height: 16),
              
              // Version cards or single card with animation
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      child: child,
                    ),
                  );
                },
                child: hasVersions && !hasSelectedVersion
                    ? _buildVersionCardsGrid(context, currentChar, charIndex)
                    : _buildSelectedCardWithActions(context, currentChar, charIndex, hasSelectedVersion),
              ),
              
              // Redo/Remove buttons (only when showing version cards)
              if (hasVersions && !hasSelectedVersion) ...[
                const SizedBox(height: 12),
                _buildActionButtons(context, charIndex, currentChar),
              ],
              
              // Not recognized warning
              if (currentChar.disambiguationReason == 'not_recognized')
                _buildNotRecognizedWarning(context, currentChar),
                
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
  
  /// Full-bleed section sub-header
  Widget _buildSectionSubHeader(BuildContext context, String title, String subtitle, Color accentColor, IconData icon, bool isDark) {
    final theme = Theme.of(context);
    
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Full-bleed background
            Positioned.fill(
              child: CustomPaint(
                painter: _SectionHeaderPainter(accentColor: accentColor, isDark: isDark),
              ),
            ),
            // Content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
                            ),
                          ),
                          Text(
                            subtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.85),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          // Background illustration
          Positioned.fill(
            child: CustomPaint(
              painter: HallOfMirrorsPainter(isDark: isDark),
            ),
          ),
          // Content
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Top bar
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(Icons.arrow_back, color: Colors.white.withOpacity(0.9)),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: _confirmSelections,
                          child: Text(
                            'Skip',
                            style: TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Title
                    Text(
                      'Hall of Mirrors',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black54, blurRadius: 8)],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Which incarnation resonates?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.85),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterPills(BuildContext context, List<MapEntry<int, CharacterAmbiguityAnalysis>> characters, int? selectedIndex, bool isMeSection) {
    final theme = Theme.of(context);
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: characters.map((entry) {
          final index = entry.key;
          final char = entry.value;
          final isSelected = index == selectedIndex;
          final accentColor = _getAccentColor(index);
          final hasVersion = _selectedVersions[index] != null;
          
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => setState(() {
                if (isMeSection) {
                  _selectedMeCharacterIndex = index;
                } else {
                  _selectedPartnerCharacterIndex = index;
                }
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? accentColor 
                      : accentColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isSelected ? accentColor : accentColor.withOpacity(0.3),
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: accentColor.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ] : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Checkmark if version selected
                    if (hasVersion) ...[
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: isSelected ? Colors.white : accentColor,
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      char.characterName ?? char.input,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: isSelected ? Colors.white : accentColor,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInstructionText(BuildContext context, bool hasVersions, bool hasSelectedVersion) {
    final theme = Theme.of(context);
    
    String text;
    if (hasVersions && !hasSelectedVersion) {
      text = 'Choose the version that resonates with you';
    } else {
      text = 'Tap the card to see and edit details';
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            hasVersions && !hasSelectedVersion ? Icons.touch_app : Icons.info_outline,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionCardsGrid(BuildContext context, CharacterAmbiguityAnalysis char, int charIndex) {
    final versions = char.versionOptions;
    
    return GridView.builder(
      key: ValueKey('grid-$charIndex'),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: versions.length,
      itemBuilder: (context, index) {
        final version = versions[index];
        return _buildVersionCard(context, version, index, charIndex);
      },
    );
  }

  Widget _buildVersionCard(BuildContext context, VersionOption version, int versionIndex, int charIndex) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accentColor = _getAccentColor(charIndex);
    
    return GestureDetector(
      onTap: () {
        setState(() => _selectedVersions[charIndex] = version.versionId);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Full-bleed illustration
              Positioned.fill(
                child: CustomPaint(
                  painter: VersionCardPainter(
                    accentColor: accentColor,
                    versionIndex: versionIndex,
                    isDark: isDark,
                  ),
                ),
              ),
              // Gradient overlay at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 70,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
              // Title at bottom
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      version.label,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (version.cue.isNotEmpty)
                      Text(
                        version.cue,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 11,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedCardWithActions(BuildContext context, CharacterAmbiguityAnalysis char, int charIndex, bool hasSelectedVersion) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accentColor = _getAccentColor(charIndex);
    
    // Find selected version
    VersionOption? selectedVersion;
    int selectedVersionIndex = 0;
    if (hasSelectedVersion && char.versionOptions.isNotEmpty) {
      final versionId = _selectedVersions[charIndex];
      for (int i = 0; i < char.versionOptions.length; i++) {
        if (char.versionOptions[i].versionId == versionId) {
          selectedVersion = char.versionOptions[i];
          selectedVersionIndex = i;
          break;
        }
      }
    }
    
    // Use LayoutBuilder to get responsive card size matching the grid
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate card size to match 2-column grid: (availableWidth - spacing) / 2
        final cardSize = (constraints.maxWidth - 12) / 2;
    
    return AnimatedSize(
      key: ValueKey('selected-$charIndex-$hasSelectedVersion'),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main card (tappable) - fixed size
          GestureDetector(
            onTap: () => _showCharacterDetail(charIndex, char),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: cardSize,
              height: cardSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.3 : 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    // Full-bleed illustration
                    Positioned.fill(
                      child: CustomPaint(
                        painter: hasSelectedVersion
                            ? VersionCardPainter(
                                accentColor: accentColor,
                                versionIndex: selectedVersionIndex,
                                isDark: isDark,
                              )
                            : CharacterCardPainter(
                                accentColor: accentColor,
                                characterIndex: charIndex,
                                isDark: isDark,
                              ),
                      ),
                    ),
                    // Selection indicator
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: accentColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, size: 14, color: Colors.white),
                      ),
                    ),
                    // Gradient overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                          ),
                        ),
                      ),
                    ),
                    // Title
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedVersion?.label ?? char.characterName ?? char.input,
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (char.franchise != null)
                            Text(
                              'from ${char.franchise}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 11,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                    // Tap hint
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.touch_app, size: 12, color: Colors.white.withOpacity(0.9)),
                            const SizedBox(width: 3),
                            Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Action buttons - use Expanded to fill space evenly
          SizedBox(
            width: cardSize,
            height: cardSize,
            child: Column(
              children: [
                // Redo button
                Expanded(
                  child: _buildLargeActionButton(
                    context,
                    icon: Icons.refresh,
                    label: 'Redo',
                    color: Colors.orange,
                    onTap: () => _showRedoRecognitionDialog(charIndex, char),
                  ),
                ),
                const SizedBox(height: 8),
                // Remove button
                Expanded(
                  child: _buildLargeActionButton(
                    context,
                    icon: Icons.close,
                    label: 'Remove',
                    color: Colors.red.shade700,
                    onTap: () => _removeCharacter(charIndex, char),
                  ),
                ),
                if (hasSelectedVersion) ...[
                  const SizedBox(height: 8),
                  // Change version button
                  Expanded(
                    child: _buildLargeActionButton(
                      context,
                      icon: Icons.swap_horiz,
                      label: 'Change',
                      color: accentColor,
                      onTap: () => setState(() => _selectedVersions.remove(charIndex)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
      },
    );
  }
  
  Widget _buildLargeActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: color.withOpacity(isDark ? 0.2 : 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(isDark ? 0.2 : 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, int charIndex, CharacterAmbiguityAnalysis char) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showRedoRecognitionDialog(charIndex, char),
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Redo Recognition'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.orange,
              side: BorderSide(color: Colors.orange.withOpacity(0.5)),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _removeCharacter(charIndex, char),
            icon: const Icon(Icons.close, size: 18),
            label: const Text('Remove'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red.shade700,
              side: BorderSide(color: Colors.red.withOpacity(0.5)),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotRecognizedWarning(BuildContext context, CharacterAmbiguityAnalysis char) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Character Not Recognized',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '"${char.input}" couldn\'t be identified. Use "Redo" to enter a well-known character.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark ? Colors.red.shade300 : Colors.red.shade800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => context.pop(),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Back'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: FilledButton(
                // Disable when submitting OR when any character is being re-recognized
                onPressed: (_isSubmitting || _loadingCharacters.isNotEmpty) ? null : _confirmSelections,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : _loadingCharacters.isNotEmpty
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                              SizedBox(width: 8),
                              Text('Recognizing...', style: TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          )
                        : const Text('Continue', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Painter for version cards - SHADOW-BASED with PEEKING EYES
/// Uses Sun, Star, Tree, Crystal, Wave, Castle shadows (different from Character Entry page)
class VersionCardPainter extends CustomPainter {
  final Color accentColor;
  final int versionIndex;
  final bool isDark;

  VersionCardPainter({
    required this.accentColor,
    required this.versionIndex,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Delegate to the shadow-based painters from clarification_painters.dart
    // Uses VersionMiniPainter which has Sun, Star, Tree, Crystal, Wave, Castle shadows
    final painter = VersionMiniPainter(color: accentColor, versionIndex: versionIndex);
    painter.paint(canvas, size);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Painter for character cards - SHADOW-BASED with PEEKING EYES
/// Uses Sun, Star, Tree, Crystal, Wave, Castle shadows (different from Character Entry page)
class CharacterCardPainter extends CustomPainter {
  final Color accentColor;
  final int characterIndex;
  final bool isDark;

  CharacterCardPainter({
    required this.accentColor,
    required this.characterIndex,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Delegate to the shadow-based painters from clarification_painters.dart
    // Uses CharacterPortraitPainter which has Sun, Star, Tree, Crystal, Wave, Castle shadows
    final painter = CharacterPortraitPainter(accentColor: accentColor, characterIndex: characterIndex);
    painter.paint(canvas, size);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SectionHeaderPainter extends CustomPainter {
  final Color accentColor;
  final bool isDark;

  _SectionHeaderPainter({required this.accentColor, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    // Background gradient
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          isDark ? const Color(0xFF1A1A2E) : accentColor.withOpacity(0.7),
          isDark ? accentColor.withOpacity(0.4) : accentColor.withOpacity(0.5),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Stars
    final starPaint = Paint()..color = Colors.white.withOpacity(0.4);
    for (int i = 0; i < 12; i++) {
      final x = (i * 41 + 20) % size.width;
      final y = (i * 17 + 8) % size.height;
      canvas.drawCircle(Offset(x, y), 1.2, starPaint);
    }

    // Hills silhouette
    final hillPaint = Paint()..color = isDark ? Colors.black.withOpacity(0.2) : accentColor.withOpacity(0.3);
    final hillPath = Path();
    hillPath.moveTo(0, size.height);
    hillPath.quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.8);
    hillPath.quadraticBezierTo(size.width * 0.75, size.height, size.width, size.height * 0.7);
    hillPath.lineTo(size.width, size.height);
    hillPath.close();
    canvas.drawPath(hillPath, hillPaint);

    // Birds
    final birdPaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;
    _drawBird(canvas, Offset(size.width * 0.8, size.height * 0.3), 6, birdPaint);
    _drawBird(canvas, Offset(size.width * 0.9, size.height * 0.4), 4, birdPaint);
  }

  void _drawBird(Canvas canvas, Offset center, double s, Paint paint) {
    final path = Path();
    path.moveTo(center.dx - s, center.dy);
    path.quadraticBezierTo(center.dx - s * 0.5, center.dy - s * 0.5, center.dx, center.dy);
    path.quadraticBezierTo(center.dx + s * 0.5, center.dy - s * 0.5, center.dx + s, center.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
