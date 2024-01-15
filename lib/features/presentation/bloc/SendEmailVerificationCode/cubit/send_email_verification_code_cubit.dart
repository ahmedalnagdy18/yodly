import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/send_email_verification_code_entity.dart';
import 'package:yodly/features/domain/usecase/send_email_verification_code_usecase.dart';

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
    print("==========");
    try {
      await sendEmailVerificationCodeUsecase
          .call(sendEmailVerificationCodeEntity);
      emit(SucsessEmailVerificationCodeState());

      print("Sucess");
    } catch (e) {
      print("Error");
      rethrow;
    }
  }
}
