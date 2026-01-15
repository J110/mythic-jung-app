import 'package:flutter/material.dart';

class AppTheme {
  // Mythical, mindful color palette
  static const Color _primaryPurple = Color(0xFF7C3AED); // Deep mystical purple
  static const Color _primaryIndigo = Color(0xFF4F46E5); // Mystical indigo
  static const Color _accentGold = Color(0xFFD97706); // Golden accent for sacred elements
  static const Color _accentTeal = Color(0xFF14B8A6); // Mindful teal
  static const Color _surfaceLight = Color(0xFFFAF5FF); // Very light purple tint

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: _primaryPurple,
        secondary: _accentTeal,
        tertiary: _accentGold,
        surface: _surfaceLight,
        error: const Color(0xFFDC2626),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: const Color(0xFF1F2937),
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFF1F2937),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1F2937),
          letterSpacing: 0.5,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: _primaryPurple,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      typography: Typography.material2021(),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          height: 1.2,
          color: Color(0xFF1F2937),
        ),
        displayMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.3,
          color: Color(0xFF1F2937),
        ),
        displaySmall: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.25,
          height: 1.3,
          color: Color(0xFF1F2937),
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.4,
          color: Color(0xFF1F2937),
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.4,
          color: Color(0xFF1F2937),
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.5,
          color: Color(0xFF1F2937),
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.5,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.6,
          letterSpacing: 0.15,
          color: Color(0xFF374151),
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.6,
          letterSpacing: 0.15,
          color: Color(0xFF374151),
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.5,
          letterSpacing: 0.4,
          color: Color(0xFF6B7280),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryPurple, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryPurple,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryPurple,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _primaryPurple,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: _primaryPurple,
        secondary: _accentTeal,
        tertiary: _accentGold,
        surface: const Color(0xFF2D1B3D),
        error: const Color(0xFFEF4444),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.grey.shade100,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Colors.grey.shade800,
            width: 1,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color(0xFF2D1B3D),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade100,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade100,
          letterSpacing: 0.5,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF2D1B3D),
        selectedItemColor: _primaryPurple,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      typography: Typography.material2021(),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          height: 1.2,
          color: Colors.grey.shade100,
        ),
        displayMedium: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.3,
          color: Colors.grey.shade100,
        ),
        displaySmall: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.25,
          height: 1.3,
          color: Colors.grey.shade100,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.4,
          color: Colors.grey.shade100,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.4,
          color: Colors.grey.shade100,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.5,
          color: Colors.grey.shade100,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          height: 1.5,
          color: Colors.grey.shade200,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.6,
          letterSpacing: 0.15,
          color: Colors.grey.shade300,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.6,
          letterSpacing: 0.15,
          color: Colors.grey.shade300,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.5,
          letterSpacing: 0.4,
          color: Colors.grey.shade400,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _primaryPurple, width: 2),
        ),
        filled: true,
        // IMPORTANT: Lighter than card background (0xFF2D1B3D) for text visibility
        fillColor: const Color(0xFF3D2B4D),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryPurple,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryPurple,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _primaryPurple,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  // Mythical gradient helpers
  static LinearGradient get primaryGradient => LinearGradient(
        colors: [_primaryPurple, _primaryIndigo],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static LinearGradient get mysticalGradient => LinearGradient(
        colors: [_primaryPurple, _accentTeal],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static BoxDecoration get cardDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1,
        ),
      );

  // ============================================================================
  // THEME-SAFE COLOR HELPERS
  // Use these to ensure visibility in both light and dark themes
  // ============================================================================

  /// Get text color for input fields - ALWAYS visible against input background
  static Color inputTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade100 : const Color(0xFF1F2937);
  }

  /// Get background color for input fields - slightly different from card background
  static Color inputFillColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Dark: lighter than card (0xFF2D1B3D), Light: lighter than white
    return isDark ? const Color(0xFF3D2B4D) : Colors.grey.shade50;
  }

  /// Get placeholder/hint text color
  static Color hintTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade500 : Colors.grey.shade500;
  }

  /// Get icon color that works on current surface background
  static Color iconOnSurface(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade300 : Colors.grey.shade700;
  }

  /// Get accent icon color (for action buttons, examples icon, etc.)
  static Color accentIconColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Lighter purple for dark theme, standard purple for light
    return isDark ? const Color(0xFFA78BFA) : _primaryPurple;
  }

  /// Get chip/badge text color with good contrast
  static Color chipTextColor(BuildContext context, {Color? chipBackground}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Darker for light theme, lighter for dark theme
    return isDark ? const Color(0xFFD8B4FE) : const Color(0xFF5B21B6);
  }

  /// Get chip/badge background color
  static Color chipBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark 
        ? _primaryPurple.withOpacity(0.25) 
        : _primaryPurple.withOpacity(0.12);
  }

  /// Get border color for containers, cards, inputs
  static Color borderColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade700 : Colors.grey.shade300;
  }

  /// Get secondary/muted text color
  static Color secondaryTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade400 : Colors.grey.shade600;
  }

  /// Get card background color
  static Color cardBackground(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFF2D1B3D) : Colors.white;
  }

  /// Get page/scaffold background color
  static Color pageBackground(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFF1E1B2E) : _surfaceLight;
  }

  /// Check if current theme is dark
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // ============================================================================
  // SEMANTIC COLORS (for specific use cases)
  // ============================================================================

  /// Success color (green) - for checkmarks, success states
  static Color successColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFF34D399) : const Color(0xFF10B981);
  }

  /// Warning color (orange/amber) - for warnings, cautions
  static Color warningColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706);
  }

  /// Error color (red) - for errors, destructive actions
  static Color errorColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626);
  }

  /// Info color (blue) - for info, hints
  static Color infoColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB);
  }
}
