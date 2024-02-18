part of 'does_user_exist_cubit.dart';

sealed class DoesUserExistState extends Equatable {
  const DoesUserExistState();

  @override
  List<Object> get props => [];
}

final class DoesUserExistInitial extends DoesUserExistState {}

class LoadingDoesUserExistState extends DoesUserExistState {}

class SucsessDoesUserExistState extends DoesUserExistState {}

class ErrorDoesUserExistState extends DoesUserExistState {
  final String message;

  const ErrorDoesUserExistState({required this.message});

  @override
  List<Object> get props => [message];
}
