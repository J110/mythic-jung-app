import 'package:flutter/material.dart';

/// Defines a section for loading state
class SectionDefinition {
  final String title;
  final IconData icon;
  final Color accentColor;

  const SectionDefinition({
    required this.title,
    required this.icon,
    required this.accentColor,
  });
}

/// Shows a progressive loading skeleton for output pages
class ProgressiveLoadingWidget extends StatefulWidget {
  final List<SectionDefinition> sections;

  const ProgressiveLoadingWidget({
    super.key,
    required this.sections,
  });

  @override
  State<ProgressiveLoadingWidget> createState() => _ProgressiveLoadingWidgetState();
}

class _ProgressiveLoadingWidgetState extends State<ProgressiveLoadingWidget> {
  final Set<int> _revealedSections = {};

  @override
  void initState() {
    super.initState();
    _startProgressiveReveal();
  }

  void _startProgressiveReveal() {
    for (int i = 0; i < widget.sections.length; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        if (mounted) setState(() => _revealedSections.add(i));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.sections.length,
      itemBuilder: (context, index) {
        final section = widget.sections[index];
        final isRevealed = _revealedSections.contains(index);

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: isRevealed ? 1.0 : 0.3,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: const EdgeInsets.only(bottom: 12),
            transform: Matrix4.translationValues(isRevealed ? 0 : 20, 0, 0),
            child: _buildSkeletonCard(section, isDark, theme),
          ),
        );
      },
    );
  }

  Widget _buildSkeletonCard(SectionDefinition section, bool isDark, ThemeData theme) {
    return Card(
      elevation: 1,
      color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: section.accentColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: section.accentColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    section.icon,
                    color: section.accentColor.withOpacity(0.5),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  section.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(section.accentColor.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Skeleton text lines
            Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 180,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Animates content cards when they appear
class AnimatedContentCard extends StatelessWidget {
  final int index;
  final Widget child;

  const AnimatedContentCard({
    super.key,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 80)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, animation, _) {
        return Opacity(
          opacity: animation,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - animation)),
            child: child,
          ),
        );
      },
    );
  }
}
