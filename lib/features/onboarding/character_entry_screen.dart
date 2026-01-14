import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../core/models/character.dart';
import '../../../core/storage/repositories.dart';
import '../../../core/utils/constants.dart';
import '../../../app/theme/app_theme.dart';

/// Enum for relationship types
enum RelationshipType {
  romantic,
  platonic;
  
  String get displayName {
    switch (this) {
      case RelationshipType.romantic:
        return 'Romantic Partner';
      case RelationshipType.platonic:
        return 'Friend / Platonic';
    }
  }
  
  String get apiValue {
    switch (this) {
      case RelationshipType.romantic:
        return AppConstants.relationshipTypeRomantic;
      case RelationshipType.platonic:
        return AppConstants.relationshipTypePlatonic;
    }
  }
}

/// State for a single character input slot
class CharacterSlotState {
  final TextEditingController nameController;
  final TextEditingController referenceController;
  final FocusNode nameFocusNode;
  bool showReference;
  ReferenceType referenceType;
  LimitMode limitMode;

  CharacterSlotState()
      : nameController = TextEditingController(),
        referenceController = TextEditingController(),
        nameFocusNode = FocusNode(),
        showReference = false,
        referenceType = ReferenceType.other,
        limitMode = LimitMode.assistive;

  void dispose() {
    nameController.dispose();
    referenceController.dispose();
    nameFocusNode.dispose();
  }

  Character? toCharacter() {
    final name = nameController.text.trim();
    if (name.isEmpty) return null;

    final refText = referenceController.text.trim();
    final hasReference = refText.isNotEmpty;

    return Character(
      id: const Uuid().v4(),
      displayName: name,
      entryReference: hasReference
          ? CharacterEntryReference(
              text: refText,
              type: referenceType,
              limitMode: limitMode,
            )
          : null,
    );
  }
}

class CharacterEntryScreen extends ConsumerStatefulWidget {
  const CharacterEntryScreen({super.key});

  @override
  ConsumerState<CharacterEntryScreen> createState() =>
      _CharacterEntryScreenState();
}

class _CharacterEntryScreenState extends ConsumerState<CharacterEntryScreen> {
  // "My Characters" slots (4 required + 2 optional)
  late final List<CharacterSlotState> _meSlots;
  
  // "Their Characters" slots (4 required + 2 optional)
  late final List<CharacterSlotState> _otherSlots;
  
  // Relationship state
  bool _relationshipEnabled = false;
  RelationshipType _relationshipType = RelationshipType.platonic;

  @override
  void initState() {
    super.initState();
    _meSlots = List.generate(AppConstants.maxCharacterCount, (_) => CharacterSlotState());
    _otherSlots = List.generate(AppConstants.maxRelationshipCharacterCount, (_) => CharacterSlotState());
  }

  @override
  void dispose() {
    for (final slot in _meSlots) {
      slot.dispose();
    }
    for (final slot in _otherSlots) {
      slot.dispose();
    }
    super.dispose();
  }

  List<Character> _extractCharacters(List<CharacterSlotState> slots) {
    return slots
        .map((slot) => slot.toCharacter())
        .where((c) => c != null)
        .cast<Character>()
        .toList();
  }

  void _generate() async {
    final meCharacters = _extractCharacters(_meSlots);
    
    // Validate "Me" characters
    if (meCharacters.length < AppConstants.minCharacterCount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter at least ${AppConstants.minCharacterCount} characters for yourself'),
        ),
      );
      return;
    }
    
    // If relationship enabled, validate "Other" characters
    List<Character>? otherCharacters;
    if (_relationshipEnabled) {
      otherCharacters = _extractCharacters(_otherSlots);
      if (otherCharacters.length < AppConstants.minRelationshipCharacterCount) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter at least ${AppConstants.minRelationshipCharacterCount} characters for your ${_relationshipType.displayName.toLowerCase()}'),
          ),
        );
        return;
      }
    }

    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(_relationshipEnabled 
                    ? 'Creating your myths...' 
                    : 'Creating your myth...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      // Collect all character inputs with references for resonance analysis
      final meCharacterInputs = meCharacters.map((c) => c.displayName).toList();
      final otherCharacterInputs = otherCharacters?.map((c) => c.displayName).toList() ?? [];
      
      // Combine all characters for analysis (Me first, then Other)
      final allCharacterInputs = [...meCharacterInputs, ...otherCharacterInputs];
      
      // Build slots with references for recognition
      final allSlots = [
        ...meCharacters.asMap().entries.map((e) => _buildSlotPayload('me_${e.key}', e.value)),
        ...?otherCharacters?.asMap().entries.map((e) => _buildSlotPayload('other_${e.key}', e.value)),
      ];
      
      // Step 1: Analyze ALL characters for ambiguity (Resonance Engine)
      // Pass slots with references for better recognition
      final resonanceResponse = await ref
          .read(resonanceRepositoryProvider.notifier)
          .analyzeCharactersWithReferences(allCharacterInputs, allSlots);
      
      // Save "Me" characters
      await ref.read(userProfileRepositoryProvider.notifier).saveCharacters(
            meCharacters,
          );
      
      // Save relationship characters if enabled
      if (_relationshipEnabled && otherCharacters != null) {
        await ref.read(relationshipRepositoryProvider.notifier).saveRelationship(
          enabled: true,
          relationshipType: _relationshipType.apiValue,
          otherCharacters: otherCharacters,
        );
      } else {
        // Disable relationship if toggle is off
        await ref.read(relationshipRepositoryProvider.notifier).disableRelationship();
      }
      
      if (context.mounted) {
        Navigator.of(context).pop(); // Close loading
        
        // Step 2: Check if clarification is needed (for ANY character)
        if (resonanceResponse.needsClarification) {
          // Navigate to clarification screen with context about character ownership
          context.push('/clarification', extra: {
            'response': resonanceResponse,
            'meCount': meCharacterInputs.length,
            'otherCount': otherCharacterInputs.length,
            'relationshipEnabled': _relationshipEnabled,
            'relationshipType': _relationshipType.apiValue,
          });
        } else {
          // No clarification needed - skip to generation
          await ref.read(resonanceRepositoryProvider.notifier).skipClarification();
          context.go('/home');
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop(); // Close loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
      }
    }
  }

  /// Build slot payload for recognition with reference hints
  Map<String, dynamic> _buildSlotPayload(String slotId, Character character) {
    final ref = character.entryReference;
    return {
      'slotId': slotId,
      'rawName': character.displayName,
      'referenceText': ref?.text,
      'referenceType': ref?.type.name.toUpperCase(),
      'limitMode': ref?.limitMode.name.toUpperCase() ?? 'NONE',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Characters'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    const Color(0xFF1E1B2E),
                    const Color(0xFF2D1B3D),
                  ]
                : [
                    const Color(0xFFFAF5FF),
                    Colors.white,
                  ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === MY CHARACTERS SECTION ===
                _buildSectionHeader(
                  context,
                  icon: Icons.person,
                  title: 'My Characters',
                  subtitle: '4 required, 2 optional. Characters you identify with.',
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 24),
                ..._buildCharacterInputs(
                  context,
                  slots: _meSlots,
                  minRequired: AppConstants.minCharacterCount,
                  maxCount: AppConstants.maxCharacterCount,
                  isMe: true,
                ),
                
                const SizedBox(height: 40),
                
                // === RELATIONSHIP TOGGLE ===
                _buildRelationshipToggle(context),
                
                // === THEIR CHARACTERS SECTION (if enabled) ===
                if (_relationshipEnabled) ...[
                  const SizedBox(height: 32),
                  _buildRelationshipTypeSelector(context),
                  const SizedBox(height: 24),
                  _buildSectionHeader(
                    context,
                    icon: Icons.people,
                    title: 'Their Characters',
                    subtitle: '4 required, 2 optional. Characters that remind you of them.',
                    color: _getRelationshipColor(),
                  ),
                  const SizedBox(height: 24),
                  ..._buildCharacterInputs(
                    context,
                    slots: _otherSlots,
                    minRequired: AppConstants.minRelationshipCharacterCount,
                    maxCount: AppConstants.maxRelationshipCharacterCount,
                    isMe: false,
                  ),
                  const SizedBox(height: 16),
                  _buildDisclaimerNote(context),
                ],
                
                const SizedBox(height: 32),
                
                // === GENERATE BUTTON ===
                _buildGenerateButton(context),
                
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCharacterInputs(
    BuildContext context, {
    required List<CharacterSlotState> slots,
    required int minRequired,
    required int maxCount,
    required bool isMe,
  }) {
    final theme = Theme.of(context);
    final accentColor = isMe ? theme.colorScheme.primary : _getRelationshipColor();
    
    return List.generate(maxCount, (index) {
      final slot = slots[index];
      final isOptional = index >= minRequired;
      
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: _CharacterInputSlot(
          slot: slot,
          index: index,
          isOptional: isOptional,
          isMe: isMe,
          accentColor: accentColor,
          onShowReferenceChanged: (show) {
            setState(() {
              slot.showReference = show;
            });
          },
          onReferenceTypeChanged: (type) {
            setState(() {
              slot.referenceType = type;
            });
          },
          onLimitModeChanged: (mode) {
            setState(() {
              slot.limitMode = mode;
            });
          },
          onReferenceTextChanged: () {
            setState(() {
              // Trigger rebuild to show/hide limit mode toggle
            });
          },
          onNextField: () {
            if (index < maxCount - 1) {
              slots[index + 1].nameFocusNode.requestFocus();
            }
          },
        ),
      );
    });
  }

  Widget _buildRelationshipToggle(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _relationshipEnabled
            ? _getRelationshipColor().withOpacity(0.1)
            : theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _relationshipEnabled
              ? _getRelationshipColor().withOpacity(0.3)
              : theme.colorScheme.outline.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _relationshipEnabled ? Icons.favorite : Icons.favorite_border,
            color: _relationshipEnabled ? _getRelationshipColor() : Colors.grey,
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a Relationship',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Explore dynamics with a partner or friend',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: _relationshipEnabled,
            onChanged: (value) {
              setState(() {
                _relationshipEnabled = value;
              });
            },
            activeColor: _getRelationshipColor(),
          ),
        ],
      ),
    );
  }

  Widget _buildRelationshipTypeSelector(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Relationship Type',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: RelationshipType.values.map((type) {
            final isSelected = _relationshipType == type;
            final color = type == RelationshipType.romantic
                ? const Color(0xFFE91E63)
                : const Color(0xFF2196F3);
            
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: type == RelationshipType.romantic ? 8 : 0,
                  left: type == RelationshipType.platonic ? 8 : 0,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _relationshipType = type;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? color.withOpacity(0.15) : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? color : theme.colorScheme.outline.withOpacity(0.3),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          type == RelationshipType.romantic
                              ? Icons.favorite
                              : Icons.people,
                          color: isSelected ? color : Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            type.displayName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: isSelected ? color : theme.colorScheme.onSurface,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDisclaimerNote(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.amber.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber.shade700, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'This is based on your perception of them. Accuracy improves if they make their own profile.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.amber.shade800,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenerateButton(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _generate,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              _relationshipEnabled ? 'Generate Our Myths' : 'Generate My Myth',
              style: theme.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRelationshipColor() {
    return _relationshipType == RelationshipType.romantic
        ? const Color(0xFFE91E63)
        : const Color(0xFF2196F3);
  }
}

/// Individual character input slot with optional reference
class _CharacterInputSlot extends StatelessWidget {
  final CharacterSlotState slot;
  final int index;
  final bool isOptional;
  final bool isMe;
  final Color accentColor;
  final ValueChanged<bool> onShowReferenceChanged;
  final ValueChanged<ReferenceType> onReferenceTypeChanged;
  final ValueChanged<LimitMode> onLimitModeChanged;
  final VoidCallback onReferenceTextChanged;
  final VoidCallback onNextField;

  const _CharacterInputSlot({
    required this.slot,
    required this.index,
    required this.isOptional,
    required this.isMe,
    required this.accentColor,
    required this.onShowReferenceChanged,
    required this.onReferenceTypeChanged,
    required this.onLimitModeChanged,
    required this.onReferenceTextChanged,
    required this.onNextField,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: isOptional
                    ? LinearGradient(colors: [Colors.grey.shade400, Colors.grey.shade500])
                    : LinearGradient(colors: [accentColor, accentColor.withOpacity(0.8)]),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                children: [
                  Text(
                    'Character ${index + 1}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (isOptional) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Optional',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        // Character name input
        TextField(
          controller: slot.nameController,
          focusNode: slot.nameFocusNode,
          decoration: InputDecoration(
            hintText: isOptional
                ? 'Optional: Add another character...'
                : isMe
                    ? 'e.g., Ethan Hunt, James Bond, Odysseus...'
                    : 'e.g., Elizabeth Bennet, Aragorn, Hermione...',
            prefixIcon: Icon(
              isMe ? Icons.person_outline : Icons.person_pin,
              color: isOptional ? Colors.grey : accentColor,
            ),
          ),
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onNextField(),
        ),
        
        // Add reference link
        const SizedBox(height: 8),
        if (!slot.showReference)
          InkWell(
            onTap: () => onShowReferenceChanged(true),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 16, color: accentColor.withOpacity(0.7)),
                  const SizedBox(width: 4),
                  Text(
                    'Add reference (optional)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: accentColor.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          _buildReferenceSection(context),
      ],
    );
  }

  Widget _buildReferenceSection(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with close button
          Row(
            children: [
              Icon(Icons.movie_filter, size: 16, color: accentColor),
              const SizedBox(width: 8),
              Text(
                'Reference',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: accentColor,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => onShowReferenceChanged(false),
                child: Icon(Icons.close, size: 18, color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Reference text input
          TextField(
            controller: slot.referenceController,
            decoration: InputDecoration(
              hintText: 'e.g., "Yes Man", "Saat Khoon Maaf", "Scene: the breakup"',
              hintStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withOpacity(0.6),
              ),
              filled: true,
              fillColor: theme.colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              isDense: true,
            ),
            style: theme.textTheme.bodyMedium,
            onChanged: (_) => onReferenceTextChanged(),
          ),
          const SizedBox(height: 12),
          
          // Reference type chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTypeChip(context, ReferenceType.movie, 'Movie'),
              _buildTypeChip(context, ReferenceType.tv, 'TV'),
              _buildTypeChip(context, ReferenceType.book, 'Book'),
              _buildTypeChip(context, ReferenceType.other, 'Other'),
            ],
          ),
          
          // Limit mode toggle (only show if reference has text)
          if (slot.referenceController.text.isNotEmpty) ...[
            const SizedBox(height: 12),
            _buildLimitModeToggle(context),
          ],
        ],
      ),
    );
  }

  Widget _buildTypeChip(BuildContext context, ReferenceType type, String label) {
    final theme = Theme.of(context);
    final isSelected = slot.referenceType == type;
    
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onReferenceTypeChanged(type),
      selectedColor: accentColor.withOpacity(0.2),
      checkmarkColor: accentColor,
      labelStyle: theme.textTheme.labelSmall?.copyWith(
        color: isSelected ? accentColor : theme.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? accentColor : theme.colorScheme.outline.withOpacity(0.3),
      ),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildLimitModeToggle(BuildContext context) {
    final theme = Theme.of(context);
    final isStrict = slot.limitMode == LimitMode.strict;
    
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isStrict ? Colors.orange.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isStrict ? Colors.orange.withOpacity(0.3) : theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            isStrict ? Icons.lock : Icons.lock_open,
            size: 18,
            color: isStrict ? Colors.orange.shade700 : theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Limit recognition to my reference',
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  isStrict
                      ? 'Only match within your reference'
                      : 'Reference used as hint (recommended)',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: isStrict,
            onChanged: (value) => onLimitModeChanged(value ? LimitMode.strict : LimitMode.assistive),
            activeColor: Colors.orange.shade700,
          ),
        ],
      ),
    );
  }
}
