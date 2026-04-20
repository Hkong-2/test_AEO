import 'dart:async';

import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';

import '../../../domain/usecase/user/login_usecase.dart';
import '../../network/apis/auth/auth_api.dart';

class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final AuthApi _authApi;

  // constructor
  UserRepositoryImpl(this._sharedPrefsHelper, this._authApi);

  // Login:---------------------------------------------------------------------
  @override
  Future<dynamic> login(LoginParams params) async {
    final response = await _authApi.login(params.username, params.password);
    return response;
  }

  @override
  Future<dynamic> signup(String fullName, String email, String password) async {
    return await _authApi.signup(fullName, email, password);
  }

  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  @override
  Future<void> saveAuthToken(String authToken) =>
      _sharedPrefsHelper.saveAuthToken(authToken);
}
