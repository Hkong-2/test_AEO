import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';

class LoginGoogleParams {
  final String code;
  final String codeVerifier;
  final String redirectUri;

  const LoginGoogleParams({
    required this.code,
    required this.codeVerifier,
    required this.redirectUri,
  });
}

class LoginGoogleUseCase implements UseCase<User?, LoginGoogleParams> {
  final UserRepository _userRepository;

  LoginGoogleUseCase(this._userRepository);

  @override
  Future<User?> call({required LoginGoogleParams params}) async {
    return _userRepository.loginWithGoogle(params);
  }
}
