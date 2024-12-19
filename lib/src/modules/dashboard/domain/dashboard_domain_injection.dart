import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/dashboard/domain/repositories/base_dashboard_repositories.dart';
import 'package:socigate_system/src/modules/dashboard/domain/usecases/get_user_data.dart';

void registerDashboardDomainDependencies(GetIt sl) {
  sl.registerLazySingleton(() => GetUserData(sl<BaseDashboardRepositories>()));
}
