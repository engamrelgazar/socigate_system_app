import 'package:dartz/dartz.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/modules/dashboard/domain/entities/user_entities.dart';

abstract class BaseDashboardRepositories {
  Future<Either<Failure, UserData>> getUserData();
}

