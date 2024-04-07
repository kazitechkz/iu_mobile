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
