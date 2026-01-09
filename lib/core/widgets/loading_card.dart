import 'package:flutter/material.dart';

/// A skeleton loading card that shows while content is being generated
class LoadingCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color accentColor;
  final bool isLoaded;
  final Widget? child;
  final int animationDelay;

  const LoadingCard({
    super.key,
    required this.title,
    required this.icon,
    required this.accentColor,
    this.isLoaded = false,
    this.child,
    this.animationDelay = 0,
  });

  @override
  State<LoadingCard> createState() => _LoadingCardState();
}

class _LoadingCardState extends State<LoadingCard> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    
    if (widget.isLoaded) {
      Future.delayed(Duration(milliseconds: widget.animationDelay), () {
        if (mounted) setState(() => _showContent = true);
      });
    }
  }

  @override
  void didUpdateWidget(LoadingCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoaded && !oldWidget.isLoaded) {
      Future.delayed(Duration(milliseconds: widget.animationDelay), () {
        if (mounted) setState(() => _showContent = true);
      });
    }
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: _showContent ? 4 : 1,
        color: _showContent 
            ? (isDark ? theme.cardColor : Colors.white)
            : (isDark ? Colors.grey.shade900 : Colors.grey.shade200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: _showContent 
                ? widget.accentColor.withOpacity(0.3)
                : Colors.grey.withOpacity(0.2),
            width: _showContent ? 2 : 1,
          ),
        ),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _showContent 
              ? CrossFadeState.showSecond 
              : CrossFadeState.showFirst,
          firstChild: _buildSkeleton(theme, isDark),
          secondChild: widget.child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildSkeleton(ThemeData theme, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.grey.shade500,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.grey.shade400),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Skeleton lines
          _buildShimmerLine(width: double.infinity, height: 12),
          const SizedBox(height: 8),
          _buildShimmerLine(width: double.infinity, height: 12),
          const SizedBox(height: 8),
          _buildShimmerLine(width: 200, height: 12),
        ],
      ),
    );
  }

  Widget _buildShimmerLine({required double width, required double height}) {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: [
                _shimmerController.value - 0.3,
                _shimmerController.value,
                _shimmerController.value + 0.3,
              ].map((e) => e.clamp(0.0, 1.0)).toList(),
            ),
          ),
        );
      },
    );
  }
}

/// Shows a loading state with all sections visible but inactive
class ProgressiveLoadingView extends StatelessWidget {
  final List<SectionConfig> sections;
  final bool isLoading;
  final Widget? loadedContent;

  const ProgressiveLoadingView({
    super.key,
    required this.sections,
    required this.isLoading,
    this.loadedContent,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading && loadedContent != null) {
      return loadedContent!;
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sections.length,
      itemBuilder: (context, index) {
        final section = sections[index];
        return LoadingCard(
          title: section.title,
          icon: section.icon,
          accentColor: section.accentColor,
          isLoaded: false,
        );
      },
    );
  }
}

class SectionConfig {
  final String title;
  final IconData icon;
  final Color accentColor;

  const SectionConfig({
    required this.title,
    required this.icon,
    required this.accentColor,
  });
}
