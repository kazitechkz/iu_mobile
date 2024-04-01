import 'package:hive/hive.dart';
import 'package:iu/core/adapters/auth_user_adapter.dart';
import 'package:iu/core/app_constants/hive_constant.dart';
import 'package:iu/features/auth/domain/entities/auth_user_entity.dart';

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

  Future<void> setLocalUser(AuthUserEntity userEntity) async{
    final userBox = await Hive.openBox<AuthUserHive>(HiveConstant.localUser);
    final localUser = AuthUserHive(
        id:userEntity.id,
        username: userEntity.username,
        name:userEntity.name,
        email:userEntity.email,
        phone: userEntity.phone,
        balance: userEntity.balance,
        role: userEntity.role,
        isKundelik: userEntity.isKundelik,
        parentName: userEntity.parentName,
        parentPhone: userEntity.parentPhone
    );
    await userBox.clear();
    await userBox.add(localUser);
  }

  Future<AuthUserHive?> getLocalUser() async{
    final userBox = await Hive.openBox<AuthUserHive>(HiveConstant.localUser);
    if(userBox.isNotEmpty){
      return userBox.getAt(0);
    }

  }

  Future<void> clearLocalUser() async{
    final userBox = await Hive.openBox<AuthUserHive>(HiveConstant.localUser);
    await userBox.clear();
  }

  Future<void> loggedOutFromHive() async{
    await clearLocalUser();
    await clearByKey(HiveConstant.tokenKey);
  }



}
