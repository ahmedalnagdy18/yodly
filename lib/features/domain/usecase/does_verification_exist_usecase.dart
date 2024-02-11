import 'package:yodly/features/domain/entites/does_verification_exist_entity.dart';
import 'package:yodly/features/domain/repositories/does_verification_exist_repository.dart';

class DoesVerificationExistUsecase {
  final DoesVerificationExistRepository repository;

  DoesVerificationExistUsecase({required this.repository});

  Future<void> call(
      DoesVerificationExistEntity doesVerificationExistEntity) async {
    return await repository
        .doesUserWithVerificationCodeExist(doesVerificationExistEntity);
  }
}
