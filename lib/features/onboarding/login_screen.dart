import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/storage/repositories.dart';
import '../../app/theme/app_theme.dart';

/// Login screen with Silent Moon-inspired design
/// Clean, calm, emotionally reassuring aesthetic
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> 
    with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _checkedSession = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkExistingSession();
    });
  }

  void _checkExistingSession() {
    if (_checkedSession) return;
    _checkedSession = true;
    
    final sessionState = ref.read(userSessionProvider);
    if (sessionState.isLoggedIn) {
      if (sessionState.hasExistingData) {
        context.go('/home');
      } else {
        context.go('/welcome');
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await ref.read(userSessionProvider.notifier).login(
        _usernameController.text.trim(),
      );

      if (!mounted) return;
      setState(() => _isLoading = false);

      if (success) {
        final sessionState = ref.read(userSessionProvider);
        
        if (sessionState.hasExistingData) {
          context.go('/home');
        } else {
          context.go('/welcome');
        }
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(userSessionProvider);
    final theme = Theme.of(context);

    // Auto-redirect if session becomes active
    if (sessionState.isLoggedIn && !_isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          if (sessionState.hasExistingData) {
            context.go('/home');
          } else {
            context.go('/welcome');
          }
        }
      });
    }

    // Loading state while checking session
    if (sessionState.isLoading && !sessionState.isLoggedIn) {
      return Scaffold(
        backgroundColor: AppTheme.surfacePrimary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.primarySoft.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.psychology_rounded,
                  size: 40,
                  color: AppTheme.primarySoft,
                ),
              ),
              const SizedBox(height: AppTheme.spacingL),
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppTheme.primarySoft,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.surfacePrimary,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingL),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    
                    // Logo with soft background
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppTheme.primarySoft.withOpacity(0.2),
                            AppTheme.primarySoft.withOpacity(0.1),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.psychology_rounded,
                        size: 50,
                        color: AppTheme.primarySoft,
                      ),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingXXL),
                    
                    // Welcome text
                    Text(
                      'Welcome to Bliss',
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: const Color(0xFF1A1A1A),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: AppTheme.spacingS),
                    
                    Text(
                      'Discover your inner archetypes through\nthe characters you love',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: AppTheme.spacingXXL),
                    
                    // Username input - FIXED TEXT COLOR
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: TextFormField(
                        controller: _usernameController,
                        enabled: !_isLoading,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _handleLogin(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: const Color(0xFF1A1A1A),  // Explicit dark text color
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: AppTheme.surfaceSecondary,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 16, right: 12),
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          suffixIcon: _usernameController.text.length >= 2
                              ? const Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    color: AppTheme.success,
                                  ),
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                            borderSide: const BorderSide(color: AppTheme.primarySoft, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a username';
                          }
                          if (value.trim().length < 2) {
                            return 'Username must be at least 2 characters';
                          }
                          return null;
                        },
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingM),
                    
                    // Info text
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Text(
                        'Your name will be used to save your journey.\nUse the same name to continue where you left off.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppTheme.textTertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingXL),
                    
                    // Error message
                    if (sessionState.error != null) ...[
                      Container(
                        constraints: const BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.all(AppTheme.spacingM),
                        decoration: BoxDecoration(
                          color: AppTheme.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info_outline_rounded,
                              color: AppTheme.error,
                              size: 20,
                            ),
                            const SizedBox(width: AppTheme.spacingS),
                            Expanded(
                              child: Text(
                                sessionState.error!,
                                style: const TextStyle(
                                  color: AppTheme.error,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingM),
                    ],
                    
                    // Continue button - pill shape
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primarySoft,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppTheme.radiusPill),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : const Text(
                                'GET STARTED',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.0,
                                ),
                              ),
                      ),
                    ),
                    
                    const SizedBox(height: AppTheme.spacingXXL),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
