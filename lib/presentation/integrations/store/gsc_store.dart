import 'package:mobx/mobx.dart';
import 'package:pkce/pkce.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../data/network/dio_client.dart';
import '../../../data/network/constants/endpoints.dart';
import '../../../core/stores/error/error_store.dart';

part 'gsc_store.g.dart';

class GscStore = _GscStore with _$GscStore;

abstract class _GscStore with Store {
  final DioClient _dioClient;
  final ErrorStore errorStore;

  _GscStore(this._dioClient, this.errorStore);

  @observable
  bool isConnected = false;

  @observable
  bool isLoading = false;

  @observable
  String? accessToken;

  // Cấu hình
  final String _redirectUri = "https://app.aeo.how/api/gsc/callback";
  // The custom scheme configured in AndroidManifest for fallback handling
  final String _callbackUrlScheme = "https";

  @action
  Future<void> connectGoogle(String projectId) async {
    try {
      isLoading = true;
      errorStore.errorMessage = "";

      // 1. Khởi tạo PKCE
      final pkcePair = PkcePair.generate(length: 128);
      final codeVerifier = pkcePair.codeVerifier;
      final codeChallenge = pkcePair.codeChallenge;

      final clientId = dotenv.env['GOOGLE_CLIENT_ID'] ?? '';
      if (clientId.isEmpty) {
        throw Exception("GOOGLE_CLIENT_ID is missing in .env file");
      }

      // 2. Tạo URL đăng nhập
      final url = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
        'client_id': clientId,
        'redirect_uri': _redirectUri,
        'response_type': 'code',
        'scope': 'https://www.googleapis.com/auth/webmasters.readonly',
        'code_challenge': codeChallenge,
        'code_challenge_method': 'S256',
        'access_type': 'offline',
        'prompt': 'consent',
      });

      // 3. Mở trình duyệt và lấy kết quả
      final result = await FlutterWebAuth2.authenticate(
        url: url.toString(),
        callbackUrlScheme: _callbackUrlScheme,
      );

      final code = Uri.parse(result).queryParameters['code'];
      if (code == null) {
        throw Exception("No code returned from Google Auth");
      }

      // 4. Gửi code lên Backend để đổi token
      final response = await _dioClient.post(
        Endpoints.gscConnect,
        data: {
          "projectId": projectId,
          "code": code,
          "codeVerifier": codeVerifier,
          "redirectUri": _redirectUri,
        },
      );

      // Backend returns {"success": true}
      if (response != null && response['success'] == true) {
        isConnected = true;
        // In a real scenario we might get access_token from backend, or backend manages it
        // The requirement just said to update isConnected = true and optionally store token if returned
      } else {
        throw Exception("Failed to connect GSC on backend");
      }

    } catch (e) {
      errorStore.errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> checkStatus(String projectId) async {
    try {
      isLoading = true;
      final response = await _dioClient.get(Endpoints.gscStatus(projectId));

      if (response != null && response['connected'] == true) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } catch (e) {
      errorStore.errorMessage = e.toString();
      isConnected = false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> disconnectGoogle(String projectId) async {
    try {
      isLoading = true;
      final response = await _dioClient.delete(Endpoints.gscDisconnect(projectId));

      if (response != null && response['success'] == true) {
        isConnected = false;
      } else {
        throw Exception("Failed to disconnect GSC on backend");
      }
    } catch (e) {
      errorStore.errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
