class AppConstants {
  static const int minCharacterCount = 4;  // Minimum required
  static const int maxCharacterCount = 6;  // Maximum allowed (2 optional)
  static const int requiredCharacterCount = 4;  // For backward compatibility
  static const int assessmentModulesCount = 7;
  
  // Relationship constants
  static const int minRelationshipCharacterCount = 4;  // Minimum required for Other
  static const int maxRelationshipCharacterCount = 6;  // Maximum for Other
  
  // Assessment module types
  static const String libidinalCharge = 'LIBIDINAL_CHARGE';
  static const String egoPosition = 'EGO_POSITION';
  static const String personaFormation = 'PERSONA_FORMATION';
  static const String shadowProximity = 'SHADOW_PROXIMITY';
  static const String feelingFunction = 'FEELING_FUNCTION';
  static const String costCompensation = 'COST_COMPENSATION';
  static const String individuationDirection = 'INDIVIDUATION_DIRECTION';
  static const String shadowPosition = 'SHADOW_POSITION';
  static const String shadowVirtue = 'SHADOW_VIRTUE';
  static const String erosAxis = 'EROS_AXIS';
  static const String functioning = 'FUNCTIONING';
  
  // Relationship types
  static const String relationshipTypeRomantic = 'romantic';
  static const String relationshipTypePlatonic = 'platonic';
  
  // Debounce delay for regeneration (milliseconds)
  static const int regenerationDebounceMs = 1000;
}
