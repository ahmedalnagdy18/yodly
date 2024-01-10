import 'package:yodly/features/domain/entites/forget_password.dart';

abstract class ForgetPasswordRepository {
  Future<void> resetPasswordByEmail(ForgetPasswordEntity forgetPasswordEntity);
}
