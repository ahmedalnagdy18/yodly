import 'package:yodly/features/domain/entites/login_entity.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});

  Future<void> call(LoginEntity loginEntity) async {
    return await repository.loginWithEmailAndPassword(loginEntity);
  }
}
