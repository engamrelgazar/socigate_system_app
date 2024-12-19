import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/dashboard/data/repositories_implements/dashboard_repositories_impl.dart';
import 'package:socigate_system/src/modules/dashboard/data/sources/remote_data_sources.dart';
import 'package:socigate_system/src/modules/dashboard/domain/repositories/base_dashboard_repositories.dart';

void registerDashboardDataDependencies(GetIt sl) {
  sl.registerLazySingleton<DashboardRemoteDataSource>(
      () => DashboardRemoteDataSourceImpl());
  sl.registerLazySingleton<BaseDashboardRepositories>(() =>
      DashboardRepositoryImpl(
          remoteDataSource: sl<DashboardRemoteDataSource>()));
}
