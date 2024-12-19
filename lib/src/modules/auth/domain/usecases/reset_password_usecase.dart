import 'package:socigate_system/src/modules/auth/domain/repositories/base_auth_repositories.dart';

class ResetPasswordUsecase {
  final BaseAuthRepositories repository;

  ResetPasswordUsecase(this.repository);

  execute(String email) async {
    return await repository.resetPassword(email);
  }
}
