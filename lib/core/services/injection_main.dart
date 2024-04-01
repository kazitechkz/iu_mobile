part of 'injection_main.container.dart';

final sl = GetIt.instance;

Future<void> slInit() async {
  await _hiveSLInit();
  await _dioSLInit();
  await _welcomeSLInit();
  await _authSLInit();
  await _stepSLInit();
}

Future<void> _hiveSLInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AuthUserHiveAdapter());
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}

Future<void> _dioSLInit() async {
  final dio = Dio();
  dio.options.headers['Accept'] = 'application/json';
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
