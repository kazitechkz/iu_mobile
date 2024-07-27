part of 'router.container.dart';

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
              return MultiBlocProvider(providers: [
                BlocProvider(create: (_) => sl<AuthBloc>()),
                BlocProvider.value(value: sl<GoogleBloc>()),
                BlocProvider.value(value: sl<KundelikBloc>()),
              ], child: const AuthScreen());
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().guestMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.kundelikScreenName}",
            name: RouteConstant.kundelikScreenName,
            builder: (context, state) {
              return const KundelikInitialScreen();
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
                        return MultiBlocProvider(providers: [
                          BlocProvider.value(value: sl<UserInfoBloc>()),
                          BlocProvider.value(value: sl<ChangeAvaBloc>())
                        ], child: const ProfileMainScreen());
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
                child: const StatMainScreen(),
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
            path: "/${RouteConstant.attemptWorkOverFailureName}/:attemptId",
            name: RouteConstant.attemptWorkOverFailureName,
            builder: (context, state) {
              int attemptId = int.parse(state.pathParameters['attemptId']!);
              return BlocProvider(
                create: (_) => sl<AttemptWorkOverFailureBloc>(),
                child: AttemptWorkOverFailureScreen(attemptId: attemptId),
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
                child: const FullStatScreen(),
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
                child: const TournamentListScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.tournamentDetailName}/:tournamentId",
            name: RouteConstant.tournamentDetailName,
            builder: (context, state) {
              int tournamentId =
                  int.parse(state.pathParameters['tournamentId']!);

              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => sl<TournamentDetailBloc>()
                      ..add(TournamentDetailGetActualEvent(tournamentId)),
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
                          GetTournamentAwardsParameter(id: tournamentId))),
                  ),
                ],
                child: TournamentDetailScreen(tournamentId: tournamentId),
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
                child: const IutubeMainScreen(),
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
                child: const IutubeListScreen(),
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
              ], child: const NewsListScreen());
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
                child: const AllForumScreen(),
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
                child: const MyTechSupportListScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.techSupportTicketDetailName}/:ticketId",
            name: RouteConstant.techSupportTicketDetailName,
            builder: (context, state) {
              int ticketId = int.parse(state.pathParameters['ticketId'] ?? "0");
              return BlocProvider(
                create: (_) => sl<TechSupportDetailBloc>(),
                child: TechSupportDetailScreen(ticketId: ticketId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.subscriptionName}",
            name: RouteConstant.subscriptionName,
            builder: (context, state) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<SubscriptionBloc>(
                    create: (context) =>
                        SubscriptionBloc()..add(GetSubscriptionsEvent()),
                  ),
                  BlocProvider<LocalSubjectBloc>(
                    create: (context) => LocalSubjectBloc(),
                  ),
                  BlocProvider<InitPayBloc>(
                    create: (context) =>
                        InitPayBloc(useCase: sl<PayBoxUseCase>()),
                  ),
                ],
                child: const SubscriptionScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.careerQuizzesListName}",
            name: RouteConstant.careerQuizzesListName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<CareerQuizzesBloc>(),
                child: const CareerQuizzesScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.careerQuizDetailName}/:quizId",
            name: RouteConstant.careerQuizDetailName,
            builder: (context, state) {
              int quizId = int.parse(state.pathParameters['quizId'] ?? "0");
              return BlocProvider(
                create: (_) => sl<CareerQuizDetailBloc>(),
                child: CareerQuizDetailScreen(quizId: quizId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.paymentName}/:redirectUrl",
            name: RouteConstant.paymentName,
            builder: (context, state) {
              String redirectUrl = state.pathParameters['redirectUrl']!;
              return PaymentScreen(redirectURL: redirectUrl);
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.mySubscriptionsName}",
            name: RouteConstant.mySubscriptionsName,
            builder: (context, state) {
              return BlocProvider.value(
                value: sl<UserInfoBloc>(),
                child: const MySubscriptionScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.mySavedQuestionsName}",
            name: RouteConstant.mySavedQuestionsName,
            builder: (context, state) {
              return MultiBlocProvider(providers: [
                BlocProvider.value(value: sl<MySavedQuestionsBloc>()),
              ], child: const MySavedQuestionScreen());
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.myCareerQuizAttemptsName}",
            name: RouteConstant.myCareerQuizAttemptsName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<MyCareerQuizAttemptsBloc>(),
                child: MyCareerQuizAttemptsScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.resultCareerQuizName}/:attemptId",
            name: RouteConstant.resultCareerQuizName,
            builder: (context, state) {
              int attemptId =
                  int.parse(state.pathParameters['attemptId'] ?? "0");
              return BlocProvider(
                create: (_) => sl<ResultCareerQuizBloc>(),
                child: ResultCareerQuizScreen(attemptId: attemptId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.careerSubscriptionsName}",
            name: RouteConstant.careerSubscriptionsName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<CareerSubscriptionsBloc>(),
                child: CareerSubscriptionsScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.passCareerQuizName}/:quizId",
            name: RouteConstant.passCareerQuizName,
            builder: (context, state) {
              int quizId = int.parse(state.pathParameters['quizId'] ?? "0");
              return BlocProvider(
                create: (_) => sl<PassCareerOneBloc>(),
                child: PassCareerOneScreen(quizId: quizId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.passCareerQuizDragDropName}/:quizId",
            name: RouteConstant.passCareerQuizDragDropName,
            builder: (context, state) {
              int quizId = int.parse(state.pathParameters['quizId'] ?? "0");
              return BlocProvider(
                create: (_) => sl<PassCareerDragDropBloc>(),
                child: PassCareerDragDropScreen(quizId: quizId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.forumDetailName}/:forumId",
            name: RouteConstant.forumDetailName,
            builder: (context, state) {
              int forumId = int.parse(state.pathParameters['forumId'] ?? "0");
              return BlocProvider(
                create: (_) => sl<ForumDetailBloc>(),
                child: ForumDetailScreen(forumId: forumId),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.notificationListScreenName}",
            name: RouteConstant.notificationListScreenName,
            builder: (context, state) {
              return BlocProvider(
                create: (_) => sl<NotificationListBloc>(),
                child: NotificationListScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.myAttemptsSettingsScreenName}",
            name: RouteConstant.myAttemptsSettingsScreenName,
            builder: (context, state) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<MyAttemptSettingsSingleBloc>(
                    create: (context) => MyAttemptSettingsSingleBloc(
                        myAttemptSettingSingleUseCase:
                            sl<MyAttemptSettingSingleUseCase>())
                      ..add(MyAttemptSettingsSingleGetEvent(
                          PaginationParameter(page: 1))),
                  ),
                  BlocProvider<MyAttemptSettingsManyBloc>(
                    create: (context) => MyAttemptSettingsManyBloc(
                        myAttemptSettingsUntUseCase:
                            sl<MyAttemptSettingsUntUseCase>())
                      ..add(MyAttemptSettingsManyGetEvent(
                          PaginationParameter(page: 1))),
                  ),
                ],
                child: const MyAttemptSettingsScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
        GoRoute(
            path: "/${RouteConstant.classRoomScreenName}",
            name: RouteConstant.classRoomScreenName,
            builder: (context, state) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (_) => sl<ClassroomBloc>()),
                ],
                child: const ClassRoomScreen(),
              );
            },
            redirect: (BuildContext context, GoRouterState state) async {
              return await RouterMiddleWare().authMiddleWare(context, state);
            }),
      ],
    );
  }
}
