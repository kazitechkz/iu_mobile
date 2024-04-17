part of 'injection_main.container.dart';

final sl = GetIt.instance;

Future<void> slInit() async {
  await _hiveSLInit();
  await _dioSLInit();
  await _welcomeSLInit();
  await _authSLInit();
  await _stepSLInit();
  await _untSlInit();
  await _attemptSlInit();
  await _tournamentSlInit();
  await _battleSlInit();
  await _careerSlInit();
  await _iutubeSlInit();
  await _forumSlInit();
}

Future<void> _hiveSLInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AuthUserHiveAdapter());
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}

Future<void> _dioSLInit() async {
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Accept': "application/json"},
      contentType: "application/json;charset=utf-8",
      responseType: ResponseType.json);
  final dio = Dio(options);
  final token = await HiveUtils().getString(HiveConstant.tokenKey);
  // HiveUtils().loggedOutFromHive();
  dio.interceptors.add(BearerTokenInterceptor(token));
  sl.registerLazySingleton<Dio>(() => dio);
}

Future<void> _welcomeSLInit() async {
  //Bloc
  sl.registerFactory(() => WelcomeBloc(
      cacheVisitedCase: sl<CacheVisitedCase>(),
      checkIsFirstTimeCase: sl<CheckIsFirstTimeCase>()));
  //Cases
  sl.registerLazySingleton(() => CacheVisitedCase(sl()));
  sl.registerLazySingleton(() => CheckIsFirstTimeCase(sl()));
  //Repository
  sl.registerLazySingleton<WelcomeInterface>(() => WelcomeRepository(sl()));
  //Data Source
  sl.registerLazySingleton<WelcomeDataSourceInterface>(
      () => WelcomeDataSourceImpl());
}

Future<void> _authSLInit() async {
  //Bloc
  sl.registerFactory(() => AuthBloc(
        signInCase: sl<SignInCase>(),
        signUpCase: sl<SignUpCase>(),
        verifyCase: sl<VerifyCase>(),
        forgetCase: sl<ForgetCase>(),
        sendResetTokenCase: sl<SendResetTokenCase>(),
      ));
  //Cases
  sl.registerLazySingleton(() => ForgetCase(sl()));
  sl.registerLazySingleton(() => SignInCase(sl()));
  sl.registerLazySingleton(() => SignUpCase(sl()));
  sl.registerLazySingleton(() => VerifyCase(sl()));
  sl.registerLazySingleton(() => SendResetTokenCase(sl()));
  //Repository
  sl.registerLazySingleton<AuthInterface>(() => AuthRepository(sl()));
  //Data Source
  sl.registerLazySingleton<AuthDataSourceInterface>(() => AuthDataSourceImpl());
}

Future<void> _stepSLInit() async {
  sl.registerFactory(() => StepBloc(stepUseCase: sl<StepUseCase>()));
  sl.registerLazySingleton(() => StepUseCase(sl()));
  sl.registerLazySingleton<StepInterface>(() => StepRepository(sl()));
  sl.registerLazySingleton<StepDataSourceInterface>(() => StepDataSourceImpl());
}

Future<void> _untSlInit() async {
  sl.registerFactory(() => UntBloc(getSubjectsCase: sl<GetSubjectsCase>()));
  sl.registerLazySingleton(() => GetSubjectsCase(sl()));
  sl.registerLazySingleton<UntInterface>(() => UntRepository(sl()));
  sl.registerLazySingleton<UntDataSourceInterface>(() => UntDataSourceImpl());
}

Future<void> _attemptSlInit() async {
  sl.registerLazySingleton(() => AllAttemptsCase(sl()));
  sl.registerLazySingleton(() => AllAttemptTypesCase(sl()));
  sl.registerLazySingleton(() => AnswerCase(sl()));
  sl.registerLazySingleton(() => AnswerResultCase(sl()));
  sl.registerLazySingleton(() => CreateAttemptCase(sl()));
  sl.registerLazySingleton(() => FinishAttemptCase(sl()));
  sl.registerLazySingleton(() => GetAttemptByPromoCodeCase(sl()));
  sl.registerLazySingleton(() => GetAttemptCase(sl()));
  sl.registerLazySingleton(() => GetAttemptStatCase(sl()));
  sl.registerLazySingleton(() => GetUntStatCase(sl()));
  sl.registerLazySingleton(() => SaveQuestionCase(sl()));
  sl.registerLazySingleton<AttemptInterface>(() => AttemptRepository(sl()));
  sl.registerLazySingleton<AttemptDataSourceInterface>(
      () => AttemptDataSourceImpl());
}

Future<void> _tournamentSlInit() async {
  sl.registerLazySingleton(() => CreateTournamentCase(sl()));
  sl.registerLazySingleton(() => GetAllTournamentCase(sl()));
  sl.registerLazySingleton(() => GetListOfTournamentsCase(sl()));
  sl.registerLazySingleton(() => GetSubTournamentDetailCase(sl()));
  sl.registerLazySingleton(() => GetSubTournamentParticipantsCase(sl()));
  sl.registerLazySingleton(() => GetSubTournamentResultsCase(sl()));
  sl.registerLazySingleton(() => GetSubTournamentRivalsCase(sl()));
  sl.registerLazySingleton(() => GetSubTournamentWinnersCase(sl()));
  sl.registerLazySingleton(() => GetTournamentAwardsCase(sl()));
  sl.registerLazySingleton(() => GetTournamentDetailCase(sl()));
  sl.registerLazySingleton(() => OnParticipateTournamentCase(sl()));
  sl.registerLazySingleton(() => OnPayTournamentCase(sl()));
  sl.registerLazySingleton<TournamentInterface>(
      () => TournamentRepository(sl()));
  sl.registerLazySingleton<TournamentDataSourceInterface>(
      () => TournamentDataSourceImpl());
}

Future<void> _battleSlInit() async {
  sl.registerLazySingleton(() => AnswerBattleQuestionCase(sl()));
  sl.registerLazySingleton(() => CreateBattleCase(sl()));
  sl.registerLazySingleton(() => CreateBattleStepCase(sl()));
  sl.registerLazySingleton(() => FinishBattleResultCase(sl()));
  sl.registerLazySingleton(() => GetActiveBattlesCase(sl()));
  sl.registerLazySingleton(() => GetBattleByPromoCase(sl()));
  sl.registerLazySingleton(() => GetBattleHistoryCase(sl()));
  sl.registerLazySingleton(() => GetBattleStatsCase(sl()));
  sl.registerLazySingleton(() => GetBattleStepCase(sl()));
  sl.registerLazySingleton(() => GetBattleStepQuestionsCase(sl()));
  sl.registerLazySingleton(() => GetBattleSubjectsCase(sl()));
  sl.registerLazySingleton(() => JoinToBattleCase(sl()));
  sl.registerLazySingleton(() => MyActiveBattlesCase(sl()));
  sl.registerLazySingleton<BattleInterface>(() => BattleRepository(sl()));
  sl.registerLazySingleton<BattleDataSourceInterface>(
      () => BattleDataSourceImpl());
}


Future<void> _careerSlInit() async {
  sl.registerLazySingleton(() => FinishCareerCase(sl()));
  sl.registerLazySingleton(() => GetCareerQuizCase(sl()));
  sl.registerLazySingleton(() => GetCareerQuizGroupListCase(sl()));
  sl.registerLazySingleton(() => GetCareerQuizzesCase(sl()));
  sl.registerLazySingleton(() => MyCareerAttemptsCase(sl()));
  sl.registerLazySingleton(() => PassCareerQuizCase(sl()));
  sl.registerLazySingleton(() => PayCareerCase(sl()));
  sl.registerLazySingleton(() => ResultCareerQuiz(sl()));
  sl.registerLazySingleton<CareerInterface>(() => CareerRepository(sl()));
  sl.registerLazySingleton<CareerDataSourceInterface>(
          () => CareerDataSourceImpl());
}

Future<void> _iutubeSlInit() async {
  sl.registerLazySingleton(() => GetAllVideosCase(sl()));
  sl.registerLazySingleton(() => GetMainVideosCase(sl()));
  sl.registerLazySingleton(() => GetVideoAuthorCase(sl()));
  sl.registerLazySingleton(() => GetVideoDetailCase(sl()));
  sl.registerLazySingleton<IUTubeInterface>(() => IUTubeRepository(sl()));
  sl.registerLazySingleton<IUTubeDataSourceInterface>(
          () => IUTubeDataSourceImpl());
}

Future<void> _forumSlInit() async {
  sl.registerLazySingleton(() => AllForumCase(sl()));
  sl.registerLazySingleton(() => CreateDiscussCase(sl()));
  sl.registerLazySingleton(() => CreateForumCase(sl()));
  sl.registerLazySingleton(() => GetForumCase(sl()));
  sl.registerLazySingleton(() => GetForumDiscussCase(sl()));
  sl.registerLazySingleton(() => RatingForumCase(sl()));
  sl.registerLazySingleton<ForumInterface>(() => ForumRepository(sl()));
  sl.registerLazySingleton<ForumDataSourceInterface>(
          () => ForumDataSourceImpl());
}