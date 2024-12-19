import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socigate_system/src/modules/dashboard/domain/entities/user_entities.dart';
import 'package:socigate_system/src/modules/dashboard/domain/usecases/get_user_data.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetUserData getUserData;
  DashboardBloc({required this.getUserData}) : super(DashboardLoadingState()) {
    on<LoadUserDataEvent>((event, emit) async {
      emit(DashboardLoadingState());
      final result = await getUserData.execute();
      result.fold(
        (failure) => emit(DashboardErrorState('Failed to load user data')),
        (userData) => emit(UserDataLoadedState(userData)),
      );
    });
  }
}
