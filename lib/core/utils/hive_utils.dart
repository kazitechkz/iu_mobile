import 'package:hive/hive.dart';
import 'package:iu/core/app_constants/hive_constant.dart';

import '../services/injection_main.container.dart';

class HiveUtils {
  final hive = sl<HiveInterface>();

  Future<void> setBool(String key, bool value) async {
    Box myBox = await hive.openBox(HiveConstant.appBox);
    myBox.put(key, value);
  }

  Future<bool> getBool(String key) async {
    Box myBox = await hive.openBox(HiveConstant.appBox);
    return myBox.get(key) ?? false;
  }

  Future<void> setString(String key, String value) async {
    Box myBox = await hive.openBox(HiveConstant.appBox);
    myBox.put(key, value);
  }

  Future<String?> getString(String key) async {
    Box myBox = await hive.openBox(HiveConstant.appBox);
    return myBox.get(key);
  }

  Future<void> clearByKey(String key) async {
    Box myBox = await hive.openBox(HiveConstant.appBox);
    myBox.delete(key);
  }
}
