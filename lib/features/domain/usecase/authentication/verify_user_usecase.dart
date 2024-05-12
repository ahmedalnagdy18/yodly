import 'package:yodly/features/domain/entites/authentication/verify_user_entity.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';

class VerifyUserUsecase {
  final VerifyUserRepository repository;

  VerifyUserUsecase({required this.repository});

  Future<void> call(VerifyUserEntity verifyUserEntity) async {
    return await repository.verifyUserByEmail(verifyUserEntity);
  }
}
