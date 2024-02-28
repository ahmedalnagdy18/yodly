import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/domain/usecase/home/delete_usecase.dart';
import 'package:yodly/features/domain/usecase/home/reviews_usecase.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsUsecase reviewsUsecase;
  final DeleteReviewUsecase deleteReviewUsecase;
  ReviewsCubit(
      {required this.deleteReviewUsecase, required this.reviewsUsecase})
      : super(ReviewsInitial());

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

  void delete(String id) async {
    try {
      // ignore: unused_local_variable
      final data = await deleteReviewUsecase.call(id);
      deletePost(id);
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorDeleteReviewsState(message: e.message));
      }
    }
  }

  void deletePost(String id) {
    final newState = state as SucsessReviewsState;
    final newListOfPost = [...newState.postItems];

    final index = newListOfPost.indexWhere((element) => element.id == id);
    newListOfPost.removeAt(index);
    emit(SucsessReviewsState(postItems: newListOfPost));
  }

  void addPost(ReviewsModels? item) {
    final newState = state as SucsessReviewsState;
    final newListOfPost = [...newState.postItems];
    if (item != null) {
      newListOfPost.insert(0, item);
      emit(SucsessReviewsState(postItems: newListOfPost));
    }
  }

  void test() {
    List<ReviewsModels> stateList = [];
    stateList.insert(
        0,
        ReviewsModels(
            name: "aa",
            id: '',
            country: '',
            userName: '',
            description: '',
            attachments: [],
            specificRating: [],
            title: '',
            city: ''));
  }
}
