import 'dart:math';

import 'package:boilerplate/core/config/environment_config.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

    final googleSignIn = GoogleSignIn(
      scopes: const <String>['openid', 'email', 'profile'],
      serverClientId: _config.googleServerClientId,
    );

    final account = await googleSignIn.signIn();
    if (account == null) {
      throw Exception('Google sign-in was cancelled');
    }

    final code = account.serverAuthCode;
    if (code == null || code.isEmpty) {
      throw Exception(
        'Unable to retrieve Google authorization code. Check Google OAuth client configuration.',
      );
    }

    return GoogleSignInPayload(
      code: code,
      codeVerifier: _generateCodeVerifier(),
      redirectUri: _config.googleRedirectUri,
    );
  }

  String _generateCodeVerifier() {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
    final random = Random.secure();
    return List<String>.generate(
      64,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }
}
