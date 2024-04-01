import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../app_constants/hive_constant.dart';
import '../app_constants/route_constant.dart';
import '../providers/user_provider.dart';
import '../utils/hive_utils.dart';

class RouterMiddleWare{


  FutureOr<String?> authMiddleWare(BuildContext context, GoRouterState state) async{
    final userHive = await HiveUtils().getLocalUser();
    final localUser = context.read<UserProvider>().user;
    final token = await HiveUtils().getString(HiveConstant.tokenKey);
    if(userHive != null && token != null){
      context.read<UserProvider>().InitUser(userHive);
      return null;
    }
    context.read<UserProvider>().clearUser();

    return "/${RouteConstant.authScreenName}";
  }

  FutureOr<String?> guestMiddleWare(BuildContext context, GoRouterState state) async{
    final userHive = await HiveUtils().getLocalUser();
    final localUser = context.read<UserProvider>().user;
    final token = await HiveUtils().getString(HiveConstant.tokenKey);
    if(userHive == null && token == null){
      if(localUser != null){
        context.read<UserProvider>().clearUser();
      }
        return null;
    }
    if(userHive != null && token != null){
      if(localUser == null){
        context.read<UserProvider>().InitUser(userHive);
      }
      return "/${RouteConstant.dashboardScreenName}";
    }
    if(localUser != null){
      context.read<UserProvider>().clearUser();
    }
    return null;
  }

  FutureOr<String?> checkInitialPage(BuildContext context, GoRouterState state) async{
    final isVisited = await HiveUtils().getBool(HiveConstant.welcomeScreenKey);
    final userHive = await HiveUtils().getLocalUser();
    final localUser = context.read<UserProvider>().user;
    final token = await HiveUtils().getString(HiveConstant.tokenKey);
    if(userHive != null && token != null){
      context.read<UserProvider>().InitUser(userHive);
      return "/${RouteConstant.dashboardScreenName}";
    }
    if(localUser != null){
      context.read<UserProvider>().InitUser(userHive);
    }
    //If User Has Already Visited Welcome Page
    if (isVisited) {
      return "/${RouteConstant.authScreenName}";
    }
    return null;
  }

}