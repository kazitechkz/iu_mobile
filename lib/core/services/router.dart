import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/hive_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/services/router_middleware.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iu/features/auth/presentation/screens/auth_screen.dart';
import 'package:iu/features/auth/presentation/screens/forget_screen.dart';
import 'package:iu/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:iu/features/auth/presentation/screens/verify_screen.dart';
import 'package:iu/features/steps/presentation/bloc/step_bloc.dart';
import 'package:iu/features/steps/presentation/screens/step_screen.dart';

import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
import '../../features/welcome/presentation/screens/welcome_screen.dart';
import '../providers/user_provider.dart';
import '../utils/hive_utils.dart';
import 'injection_main.container.dart';

final appRouterConfig = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<WelcomeBloc>(),
          child: const WelcomeScreen(),
        );
      },
      redirect: (BuildContext context, GoRouterState state) async {
        return await RouterMiddleWare().checkInitialPage(context, state);
      },
    ),
    GoRoute(
      path: "/${RouteConstant.authScreenName}",
      name: RouteConstant.authScreenName,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const AuthScreen(),
        );
      },
      redirect: (BuildContext context, GoRouterState state) async {
        return await RouterMiddleWare().guestMiddleWare(context, state);
      }
    ),
    GoRoute(
      path: "/${RouteConstant.signInScreenName}",
      name: RouteConstant.signInScreenName,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignInScreen(),
        );
      },
      redirect: (BuildContext context, GoRouterState state) async {
          return await RouterMiddleWare().guestMiddleWare(context, state);
      }
    ),
    GoRoute(
      path: "/${RouteConstant.signUpScreenName}",
      name: RouteConstant.signUpScreenName,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignUpScreen(),
        );
      },
      redirect: (BuildContext context, GoRouterState state) async {
        return await RouterMiddleWare().guestMiddleWare(context, state);
      }
    ),
    GoRoute(
      path: "/${RouteConstant.verifyScreenName}/:userId",
      name: RouteConstant.verifyScreenName,
      builder: (context, state) {
        String? userID = state.pathParameters['userId'];
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: VerifyScreen(userId: userID.toString()),
        );
      },
        redirect: (BuildContext context, GoRouterState state) async {
          return await RouterMiddleWare().guestMiddleWare(context, state);
        }
    ),
    GoRoute(
      path: "/${RouteConstant.forgetScreenName}",
      name: RouteConstant.forgetScreenName,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const ForgetScreen(),
        );
      },
        redirect: (BuildContext context, GoRouterState state) async {
          return await RouterMiddleWare().guestMiddleWare(context, state);
        }
    ),
    GoRoute(
      path: "/${RouteConstant.dashboardScreenName}",
      name: RouteConstant.dashboardScreenName,
      builder: (context, state) {
        return const DashBoardScreen();
      },
        redirect: (BuildContext context, GoRouterState state) async {
          return await RouterMiddleWare().authMiddleWare(context, state);
        }
    ),
    GoRoute(
      path: "/${RouteConstant.stepsScreenName}",
      name: RouteConstant.stepsScreenName,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => sl<StepBloc>(),
          child: const StepScreen(),
        );
      },
        redirect: (BuildContext context, GoRouterState state) async {
          return await RouterMiddleWare().authMiddleWare(context, state);
        }
    ),
  ],
);
