import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../core/models/character.dart';
import '../../core/storage/repositories.dart';
import '../../core/utils/constants.dart';
import '../../app/theme/app_theme.dart';
import '../shared/redesign/character_entry_cards.dart';

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
  ConsumerState<CharacterEntryScreen> createState() => _CharacterEntryScreenState();
}

class _CharacterEntryScreenState extends ConsumerState<CharacterEntryScreen> {
  late final List<CharacterSlotState> _meSlots;
  late final List<CharacterSlotState> _otherSlots;
  
  bool _relationshipEnabled = false;
  RelationshipType _relationshipType = RelationshipType.platonic;
  
  // Track visible slots (start with minimum required)
  int _visibleMeSlots = 4;
  int _visibleOtherSlots = 4;

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
    
    if (meCharacters.length < AppConstants.minCharacterCount) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter at least ${AppConstants.minCharacterCount} characters')),
      );
      return;
    }
    
    List<Character>? otherCharacters;
    if (_relationshipEnabled) {
      otherCharacters = _extractCharacters(_otherSlots);
      if (otherCharacters.length < AppConstants.minRelationshipCharacterCount) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter at least ${AppConstants.minRelationshipCharacterCount} characters for your ${_relationshipType.displayName.toLowerCase()}')),
        );
        return;
      }
    }

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
                Text(_relationshipEnabled ? 'Creating your myths...' : 'Creating your myth...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      final meCharacterInputs = meCharacters.map((c) => c.displayName).toList();
      final otherCharacterInputs = otherCharacters?.map((c) => c.displayName).toList() ?? [];
      final allCharacterInputs = [...meCharacterInputs, ...otherCharacterInputs];
      
      final allSlots = [
        ...meCharacters.asMap().entries.map((e) => _buildSlotPayload('me_${e.key}', e.value)),
        ...?otherCharacters?.asMap().entries.map((e) => _buildSlotPayload('other_${e.key}', e.value)),
      ];
      
      final resonanceResponse = await ref
          .read(resonanceRepositoryProvider.notifier)
          .analyzeCharactersWithReferences(allCharacterInputs, allSlots);
      
      await ref.read(userProfileRepositoryProvider.notifier).saveCharacters(meCharacters);
      
      if (_relationshipEnabled && otherCharacters != null) {
        await ref.read(relationshipRepositoryProvider.notifier).saveRelationship(
          enabled: true,
          relationshipType: _relationshipType.apiValue,
          otherCharacters: otherCharacters,
        );
      } else {
        await ref.read(relationshipRepositoryProvider.notifier).disableRelationship();
      }
      
      if (context.mounted) {
        Navigator.of(context).pop();
        
        if (resonanceResponse.needsClarification) {
          context.push('/clarification', extra: {
            'response': resonanceResponse,
            'meCount': meCharacterInputs.length,
            'otherCount': otherCharacterInputs.length,
            'relationshipEnabled': _relationshipEnabled,
            'relationshipType': _relationshipType.apiValue,
          });
        } else {
          await ref.read(resonanceRepositoryProvider.notifier).skipClarification();
          context.go('/home');
        }
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

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
                    // === CASTING CIRCLE HEADER ===
                    SliverToBoxAdapter(child: _buildHeader(context, isDark)),
                    
                    // === MY CHARACTERS SECTION ===
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      sliver: SliverToBoxAdapter(
                        child: _buildSectionLabel(context, 'My Characters', 'Characters you identify with'),
                      ),
                    ),
                    
                    // Character cards grid
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85, // Square-ish cards like Story page
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _CharacterInputCard(
                            slot: _meSlots[index],
                            index: index,
                            theme: CharacterCardThemes.getTheme(index),
                            isDark: isDark,
                            onReferenceToggle: () => setState(() => _meSlots[index].showReference = !_meSlots[index].showReference),
                          ),
                          childCount: _visibleMeSlots,
                        ),
                      ),
                    ),
                    
                    // Add More button for Me
                    if (_visibleMeSlots < AppConstants.maxCharacterCount)
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        sliver: SliverToBoxAdapter(
                          child: _buildAddMoreButton(context, () {
                            setState(() => _visibleMeSlots = (_visibleMeSlots + 2).clamp(0, AppConstants.maxCharacterCount));
                          }),
                        ),
                      ),
                    
                    // === RELATIONSHIP TOGGLE ===
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                      sliver: SliverToBoxAdapter(child: _buildRelationshipToggle(context)),
                    ),
                    
                    // === PARTNER CHARACTERS (if enabled) ===
                    if (_relationshipEnabled) ...[
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        sliver: SliverToBoxAdapter(child: _buildRelationshipTypeSelector(context)),
                      ),
                      
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        sliver: SliverToBoxAdapter(
                          child: _buildSectionLabel(
                            context, 
                            'Their Characters', 
                            'Characters that remind you of them',
                            color: _getRelationshipColor(),
                          ),
                        ),
                      ),
                      
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverGrid(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.85, // Square-ish cards like Story page
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => _CharacterInputCard(
                              slot: _otherSlots[index],
                              index: index,
                              theme: CharacterCardThemes.getTheme(index),
                              isDark: isDark,
                              accentOverride: _getRelationshipColor(),
                              onReferenceToggle: () => setState(() => _otherSlots[index].showReference = !_otherSlots[index].showReference),
                            ),
                            childCount: _visibleOtherSlots,
                          ),
                        ),
                      ),
                      
                      if (_visibleOtherSlots < AppConstants.maxRelationshipCharacterCount)
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          sliver: SliverToBoxAdapter(
                            child: _buildAddMoreButton(context, () {
                              setState(() => _visibleOtherSlots = (_visibleOtherSlots + 2).clamp(0, AppConstants.maxRelationshipCharacterCount));
                            }, color: _getRelationshipColor()),
                          ),
                        ),
                      
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        sliver: SliverToBoxAdapter(child: _buildDisclaimerNote(context)),
                      ),
                    ],
                    
                    const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
                  ],
                ),
              ),
              
              // === BOTTOM BAR ===
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    final theme = Theme.of(context);
    
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CastingCircleHeaderPainter(isDark: isDark),
              size: Size.infinite,
            ),
          ),
          
          // Back button
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              ),
            ),
          ),
          
          // Title
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Text(
                  '✨ CASTING CIRCLE ✨',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: const Color(0xFFD4AF37),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Summon Your Characters',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(offset: const Offset(1, 1), blurRadius: 4, color: Colors.black.withOpacity(0.5))],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'The characters you resonate with reveal your inner mythology',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(BuildContext context, String title, String subtitle, {Color? color}) {
    final theme = Theme.of(context);
    final accentColor = color ?? theme.colorScheme.primary;
    
    return Row(
      children: [
        Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          ],
        ),
      ],
    );
  }

  Widget _buildAddMoreButton(BuildContext context, VoidCallback onTap, {Color? color}) {
    final theme = Theme.of(context);
    final accentColor = color ?? theme.colorScheme.primary;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: accentColor.withOpacity(0.4), width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, color: accentColor, size: 20),
            const SizedBox(width: 8),
            Text('Add More Characters', style: theme.textTheme.bodyMedium?.copyWith(color: accentColor, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildRelationshipToggle(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: _relationshipEnabled
            ? LinearGradient(colors: [_getRelationshipColor().withOpacity(isDark ? 0.2 : 0.1), _getRelationshipColor().withOpacity(isDark ? 0.1 : 0.05)])
            : null,
        color: _relationshipEnabled ? null : theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _relationshipEnabled ? _getRelationshipColor().withOpacity(0.4) : theme.colorScheme.outline.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(_relationshipEnabled ? Icons.favorite : Icons.favorite_border, color: _relationshipEnabled ? _getRelationshipColor() : Colors.grey, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add a Relationship', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                Text('Explore dynamics with a partner or friend', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
          Switch.adaptive(value: _relationshipEnabled, onChanged: (v) => setState(() => _relationshipEnabled = v), activeColor: _getRelationshipColor()),
        ],
      ),
    );
  }

  Widget _buildRelationshipTypeSelector(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: RelationshipType.values.map((type) {
        final isSelected = _relationshipType == type;
        final color = type == RelationshipType.romantic ? const Color(0xFFE91E63) : const Color(0xFF2196F3);
        
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: type == RelationshipType.romantic ? 6 : 0, left: type == RelationshipType.platonic ? 6 : 0),
            child: InkWell(
              onTap: () => setState(() => _relationshipType = type),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? color.withOpacity(0.15) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isSelected ? color : theme.colorScheme.outline.withOpacity(0.3), width: isSelected ? 2 : 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(type == RelationshipType.romantic ? Icons.favorite : Icons.people, color: isSelected ? color : Colors.grey, size: 18),
                    const SizedBox(width: 6),
                    Text(type.displayName, style: theme.textTheme.bodySmall?.copyWith(color: isSelected ? color : null, fontWeight: isSelected ? FontWeight.w600 : null)),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDisclaimerNote(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.amber.withOpacity(0.1), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.amber.withOpacity(0.3))),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber.shade700, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text('Based on your perception. Accuracy improves if they create their own profile.', style: theme.textTheme.bodySmall?.copyWith(color: Colors.amber.shade800))),
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: theme.colorScheme.primary.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 6))],
        ),
        child: ElevatedButton(
          onPressed: _generate,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(vertical: 18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome, color: Colors.white),
              const SizedBox(width: 10),
              Text(_relationshipEnabled ? 'Generate Our Myths' : 'Generate My Myth', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRelationshipColor() => _relationshipType == RelationshipType.romantic ? const Color(0xFFE91E63) : const Color(0xFF2196F3);
}

/// Individual character input card with themed illustration
class _CharacterInputCard extends StatefulWidget {
  final CharacterSlotState slot;
  final int index;
  final CharacterCardTheme theme;
  final bool isDark;
  final Color? accentOverride;
  final VoidCallback onReferenceToggle;

  const _CharacterInputCard({
    required this.slot,
    required this.index,
    required this.theme,
    required this.isDark,
    this.accentOverride,
    required this.onReferenceToggle,
  });

  @override
  State<_CharacterInputCard> createState() => _CharacterInputCardState();
}

class _CharacterInputCardState extends State<_CharacterInputCard> {
  bool _showReference = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final accentColor = widget.accentOverride ?? widget.theme.accentColor;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card with illustration - matches Story page design (no border)
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(widget.isDark ? 0.3 : 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Full-bleed illustration
                  CustomPaint(
                    painter: widget.theme.iconPainter(accentColor, widget.isDark),
                    size: Size.infinite,
                  ),
                  
                  // Gradient overlay at bottom for input area
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.85),
                          ],
                          stops: const [0.0, 0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                  
                  // Character number badge (top left)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                      ),
                      child: Center(
                        child: Text(
                          '${widget.index + 1}',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  
                  // Input section at bottom (inside the card)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Character name input
                        TextField(
                          controller: widget.slot.nameController,
                          focusNode: widget.slot.nameFocusNode,
                          style: themeData.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Character name',
                            hintStyle: themeData.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.15),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                          ),
                        ),
                        
                        // Reference toggle
                        if (!_showReference)
                          GestureDetector(
                            onTap: () => setState(() => _showReference = true),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add, size: 14, color: Colors.white.withOpacity(0.6)),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Add source',
                                    style: themeData.textTheme.labelSmall?.copyWith(
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        // Reference section (below card when expanded)
        if (_showReference) ...[
          const SizedBox(height: 8),
          // Reference input
          TextField(
            controller: widget.slot.referenceController,
            style: themeData.textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: 'Movie, show, book, or real person',
              hintStyle: themeData.textTheme.labelSmall?.copyWith(
                color: themeData.colorScheme.onSurfaceVariant.withOpacity(0.5),
              ),
              filled: true,
              fillColor: widget.isDark ? Colors.white.withOpacity(0.08) : themeData.colorScheme.surfaceContainerHighest.withOpacity(0.5),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              isDense: true,
            ),
          ),
          const SizedBox(height: 4),
          // Type chips row
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              _ReferenceTypeChip(
                label: 'Movie',
                icon: Icons.movie,
                isSelected: widget.slot.referenceType == ReferenceType.movie,
                accentColor: accentColor,
                onTap: () => setState(() => widget.slot.referenceType = ReferenceType.movie),
              ),
              _ReferenceTypeChip(
                label: 'TV',
                icon: Icons.tv,
                isSelected: widget.slot.referenceType == ReferenceType.tv,
                accentColor: accentColor,
                onTap: () => setState(() => widget.slot.referenceType = ReferenceType.tv),
              ),
              _ReferenceTypeChip(
                label: 'Real',
                icon: Icons.person,
                isSelected: widget.slot.referenceType == ReferenceType.realLife,
                accentColor: accentColor,
                onTap: () => setState(() => widget.slot.referenceType = ReferenceType.realLife),
              ),
              _LimitModeChip(
                label: widget.slot.limitMode == LimitMode.strict ? '🔒 Strict' : '🔓 Flex',
                isSelected: widget.slot.limitMode == LimitMode.strict,
                accentColor: accentColor,
                onTap: () => setState(() => widget.slot.limitMode = 
                  widget.slot.limitMode == LimitMode.strict ? LimitMode.assistive : LimitMode.strict),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

/// Small chip for reference type selection
class _ReferenceTypeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final Color accentColor;
  final VoidCallback onTap;

  const _ReferenceTypeChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? accentColor.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: isSelected ? accentColor : Colors.grey.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: isSelected ? accentColor : Colors.grey),
            const SizedBox(width: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? accentColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Small chip for limit mode selection
class _LimitModeChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color accentColor;
  final VoidCallback onTap;

  const _LimitModeChip({
    required this.label,
    required this.isSelected,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: isSelected ? accentColor.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: isSelected ? accentColor.withOpacity(0.5) : Colors.grey.withOpacity(0.3)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? accentColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
