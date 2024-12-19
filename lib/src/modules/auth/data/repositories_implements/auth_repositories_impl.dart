import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/modules/auth/data/models/user_model.dart';
import 'package:socigate_system/src/modules/auth/data/sources/local_data_source.dart';
import 'package:socigate_system/src/modules/auth/data/sources/remote_data_source.dart';
import 'package:socigate_system/src/modules/auth/domain/repositories/base_auth_repositories.dart';

class AuthRepositoryImpl implements BaseAuthRepositories {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});
  @override
  Future<Either<Failure, AuthUserModel>> loginByEmail(
      String email, String password) async {
    final remoteResponse = await remoteDataSource.login(email, password);
    return remoteResponse.fold(
      (failure) => left(failure),
      (authUserModel) async {
        await localDataSource.saveAuthData(json.encode(authUserModel.toJson()));
        return right(authUserModel);
      },
    );
  }

  @override
  Future<Either<Failure, String>> resetPassword(String email) async {
    return await remoteDataSource.resetPassword(email);
  }
}
