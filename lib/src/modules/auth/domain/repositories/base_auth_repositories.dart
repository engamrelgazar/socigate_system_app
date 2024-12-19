import 'package:dartz/dartz.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/modules/auth/domain/entities/user_entities.dart';

abstract class BaseAuthRepositories {
  Future<Either<Failure, AuthUser>> loginByEmail(
      String email, String password);
  Future<Either<Failure, String>> resetPassword(String email);
}

