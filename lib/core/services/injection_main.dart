part of 'injection_main.container.dart';

final sl = GetIt.instance;

Future<void> slInit() async{
  await _commonSLInit();
  await _welcomeSLInit();
}


Future<void> _commonSLInit() async {
  final dio = Dio();
  await Hive.initFlutter();
  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}

Future<void> _welcomeSLInit() async {
  //Bloc
  sl.registerFactory(() => WelcomeBloc(cacheVisitedCase: sl<CacheVisitedCase>(), checkIsFirstTimeCase: sl<CheckIsFirstTimeCase>()));
  //Cases
  sl.registerLazySingleton(() => CacheVisitedCase(sl()));
  sl.registerLazySingleton(() => CheckIsFirstTimeCase(sl()));
  //Repository
  sl.registerLazySingleton<WelcomeInterface>(() => WelcomeRepository(sl()));
  //Data Source
  sl.registerLazySingleton<WelcomeDataSourceInterface>(() => WelcomeDataSourceImpl());
}

Future<void> _authSLInit() async {
  //Bloc
  sl.registerFactory(() => AuthBloc(
      signInCase: sl<SignInCase>(),
      signUpCase: sl<SignUpCase>(),
      verifyCase: sl<VerifyCase>(),
      forgetCase: sl<ForgetCase>(),
  ));
  //Cases
  sl.registerLazySingleton(() => ForgetCase(sl()));
  sl.registerLazySingleton(() => SignInCase(sl()));
  sl.registerLazySingleton(() => SignUpCase(sl()));
  sl.registerLazySingleton(() => VerifyCase(sl()));
  //Repository
  sl.registerLazySingleton<AuthInterface>(() => AuthRepository(sl()));
  //Data Source
  sl.registerLazySingleton<AuthDataSourceInterface>(() => AuthDataSourceImpl());
}