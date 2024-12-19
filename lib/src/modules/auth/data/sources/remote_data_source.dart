import 'package:dartz/dartz.dart';
import 'package:socigate_system/src/core/api/api.dart';
import 'package:socigate_system/src/core/error/error_message_model.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/modules/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, AuthUserModel>> login(String email, String password);
  Future<Either<Failure, String>> resetPassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  
  @override
  Future<Either<Failure, AuthUserModel>> login(
      String email, String password) async {
    try {
      var response = await Api().postRequest('api/login', {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        return right(AuthUserModel.fromJson(data['user']));
      } else {
        return left(ServerFailure(
            errorMessageModel: ErrorMessageModel.fromJson(response.data)));
      }
    } catch (e) {
      return left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(String email) async {
    try {
      var response = await Api().postRequest('api/password/forgot', {
        'email': email,
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        return right(data['message']);
      } else {
        return left(ServerFailure(
            errorMessageModel: ErrorMessageModel.fromJson(response.data)));
      }
    } catch (e) {
      return left(GeneralFailure(message: e.toString()));
    }
  }
}
