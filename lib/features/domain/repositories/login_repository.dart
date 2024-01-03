import 'package:yodly/features/domain/entites/login_entity.dart';

abstract class LoginRepository {
  Future<void> loginWithEmailAndPassword(LoginEntity loginEntity);
}
