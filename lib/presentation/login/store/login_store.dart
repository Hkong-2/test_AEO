import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entity/user/user.dart';
import '../../../domain/usecase/user/login_usecase.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // use cases
  final IsLoggedInUseCase _isLoggedInUseCase;
  final SaveLoginStatusUseCase _saveLoginStatusUseCase;
  final LoginUseCase _loginUseCase;

  // stores
  final FormErrorStore formErrorStore;
  final ErrorStore errorStore;

  // constructor
  _LoginStore(
    IsLoggedInUseCase isLoggedInUseCase,
    SaveLoginStatusUseCase saveLoginStatusUseCase,
    LoginUseCase loginUseCase,
    FormErrorStore formErrorStore,
    ErrorStore errorStore,
  )   : _isLoggedInUseCase = isLoggedInUseCase,
        _saveLoginStatusUseCase = saveLoginStatusUseCase,
        _loginUseCase = loginUseCase,
        formErrorStore = formErrorStore,
        errorStore = errorStore {
    // checking if user is logged in
    _isLoggedInUseCase.call(params: null).then((value) async {
      isLoggedIn = value;
    });
  }

  // observable variables
  @observable
  bool isLoggedIn = false;

  @observable
  bool success = false;

  @observable
  bool isLoading = false;

  @observable
  User? loginResult;

  // actions
  @action
  Future<void> login(String email, String password) async {
    isLoading = true;
    try {
      final LoginParams loginParams =
          LoginParams(username: email, password: password);
      final result = await _loginUseCase.call(params: loginParams);
      
      if (result != null) {
        await _saveLoginStatusUseCase.call(params: true);
        isLoggedIn = true;
        success = true;
        loginResult = result;
      }
    } catch (e) {
      print(e);
      isLoggedIn = false;
      success = false;
    } finally {
      isLoading = false;
    }
  }

  // logout action
  @action
  Future<void> logout() async {
    isLoggedIn = false;
    success = false;
    loginResult = null;
    await _saveLoginStatusUseCase.call(params: false);
  }

  // cleanup
  void dispose() {
    // No-op for now
  }
}
