import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/login_entity.dart';
import 'package:yodly/features/domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit({required this.loginUsecase}) : super(LoginInitial());

  void login(LoginEntity loginEntity) async {
    emit(LoadingLoginState());
    print("==========");
    try {
      await loginUsecase.call(loginEntity);
      print("Sucess");
    } catch (e) {
      print("Error");
      rethrow;
    }
    emit(SucsessLoginState());
    // emit(ErrorLoginState());
  }
}
