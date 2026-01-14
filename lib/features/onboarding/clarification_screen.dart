import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import '../../core/models/resonance.dart';
import '../../core/storage/repositories.dart';
import '../../app/theme/app_theme.dart';

/// Clarification Screen v4
/// 
/// Updated with:
/// - Split positive/negative text inputs
/// - Proper placement (positive before exclusions)
/// - Microcopy: "choose what feels true even if you don't want it"
/// - Supports both "Me" and "Other" (relationship) characters.
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
  final Set<int> _loadingCharacters = {}; // Track which characters are being re-recognized
  final Set<int> _removedIndices = {}; // Track removed characters

  @override
  void initState() {
    super.initState();
    // Create a mutable copy of the characters list
    _characters = List<CharacterAmbiguityAnalysis>.from(widget.analysisResponse.characters);
    
    // Initialize controllers and default selections for ALL characters
    // (All characters should be shown for confirmation/adjustment)
    for (int i = 0; i < _characters.length; i++) {
      _positiveTextControllers[i] = TextEditingController();
      _negativeTextControllers[i] = TextEditingController();
      _excludedPhases[i] = {};
      if (_characters[i].phaseOptions.isNotEmpty) {
        _selectedPhases[i] = 'phase_overall';
      }
    }
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

  bool _isMyCharacter(int index) => index < widget.meCount;

  String _getSectionLabel(int index) {
    if (_isMyCharacter(index)) {
      return 'My Character';
    } else {
      final relationType = widget.relationshipType == 'romantic' ? 'Partner' : 'Friend';
      return '$relationType\'s Character';
    }
  }

  Color _getAccentColor(int index) {
    if (_isMyCharacter(index)) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return widget.relationshipType == 'romantic'
          ? const Color(0xFFE91E63)
          : const Color(0xFF2196F3);
    }
  }

  bool _shouldShowExclusion(CharacterAmbiguityAnalysis char) {
    final excludablePhases = char.phaseOptions.where((p) => 
      p.phaseId != 'phase_overall' && p.excludable
    ).toList();
    return char.showExclusionSection || excludablePhases.length > 1;
  }

  List<ClarificationChoice> _buildClarifications() {
    return _characters.asMap().entries.map((entry) {
      final index = entry.key;
      final char = entry.value;
      
      // Mark removed characters with SKIP mode
      if (_removedIndices.contains(index)) {
        return const ClarificationChoice(
          referenceMode: 'SKIP', // Special mode to indicate character should be skipped
        );
      }
      
      // Build clarifications for ALL characters (not just needsClarification)
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
    setState(() => _isSubmitting = true);
    
    try {
      final clarifications = _buildClarifications();
      
      // Pass meCount and relationship info so backend can properly split and store characters
      await ref.read(resonanceRepositoryProvider.notifier).confirmClarifications(
        clarifications,
        meCount: widget.meCount,
        relationshipEnabled: widget.relationshipEnabled,
        relationshipType: widget.relationshipType ?? 'platonic',
      );
      
      if (mounted) {
        context.go('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _skipClarification() async {
    setState(() => _isSubmitting = true);
    
    try {
      await ref.read(resonanceRepositoryProvider.notifier).skipClarification();
      
      if (mounted) {
        context.go('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  /// Remove a character from the list
  void _removeCharacter(int index, CharacterAmbiguityAnalysis character) {
    // Calculate minimum required characters
    final minMeCount = 4; // Minimum 4 Me characters required
    final currentMeCount = _characters.asMap().entries
        .where((e) => _isMyCharacter(e.key) && !_removedIndices.contains(e.key))
        .length;
    final currentOtherCount = _characters.asMap().entries
        .where((e) => !_isMyCharacter(e.key) && !_removedIndices.contains(e.key))
        .length;
    
    // Check if removal would violate minimum requirements
    if (_isMyCharacter(index)) {
      if (currentMeCount <= minMeCount) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You need at least $minMeCount characters. Please redo recognition instead.'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
    } else {
      // For relationship characters, also need minimum 4
      if (widget.relationshipEnabled && currentOtherCount <= 4) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You need at least 4 partner characters. Please redo recognition instead.'),
            backgroundColor: Colors.orange,
          ),
        );
        return;
      }
    }
    
    // Show confirmation dialog
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.delete_outline, color: Colors.red.shade700),
            const SizedBox(width: 8),
            const Expanded(child: Text('Remove Character?')),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Remove "${character.characterName ?? character.input}" from your selection?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              'This character will not be included in your analysis.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) {
        setState(() {
          _removedIndices.add(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed "${character.characterName ?? character.input}"'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {
                  _removedIndices.remove(index);
                });
              },
            ),
          ),
        );
      }
    });
  }

  /// Show dialog to redo recognition for a specific character
  Future<void> _showRedoRecognitionDialog(int index, CharacterAmbiguityAnalysis character) async {
    final hintController = TextEditingController();
    final theme = Theme.of(context);
    
    final result = await showDialog<Map<String, String?>>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.refresh, color: Colors.orange),
            const SizedBox(width: 8),
            const Expanded(child: Text('Redo Recognition')),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current: "${character.characterName ?? character.input}"',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add reference(s) to help recognition:',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'You can enter multiple movies/shows separated by commas.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: hintController,
              decoration: InputDecoration(
                hintText: 'e.g., "Don, Fashion" or "Yes Man (2008)"',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(Icons.movie_filter),
              ),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, {
              'hint': hintController.text.trim().isNotEmpty ? hintController.text.trim() : null,
            }),
            child: const Text('Redo Recognition'),
          ),
        ],
      ),
    );
    
    if (result == null || !mounted) return;
    
    // Set loading state for this character slot
    setState(() {
      _loadingCharacters.add(index);
    });
    
    try {
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.rerecognizeCharacter(
        characterIndex: index,
        originalInput: character.input,
        hint: result['hint'],
      );
      
      if (!mounted) return;
      
      if (response.success && response.updatedCharacter != null) {
        final updated = response.updatedCharacter!;
        
        // Determine new disambiguation reason based on recognition result
        String? newDisambiguationReason;
        if (updated.needsClarification) {
          // Still needs clarification for some reason
          newDisambiguationReason = updated.versionOptions.isNotEmpty 
              ? 'distinct_phases' 
              : 'confirm_identification';
        } else {
          // Successfully recognized - just needs confirmation
          newDisambiguationReason = 'confirm_identification';
        }
        
        // Update the local character data
        setState(() {
          _loadingCharacters.remove(index);
          _characters[index] = CharacterAmbiguityAnalysis(
            input: character.input,
            characterName: updated.characterName,
            canonicalId: updated.canonicalId,
            franchise: updated.franchise,
            medium: updated.medium,
            needsClarification: updated.needsClarification,
            disambiguationReason: newDisambiguationReason, // Updated after re-recognition!
            versionOptions: updated.versionOptions,
            phaseOptions: updated.phaseOptions,
            hasEntryReference: true, // Now has reference
            entryReferenceText: result['hint'],
            entryReferenceMismatch: false, // No longer mismatched after redo
            showExclusionSection: updated.phaseOptions.length > 1,
            referenceDescription: updated.franchise != null 
                ? '${updated.characterName} from ${updated.franchise}'
                : null,
          );
          
          // Clear any previous selections for this character
          _selectedVersions.remove(index);
          _selectedPhases.remove(index);
          _excludedPhases.remove(index);
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✓ Recognized as "${updated.characterName}" from "${updated.franchise}"'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        setState(() {
          _loadingCharacters.remove(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message ?? 'Recognition failed. Try adding more context (e.g., movie name, year).'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on DioException catch (e) {
      if (!mounted) return;
      setState(() {
        _loadingCharacters.remove(index);
      });
      
      // Extract error information from backend response
      String errorMessage = 'Recognition failed. Please try again.';
      String? suggestion;
      List<String>? hints;
      
      if (e.response?.data != null && e.response!.data is Map) {
        final errorData = e.response!.data as Map<String, dynamic>;
        
        errorMessage = errorData['error'] ?? errorMessage;
        suggestion = errorData['suggestion'];
        
        if (errorData['hints'] != null && errorData['hints'] is List) {
          hints = (errorData['hints'] as List).map((h) => h.toString()).toList();
        }
        
        // Special handling for actor-character mapping errors
        if (errorData['code'] == 'ACTOR_CHARACTER_UNKNOWN') {
          errorMessage = '🎭 Actor name detected';
          suggestion = 'Please enter the character name instead of the actor name';
          hints ??= [
            'Example: Enter "Roma" (character) not "Priyanka Chopra" (actor)',
            'Example: Enter "Allison" (character) not "Zooey Deschanel" (actor)',
          ];
        }
      }
      
      // Show error with helpful information
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(errorMessage, style: const TextStyle(fontWeight: FontWeight.bold)),
              if (suggestion != null) ...[
                const SizedBox(height: 4),
                Text(suggestion, style: const TextStyle(fontSize: 12)),
              ],
              if (hints != null) ...[
                const SizedBox(height: 4),
                ...hints.map((hint) => Text('• $hint', style: const TextStyle(fontSize: 11))),
              ],
            ],
          ),
          backgroundColor: Colors.orange.shade700,
          duration: const Duration(seconds: 8),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loadingCharacters.remove(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unexpected error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    // Show ALL characters for confirmation/adjustment (excluding removed ones)
    final meCharacters = _characters
        .asMap()
        .entries
        .where((e) => _isMyCharacter(e.key) && !_removedIndices.contains(e.key))
        .toList();
    final otherCharacters = _characters
        .asMap()
        .entries
        .where((e) => !_isMyCharacter(e.key) && !_removedIndices.contains(e.key))
        .toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refine Your Characters'),
        actions: [
          TextButton(
            onPressed: _isSubmitting ? null : _skipClarification,
            child: const Text('Skip All'),
          ),
        ],
      ),
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
          child: Column(
            children: [
              _buildHeader(context),
              
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    // Guidance microcopy
                    _buildGuidanceNote(context),
                    
                    // Show ALL My Characters for confirmation/adjustment
                    if (meCharacters.isNotEmpty) ...[
                      _buildSectionTitle(context, 'My Characters', theme.colorScheme.primary),
                      ...meCharacters.map((entry) => 
                        _CharacterClarificationCard(
                          character: entry.value,
                          index: entry.key,
                          sectionLabel: _getSectionLabel(entry.key),
                          accentColor: _getAccentColor(entry.key),
                          selectedVersionId: _selectedVersions[entry.key],
                          selectedPhaseId: _selectedPhases[entry.key],
                          excludedPhaseIds: _excludedPhases[entry.key] ?? {},
                          showExclusionSection: _shouldShowExclusion(entry.value),
                          positiveTextController: _positiveTextControllers[entry.key],
                          negativeTextController: _negativeTextControllers[entry.key],
                          isLoading: _loadingCharacters.contains(entry.key),
                          onRedoRecognition: () => _showRedoRecognitionDialog(entry.key, entry.value),
                          onRemove: () => _removeCharacter(entry.key, entry.value),
                          onVersionSelected: (versionId) {
                            setState(() => _selectedVersions[entry.key] = versionId);
                          },
                          onPhaseSelected: (phaseId) {
                            setState(() {
                              _selectedPhases[entry.key] = phaseId;
                              _excludedPhases[entry.key]?.remove(phaseId);
                            });
                          },
                          onPhaseExclusionToggled: (phaseId) {
                            setState(() {
                              final exclusions = _excludedPhases[entry.key] ?? {};
                              if (exclusions.contains(phaseId)) {
                                exclusions.remove(phaseId);
                              } else {
                                exclusions.add(phaseId);
                                if (_selectedPhases[entry.key] == phaseId) {
                                  _selectedPhases[entry.key] = 'phase_overall';
                                }
                              }
                              _excludedPhases[entry.key] = exclusions;
                            });
                          },
                        ),
                      ),
                    ],
                    
                    // Show ALL Partner Characters for confirmation/adjustment
                    if (otherCharacters.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      _buildSectionTitle(
                        context, 
                        widget.relationshipType == 'romantic' 
                            ? "Partner's Characters" 
                            : "Friend's Characters",
                        widget.relationshipType == 'romantic'
                            ? const Color(0xFFE91E63)
                            : const Color(0xFF2196F3),
                      ),
                      ...otherCharacters.map((entry) => 
                        _CharacterClarificationCard(
                          character: entry.value,
                          index: entry.key,
                          sectionLabel: _getSectionLabel(entry.key),
                          accentColor: _getAccentColor(entry.key),
                          selectedVersionId: _selectedVersions[entry.key],
                          selectedPhaseId: _selectedPhases[entry.key],
                          excludedPhaseIds: _excludedPhases[entry.key] ?? {},
                          showExclusionSection: _shouldShowExclusion(entry.value),
                          positiveTextController: _positiveTextControllers[entry.key],
                          negativeTextController: _negativeTextControllers[entry.key],
                          isLoading: _loadingCharacters.contains(entry.key),
                          onRedoRecognition: () => _showRedoRecognitionDialog(entry.key, entry.value),
                          onRemove: () => _removeCharacter(entry.key, entry.value),
                          onVersionSelected: (versionId) {
                            setState(() => _selectedVersions[entry.key] = versionId);
                          },
                          onPhaseSelected: (phaseId) {
                            setState(() {
                              _selectedPhases[entry.key] = phaseId;
                              _excludedPhases[entry.key]?.remove(phaseId);
                            });
                          },
                          onPhaseExclusionToggled: (phaseId) {
                            setState(() {
                              final exclusions = _excludedPhases[entry.key] ?? {};
                              if (exclusions.contains(phaseId)) {
                                exclusions.remove(phaseId);
                              } else {
                                exclusions.add(phaseId);
                                if (_selectedPhases[entry.key] == phaseId) {
                                  _selectedPhases[entry.key] = 'phase_overall';
                                }
                              }
                              _excludedPhases[entry.key] = exclusions;
                            });
                          },
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: 100),
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

  Widget _buildGuidanceNote(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.tertiary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.lightbulb_outline, color: theme.colorScheme.tertiary, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Choose what feels true — even if you don\'t want it. This is about what shows up, not what you prefer.',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onTertiaryContainer,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, Color color) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.tune, color: theme.colorScheme.primary, size: 32),
          const SizedBox(height: 12),
          Text(
            'Which incarnation resonates with you?',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Select versions or phases. Tell us what you connect with — and what doesn\'t fit.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Removed _buildReadyCharactersSummary - all characters now shown for confirmation

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
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: _isSubmitting ? null : () => context.pop(),
              child: const Text('Back'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _confirmSelections,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Card for a single character's clarification options
class _CharacterClarificationCard extends StatelessWidget {
  final CharacterAmbiguityAnalysis character;
  final int index;
  final String sectionLabel;
  final Color accentColor;
  final String? selectedVersionId;
  final String? selectedPhaseId;
  final Set<String> excludedPhaseIds;
  final bool showExclusionSection;
  final TextEditingController? positiveTextController;
  final TextEditingController? negativeTextController;
  final ValueChanged<String?> onVersionSelected;
  final ValueChanged<String?> onPhaseSelected;
  final ValueChanged<String> onPhaseExclusionToggled;
  final VoidCallback? onRedoRecognition;
  final VoidCallback? onRemove; // NEW: Remove character callback
  final bool isLoading; // Loading state for re-recognition

  const _CharacterClarificationCard({
    required this.character,
    required this.index,
    required this.sectionLabel,
    required this.accentColor,
    required this.selectedVersionId,
    required this.selectedPhaseId,
    required this.excludedPhaseIds,
    required this.showExclusionSection,
    this.positiveTextController,
    this.negativeTextController,
    required this.onVersionSelected,
    required this.onPhaseSelected,
    required this.onPhaseExclusionToggled,
    this.onRedoRecognition,
    this.onRemove, // NEW
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasVersions = character.versionOptions.isNotEmpty;
    final hasPhases = character.phaseOptions.isNotEmpty;
    final hasEntryReferenceMismatch = character.entryReferenceMismatch;
    
    // Show loading overlay when re-recognizing
    if (isLoading) {
      return Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: accentColor.withOpacity(0.3)),
        ),
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(accentColor),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Re-recognizing "${character.input}"...',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'This may take a moment',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: hasEntryReferenceMismatch 
              ? Colors.orange.withOpacity(0.5) 
              : accentColor.withOpacity(0.3),
          width: hasEntryReferenceMismatch ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Character header
            _buildHeader(context),
            
            // 1.5. AI Clarification Request (if applicable)
            if (character.aiNeedsClarification && character.clarificationMessage != null) ...[
              const SizedBox(height: 12),
              _buildAIClarificationBanner(context),
            ],
            
            // 1.6. Entry Reference Mismatch Warning (if applicable)
            if (hasEntryReferenceMismatch && !character.aiNeedsClarification) ...[
              const SizedBox(height: 12),
              _buildReferenceMismatchWarning(context),
            ],
            
            // 2. Version options (if applicable)
            if (hasVersions) ...[
              const SizedBox(height: 20),
              _buildVersionSection(context),
            ],
            
            // 3. Phase options
            if (hasPhases) ...[
              const SizedBox(height: 20),
              _buildPhaseSection(context),
            ],
            
            // 4. What you connect with (POSITIVE resonance - placed before negative)
            const SizedBox(height: 20),
            _buildPositiveResonanceSection(context),
            
            // 5. What you don't connect with (NEGATIVE resonance)
            const SizedBox(height: 20),
            _buildNegativeResonanceSection(context),
            
            // Arc exclusion chips (part of negative section)
            if (showExclusionSection && hasPhases) ...[
              const SizedBox(height: 12),
              _buildExclusionChips(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAIClarificationBanner(BuildContext context) {
    final theme = Theme.of(context);
    final isActorInput = character.inputWasActor;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Icon(
            isActorInput ? Icons.person_search : Icons.help_outline,
            color: Colors.blue.shade700,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isActorInput ? 'Actor Name Detected' : 'Clarification Needed',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  character.clarificationMessage ?? 
                    (isActorInput 
                      ? 'Please specify the character they played.'
                      : 'Please provide more details about this character.'),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.blue.shade700,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Use the "Redo Recognition" button to enter the character name directly.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.blue.shade600,
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

  Widget _buildReferenceMismatchWarning(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange.shade700, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'This doesn\'t match your reference',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (character.entryReferenceText != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'You mentioned "${character.entryReferenceText}" but we found a popular match that may be different.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.orange.shade700,
                      height: 1.4,
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(
                  'Please confirm this is correct, or try adding more details.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.orange.shade600,
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

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final hasReference = character.hasEntryReference;
    
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: accentColor, width: 2),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      character.characterName ?? character.input,
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Show reference badge if entry reference exists
                  if (hasReference && character.entryReferenceText != null) ...[
                    const SizedBox(width: 8),
                    Tooltip(
                      message: 'From "${character.entryReferenceText}"',
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.blue.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.movie_filter, size: 12, color: Colors.blue.shade600),
                            const SizedBox(width: 4),
                            Text(
                              'Ref',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              // Always show franchise/source reference
              if (character.franchise != null || character.referenceDescription != null) ...[
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        character.medium == 'tv' ? Icons.tv :
                        character.medium == 'book' ? Icons.book :
                        character.medium == 'game' ? Icons.sports_esports :
                        Icons.movie,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          character.referenceDescription ?? 
                            '${character.characterName ?? character.input} from ${character.franchise ?? "Unknown"}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      sectionLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: accentColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    _getReasonText(character.disambiguationReason, character.entryReferenceMismatch, character.inputWasActor),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: character.entryReferenceMismatch 
                          ? Colors.orange.shade700 
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Redo Recognition Button
        if (onRedoRecognition != null)
          IconButton(
            onPressed: onRedoRecognition,
            icon: const Icon(Icons.refresh),
            tooltip: 'This is wrong. Redo recognition.',
            style: IconButton.styleFrom(
              foregroundColor: Colors.orange,
              backgroundColor: Colors.orange.withOpacity(0.1),
            ),
          ),
        // Remove Character Button
        if (onRemove != null) ...[
          const SizedBox(width: 4),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close),
            tooltip: 'Remove this character',
            style: IconButton.styleFrom(
              foregroundColor: Colors.red.shade700,
              backgroundColor: Colors.red.withOpacity(0.1),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildVersionSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.movie_outlined, size: 18, color: accentColor),
            const SizedBox(width: 8),
            Text(
              'Which version?',
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...character.versionOptions.map((version) => _buildVersionCard(context, version)),
      ],
    );
  }

  Widget _buildVersionCard(BuildContext context, VersionOption version) {
    final theme = Theme.of(context);
    final isSelected = selectedVersionId == version.versionId;
    
    return GestureDetector(
      onTap: () => onVersionSelected(isSelected ? null : version.versionId),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withOpacity(0.15)
              : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? accentColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? accentColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? accentColor : theme.colorScheme.outline,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    version.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected ? accentColor : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    version.cue,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isSelected
                          ? accentColor.withOpacity(0.8)
                          : theme.colorScheme.onSurfaceVariant,
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

  Widget _buildPhaseSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.timeline, size: 18, color: theme.colorScheme.secondary),
            const SizedBox(width: 8),
            Text(
              'Which phase resonates most?',
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: character.phaseOptions
              .where((phase) => !excludedPhaseIds.contains(phase.phaseId))
              .map((phase) => _buildPhaseChip(context, phase))
              .toList(),
        ),
        if (selectedPhaseId != null && selectedPhaseId != 'phase_overall') ...[
          const SizedBox(height: 12),
          _buildSelectedPhaseCue(context),
        ],
      ],
    );
  }

  Widget _buildPhaseChip(BuildContext context, PhaseOption phase) {
    final theme = Theme.of(context);
    final isSelected = selectedPhaseId == phase.phaseId;
    final isOverall = phase.phaseId == 'phase_overall';
    
    return FilterChip(
      label: Text(phase.label),
      selected: isSelected,
      onSelected: (_) => onPhaseSelected(phase.phaseId),
      selectedColor: isOverall
          ? theme.colorScheme.surfaceContainerHighest
          : theme.colorScheme.secondaryContainer,
      checkmarkColor: isOverall ? theme.colorScheme.outline : theme.colorScheme.onSecondaryContainer,
      labelStyle: TextStyle(
        color: isSelected
            ? (isOverall ? theme.colorScheme.onSurface : theme.colorScheme.onSecondaryContainer)
            : theme.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? theme.colorScheme.secondary : theme.colorScheme.outline,
      ),
    );
  }

  Widget _buildSelectedPhaseCue(BuildContext context) {
    final theme = Theme.of(context);
    final selectedPhase = character.phaseOptions.firstWhere(
      (p) => p.phaseId == selectedPhaseId,
      orElse: () => const PhaseOption(phaseId: '', label: '', cue: ''),
    );
    
    if (selectedPhase.cue.isEmpty) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.colorScheme.secondary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: theme.colorScheme.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              selectedPhase.cue,
              style: theme.textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// POSITIVE resonance section - what user connects with
  Widget _buildPositiveResonanceSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.favorite_outline, size: 18, color: Colors.green.shade600),
            const SizedBox(width: 8),
            Text(
              'What you connect with',
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: positiveTextController,
          decoration: InputDecoration(
            hintText: 'A moment, quality, or way of being...',
            filled: true,
            fillColor: Colors.green.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.green.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.green.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.green.shade600, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            prefixIcon: Icon(Icons.add_circle_outline, color: Colors.green.shade600),
          ),
          maxLines: 2,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }

  /// NEGATIVE resonance section - what doesn't fit the user
  Widget _buildNegativeResonanceSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.block_outlined, size: 18, color: Colors.orange.shade700),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'What doesn\'t feel like you',
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Excluding doesn\'t mean it\'s bad. It means it doesn\'t represent you.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: negativeTextController,
          decoration: InputDecoration(
            hintText: 'A quality, cost, or edge that doesn\'t fit...',
            filled: true,
            fillColor: Colors.orange.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.orange.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.orange.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.orange.shade700, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            prefixIcon: Icon(Icons.remove_circle_outline, color: Colors.orange.shade700),
          ),
          maxLines: 2,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }

  /// Exclusion chips - part of negative section
  Widget _buildExclusionChips(BuildContext context) {
    final theme = Theme.of(context);
    
    final excludablePhases = character.phaseOptions
        .where((p) => p.phaseId != 'phase_overall' && p.excludable)
        .toList();
    
    if (excludablePhases.isEmpty) return const SizedBox.shrink();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Or exclude specific phases:',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: excludablePhases.map((phase) => 
            _buildExclusionChip(context, phase)
          ).toList(),
        ),
        if (excludedPhaseIds.isNotEmpty) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.shield_outlined, size: 16, color: Colors.orange.shade700),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'You won\'t be analyzed through ${excludedPhaseIds.length == 1 ? 'this phase' : 'these phases'}.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.orange.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildExclusionChip(BuildContext context, PhaseOption phase) {
    final theme = Theme.of(context);
    final isExcluded = excludedPhaseIds.contains(phase.phaseId);
    
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isExcluded) ...[
            Icon(Icons.close, size: 14, color: Colors.red.shade700),
            const SizedBox(width: 4),
          ],
          Text(phase.label),
        ],
      ),
      selected: isExcluded,
      onSelected: (_) => onPhaseExclusionToggled(phase.phaseId),
      selectedColor: Colors.red.withOpacity(0.15),
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      labelStyle: TextStyle(
        color: isExcluded ? Colors.red.shade700 : theme.colorScheme.onSurface,
        fontWeight: isExcluded ? FontWeight.w600 : FontWeight.normal,
        decoration: isExcluded ? TextDecoration.lineThrough : null,
      ),
      side: BorderSide(
        color: isExcluded ? Colors.red.shade400 : theme.colorScheme.outline.withOpacity(0.5),
      ),
      showCheckmark: false,
    );
  }

  String _getReasonText(String? reason, [bool hasMismatch = false, bool inputWasActor = false]) {
    if (hasMismatch) {
      return 'Reference mismatch — please verify';
    }
    if (inputWasActor) {
      return 'Actor detected — please specify character';
    }
    switch (reason) {
      case 'multiple_versions':
        return 'Multiple versions exist';
      case 'distinct_phases':
        return 'Has distinct arc phases';
      case 'confirm_identification':
        return 'Confirm or adjust';
      case 'not_recognized':
        return 'Not recognized — try again';
      case 'actor_character_unknown':
        return 'Please specify the character name';
      case 'ambiguous':
        return 'Ambiguous — please clarify';
      case 'low_confidence':
        return 'Uncertain — please confirm';
      default:
        return 'Please confirm';
    }
  }
}
