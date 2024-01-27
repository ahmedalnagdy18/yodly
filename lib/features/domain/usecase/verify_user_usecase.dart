import 'package:yodly/features/domain/entites/verify_user_entity.dart';
import 'package:yodly/features/domain/repositories/verify_user_repository.dart';

class VerifyUserUsecase {
  final VerifyUserRepository repository;

  VerifyUserUsecase({required this.repository});

  Future<void> call(VerifyUserEntity verifyUserEntity) async {
    return await repository.verifyUserByEmail(verifyUserEntity);
  }
}
