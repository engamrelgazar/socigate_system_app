import 'package:socigate_system/src/core/storage/hive_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAuthData(String apiKey);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveAuthData(String apiKey) async {
    await HiveStorage.saveValue('userBox', 'user_data', apiKey);
  }
}
