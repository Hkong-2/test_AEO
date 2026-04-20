import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';

class AuthApi {
  final DioClient _dioClient;

  AuthApi(this._dioClient);

  Future<String> login(
      {required String email, required String password}) async {
    final response = await _dioClient.dio.post(
      Endpoints.login,
      data: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    final responseData = response.data as Map<String, dynamic>?;
    final accessToken = responseData?['accessToken'];

    if (accessToken is! String || accessToken.isEmpty) {
      throw Exception('Missing accessToken in login response');
    }

    return accessToken;
  }

  Future<bool> signup({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final response = await _dioClient.dio.post(
      Endpoints.signup,
      data: <String, dynamic>{
        'fullName': fullName,
        'email': email,
        'password': password,
      },
    );

    final responseData = response.data as Map<String, dynamic>?;
    final success = responseData?['success'];

    return success == true;
  }
}
