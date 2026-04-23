import 'dart:convert';
import 'dart:math';

import 'package:boilerplate/core/config/environment_config.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class GoogleSignInPayload {
  final String code;
  final String codeVerifier;
  final String redirectUri;

  const GoogleSignInPayload({
    required this.code,
    required this.codeVerifier,
    required this.redirectUri,
  });
}

class GoogleSignInService {
  final EnvironmentConfig _config;

  GoogleSignInService(this._config);

  Future<GoogleSignInPayload> signInAndGetCode() async {
    if (_config.googleServerClientId.isEmpty ||
        _config.googleRedirectUri.isEmpty) {
      throw Exception(
        'Google login is not configured. Please set GOOGLE_SERVER_CLIENT_ID and GOOGLE_REDIRECT_URI in .env.dev',
      );
    }

    final String clientId = _config.googleServerClientId;
    final String redirectUri = _config.googleRedirectUri;

    // Extract scheme from redirect URI
    final Uri parsedRedirectUri = Uri.parse(redirectUri);
    final String customScheme = parsedRedirectUri.scheme;

    // Generate PKCE code verifier and challenge
    final codeVerifier = _generateCodeVerifier();
    final codeChallenge = _generateCodeChallenge(codeVerifier);

    // Construct the Google OAuth 2.0 authorization URL
    final authorizationUrl = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'response_type': 'code',
      'scope': 'openid email profile',
      'code_challenge': codeChallenge,
      'code_challenge_method': 'S256',
      'prompt': 'select_account',
    });

    try {
      // Open the browser and authenticate using flutter_web_auth_2
      final result = await FlutterWebAuth2.authenticate(
        url: authorizationUrl.toString(),
        callbackUrlScheme: customScheme,
      );

      // Parse the result URL to get the authorization code
      final resultUri = Uri.parse(result);
      final code = resultUri.queryParameters['code'];

      if (code == null || code.isEmpty) {
        throw Exception('Authorization code not found in the redirect URI.');
      }

      return GoogleSignInPayload(
        code: code,
        codeVerifier: codeVerifier,
        redirectUri: redirectUri,
      );
    } catch (e) {
      if (e.toString().contains('CANCELED')) {
        throw Exception('Google sign-in was cancelled');
      }
      throw Exception('Failed to authenticate with Google: $e');
    }
  }

  String _generateCodeVerifier() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
    final random = Random.secure();
    return List<String>.generate(
      128,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }

  String _generateCodeChallenge(String verifier) {
    final bytes = utf8.encode(verifier);
    final digest = sha256.convert(bytes);
    return base64UrlEncode(digest.bytes).replaceAll('=', '');
  }
}
