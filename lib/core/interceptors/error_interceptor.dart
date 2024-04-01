import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class ServerErrorInterceptor extends Interceptor {
  final BuildContext context;
  ServerErrorInterceptor(this.context);

  @override
  void onError(err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      final responseData = err.response!.data;
      handler.next(err);
    } else {
      handler.next(err);
    }
  }


  void _handleUnauthorized() {
    // Очистка данных пользователя в Provider
    Provider.of<UserProvider>(context).clearUser();

    // Очистка данных пользователя в Hive
    HiveUtils().loggedOutFromHive().then((_) {
      // Перенаправление пользователя на экран входа
      context.pushReplacementNamed("/${RouteConstant.authScreenName}");
    });
  }
}
