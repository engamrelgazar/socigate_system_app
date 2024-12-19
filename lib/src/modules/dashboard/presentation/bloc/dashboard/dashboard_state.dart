part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardErrorState extends DashboardState {
  final String message;

  const DashboardErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class UserDataLoadedState extends DashboardState {
  final UserData userData;

  const UserDataLoadedState(this.userData);

  @override
  List<Object> get props => [userData];
}

