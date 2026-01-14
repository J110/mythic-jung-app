import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'me/me_tab.dart';
import 'relationship/relationship_tab.dart';
import '../../features/assessment/assessment_tab.dart';
import '../../core/storage/repositories.dart';
import '../../app/theme/app_theme.dart';

/// Home screen with Silent Moon-inspired navigation
/// Clean bottom navigation with calm, gentle transitions
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  void _showUserMenu(BuildContext context) {
    final sessionState = ref.read(userSessionProvider);
    final user = sessionState.user;
    final theme = Theme.of(context);
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppTheme.surfaceElevated,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppTheme.radiusLarge),
            topRight: Radius.circular(AppTheme.radiusLarge),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.surfaceSecondary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // User info header
              Padding(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Row(
                  children: [
                    // Avatar with gradient background
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppTheme.primarySoft,
                            AppTheme.primarySoft.withOpacity(0.7),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          (user?.displayName ?? 'U').substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.displayName ?? 'User',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '@${user?.username ?? 'unknown'}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const Divider(height: 1, color: AppTheme.surfaceSecondary),
              
              // Re-enter characters option
              _MenuTile(
                icon: Icons.refresh_rounded,
                iconColor: AppTheme.primarySoft,
                title: 'Re-enter Characters',
                subtitle: 'Start fresh with new characters',
                onTap: () async {
                  Navigator.pop(context);
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => _ConfirmDialog(
                      title: 'Re-enter Characters?',
                      message: 'This will clear your current analysis and let you enter new characters.',
                      confirmText: 'Continue',
                    ),
                  );
                  if (confirm == true && mounted) {
                    await ref.read(userSessionProvider.notifier).clearDataAndStartFresh();
                    if (mounted) {
                      context.go('/characters');
                    }
                  }
                },
              ),
              
              // Switch user option
              _MenuTile(
                icon: Icons.logout_rounded,
                iconColor: AppTheme.error,
                title: 'Switch User',
                subtitle: 'Login with a different username',
                onTap: () async {
                  Navigator.pop(context);
                  await ref.read(userSessionProvider.notifier).logout();
                  if (mounted) {
                    context.go('/login');
                  }
                },
              ),
              
              const SizedBox(height: AppTheme.spacingM),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final relationshipAsync = ref.watch(relationshipRepositoryProvider);
    final isRelationshipEnabled = relationshipAsync.valueOrNull?.enabled ?? false;
    final sessionState = ref.watch(userSessionProvider);
    final theme = Theme.of(context);
    
    final tabs = <Widget>[
      const MeTab(),
      if (isRelationshipEnabled) const RelationshipTab(),
      const AssessmentTab(),
    ];
    
    // Ensure current index is valid
    if (_currentIndex >= tabs.length) {
      _currentIndex = 0;
    }
    
    final isWeb = MediaQuery.of(context).size.width > 600;

    // User avatar button - Silent Moon style
    Widget userButton = GestureDetector(
      onTap: () => _showUserMenu(context),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppTheme.primarySoft,
              AppTheme.primarySoft.withOpacity(0.8),
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            (sessionState.user?.displayName ?? 'U').substring(0, 1).toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    // Tab titles for greeting
    String getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) return 'Good Morning';
      if (hour < 17) return 'Good Afternoon';
      return 'Good Evening';
    }

    if (isWeb) {
      // Web layout with NavigationRail
      return Scaffold(
        backgroundColor: AppTheme.surfacePrimary,
        body: Row(
          children: [
            NavigationRail(
              backgroundColor: AppTheme.surfaceElevated,
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) {
                setState(() => _currentIndex = index);
              },
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingL),
                child: Column(
                  children: [
                    // App logo
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.primarySoft.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.psychology_rounded,
                        size: 28,
                        color: AppTheme.primarySoft,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingL),
                    userButton,
                  ],
                ),
              ),
              destinations: [
                const NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home_rounded),
                  label: Text('Me'),
                ),
                if (isRelationshipEnabled)
                  const NavigationRailDestination(
                    icon: Icon(Icons.favorite_outline_rounded),
                    selectedIcon: Icon(Icons.favorite_rounded),
                    label: Text('Relations'),
                  ),
                const NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore_rounded),
                  label: Text('Explore'),
                ),
              ],
            ),
            Container(width: 1, color: AppTheme.surfaceSecondary),
            Expanded(child: tabs[_currentIndex]),
          ],
        ),
      );
    }

    // Mobile layout with custom bottom navigation
    return Scaffold(
      backgroundColor: AppTheme.surfacePrimary,
      body: Column(
        children: [
          // Custom AppBar with greeting
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppTheme.spacingL, 
                AppTheme.spacingM, 
                AppTheme.spacingL, 
                AppTheme.spacingS,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${getGreeting()}, ${sessionState.user?.displayName ?? 'Friend'}',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _currentIndex == 0 
                              ? 'Explore your inner world'
                              : _currentIndex == 1 && isRelationshipEnabled
                                  ? 'Understanding together'
                                  : 'Deepen your journey',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  userButton,
                ],
              ),
            ),
          ),
          
          // Tab content
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: tabs[_currentIndex],
            ),
          ),
        ],
      ),
      
      // Silent Moon style bottom navigation
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceElevated,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingL,
              vertical: AppTheme.spacingS,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home_rounded,
                  label: 'Home',
                  isSelected: _currentIndex == 0,
                  onTap: () => setState(() => _currentIndex = 0),
                ),
                if (isRelationshipEnabled)
                  _NavItem(
                    icon: Icons.favorite_outline_rounded,
                    selectedIcon: Icons.favorite_rounded,
                    label: 'Relations',
                    isSelected: _currentIndex == 1,
                    onTap: () => setState(() => _currentIndex = 1),
                  ),
                _NavItem(
                  icon: Icons.explore_outlined,
                  selectedIcon: Icons.explore_rounded,
                  label: 'Explore',
                  isSelected: _currentIndex == (isRelationshipEnabled ? 2 : 1),
                  onTap: () => setState(() => _currentIndex = isRelationshipEnabled ? 2 : 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom navigation item - Silent Moon style
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingM,
          vertical: AppTheme.spacingS,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primarySoft.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppTheme.radiusPill),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              color: isSelected ? AppTheme.primarySoft : AppTheme.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppTheme.primarySoft : AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Menu tile for bottom sheet
class _MenuTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 13,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingL,
        vertical: AppTheme.spacingXS,
      ),
    );
  }
}

/// Confirmation dialog - Silent Moon style
class _ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;

  const _ConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 15,
          height: 1.5,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            confirmText,
            style: const TextStyle(
              color: AppTheme.primarySoft,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
