import 'dart:async';

import 'package:boilerplate/data/network/apis/auth/auth_api.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/dio.dart';

import '../../../domain/entity/user/user.dart';
import '../../../domain/usecase/user/login_google_usecase.dart';
import '../../../domain/usecase/user/login_usecase.dart';
import '../../../domain/usecase/user/sign_up_usecase.dart';

class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final AuthApi _authApi;

  // constructor
  UserRepositoryImpl(this._sharedPrefsHelper, this._authApi);

  // Login:---------------------------------------------------------------------
  @override
  Future<User?> login(LoginParams params) async {
    try {
      final accessToken = await _authApi.login(
        email: params.username,
        password: params.password,
      );

      await _sharedPrefsHelper.saveAuthToken(accessToken);
      return User(accessToken: accessToken);
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode;

      if (statusCode == 400) {
        throw Exception('Invalid input data');
      }

      if (statusCode == 401) {
        throw Exception('Invalid credentials');
      }

      throw Exception('Login failed. Please try again.');
    }
  }

  @override
  Future<User?> loginWithGoogle(LoginGoogleParams params) async {
    try {
      final accessToken = await _authApi.loginGoogle(
        code: params.code,
        codeVerifier: params.codeVerifier,
        redirectUri: params.redirectUri,
      );

      await _sharedPrefsHelper.saveAuthToken(accessToken);
      return User(accessToken: accessToken);
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode;

      if (statusCode == 400) {
        throw Exception('Invalid input data or missing required fields');
      }

      if (statusCode == 401) {
        throw Exception(
            'Invalid Google authorization code or PKCE verification failed');
      }

      if (statusCode == 409) {
        throw Exception('Email already registered with standard login');
      }

      throw Exception('Google login failed. Please try again.');
    }
  }

  @override
  Future<bool> signUp(SignUpParams params) async {
    try {
      return await _authApi.signup(
        fullName: params.fullName,
        email: params.email,
        password: params.password,
      );
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode;

      if (statusCode == 400) {
        throw Exception('Invalid input data');
      }

      if (statusCode == 409) {
        throw Exception('User with this email already exists');
      }

      throw Exception('Sign up failed. Please try again.');
    }
  }

  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
}
