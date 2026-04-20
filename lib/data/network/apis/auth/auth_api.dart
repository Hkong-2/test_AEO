import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:dio/dio.dart';

class AuthApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  AuthApi(this._dioClient);

  /// Returns the access token.
  Future<dynamic> login(String email, String password) async {
    try {
      final res = await _dioClient.dio.post(
        Endpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      return res.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw "Invalid input data";
      }
      if (e.response?.statusCode == 401) {
        throw "Invalid credentials";
      }
      print(e.toString());
      throw e;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Returns the response body containing the success message and user ID.
  Future<dynamic> signup(String fullName, String email, String password) async {
    try {
      final res = await _dioClient.dio.post(
        Endpoints.signup,
        data: {
          "fullName": fullName,
          "email": email,
          "password": password,
        },
      );
      return res.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw "A user with this email already exists";
      }
      print(e.toString());
      throw e;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
