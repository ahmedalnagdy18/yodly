import 'package:yodly/features/domain/entites/verify_user_entity.dart';

abstract class VerifyUserRepository {
  Future<void> verifyUserByEmail(VerifyUserEntity verifyUserEntity);
}
