import '../../../core/domain/usecase/use_case.dart';
import '../../repository/user/user_repository.dart';

class SignUpParams {
  final String fullName;
  final String email;
  final String password;

  const SignUpParams({
    required this.fullName,
    required this.email,
    required this.password,
  });
}

class SignUpUseCase implements UseCase<bool, SignUpParams> {
  final UserRepository _userRepository;

  SignUpUseCase(this._userRepository);

  @override
  Future<bool> call({required SignUpParams params}) async {
    return _userRepository.signUp(params);
  }
}
