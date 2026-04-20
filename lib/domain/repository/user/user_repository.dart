import 'dart:async';

import 'package:boilerplate/domain/usecase/user/login_usecase.dart';

import '../../entity/user/user.dart';

abstract class UserRepository {
  Future<dynamic> login(LoginParams params);

  Future<dynamic> signup(String fullName, String email, String password);

  Future<void> saveIsLoggedIn(bool value);

  Future<bool> get isLoggedIn;

  Future<void> saveAuthToken(String authToken);
}
