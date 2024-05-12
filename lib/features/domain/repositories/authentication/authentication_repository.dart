import 'package:yodly/features/domain/entites/authentication/does_verification_exist_entity.dart';
import 'package:yodly/features/domain/entites/authentication/forget_password_entity.dart';
import 'package:yodly/features/domain/entites/authentication/login_entity.dart';
import 'package:yodly/features/domain/entites/authentication/register_entity.dart';
import 'package:yodly/features/domain/entites/authentication/send_email_verification_code_entity.dart';
import 'package:yodly/features/domain/entites/authentication/verify_user_entity.dart';

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
