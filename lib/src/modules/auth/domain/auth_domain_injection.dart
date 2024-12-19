import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/auth/domain/repositories/base_auth_repositories.dart';
import 'package:socigate_system/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:socigate_system/src/modules/auth/domain/usecases/reset_password_usecase.dart';

void registerAuthDomainDependencies(GetIt sl) {
  sl.registerLazySingleton(() => LoginUsecase(sl<BaseAuthRepositories>()));
  sl.registerLazySingleton(() => ResetPasswordUsecase(sl<BaseAuthRepositories>()));
}
