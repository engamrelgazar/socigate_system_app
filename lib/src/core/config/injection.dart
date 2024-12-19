import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:socigate_system/src/core/config/injections/auth_injection.dart';
import 'package:socigate_system/src/core/config/injections/dashboard_injection.dart';

import 'package:socigate_system/src/core/storage/hive_storage.dart';

class DependencyInjection {
  static final GetIt sl = GetIt.instance;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveStorage.init('userBox');
    registerAuthDependencies(sl);
    registerDashboardDependencies(sl);
  }
}
