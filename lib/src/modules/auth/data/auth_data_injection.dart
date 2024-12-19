import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/modules/auth/data/sources/local_data_source.dart';
import 'package:socigate_system/src/modules/auth/data/sources/remote_data_source.dart';
import 'package:socigate_system/src/modules/auth/data/repositories_implements/auth_repositories_impl.dart';
import 'package:socigate_system/src/modules/auth/domain/repositories/base_auth_repositories.dart';

void registerAuthDataDependencies(GetIt sl) {
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl());
  sl.registerLazySingleton<BaseAuthRepositories>(() => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>()));
}
