part of 'side_menu_bloc.dart';

sealed class SideMenuEvent extends Equatable {
  const SideMenuEvent();

  @override
  List<Object> get props => [];
}

class ToggleSidebarEvent extends SideMenuEvent {}

class MenuSelectEvent extends SideMenuEvent {
  final int selectedIndex;

  const MenuSelectEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class LogoutRequested extends SideMenuEvent{}
