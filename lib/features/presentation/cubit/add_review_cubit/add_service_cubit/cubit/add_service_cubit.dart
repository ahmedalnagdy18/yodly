import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/features/domain/entites/add_review/add_service_entity.dart';
import 'package:yodly/features/domain/models/add_review_model.dart';
import 'package:yodly/features/domain/usecase/add_review/add_review_usecase.dart';
import 'package:yodly/features/domain/usecase/add_review/add_service_usecase.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  final AddServiceUsecase addServiceUsecase;
  final AddReviewUsecase addReviewUsecase;
  AddServiceCubit(
      {required this.addReviewUsecase, required this.addServiceUsecase})
      : super(AddServiceInitial());

  void addServicee(AddServiceEntity addServiceEntity) async {
    emit(LoadingAddServiceState());
    try {
      await addServiceUsecase.call(addServiceEntity);
      emit(SucsessAddServiceState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorAddServiceState(message: e.message));
      }
      rethrow;
    }
  }

  void addReview() async {
    emit(LoadingAddReviewState());
    try {
      final data = await addReviewUsecase.call();
      emit(SucsessAddReviewState(reviewModel: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorAddReviewState(message: e.message));
      }
      rethrow;
    }
  }
}
