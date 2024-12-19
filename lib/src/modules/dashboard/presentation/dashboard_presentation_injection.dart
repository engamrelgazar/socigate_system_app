import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/dashboard/domain/usecases/get_user_data.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:socigate_system/src/modules/dashboard/presentation/bloc/side_menu/side_menu_bloc.dart';

void registerDashboardPresentationDependencies(GetIt sl) {
  sl.registerFactory(() => DashboardBloc(getUserData: sl<GetUserData>()));
  sl.registerFactory(() => SideMenuBloc());
}
