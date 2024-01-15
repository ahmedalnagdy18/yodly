import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/forget_password_entity.dart';
import 'package:yodly/features/domain/usecase/forget_password_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordCubit({required this.forgetPasswordUsecase})
      : super(ForgetPasswordInitial());

  void forgetPassword(ForgetPasswordEntity forgetPasswordEntity) async {
    emit(LoadingForgetPasswordState());
    print("==========");
    try {
      await forgetPasswordUsecase.call(forgetPasswordEntity);
      emit(SucsessForgetPasswordState());

      print("Sucess");
    } catch (e) {
      print("Error");
      rethrow;
    }
    // emit(ErrorLoginState());
  }
}
