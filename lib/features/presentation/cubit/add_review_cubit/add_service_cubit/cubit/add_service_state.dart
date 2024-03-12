part of 'add_service_cubit.dart';

sealed class AddServiceState extends Equatable {
  const AddServiceState();

  @override
  List<Object> get props => [];
}

final class AddServiceInitial extends AddServiceState {}

class LoadingAddServiceState extends AddServiceState {}

class SucsessAddServiceState extends AddServiceState {}

class ErrorAddServiceState extends AddServiceState {
  final String message;

  const ErrorAddServiceState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingAddReviewState extends AddServiceState {}

class SucsessAddReviewState extends AddServiceState {
  final List<AddReviewModel> reviewModel;

  const SucsessAddReviewState({required this.reviewModel});
}

class ErrorAddReviewState extends AddServiceState {
  final String message;

  const ErrorAddReviewState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingUploadFileState extends AddServiceState {}

class SucsessUploadFileState extends AddServiceState {}

class ErrorUploadFileState extends AddServiceState {
  final String message;

  const ErrorUploadFileState({required this.message});

  @override
  List<Object> get props => [message];
}
