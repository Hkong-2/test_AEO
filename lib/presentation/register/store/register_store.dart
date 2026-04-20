import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/domain/usecase/user/sign_up_usecase.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  // constructor:---------------------------------------------------------------
  _RegisterStore(
    this._signUpUseCase,
    this.formErrorStore,
    this.errorStore,
  ) {
    // setting up disposers
    _setupDisposers();
  }

  // stores:--------------------------------------------------------------------
  final SignUpUseCase _signUpUseCase;

  // for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<bool> emptyRegisterResponse =
      ObservableFuture.value(false);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  bool agreedToTerms = false;

  @observable
  ObservableFuture<bool> registerFuture = emptyRegisterResponse;

  @computed
  bool get isLoading => registerFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future<void> register(
      String email, String password, String confirmPassword) async {
    final trimmedFullName = fullName.trim();
    final trimmedEmail = email.trim();

    if (trimmedFullName.isEmpty) {
      errorStore.setErrorMessage('Please enter your full name');
      return;
    }

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      errorStore.setErrorMessage('All fields are required');
      return;
    }

    if (password != confirmPassword) {
      errorStore.setErrorMessage('Passwords do not match');
      return;
    }

    if (password.length < 6) {
      errorStore.setErrorMessage('Password must be at least 6 characters');
      return;
    }

    final future = _signUpUseCase.call(
      params: SignUpParams(
        fullName: trimmedFullName,
        email: trimmedEmail,
        password: password,
      ),
    );

    registerFuture = ObservableFuture(future);

    await future.then((value) {
      if (value) {
        success = true;
        errorStore.setErrorMessage('');
      } else {
        errorStore.setErrorMessage('Sign up failed. Please try again.');
      }
    }).catchError((error) {
      errorStore
          .setErrorMessage(error.toString().replaceFirst('Exception: ', ''));
    });
  }

  String fullName = '';

  @action
  void setFullName(String value) {
    fullName = value;
  }

  @action
  void setAgreedToTerms(bool value) {
    agreedToTerms = value;
  }

  @action
  void clearError() {
    errorStore.setErrorMessage('');
  }

  // dispose:-------------------------------------------------------------------
  void dispose() {
    for (final disposer in _disposers) {
      disposer();
    }
  }
}
