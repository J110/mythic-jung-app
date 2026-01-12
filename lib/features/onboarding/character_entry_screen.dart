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

class CharacterEntryScreen extends ConsumerStatefulWidget {
  const CharacterEntryScreen({super.key});

  @override
  ConsumerState<CharacterEntryScreen> createState() =>
      _CharacterEntryScreenState();
}

class _CharacterEntryScreenState
    extends ConsumerState<CharacterEntryScreen> {
  // "My Characters" controllers (4 required + 2 optional)
  final List<TextEditingController> _meControllers = List.generate(
    AppConstants.maxCharacterCount,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _meFocusNodes = List.generate(
    AppConstants.maxCharacterCount,
    (_) => FocusNode(),
  );
  
  // "Their Characters" controllers (4 required + 2 optional)
  final List<TextEditingController> _otherControllers = List.generate(
    AppConstants.maxRelationshipCharacterCount,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _otherFocusNodes = List.generate(
    AppConstants.maxRelationshipCharacterCount,
    (_) => FocusNode(),
  );
  
  // Relationship state
  bool _relationshipEnabled = false;
  RelationshipType _relationshipType = RelationshipType.platonic;

  @override
  void dispose() {
    for (final controller in _meControllers) {
      controller.dispose();
    }
    for (final node in _meFocusNodes) {
      node.dispose();
    }
    for (final controller in _otherControllers) {
      controller.dispose();
    }
    for (final node in _otherFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  List<Character> _extractCharacters(List<TextEditingController> controllers) {
    return controllers
        .map((c) => c.text.trim())
        .where((text) => text.isNotEmpty)
        .map((text) => Character(
              id: const Uuid().v4(),
              displayName: text,
            ))
        .toList();
  }

  void _generate() async {
    final meCharacters = _extractCharacters(_meControllers);
    
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
      otherCharacters = _extractCharacters(_otherControllers);
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
        context.go('/home');
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
                  controllers: _meControllers,
                  focusNodes: _meFocusNodes,
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
                    controllers: _otherControllers,
                    focusNodes: _otherFocusNodes,
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
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
    required int minRequired,
    required int maxCount,
    required bool isMe,
  }) {
    final theme = Theme.of(context);
    final accentColor = isMe ? theme.colorScheme.primary : _getRelationshipColor();
    
    return List.generate(maxCount, (index) {
      final isOptional = index >= minRequired;
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
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
              textInputAction: index < maxCount - 1
                  ? TextInputAction.next
                  : TextInputAction.done,
              onSubmitted: (value) {
                if (index < maxCount - 1) {
                  focusNodes[index + 1].requestFocus();
                }
              },
            ),
          ],
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
