import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class PkceUtils {
  /// Generates a random code verifier.
  static String generateCodeVerifier({int length = 64}) {
    final random = Random.secure();
    final chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~';
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  /// Generates a code challenge from a code verifier using S256.
  static String generateCodeChallenge(String verifier) {
    final bytes = utf8.encode(verifier);
    final digest = sha256.convert(bytes);
    return base64UrlEncode(digest.bytes).replaceAll('=', '');
  }
}
