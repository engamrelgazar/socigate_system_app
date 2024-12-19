import 'package:dartz/dartz.dart';
import 'package:socigate_system/src/core/api/api.dart';
import 'package:socigate_system/src/core/error/error_message_model.dart';
import 'package:socigate_system/src/core/error/failure.dart';
import 'package:socigate_system/src/modules/dashboard/data/models/user_model.dart';

abstract class DashboardRemoteDataSource {
  Future<Either<Failure, UserDataModel>> getUserData();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  @override
  Future<Either<Failure, UserDataModel>> getUserData() async {
    try {
      var response = await Api().getRequest('api/user/get-user-data');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        return right(UserDataModel.fromJson(data['user']));
      } else {
        return left(ServerFailure(
            errorMessageModel: ErrorMessageModel.fromJson(response.data)));
      }
    } catch (e) {
      return left(GeneralFailure(message: e.toString()));
    }
  }
}
