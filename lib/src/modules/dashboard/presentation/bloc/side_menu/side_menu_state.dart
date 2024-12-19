part of 'side_menu_bloc.dart';

sealed class SideMenuState extends Equatable {
  const SideMenuState();

  @override
  List<Object> get props => [];
}

final class SideMenuInitial extends SideMenuState {}

class MenuToggleState extends SideMenuState {
  final bool isExpanded;

  const MenuToggleState(this.isExpanded);

  @override
  List<Object> get props => [isExpanded];
}

class MenuSelectState extends SideMenuState {
  final int selectedIndex;

  const MenuSelectState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class LogoutSuccess extends SideMenuState {}

class LogoutError extends SideMenuState {
  final String error;

  const LogoutError(this.error);

  @override
  List<Object> get props => [error];
}
