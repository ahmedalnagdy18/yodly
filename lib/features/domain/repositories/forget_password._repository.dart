import 'package:yodly/features/domain/entites/forget_password_entity.dart';

abstract class ForgetPasswordRepository {
  Future<void> resetPasswordByEmail(ForgetPasswordEntity forgetPasswordEntity);
}
