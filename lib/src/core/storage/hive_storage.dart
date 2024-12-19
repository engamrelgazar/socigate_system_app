import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveStorage {
  static Future<void> init(String boxName) async {
    final directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);

    await Hive.openBox(boxName);
  }

  static Future<void> saveValue(
      String boxName, String key, String value) async {
    var box = Hive.box(boxName);
    await box.put(key, value);
  }

  static bool getBoolValue(String boxName, String key) {
    var box = Hive.box(boxName);
    return box.get(key) != null;
  }

  static String? getValue(String boxName, String key) {
    var box = Hive.box(boxName);
    return box.get(key);
  }

  static Future<void> removeValue(String boxName, String key) async {
    var box = Hive.box(boxName);
    await box.delete(key);
  }
}
