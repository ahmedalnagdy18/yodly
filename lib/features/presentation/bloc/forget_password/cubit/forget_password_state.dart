part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class LoadingForgetPasswordState extends ForgetPasswordState {}

class LoadedForgetPasswordState extends ForgetPasswordState {}

class SucsessForgetPasswordState extends ForgetPasswordState {}

class ErrorForgetPasswordState extends ForgetPasswordState {
  final String message;

  const ErrorForgetPasswordState({required this.message});

  @override
  List<Object> get props => [message];
}
