import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/authentication/send_email_verification_code_entity.dart';
import 'package:yodly/features/domain/usecase/authentication/send_email_verification_code_usecase.dart';

part 'send_email_verification_code_state.dart';

class SendEmailVerificationCodeCubit
    extends Cubit<SendEmailVerificationCodeState> {
  final SendEmailVerificationCodeUsecase sendEmailVerificationCodeUsecase;
  SendEmailVerificationCodeCubit(
      {required this.sendEmailVerificationCodeUsecase})
      : super(SendEmailVerificationCodeInitial());

  void sendEmailVerificationCode(
      SendEmailVerificationCodeEntity sendEmailVerificationCodeEntity) async {
    emit(LoadingEmailVerificationCodeState());
    try {
      await sendEmailVerificationCodeUsecase
          .call(sendEmailVerificationCodeEntity);
      emit(SucsessEmailVerificationCodeState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorEmailVerificationCodeState(message: e.message));
      }
      rethrow;
    }
  }
}
