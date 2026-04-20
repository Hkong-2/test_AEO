import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class LoginGoogleUseCase implements UseCase<dynamic, LoginGoogleParams> {
  final UserRepository _userRepository;

  LoginGoogleUseCase(this._userRepository);

  @override
  Future<dynamic> call({required LoginGoogleParams params}) async {
    return _userRepository.loginGoogle(params);
  }
}

class LoginGoogleParams {
  final String code;
  final String codeVerifier;
  final String redirectUri;

  LoginGoogleParams({
    required this.code,
    required this.codeVerifier,
    required this.redirectUri,
  });
}
