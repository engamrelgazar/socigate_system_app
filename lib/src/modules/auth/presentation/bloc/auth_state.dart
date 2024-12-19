part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

abstract class UIState extends AuthState {}

class LoginUIState extends UIState {}

class ForgetPasswordUIState extends UIState {}

class ForgetPasswordSuccessUiState extends AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final AuthUser user;

  const AuthSuccessState(this.user);
}

class AuthFailureState extends AuthState {
  final Failure failure;

  const AuthFailureState(this.failure);

  @override
  List<Object> get props => [failure];
}
