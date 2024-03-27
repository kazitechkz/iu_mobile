import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
import '../../features/welcome/presentation/screens/welcome_screen.dart';
import 'injection_main.container.dart';

final appRouterConfig = GoRouter(
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
  ],
);