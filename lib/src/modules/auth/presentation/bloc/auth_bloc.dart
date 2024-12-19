import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/modules/auth/domain/entities/user_entities.dart';
import 'package:socigate_system/src/modules/auth/domain/usecases/login_usecase.dart';
import 'package:socigate_system/src/modules/auth/domain/usecases/reset_password_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUseCase;
  final ResetPasswordUsecase resetPasswordUsecase;

  AuthBloc({required this.loginUseCase, required this.resetPasswordUsecase})
      : super(LoginUIState()) {
    on<ToggleViewEvent>((event, emit) {
      if (state is LoginUIState) {
        emit(ForgetPasswordUIState());
      } else if (state is ForgetPasswordUIState) {
        emit(LoginUIState());
      }else if (state is ForgetPasswordSuccessUiState){
         emit(LoginUIState());
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoadingState());
      final result = await loginUseCase.execute(
        event.email,
        event.password,
      );

      result.fold(
        (failure) => emitFailureAndReset(failure, LoginUIState(), emit),
        (user) => emit(AuthSuccessState(user)),
      );
    });

    on<ForgetPasswordRequested>((event, emit) async {
      emit(AuthLoadingState());
      final result = await resetPasswordUsecase.execute(event.email);

      result.fold(
        (failure) =>
            emitFailureAndReset(failure, ForgetPasswordUIState(), emit),
        (_) => emit(ForgetPasswordSuccessUiState()),
      );
    });
  }
  void emitFailureAndReset(
      Failure failure, AuthState resetState, Emitter<AuthState> emit) {
    emit(AuthFailureState(failure));
    emit(resetState);
  }
}
