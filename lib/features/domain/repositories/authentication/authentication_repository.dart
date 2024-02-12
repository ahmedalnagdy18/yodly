import 'package:yodly/features/domain/entites/does_verification_exist_entity.dart';
import 'package:yodly/features/domain/entites/forget_password_entity.dart';
import 'package:yodly/features/domain/entites/login_entity.dart';
import 'package:yodly/features/domain/entites/register_entity.dart';
import 'package:yodly/features/domain/entites/send_email_verification_code_entity.dart';
import 'package:yodly/features/domain/entites/verify_user_entity.dart';

abstract class RegisterRepository {
  Future<void> registerInput(RegisterEntity registerEntity);
}

abstract class LoginRepository {
  Future<void> loginWithEmailAndPassword(LoginEntity loginEntity);
}

abstract class SendEmailVerificationCodeRepository {
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity);
}

abstract class ForgetPasswordRepository {
  Future<void> resetPasswordByEmail(ForgetPasswordEntity forgetPasswordEntity);
}

abstract class VerifyUserRepository {
  Future<void> verifyUserByEmail(VerifyUserEntity verifyUserEntity);
}

abstract class DoesVerificationExistRepository {
  Future<void> doesUserWithVerificationCodeExist(
      DoesVerificationExistEntity doesVerificationExistEntity);
}
