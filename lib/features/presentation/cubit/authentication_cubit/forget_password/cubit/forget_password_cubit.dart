import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/authentication/forget_password_entity.dart';
import 'package:yodly/features/domain/usecase/authentication/forget_password_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordCubit({required this.forgetPasswordUsecase})
      : super(ForgetPasswordInitial());

  void forgetPassword(ForgetPasswordEntity forgetPasswordEntity) async {
    emit(LoadingForgetPasswordState());
    try {
      await forgetPasswordUsecase.call(forgetPasswordEntity);
      emit(SucsessForgetPasswordState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorForgetPasswordState(message: e.message));
      }
      rethrow;
    }
  }
}
