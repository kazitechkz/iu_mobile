import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iu/features/auth/presentation/screens/auth_screen.dart';
import 'package:iu/features/auth/presentation/screens/forget_screen.dart';
import 'package:iu/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:iu/features/auth/presentation/screens/verify_screen.dart';

import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
import '../../features/welcome/presentation/screens/welcome_screen.dart';
import 'injection_main.container.dart';

final appRouterConfig = GoRouter(
  initialLocation: RouteConstant.authScreenName,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state){
        return BlocProvider(
          create:(_)=> sl<WelcomeBloc>(),
          child: WelcomeScreen(),
        );
      },
    ),
    GoRoute(
      path: RouteConstant.authScreenName,
      builder: (context, state){
        return BlocProvider(
          create:(_)=> sl<AuthBloc>(),
          child: const AuthScreen(),
        );
      },
    ),
    GoRoute(
      path: RouteConstant.signInScreenName,
      builder: (context, state){
        return BlocProvider(
          create:(_)=> sl<AuthBloc>(),
          child: const SignInScreen(),
        );
      },
    ),
    GoRoute(
      path: RouteConstant.signUpScreenName,
      builder: (context, state){
        return BlocProvider(
          create:(_)=> sl<AuthBloc>(),
          child: const SignUpScreen(),
        );
      },
    ),
    GoRoute(
      path: RouteConstant.verifyScreenName,
      builder: (context, state){
        return BlocProvider(
          create:(_)=> sl<AuthBloc>(),
          child: const VerifyScreen(),
        );
      },
    ),
    GoRoute(
      path: RouteConstant.forgetScreenName,
      builder: (context, state){
        return BlocProvider(
          create:(_)=> sl<AuthBloc>(),
          child: const ForgetScreen(),
        );
      },
    ),
  ],
);