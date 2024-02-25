import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/features/domain/entites/authentication/login_entity.dart';
import 'package:yodly/features/domain/usecase/authentication/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  void login(LoginEntity loginEntity) async {
    emit(LoadingLoginState());
    try {
      await loginUsecase.call(loginEntity);
      emit(SucsessLoginState());
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorLoginState(message: e.message));
      }
      rethrow;
    }
  }
}
