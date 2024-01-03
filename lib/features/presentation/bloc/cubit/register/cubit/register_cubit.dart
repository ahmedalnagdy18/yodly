import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yodly/features/domain/entites/register_entity.dart';
import 'package:yodly/features/domain/usecase/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterCubit({required this.registerUsecase}) : super(RegisterInitial());

  void register(RegisterEntity registerEntity) async {
    emit(LoadingRegsisterState());
    final result = await registerUsecase.call(registerEntity);
    emit(SucsessRegsisterState());
  }
}
