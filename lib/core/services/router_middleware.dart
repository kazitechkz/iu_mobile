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
    if(userHive == null && localUser == null){
      return "/${RouteConstant.authScreenName}";
    }
    if(userHive != null && localUser == null){
      context.read<UserProvider>().InitUser(userHive);
      return null;
    }
    if(localUser != null){
        return null;
    }
    return "/${RouteConstant.authScreenName}";
  }

  FutureOr<String?> guestMiddleWare(BuildContext context, GoRouterState state) async{
    final userHive = await HiveUtils().getLocalUser();
    final localUser = context.read<UserProvider>().user;
    if(userHive == null && localUser == null){
        return null;
    }
    if(userHive != null && localUser == null){
      context.read<UserProvider>().InitUser(userHive);
      return "/${RouteConstant.dashboardScreenName}";
    }
    if(localUser != null){
      return "/${RouteConstant.dashboardScreenName}";
    }
    return "/${RouteConstant.dashboardScreenName}";
  }

  FutureOr<String?> checkInitialPage(BuildContext context, GoRouterState state) async{
    final isVisited = await HiveUtils().getBool(HiveConstant.welcomeScreenKey);
    final userHive = await HiveUtils().getLocalUser();
    final localUser = context.read<UserProvider>().user;
    if(userHive != null && localUser == null){
      context.read<UserProvider>().InitUser(userHive);
      return "/${RouteConstant.dashboardScreenName}";
    }
    if(localUser != null){
      return "/${RouteConstant.dashboardScreenName}";
    }
    //If User Has Already Visited Welcome Page
    if (isVisited) {
      return "/${RouteConstant.authScreenName}";
    }
    return null;
  }

}