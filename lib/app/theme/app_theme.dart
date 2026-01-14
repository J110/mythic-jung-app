import 'package:flutter/material.dart';

/// Silent Moon-inspired design system for Bliss app
/// Based on calm, gentle, emotionally reassuring aesthetic
/// 
/// To revert to the previous theme, rename app_theme_legacy.dart to app_theme.dart

class AppTheme {
  // ============================================================================
  // COLOR TOKENS - Silent Moon Palette
  // ============================================================================
  
  // Brand Colors
  static const Color primarySoft = Color(0xFF8E97FD);      // Calming lavender for actions
  static const Color primaryStrong = Color(0xFF03174C);    // Deep navy for immersive screens
  static const Color primaryMuted = Color(0xFFA1A4B2);     // Muted purple for secondary elements
  
  // Surface Colors - Light Mode
  static const Color surfacePrimary = Color(0xFFFAFAFA);   // Main background
  static const Color surfaceSecondary = Color(0xFFF2F3F7); // Cards, inputs
  static const Color surfaceElevated = Color(0xFFFFFFFF);  // Elevated cards
  
  // Surface Colors - Dark Mode (Sleep/Immersive)
  static const Color surfaceDark = Color(0xFF03174C);      // Deep navy background
  static const Color surfaceDarkElevated = Color(0xFF1F265E); // Elevated dark surface
  static const Color surfaceDarkCard = Color(0xFF2E3A59);  // Card on dark
  
  // Text Colors
  static const Color textPrimary = Color(0xFF3F414E);      // High emphasis
  static const Color textSecondary = Color(0xFFA1A4B2);    // Supporting content
  static const Color textTertiary = Color(0xFFCDCED4);     // Hints, metadata
  static const Color textInverse = Color(0xFFFFFFFF);      // Text on dark
  static const Color textInverseSecondary = Color(0xFFE6E7F2); // Secondary on dark
  
  // Functional Colors
  static const Color success = Color(0xFF4CAF50);          // Validation green
  static const Color error = Color(0xFFEB5757);            // Error red
  static const Color warning = Color(0xFFF2994A);          // Warning orange
  
  // Accent Colors (for cards, illustrations)
  static const Color accentPeach = Color(0xFFFFC97E);      // Warm peach
  static const Color accentMint = Color(0xFFAFDBC5);       // Calm mint
  static const Color accentSky = Color(0xFF67B5F7);        // Soft sky blue

  // ============================================================================
  // SPACING & SIZING
  // ============================================================================
  
  static const double spacingXS = 4;
  static const double spacingS = 8;
  static const double spacingM = 16;
  static const double spacingL = 24;
  static const double spacingXL = 32;
  static const double spacingXXL = 48;
  
  static const double radiusSmall = 8;
  static const double radiusMedium = 16;
  static const double radiusLarge = 24;
  static const double radiusPill = 50;

  // ============================================================================
  // LIGHT THEME
  // ============================================================================
  
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primarySoft,
        onPrimary: textInverse,
        secondary: accentPeach,
        onSecondary: textPrimary,
        tertiary: accentMint,
        surface: surfacePrimary,
        onSurface: textPrimary,
        surfaceContainerHighest: surfaceSecondary,
        error: error,
        onError: textInverse,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: surfacePrimary,
      
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
        ),
        color: surfaceElevated,
        margin: const EdgeInsets.symmetric(horizontal: spacingM, vertical: spacingS),
        clipBehavior: Clip.antiAlias,
      ),
      
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: textPrimary,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: 0.5,
        ),
      ),
      
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surfaceElevated,
        selectedItemColor: primarySoft,
        unselectedItemColor: textSecondary,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, letterSpacing: -0.5, height: 1.3, color: textPrimary),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.25, height: 1.35, color: textPrimary),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0, height: 1.4, color: textPrimary),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.4, color: textPrimary),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.45, color: textPrimary),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.5, color: textPrimary),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.5, color: textPrimary),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.1, height: 1.5, color: textPrimary),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, height: 1.5, color: textPrimary),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.65, letterSpacing: 0.15, color: textPrimary),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, letterSpacing: 0.15, color: textPrimary),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0.25, color: textSecondary),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.0, color: textPrimary),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: textSecondary),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.4, color: textTertiary),
      ),
      
      // INPUT DECORATION - Fixed text visibility
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceSecondary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: const BorderSide(color: primarySoft, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: const BorderSide(color: error, width: 1)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: const BorderSide(color: error, width: 2)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: const TextStyle(color: textSecondary, fontSize: 16, fontWeight: FontWeight.w400),
        labelStyle: const TextStyle(color: textSecondary, fontSize: 16),
        prefixIconColor: textSecondary,
        suffixIconColor: success,
        // IMPORTANT: This ensures input text is visible
        floatingLabelStyle: const TextStyle(color: primarySoft),
        errorStyle: const TextStyle(color: error),
      ),
      
      // TextField text style - ensures typed text is visible
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primarySoft,
        selectionColor: Color(0x408E97FD),
        selectionHandleColor: primarySoft,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primarySoft,
          foregroundColor: textInverse,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: spacingXL, vertical: 18),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusPill)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.0),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          side: const BorderSide(color: surfaceSecondary, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: spacingXL, vertical: 18),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusPill)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.0),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: textSecondary,
          padding: const EdgeInsets.symmetric(horizontal: spacingM, vertical: spacingS),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),
      
      chipTheme: ChipThemeData(
        backgroundColor: surfaceSecondary,
        selectedColor: primarySoft,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textPrimary),
        secondaryLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textInverse),
        padding: const EdgeInsets.symmetric(horizontal: spacingM, vertical: spacingS),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusPill)),
      ),
      
      dialogTheme: DialogThemeData(
        backgroundColor: surfaceElevated,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusLarge)),
        titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textPrimary),
      ),
      
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surfaceElevated,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusLarge),
            topRight: Radius.circular(radiusLarge),
          ),
        ),
      ),
      
      dividerTheme: const DividerThemeData(color: surfaceSecondary, thickness: 1, space: spacingL),
      iconTheme: const IconThemeData(color: textSecondary, size: 24),
      
      tabBarTheme: TabBarThemeData(
        labelColor: primarySoft,
        unselectedLabelColor: textSecondary,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        indicator: UnderlineTabIndicator(
          borderSide: const BorderSide(color: primarySoft, width: 2),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: primarySoft, linearTrackColor: surfaceSecondary),
    );
  }

  // ============================================================================
  // DARK THEME (Sleep/Immersive Mode)
  // ============================================================================
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: primarySoft,
        onPrimary: textInverse,
        secondary: accentPeach,
        onSecondary: textPrimary,
        tertiary: accentMint,
        surface: surfaceDark,
        onSurface: textInverse,
        surfaceContainerHighest: surfaceDarkElevated,
        error: error,
        onError: textInverse,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: surfaceDark,
      
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusMedium)),
        color: surfaceDarkCard,
        margin: const EdgeInsets.symmetric(horizontal: spacingM, vertical: spacingS),
        clipBehavior: Clip.antiAlias,
      ),
      
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: textInverse,
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textInverse, letterSpacing: 0.5),
      ),
      
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceDark,
        selectedItemColor: primarySoft,
        unselectedItemColor: textInverseSecondary,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, letterSpacing: -0.5, height: 1.3, color: textInverse),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.25, height: 1.35, color: textInverse),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0, height: 1.4, color: textInverse),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.4, color: textInverse),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.45, color: textInverse),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.5, color: textInverse),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.15, height: 1.5, color: textInverse),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.1, height: 1.5, color: textInverse),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, height: 1.5, color: textInverseSecondary),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.65, letterSpacing: 0.15, color: textInverseSecondary),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.6, letterSpacing: 0.15, color: textInverseSecondary),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0.25, color: textTertiary),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.0, color: textInverse),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5, color: textInverseSecondary),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.4, color: textTertiary),
      ),
      
      // INPUT DECORATION - Dark theme with visible text
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDarkElevated,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radiusMedium), borderSide: const BorderSide(color: primarySoft, width: 2)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: const TextStyle(color: textTertiary, fontSize: 16, fontWeight: FontWeight.w400),
        labelStyle: const TextStyle(color: textInverseSecondary, fontSize: 16),
      ),
      
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primarySoft,
        selectionColor: Color(0x408E97FD),
        selectionHandleColor: primarySoft,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primarySoft,
          foregroundColor: textInverse,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: spacingXL, vertical: 18),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusPill)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.0),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textInverse,
          backgroundColor: surfaceDarkElevated.withOpacity(0.5),
          side: BorderSide.none,
          padding: const EdgeInsets.symmetric(horizontal: spacingXL, vertical: 18),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusPill)),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: textInverseSecondary)),
      
      chipTheme: ChipThemeData(
        backgroundColor: surfaceDarkElevated,
        selectedColor: primarySoft,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textInverse),
        padding: const EdgeInsets.symmetric(horizontal: spacingM, vertical: spacingS),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusPill)),
      ),
      
      dialogTheme: DialogThemeData(
        backgroundColor: surfaceDarkElevated,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusLarge)),
      ),
      
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surfaceDarkElevated,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(radiusLarge), topRight: Radius.circular(radiusLarge)),
        ),
      ),
      
      dividerTheme: const DividerThemeData(color: surfaceDarkCard, thickness: 1, space: spacingL),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: primarySoft, linearTrackColor: surfaceDarkElevated),
    );
  }

  // ============================================================================
  // HELPER DECORATIONS
  // ============================================================================
  
  static BoxDecoration get wavyBackground => const BoxDecoration(color: surfacePrimary);
  
  static BoxDecoration get immersiveBackground => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF1F265E), surfaceDark],
    ),
  );
  
  static BoxDecoration contentCardDecoration(Color backgroundColor) => BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(radiusMedium),
  );
  
  static BoxDecoration get featuredCardDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(radiusMedium),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [primarySoft.withOpacity(0.9), primarySoft],
    ),
  );
  
  static BoxDecoration get circularIconButton => const BoxDecoration(color: surfaceElevated, shape: BoxShape.circle);
  static BoxDecoration get dayChipSelected => const BoxDecoration(color: textPrimary, shape: BoxShape.circle);
  static BoxDecoration get dayChipUnselected => BoxDecoration(
    color: Colors.transparent,
    shape: BoxShape.circle,
    border: Border.all(color: textTertiary, width: 1),
  );

  // ============================================================================
  // LEGACY COMPATIBILITY - Gradients used by existing screens
  // ============================================================================
  
  static LinearGradient get primaryGradient => const LinearGradient(
    colors: [primarySoft, Color(0xFF7B8FF7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static LinearGradient get mysticalGradient => LinearGradient(
    colors: [primarySoft, accentMint],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // ============================================================================
  // INPUT TEXT STYLE HELPER - Use this for TextField/TextFormField style
  // ============================================================================
  
  /// Use this style property for TextFormField/TextField to ensure text is visible
  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );
  
  static const TextStyle inputTextStyleDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textInverse,
  );
}
