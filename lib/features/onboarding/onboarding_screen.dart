import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/tone.dart';
import '../../core/storage/repositories.dart';
import '../shared/redesign/welcome_illustrations.dart';

/// Merged onboarding screen with:
/// - Page 1: Welcome with tone selection
/// - Page 2: Login/username entry
/// 
/// User swipes right from welcome to login
class OnboardingScreen extends ConsumerStatefulWidget {
  /// If true, shows the welcome page first (for tone selection)
  /// If false, goes directly to login
  final bool showWelcome;

  const OnboardingScreen({super.key, this.showWelcome = true});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _pageController;
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _checkedSession = false;
  int _currentPage = 0;
  NarrativeTone _selectedTone = NarrativeTone.modern;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.showWelcome ? 0 : 1);
    _currentPage = widget.showWelcome ? 0 : 1;
    
    // Load current tone preference
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadTonePreference();
      _checkExistingSession();
    });
  }

  void _loadTonePreference() {
    final toneState = ref.read(toneRepositoryProvider);
    setState(() {
      _selectedTone = toneState.currentTone;
    });
  }

  void _checkExistingSession() {
    if (_checkedSession) return;
    _checkedSession = true;
    
    final sessionState = ref.read(userSessionProvider);
    if (sessionState.isLoggedIn) {
      if (sessionState.hasExistingData) {
        context.go('/home');
      }
      // If logged in but no data, stay on onboarding
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // First, set the selected tone
    await ref.read(toneRepositoryProvider.notifier).setTone(_selectedTone);

    // Then login
    final success = await ref.read(userSessionProvider.notifier).login(
      _usernameController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (success && mounted) {
      final sessionState = ref.read(userSessionProvider);
      
      if (sessionState.hasExistingData) {
        context.go('/home');
      } else {
        context.go('/characters');
      }
    }
  }

  void _goToLogin() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _goToWelcome() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(userSessionProvider);

    // Auto-redirect if session becomes active
    if (sessionState.isLoggedIn && !_isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && sessionState.hasExistingData) {
          context.go('/home');
        }
      });
    }

    // Loading state while checking session
    if (sessionState.isLoading && !sessionState.isLoggedIn) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: WelcomeScenePainter(isDark: true),
                size: Size.infinite,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Checking session...',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() => _currentPage = page);
        },
        children: [
          _buildWelcomePage(context),
          _buildLoginPage(context, sessionState),
        ],
      ),
    );
  }

  Widget _buildWelcomePage(BuildContext context) {
    final theme = Theme.of(context);
    
    return Stack(
      children: [
        // === FULL-SCREEN ILLUSTRATED BACKGROUND ===
        Positioned.fill(
          child: CustomPaint(
            painter: WelcomeScenePainter(isDark: true),
            size: Size.infinite,
          ),
        ),
        
        // === CONTENT OVERLAY ===
        SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              
              // === TITLE SECTION ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    // Main title
                    Text(
                      'Welcome to Bliss',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                        shadows: [
                          Shadow(
                            offset: const Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Subtitle
                    Text(
                      'Discover your inner mythology through\ncharacter-based Jungian exploration.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withOpacity(0.85),
                        height: 1.6,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            offset: const Offset(1, 1),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const Spacer(flex: 2),
              
              // === TONE SELECTION ===
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      'Choose your narrative style',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            offset: const Offset(1, 1),
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildToneSelector(theme),
                  ],
                ),
              ),
              
              const Spacer(flex: 3),
              
              // === BOTTOM SECTION ===
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: Column(
                  children: [
                    // Mindful reminder (subtle)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.self_improvement,
                            color: Colors.white.withOpacity(0.7),
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'A reflective journey, not a clinical assessment',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // GET STARTED BUTTON
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _goToLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C8CFF).withOpacity(0.85),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'GET STARTED',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 20),
                          ],
                        ),
                      ),
                    ),
                    
                    // Page indicator
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPageDot(0),
                        const SizedBox(width: 8),
                        _buildPageDot(1),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToneSelector(ThemeData theme) {
    return Column(
      children: NarrativeTone.values.map((tone) {
        final isSelected = tone == _selectedTone;
        return GestureDetector(
          onTap: () => setState(() => _selectedTone = tone),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected 
                  ? Colors.white.withOpacity(0.2)
                  : Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected 
                    ? const Color(0xFF7C8CFF)
                    : Colors.white.withOpacity(0.15),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? const Color(0xFF7C8CFF).withOpacity(0.3)
                        : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getToneIcon(tone),
                    color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tone.label,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        tone.shortDescription,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                // Check mark
                if (isSelected)
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7C8CFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 18),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  IconData _getToneIcon(NarrativeTone tone) {
    switch (tone) {
      case NarrativeTone.minimal:
        return Icons.format_list_bulleted;
      case NarrativeTone.modern:
        return Icons.auto_stories;
      case NarrativeTone.mythical:
        return Icons.auto_awesome;
    }
  }

  Widget _buildLoginPage(BuildContext context, dynamic sessionState) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        // === FULL-SCREEN ILLUSTRATED BACKGROUND ===
        Positioned.fill(
          child: CustomPaint(
            painter: LoginScenePainter(isDark: true),
            size: Size.infinite,
          ),
        ),
        
        // === BACK BUTTON ===
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 8,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: _goToWelcome,
          ),
        ),
        
        // === CONTENT ===
        SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    
                    // === TITLE ===
                    Text(
                      'Begin Your Journey',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                        shadows: [
                          Shadow(
                            offset: const Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Selected tone badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7C8CFF).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF7C8CFF).withOpacity(0.5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(_getToneIcon(_selectedTone), size: 16, color: Colors.white),
                          const SizedBox(width: 6),
                          Text(
                            '${_selectedTone.label} narrative',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 140), // Space for the owl illustration
                    
                    // === USERNAME INPUT ===
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: TextFormField(
                        controller: _usernameController,
                        enabled: !_isLoading,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _handleLogin(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Choose a username',
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                          ),
                          hintText: 'Enter your name or nickname',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color(0xFF7C8CFF),
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.red, width: 2),
                          ),
                          errorStyle: const TextStyle(color: Colors.redAccent),
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
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Info text
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Text(
                        'Your username saves your journey.\nUse the same name to continue later.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.5),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Error message
                    if (sessionState.error != null) ...[
                      Container(
                        constraints: const BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red.withOpacity(0.4)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline, color: Colors.redAccent, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                sessionState.error!,
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    // === CONTINUE BUTTON ===
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7C8CFF).withOpacity(0.85),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                          disabledBackgroundColor: const Color(0xFF7C8CFF).withOpacity(0.4),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Text(
                                'CONTINUE',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                ),
                              ),
                      ),
                    ),
                    
                    // Page indicator
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPageDot(0),
                        const SizedBox(width: 8),
                        _buildPageDot(1),
                      ],
                    ),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageDot(int index) {
    final isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive 
            ? const Color(0xFF7C8CFF) 
            : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
