import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/auth/presentation/bloc/auth_bloc.dart';
import 'package:socigate_system/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:socigate_system/src/modules/auth/domain/usecases/reset_password_usecase.dart';

void registerAuthPresentationDependencies(GetIt sl) {
  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl<LoginUsecase>(),
        resetPasswordUsecase: sl<ResetPasswordUsecase>(),
      ));
}
