import 'package:yodly/features/domain/entites/send_email_verification_code_entity.dart';

abstract class SendEmailVerificationCodeRepository {
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity);
}
