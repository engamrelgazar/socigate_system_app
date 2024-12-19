import 'package:socigate_system/src/modules/auth/domain/repositories/base_auth_repositories.dart';

class LoginUsecase{
  final BaseAuthRepositories repository;

  LoginUsecase(this.repository);

  execute(String email, String password) async {
    return await repository.loginByEmail(email, password);
  }
}
