part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

class LoadingReviewsState extends ReviewsState {}

class SucsessReviewsState extends ReviewsState {
  final List<ReviewsModels> postItems;

  const SucsessReviewsState({required this.postItems});
  @override
  List<Object> get props => [postItems];
}

class ErrorReviewsState extends ReviewsState {
  final String message;

  const ErrorReviewsState({required this.message});

  @override
  List<Object> get props => [message];
}
