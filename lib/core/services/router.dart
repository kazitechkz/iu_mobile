import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/common/widgets/scaffold_with_navigation.dart';
import 'package:iu/core/services/router_middleware.dart';
import 'package:iu/features/attempt/presentation/attempt_result/bloc/attempt_result_bloc.dart';
import 'package:iu/features/attempt/presentation/pass_attempt/bloc/pass_attempt_bloc.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iu/features/auth/presentation/screens/auth_screen.dart';
import 'package:iu/features/auth/presentation/screens/forget_screen.dart';
import 'package:iu/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:iu/features/auth/presentation/screens/verify_screen.dart';
import 'package:iu/features/forum/presentation/all_forum/all_forum_screen.dart';
import 'package:iu/features/forum/presentation/all_forum/bloc/all_forum_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_detail/bloc/iutube_detail_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_detail/iutube_detail_screen.dart';
import 'package:iu/features/iutube/presentation/iutube_list/bloc/iutube_list_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_list/iutube_list_screen.dart';
import 'package:iu/features/iutube/presentation/iutube_main/bloc/iutube_main_bloc.dart';
import 'package:iu/features/iutube/presentation/iutube_main/iutube_main_screen.dart';
import 'package:iu/features/menu_services/presentation/main_services/main_services_screen.dart';
import 'package:iu/features/news/presentation/news_detail/bloc/news_detail_bloc.dart';
import 'package:iu/features/news/presentation/news_detail/news_detail_screen.dart';
import 'package:iu/features/news/presentation/news_list/bloc/important_news/important_news_bloc.dart';
import 'package:iu/features/news/presentation/news_list/bloc/news_list/news_list_bloc.dart';
import 'package:iu/features/news/presentation/news_list/news_list_screen.dart';
import 'package:iu/features/profile/profile_main_screen.dart';
import 'package:iu/features/stat/presentation/full_stat/bloc/full_stat_bloc.dart';
import 'package:iu/features/stat/presentation/full_stat/full_stat_screen.dart';
import 'package:iu/features/stat/presentation/stat_attempt/bloc/stat_attempt_bloc.dart';
import 'package:iu/features/stat/presentation/stat_attempt/stat_attempt_screen.dart';
import 'package:iu/features/stat/presentation/stat_main/bloc/stat_main_bloc.dart';
import 'package:iu/features/stat/presentation/stat_main/stat_main_screen.dart';
import 'package:iu/features/steps/presentation/detail/bloc/step_detail_bloc.dart';
import 'package:iu/features/steps/presentation/detail/screens/step_detail_screen.dart';
import 'package:iu/features/steps/presentation/step/bloc/step_bloc.dart';
import 'package:iu/features/steps/presentation/step/screens/step_screen.dart';
import 'package:iu/features/sub_steps/domain/parameters/sub_step_exam_parameters.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/check_sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/bloc/sub_step_detail_bloc.dart';
import 'package:iu/features/sub_steps/presentation/detail/screen/sub_step_detail_screen.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/radio_bloc/exam_radio_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/bloc/sub_step_exam_bloc.dart';
import 'package:iu/features/sub_steps/presentation/exam/screen/sub_step_exam_screen.dart';
import 'package:iu/features/sub_steps/presentation/result/bloc/sub_step_exam_result_bloc.dart';
import 'package:iu/features/sub_steps/presentation/result/screen/sub_step_exam_result_screen.dart';
import 'package:iu/features/techSupport/presentation/my_tech_support_list/bloc/my_tech_support_tickets_bloc.dart';
import 'package:iu/features/techSupport/presentation/my_tech_support_list/my_tech_support_list_screen.dart';
import 'package:iu/features/tournament/presentation/tournament_detail/tournament_detail_screen.dart';
import 'package:iu/features/tournament/presentation/tournament_list/bloc/tournament_list_bloc.dart';
import 'package:iu/features/tournament/presentation/tournament_list/tournament_list_screen.dart';
import 'package:iu/features/unt/presentation/screens/unt_mode_screen.dart';
import 'package:iu/features/unt/presentation/unt_single/bloc/unt_Single_bloc.dart';
import 'package:iu/features/unt/presentation/unt_single/unt_single_screen.dart';
import '../../features/attempt/presentation/attempt_result/attempt_result_screen.dart';
import '../../features/attempt/presentation/pass_attempt/pass_attempt_screen.dart';
import '../../features/auth/presentation/screens/sign_up_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/iutube/presentation/iutube_author/bloc/iutube_author_bloc.dart';
import '../../features/iutube/presentation/iutube_author/iutube_author_screen.dart';
import '../../features/tournament/domain/parameters/get_tournament_awards_parameter.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_participants/sub_tournament_participants_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_results/sub_tournament_results_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/sub_tournament_rivals/sub_tournament_rivals_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/tournament_awards/tournament_awards_bloc.dart';
import '../../features/tournament/presentation/tournament_detail/bloc/tournament_detail_bloc.dart';
import '../../features/unt/presentation/unt_full/bloc/unt_full_bloc.dart';
import '../../features/unt/presentation/unt_full/unt_full_screen.dart';
import '../../features/user/presentation/bloc/change/change_user_info_bloc.dart';
import '../../features/user/presentation/bloc/user_info_bloc.dart';
import '../../features/user/presentation/screen/user_info_screen.dart';
import '../../features/welcome/presentation/bloc/welcome_bloc.dart';
import '../../features/welcome/presentation/screens/welcome_screen.dart';
import 'injection_main.container.dart';

class RouteNavigation {
  late GoRouter appRouterConfig;
  final GlobalKey<NavigatorState> navigatorKey;

  RouteNavigation(this.navigatorKey) {
    appRouterConfig = GoRouter(
      initialLocation: "/",
      navigatorKey: navigatorKey,
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
            }),
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
            }),
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
            }),
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
            }),
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
            }),
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                ScaffoldWithNavBar(navigationShell: navigationShell),
            branches: <StatefulShellBranch>[
              // The route branch for the third tab of the bottom navigation bar.
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                      path: "/${RouteConstant.dashboardScreenName}",
                      name: RouteConstant.dashboardScreenName,
                      builder: (context, state) {
                        return const DashBoardScreen();
                      },
                      redirect:
                          (BuildContext context, GoRouterState state) async {
                        return await RouterMiddleWare()
                            .authMiddleWare(context, state);
                      }),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                      path: "/${RouteConstant.stepsScreenName}",
                      name: RouteConstant.stepsScreenName,
                      builder: (context, state) {
                        return BlocProvider(
                          create: (_) => sl<StepBloc>(),
                          child: const StepScreen(),
                        );
                      },
                      redirect:
                          (BuildContext context, GoRouterState state) async {
                        return await RouterMiddleWare()
                            .authMiddleWare(context, state);
                      }),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                      path: "/${RouteConstant.untModeScreenName}",
                      name: RouteConstant.untModeScreenName,
                      builder: (context, state) {
                        return const UntModeScreen();
                      },
                      redirect:
                          (BuildContext context, GoRouterState state) async {
                        return await RouterMiddleWare()
                            .authMiddleWare(context, state);
                      }),
                ],
              ),
              StatefulShellBranch(
                routes: <RouteBase>[
                  GoRoute(
                      path: "/${RouteConstant.profileScreenName}",
                      name: RouteConstant.profileScreenName,
                      builder: (context, state) {
                        return const ProfileMainScreen();
                      },
                      redirect:
                          (BuildContext context, GoRouterState state) async {
                        return await RouterMiddleWare()
                            .authMiddleWare(context, state);
                      }),
                ],
              ),
            ]),
        GoRoute(
            path: "/${RouteConstant.userInfoScreenName}",
            name: RouteConstant.userInfoScreenName,
            builder: (context, state) {
              return MultiBlocProvider(providers: [
                BlocProvider.value(
                  value: sl<UserInfoBloc>(),
                ),
                BlocProvider.value(value: sl<ChangeUserInfoBloc>())
              ], child: const UserInfoScreen());
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.stepDetailScreenName}/:subjectID",
            name: RouteConstant.stepDetailScreenName,
            builder: (context, state) {
              String subjectID = state.pathParameters['subjectID']!;
              return BlocProvider(
                  create: (_) => sl<StepDetailBloc>(),
                  child: StepDetailScreen(subjectID: subjectID));
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.subStepDetailScreenName}/:subStepID",
            name: RouteConstant.subStepDetailScreenName,
            builder: (context, state) {
              String subStepID = state.pathParameters['subStepID']!;
              return MultiBlocProvider(providers: [
                BlocProvider.value(value: sl<SubStepDetailBloc>()),
                BlocProvider.value(value: sl<CheckSubStepExamResultBloc>())
              ], child: SubStepDetailScreen(subStepID: subStepID));
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path:
                "/${RouteConstant.subStepExamScreenName}/:subStepID/:localeID",
            name: RouteConstant.subStepExamScreenName,
            builder: (context, state) {
              String subStepID = state.pathParameters['subStepID']!;
              String localeID = state.pathParameters['localeID']!;
              final params = SubStepExamParameters(
                  subStepId: subStepID, localeId: localeID);
              return MultiBlocProvider(providers: [
                BlocProvider.value(value: sl<SubStepExamBloc>()),
                BlocProvider(create: (_) => sl<ExamRadioBloc>())
              ], child: SubStepExamScreen(params: params));
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path:
                "/${RouteConstant.subStepExamResultScreenName}/:subStepID/:localeID",
            name: RouteConstant.subStepExamResultScreenName,
            builder: (context, state) {
              String subStepID = state.pathParameters['subStepID']!;
              String localeID = state.pathParameters['localeID']!;
              final params = SubStepExamParameters(
                  subStepId: subStepID, localeId: localeID);
              return MultiBlocProvider(providers: [
                BlocProvider.value(value: sl<SubStepExamResultBloc>()),
                // BlocProvider(create: (_) => sl<ExamRadioBloc>())
              ], child: SubStepExamResultScreen(params: params));
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.untFullScreenName}",
            name: RouteConstant.untFullScreenName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<UntFullBloc>(),
                child: const UntFullScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.untSingleScreenName}",
            name: RouteConstant.untSingleScreenName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<UntSingleBloc>(),
                child: const UntSingleScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.passAttemptById}/:attemptId",
            name: RouteConstant.passAttemptById,
            builder: (context, state) {
              int attemptId = int.parse(state.pathParameters['attemptId']!);
              return BlocProvider(
                create: (_) => sl<PassAttemptBloc>(),
                child: PassUntScreen(
                  attemptId: attemptId,
                ),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.statMainName}",
            name: RouteConstant.statMainName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<StatMainBloc>(),
                child: StatMainScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.attemptResultByAttemptIdName}/:attemptId",
            name: RouteConstant.attemptResultByAttemptIdName,
            builder: (context, state) {
              int attemptId = int.parse(state.pathParameters['attemptId']!);
              return BlocProvider(
                create: (_) => sl<AttemptResultBloc>(),
                child: AttemptResultScreen(attemptId: attemptId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.statByAttemptIdName}/:attemptId",
            name: RouteConstant.statByAttemptIdName,
            builder: (context, state) {
              int attemptId = int.parse(state.pathParameters['attemptId']!);
              return BlocProvider(
                create: (_) => sl<StatAttemptBloc>(),
                child: StatAttemptScreen(attemptId: attemptId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.fullStatName}",
            name: RouteConstant.fullStatName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<FullStatBloc>(),
                child: FullStatScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.listTournamentName}",
            name: RouteConstant.listTournamentName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<TournamentListBloc>(),
                child: TournamentListScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.tournamentDetailName}/:tournamentId",
            name: RouteConstant.tournamentDetailName,
            builder: (context, state) {
              int tounamentId =
                  int.parse(state.pathParameters['tournamentId']!);

              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => sl<TournamentDetailBloc>()
                      ..add(TournamentDetailGetActualEvent(tounamentId)),
                  ),
                  BlocProvider(
                    create: (_) => sl<SubTournamentParticipantsBloc>(),
                  ),
                  BlocProvider(
                    create: (_) => sl<SubTournamentResultsBloc>(),
                  ),
                  BlocProvider(
                    create: (_) => sl<SubTournamentRivalsBloc>(),
                  ),
                  BlocProvider(
                    create: (_) => sl<TournamentAwardsBloc>()
                      ..add(TournamentAwardByTournamentIdEvent(
                          GetTournamentAwardsParameter(id: tounamentId))),
                  ),
                ],
                child: TournamentDetailScreen(tournamentId: tounamentId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.iutubeMainName}",
            name: RouteConstant.iutubeMainName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<IutubeMainBloc>(),
                child: IutubeMainScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.iutubeListName}",
            name: RouteConstant.iutubeListName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<IutubeListBloc>(),
                child: IutubeListScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.iutubeDetailName}/:alias",
            name: RouteConstant.iutubeDetailName,
            builder: (context, state) {
              String alias = state.pathParameters['alias'] ?? "";
              return BlocProvider(
                create: (_) => sl<IutubeDetailBloc>(),
                child: IutubeDetailScreen(alias: alias),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.iutubeAuthorVideoName}/:authorId",
            name: RouteConstant.iutubeAuthorVideoName,
            builder: (context, state) {
              int authorId = int.parse(state.pathParameters['authorId']!);
              return BlocProvider(
                create: (_) => sl<IutubeAuthorBloc>(),
                child: IutubeAuthorScreen(authorId: authorId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.newsListName}",
            name: RouteConstant.newsListName,
            builder: (context, state) {
              return MultiBlocProvider(providers: [
                BlocProvider(
                  create: (_) => sl<NewsListBloc>(),
                ),
                BlocProvider(
                  create: (_) => sl<ImportantNewsBloc>(),
                ),
              ], child: NewsListScreen());
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.newsDetailName}/:alias",
            name: RouteConstant.newsDetailName,
            builder: (context, state) {
              String alias = state.pathParameters['alias'] ?? "";
              return BlocProvider(
                create: (_) => sl<NewsDetailBloc>(),
                child: NewsDetailScreen(alias: alias),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.forumListName}",
            name: RouteConstant.forumListName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<AllForumBloc>(),
                child: AllForumScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.techSupportListName}",
            name: RouteConstant.techSupportListName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<MyTechSupportTicketsBloc>(),
                child: MyTechSupportListScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
      ],
    );
  }
}
