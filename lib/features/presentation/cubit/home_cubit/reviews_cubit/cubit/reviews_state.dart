part of 'reviews_cubit.dart';

abstract class ReviewsState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

class LoadingReviewsState extends ReviewsState {}

class SucsessReviewsState extends ReviewsState {
  final List<ReviewsModels> postItems;

  SucsessReviewsState({required this.postItems});
  @override
  List<Object> get props => [postItems];
}

class ErrorReviewsState extends ReviewsState {
  final String message;

  ErrorReviewsState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingDeleteReviewsState extends ReviewsState {}

class SucsessDeleteReviewsState extends ReviewsState {}

class ErrorDeleteReviewsState extends ReviewsState {
  final String message;

  ErrorDeleteReviewsState({required this.message});

  @override
  List<Object> get props => [message];
}
