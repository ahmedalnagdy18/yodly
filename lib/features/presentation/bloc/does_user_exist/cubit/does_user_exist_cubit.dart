import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/does_verification_exist_entity.dart';
import 'package:yodly/features/domain/usecase/does_verification_exist_usecase.dart';

part 'does_user_exist_state.dart';

class DoesUserExistCubit extends Cubit<DoesUserExistState> {
  final DoesVerificationExistUsecase doesVerificationExistUsecase;
  DoesUserExistCubit({required this.doesVerificationExistUsecase})
      : super(DoesUserExistInitial());

  void doesUserExist(
      DoesVerificationExistEntity doesVerificationExistEntity) async {
    emit(LoadingDoesUserExistState());
    try {
      await doesVerificationExistUsecase.call(doesVerificationExistEntity);
      emit(SucsessDoesUserExistState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorDoesUserExistState(message: e.message));
      }
      rethrow;
    }
  }
}
