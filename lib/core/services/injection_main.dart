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