import 'package:yodly/features/domain/entites/authentication/register_entity.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';

class RegisterUsecase {
  final RegisterRepository repository;

  RegisterUsecase({required this.repository});

  Future<void> call(RegisterEntity registerEntity) async {
    return await repository.registerInput(registerEntity);
  }
}
