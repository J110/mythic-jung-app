# Theme Visibility Guide

## Overview
This document ensures all text, icons, and UI elements are clearly visible in **BOTH** light and dark themes.

---

## 🚨 Known Issues (From Previous Redesign)

| Issue | Where | Cause |
|-------|-------|-------|
| User input text invisible | Text fields | Text color same as background |
| Example icons not visible | Light theme | White/light icons on light background |
| Chip text hard to read | Various | Low contrast accent colors |

---

## 🎨 Color Definitions

### Light Theme Colors
| Element | Background | Text/Icon | Contrast Ratio |
|---------|-----------|-----------|----------------|
| Page background | `#FAF5FF` (light purple) | `#1F2937` (dark gray) | ✅ 10:1 |
| Card background | `#FFFFFF` (white) | `#374151` (gray) | ✅ 8:1 |
| Input field | `#F9FAFB` (gray-50) | `#1F2937` (dark gray) | ✅ 9:1 |
| Input placeholder | `#F9FAFB` (gray-50) | `#9CA3AF` (gray-400) | ✅ 3:1 |
| Primary button | `#7C3AED` (purple) | `#FFFFFF` (white) | ✅ 7:1 |
| Icon on light bg | - | `#374151` or `#7C3AED` | ✅ |

### Dark Theme Colors
| Element | Background | Text/Icon | Contrast Ratio |
|---------|-----------|-----------|----------------|
| Page background | `#1E1B2E` (dark purple) | `#F3F4F6` (gray-100) | ✅ 12:1 |
| Card background | `#2D1B3D` (purple-dark) | `#E5E7EB` (gray-200) | ✅ 9:1 |
| Input field | `#3D2B4D` (lighter than card) | `#F3F4F6` (gray-100) | ✅ 8:1 |
| Input placeholder | `#3D2B4D` | `#9CA3AF` (gray-400) | ✅ 3:1 |
| Primary button | `#7C3AED` (purple) | `#FFFFFF` (white) | ✅ 7:1 |
| Icon on dark bg | - | `#E5E7EB` or `#A78BFA` | ✅ |

---

## ✅ Visibility Rules

### Rule 1: Input Text MUST be different from background
```dart
// ❌ WRONG - Text color not specified, might default to background color
TextField(
  decoration: InputDecoration(
    fillColor: Color(0xFF2D1B3D),
  ),
)

// ✅ CORRECT - Explicitly set text style
TextField(
  style: TextStyle(
    color: isDark ? Colors.grey.shade100 : Color(0xFF1F2937),
  ),
  decoration: InputDecoration(
    fillColor: isDark ? Color(0xFF3D2B4D) : Colors.grey.shade50,
  ),
)
```

### Rule 2: Icons MUST have theme-aware colors
```dart
// ❌ WRONG - Fixed white color, invisible in light theme
Icon(Icons.movie, color: Colors.white)

// ✅ CORRECT - Theme-aware color
Icon(
  Icons.movie, 
  color: isDark ? Colors.white : Colors.grey.shade700,
)

// ✅ BETTER - Use theme color scheme
Icon(
  Icons.movie,
  color: theme.colorScheme.onSurface,
)
```

### Rule 3: Chips MUST have visible text
```dart
// ❌ WRONG - Light purple text on light background
Container(
  color: Color(0xFF7C3AED).withOpacity(0.1),
  child: Text('Label', style: TextStyle(color: Color(0xFF7C3AED))),
)

// ✅ CORRECT - Darker text for light theme
Container(
  color: Color(0xFF7C3AED).withOpacity(0.15),
  child: Text(
    'Label', 
    style: TextStyle(
      color: isDark ? Color(0xFFA78BFA) : Color(0xFF5B21B6), // Lighter for dark, darker for light
      fontWeight: FontWeight.w600,
    ),
  ),
)
```

### Rule 4: Borders MUST be visible
```dart
// ❌ WRONG - Border same as background
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey.shade200), // Invisible in light theme
  ),
)

// ✅ CORRECT - Theme-aware borders
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
    ),
  ),
)
```

---

## 📋 Component Checklist

### Text Inputs
- [ ] Character name input - text visible
- [ ] Reference hint input - text visible
- [ ] Positive resonance input - text visible
- [ ] Negative resonance input - text visible
- [ ] Search inputs - text visible

### Icons
- [ ] Example button icon (movie icon) - visible in both themes
- [ ] Tab bar icons - visible
- [ ] Card action icons - visible
- [ ] Navigation icons - visible
- [ ] Info tooltip icons - visible

### Cards
- [ ] OutputCard - text readable
- [ ] Character chips - text readable
- [ ] Phase chips - text readable
- [ ] Badge/tag chips - text readable

### Buttons
- [ ] Primary buttons - text visible
- [ ] Secondary buttons - text visible
- [ ] Icon buttons - icon visible
- [ ] Text buttons - text visible

### Special Elements
- [ ] Loading spinners - visible
- [ ] Error messages - visible
- [ ] Success messages - visible
- [ ] Progress bars - visible
- [ ] Dividers - visible

---

## 🛠️ Implementation: Theme-Safe Colors

Add these helper methods to `app_theme.dart`:

```dart
class AppTheme {
  // ... existing code ...

  /// Get text color for input fields
  static Color inputTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade100 : const Color(0xFF1F2937);
  }

  /// Get background color for input fields (slightly different from card)
  static Color inputFillColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFF3D2B4D) : Colors.grey.shade50;
  }

  /// Get icon color that works on current background
  static Color iconColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade300 : Colors.grey.shade700;
  }

  /// Get accent icon color (for action icons)
  static Color accentIconColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFFA78BFA) : const Color(0xFF7C3AED);
  }

  /// Get chip text color that has good contrast
  static Color chipTextColor(BuildContext context, Color chipBackground) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // For purple chips
    if (chipBackground == const Color(0xFF7C3AED).withOpacity(0.15)) {
      return isDark ? const Color(0xFFA78BFA) : const Color(0xFF5B21B6);
    }
    // Default
    return isDark ? Colors.grey.shade200 : Colors.grey.shade800;
  }

  /// Get border color for containers
  static Color borderColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade700 : Colors.grey.shade300;
  }

  /// Get secondary text color (for hints, labels)
  static Color secondaryTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.grey.shade400 : Colors.grey.shade600;
  }
}
```

---

## 🧪 Testing Protocol

### Before ANY UI Change:

1. **Light Theme Test**
   - Set device to light mode
   - Check ALL text inputs have visible text
   - Check ALL icons are visible
   - Check ALL chips are readable
   - Screenshot each screen

2. **Dark Theme Test**
   - Set device to dark mode
   - Repeat all checks above
   - Screenshot each screen

3. **Comparison**
   - Compare light and dark screenshots
   - Ensure consistent visibility in both

### Quick Test Script (Manual)
```
□ Open app in LIGHT mode
  □ Enter text in character input - CAN I SEE IT?
  □ Tap example button - CAN I SEE THE ICON?
  □ Check all tabs - CAN I READ ALL TEXT?

□ Switch to DARK mode
  □ Enter text in character input - CAN I SEE IT?
  □ Tap example button - CAN I SEE THE ICON?
  □ Check all tabs - CAN I READ ALL TEXT?
```

---

## 🎯 Minimum Contrast Ratios (WCAG AA)

| Element Type | Minimum Ratio | Our Target |
|-------------|---------------|------------|
| Normal text | 4.5:1 | 7:1+ |
| Large text | 3:1 | 5:1+ |
| UI components (icons, borders) | 3:1 | 4:1+ |
| Placeholder text | 3:1 | 3.5:1+ |

---

## 📁 Files to Audit Before Redesign

These files have custom colors that need checking:

1. `lib/features/onboarding/character_entry_screen.dart`
2. `lib/features/onboarding/clarification_screen.dart`
3. `lib/core/widgets/output_card.dart`
4. `lib/features/output_tabs/*/` (all tab files)
5. `lib/core/widgets/examples_sheet.dart`

---

## ✅ Sign-off Checklist

Before merging any UI changes:

- [ ] All text inputs tested in light theme
- [ ] All text inputs tested in dark theme
- [ ] All icons visible in light theme
- [ ] All icons visible in dark theme
- [ ] All chips readable in both themes
- [ ] No hardcoded white/black colors without theme check
- [ ] Screenshots taken and compared
- [ ] User tested on actual device
