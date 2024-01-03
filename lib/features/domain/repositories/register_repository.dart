import 'package:yodly/features/domain/entites/register_entity.dart';

abstract class RegisterRepository {
  Future<void> registerInput(RegisterEntity registerEntity);
}
