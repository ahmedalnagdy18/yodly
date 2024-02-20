import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/domain/usecase/home/reviews_usecase.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsUsecase reviewsUsecase;
  ReviewsCubit({required this.reviewsUsecase}) : super(ReviewsInitial());

  void review() async {
    emit(LoadingReviewsState());
    try {
      final data = await reviewsUsecase.call();
      emit(SucsessReviewsState(postItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorReviewsState(message: e.message));
      }
      rethrow;
    }
  }
}
