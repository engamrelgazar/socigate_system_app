import 'package:dartz/dartz.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/modules/dashboard/data/models/user_model.dart';
import 'package:socigate_system/src/modules/dashboard/data/sources/remote_data_sources.dart';
import 'package:socigate_system/src/modules/dashboard/domain/repositories/base_dashboard_repositories.dart';

class DashboardRepositoryImpl implements BaseDashboardRepositories {
  final DashboardRemoteDataSource remoteDataSource;
  DashboardRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserDataModel>> getUserData() async {
    final remoteResponse = await remoteDataSource.getUserData();
    return remoteResponse;
  }
}
