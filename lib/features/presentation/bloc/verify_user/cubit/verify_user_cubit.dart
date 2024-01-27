import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/verify_user_entity.dart';
import 'package:yodly/features/domain/usecase/verify_user_usecase.dart';

part 'verify_user_state.dart';

class VerifyUserCubit extends Cubit<VerifyUserState> {
  final VerifyUserUsecase verifyUserUsecase;
  VerifyUserCubit({required this.verifyUserUsecase})
      : super(VerifyUserInitial());

  void verifyUser(VerifyUserEntity verifyUserEntity) async {
    emit(LoadingVerifyUserState());
    print("==========");
    try {
      await verifyUserUsecase.call(verifyUserEntity);
      emit(SucsessVerifyUserState());

      print("Sucess");
    } catch (e) {
      print("Error");
      rethrow;
    }
    // emit(ErrorLoginState());
  }
}
