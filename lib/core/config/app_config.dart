/// App configuration for different environments
/// 
/// Build commands:
/// - Development (mock): flutter run
/// - Development (backend): flutter run --dart-define=USE_MOCK=false
/// - Production Android: flutter build apk --release --dart-define=API_BASE_URL=https://api.yourapp.com --dart-define=USE_MOCK=false
/// - Production iOS: flutter build ios --release --dart-define=API_BASE_URL=https://api.yourapp.com --dart-define=USE_MOCK=false
class AppConfig {
  /// The base URL for the API
  /// Override with --dart-define=API_BASE_URL=https://your-api.com
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:3001',
  );

  /// Whether to use mock data (for development without backend)
  /// Override with --dart-define=USE_MOCK=false
  static const bool useMock = bool.fromEnvironment(
    'USE_MOCK',
    defaultValue: false,
  );

  /// App name
  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Bliss+',
  );

  /// App version (can be overridden for display purposes)
  static const String appVersion = String.fromEnvironment(
    'APP_VERSION',
    defaultValue: '1.0.0',
  );

  /// Whether this is a production build
  static const bool isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );

  /// Enable analytics (production only)
  static const bool enableAnalytics = bool.fromEnvironment(
    'ENABLE_ANALYTICS',
    defaultValue: false,
  );

  /// Sentry DSN for error tracking (production only)
  static const String? sentryDsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  ) == '' ? null : String.fromEnvironment('SENTRY_DSN');

  /// Request timeout in seconds
  static const int requestTimeout = int.fromEnvironment(
    'REQUEST_TIMEOUT',
    defaultValue: 60,
  );

  /// AI generation timeout in seconds (longer for complex requests)
  static const int aiGenerationTimeout = int.fromEnvironment(
    'AI_GENERATION_TIMEOUT',
    defaultValue: 360, // 6 minutes
  );

  /// Debug logging enabled
  static bool get debugLogging => !isProduction;

  /// Print current configuration (for debugging)
  static void printConfig() {
    print('=== App Configuration ===');
    print('API Base URL: $apiBaseUrl');
    print('Use Mock: $useMock');
    print('App Name: $appName');
    print('App Version: $appVersion');
    print('Is Production: $isProduction');
    print('Enable Analytics: $enableAnalytics');
    print('Sentry DSN: ${sentryDsn != null ? 'Configured' : 'Not configured'}');
    print('Request Timeout: ${requestTimeout}s');
    print('AI Generation Timeout: ${aiGenerationTimeout}s');
    print('=========================');
  }
}

/// Environment types
enum Environment {
  development,
  staging,
  production,
}

/// Environment configuration helper
class EnvironmentConfig {
  static Environment get current {
    if (AppConfig.isProduction) {
      return Environment.production;
    }
    if (AppConfig.apiBaseUrl.contains('staging')) {
      return Environment.staging;
    }
    return Environment.development;
  }

  static bool get isDevelopment => current == Environment.development;
  static bool get isStaging => current == Environment.staging;
  static bool get isProduction => current == Environment.production;
}
