part of 'send_email_verification_code_cubit.dart';

sealed class SendEmailVerificationCodeState extends Equatable {
  const SendEmailVerificationCodeState();

  @override
  List<Object> get props => [];
}

final class SendEmailVerificationCodeInitial
    extends SendEmailVerificationCodeState {}

class LoadingEmailVerificationCodeState
    extends SendEmailVerificationCodeState {}

class SucsessEmailVerificationCodeState
    extends SendEmailVerificationCodeState {}

class ErrorEmailVerificationCodeState extends SendEmailVerificationCodeState {
  final String message;

  const ErrorEmailVerificationCodeState({required this.message});

  @override
  List<Object> get props => [message];
}
