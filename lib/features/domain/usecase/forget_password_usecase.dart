import 'package:yodly/features/domain/entites/forget_password_entity.dart';
import 'package:yodly/features/domain/repositories/forget_password._repository.dart';

class ForgetPasswordUsecase {
  final ForgetPasswordRepository repository;

  ForgetPasswordUsecase({required this.repository});

  Future<void> call(ForgetPasswordEntity forgetPasswordEntity) async {
    return await repository.resetPasswordByEmail(forgetPasswordEntity);
  }
}
