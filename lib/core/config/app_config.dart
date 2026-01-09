/// App configuration for different environments
class AppConfig {
  /// The base URL for the API
  /// In production, this should point to your Render deployment
  /// For local development, use http://127.0.0.1:3000
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:3000',
  );

  /// Whether to use mock data (for development without backend)
  static const bool useMock = bool.fromEnvironment(
    'USE_MOCK',
    defaultValue: false,
  );
}
