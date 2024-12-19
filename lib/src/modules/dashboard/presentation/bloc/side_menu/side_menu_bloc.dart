import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socigate_system/src/core/storage/hive_storage.dart';

part 'side_menu_event.dart';
part 'side_menu_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  int selectedIndex = 0;
  bool isExpanded = true;
  SideMenuBloc() : super(SideMenuInitial()) {
    on<ToggleSidebarEvent>((event, emit) {
      isExpanded = !isExpanded;
      emit(MenuToggleState(isExpanded));
    });

    on<MenuSelectEvent>((event, emit) {
      selectedIndex = event.selectedIndex;
      emit(MenuSelectState(selectedIndex));
    });
    on<LogoutRequested>((event, emit) async {
      try {
        await HiveStorage.removeValue('userBox', 'user_data');
        emit(LogoutSuccess());
      } catch (error) {
        emit(LogoutError(error.toString()));
      }
    });
  }
}
