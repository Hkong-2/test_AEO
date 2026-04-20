/// Environment configuration loaded from .env files.
/// Provides API URLs, feature flags, and service DSNs.
enum Environment { dev, staging, prod }

class EnvironmentConfig {
  final Environment environment;
  final String apiBaseUrl;
  final String aiApiBaseUrl;
  final String sentryDsn;
  final bool analyticsEnabled;
  final String googleClientId;
  final String googleRedirectUri;

  const EnvironmentConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.aiApiBaseUrl,
    this.sentryDsn = '',
    this.analyticsEnabled = false,
    this.googleClientId = '',
    this.googleRedirectUri = '',
  });

  /// Default dev config used when .env is not available
  factory EnvironmentConfig.defaultDev() {
    return const EnvironmentConfig(
      environment: Environment.dev,
      apiBaseUrl: 'http://jsonplaceholder.typicode.com',
      aiApiBaseUrl: 'http://localhost:8080',
      sentryDsn: '',
      analyticsEnabled: false,
      googleClientId: '195844443608-oj82c11fvpfiekkigjjgdofeuv6nsjs2.apps.googleusercontent.com',
      googleRedirectUri: 'com.boilerplate.aeo://oauth2redirect',
    );
  }

  bool get isSentryEnabled => sentryDsn.isNotEmpty;
  bool get isProduction => environment == Environment.prod;
}
