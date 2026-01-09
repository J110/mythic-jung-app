import 'package:flutter/material.dart';

class OutputCard extends StatelessWidget {
  final String title;
  final String preview;
  final VoidCallback? onTap;
  final VoidCallback? onShowExamples;
  final Widget? trailing;
  final IconData? icon;
  final Color? accentColor;

  const OutputCard({
    super.key,
    required this.title,
    required this.preview,
    this.onTap,
    this.onShowExamples,
    this.trailing,
    this.icon,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardColor = accentColor ?? theme.colorScheme.primary;
    
    // Determine if the card color is too dark for text
    final isDarkCard = cardColor.computeLuminance() < 0.3;
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isDark 
              ? Colors.grey.shade800 
              : Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      theme.colorScheme.surface,
                      theme.colorScheme.surface.withOpacity(0.7),
                    ]
                  : [
                      Colors.white,
                      theme.colorScheme.surface.withOpacity(0.5),
                    ],
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: cardColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        size: 24,
                        color: cardColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
              const SizedBox(height: 12),
              Text(
                preview,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              if (onShowExamples != null) ...[
                const SizedBox(height: 16),
                InkWell(
                  onTap: onShowExamples,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkCard
                        ? Colors.white.withOpacity(0.15)
                        : isDark 
                          ? cardColor.withOpacity(0.2)
                          : cardColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isDarkCard
                          ? Colors.white.withOpacity(0.3)
                          : isDark
                            ? cardColor.withOpacity(0.5)
                            : cardColor.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.movie_outlined,
                          size: 16,
                          color: isDarkCard
                            ? Colors.white.withOpacity(0.9)
                            : isDark 
                              ? Colors.grey.shade300
                              : cardColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Examples',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: isDarkCard
                              ? Colors.white.withOpacity(0.9)
                              : isDark
                                ? Colors.grey.shade300
                                : cardColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
