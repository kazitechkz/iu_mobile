import 'package:iu/core/app_constants/hive_constant.dart';
import 'package:iu/core/utils/hive_utils.dart';

import '../../../../core/errors/exception.dart';

abstract class WelcomeDataSourceInterface {
  const WelcomeDataSourceInterface();
  Future<bool> checkIsFirstTimeDS();
  Future<void> cacheVisitedDS();
}

class WelcomeDataSourceImpl implements WelcomeDataSourceInterface {
  final hiveBox = HiveUtils();

  @override
  Future<void> cacheVisitedDS() async {
    try {
      await hiveBox.setBool(HiveConstant.welcomeScreenKey, true);
    } on Exception catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIsFirstTimeDS() async {
    try {
      return await hiveBox.getBool(HiveConstant.welcomeScreenKey);
    } on Exception catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
