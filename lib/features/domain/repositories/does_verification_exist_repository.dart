import 'package:yodly/features/domain/entites/does_verification_exist_entity.dart';

abstract class DoesVerificationExistRepository {
  Future<void> doesUserWithVerificationCodeExist(
      DoesVerificationExistEntity doesVerificationExistEntity);
}
