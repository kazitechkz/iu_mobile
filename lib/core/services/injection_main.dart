part of 'injection_main.container.dart';

final sl = GetIt.instance;

Future<void> slInit() async {
  await _hiveSLInit();
  await _dioSLInit();
  await _welcomeSLInit();
  await _authSLInit();
  await _stepSLInit();
  await _untSlInit();
  await _singleUntSlInit();
  await _attemptSlInit();
  await _tournamentSlInit();
  await _battleSlInit();
  await _careerSlInit();
  await _iutubeSlInit();
  await _forumSlInit();
  await _newsSlInit();
  await _notificationSlInit();
  await _statSlInit();
  await _factSLInit();
  await _subjectSLInit();
  await _categorySLInit();
  await _subCategorySLInit();
  await _techSupportSlInit();
  await _appealSLInit();
  await _accountSlInit();
  await _questionSlInit();
  await _attemptSettingsSLInit();
  await _openAiSLInit();
}

Future<void> _hiveSLInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AuthUserHiveAdapter());
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}

Future<void> _dioSLInit() async {
  BaseOptions options = BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    headers: {'Accept': "application/json"},
    contentType: "application/json;charset=utf-8",
    responseType: ResponseType.json,
  );
  final dio = Dio(options);
  dio.options.headers['Accept'] = 'application/json, text/plain, */*';
  dio.options.responseType = ResponseType.json;
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
  sl.registerFactory(() => StepDetailBloc(stepDetailUseCase: sl<StepDetailUseCase>()));
  sl.registerLazySingleton(() => StepUseCase(sl()));
  sl.registerLazySingleton(() => StepDetailUseCase(sl()));
  sl.registerLazySingleton<StepInterface>(() => StepRepository(sl()));
  sl.registerLazySingleton<StepDataSourceInterface>(() => StepDataSourceImpl());

  sl.registerLazySingleton(() => SubStepUseCase(sl()));
  sl.registerLazySingleton(() => SubStepDetailUseCase(sl()));
  sl.registerLazySingleton(() => PassSubStepExamUseCase(sl()));
  sl.registerLazySingleton<SubStepInterface>(() => SubStepRepository(sl()));
  sl.registerLazySingleton<SubStepDataSourceInterface>(
      () => SubStepDataSourceImpl());
}

Future<void> _factSLInit() async {
  sl.registerLazySingleton(() => FactUseCase(sl()));
  sl.registerLazySingleton<FactInterface>(() => FactRepository(sl()));
  sl.registerLazySingleton<FactDatasourceInterface>(() => FactDatasourceImpl());
}

Future<void> _openAiSLInit() async {
  sl.registerLazySingleton(() => OpenAiUseCase(sl()));
  sl.registerLazySingleton<OpenAiInterface>(() => OpenAiRepository(sl()));
  sl.registerLazySingleton<OpenAiDatasourceInterface>(
      () => OpenAiDatasourceImpl());
}

Future<void> _attemptSettingsSLInit() async {
  sl.registerLazySingleton(() => CreateAttemptSettingUseCase(sl()));
  sl.registerLazySingleton(() => MyAttemptSettingSingleUseCase(sl()));
  sl.registerLazySingleton(() => MyAttemptSettingsUntUseCase(sl()));
  sl.registerLazySingleton<AttemptSettingInterface>(
      () => AttemptSettingRepository(sl()));
  sl.registerLazySingleton<AttemptSettingDatasourceInterface>(
      () => AttemptSettingDatasourceImpl());
}

Future<void> _appealSLInit() async {
  // sl.registerFactory(() => AppealBloc(stepUseCase: sl<StepUseCase>()));
  sl.registerLazySingleton(() => AppealTypeUseCase(sl()));
  sl.registerLazySingleton(() => CreateAppealUseCase(sl()));
  sl.registerLazySingleton(() => AppealUseCase(sl()));
  sl.registerLazySingleton(() => AppealByIdCase(sl()));
  sl.registerLazySingleton<AppealInterface>(() => AppealRepository(sl()));
  sl.registerLazySingleton<AppealDatasourceInterface>(
      () => AppealDatasourceInterfaceImpl());
}

Future<void> _subjectSLInit() async {
  // sl.registerFactory(() => SubjectBloc(stepUseCase: sl<StepUseCase>()));
  sl.registerLazySingleton(() => SubjectUseCase(sl()));
  sl.registerLazySingleton<SubjectInterface>(() => SubjectRepository(sl()));
  sl.registerLazySingleton<SubjectDatasourceInterface>(
      () => SubjectDatasourceImpl());
}

Future<void> _categorySLInit() async {
  // sl.registerFactory(() => CategoryBloc(stepUseCase: sl<StepUseCase>()));
  sl.registerLazySingleton(() => CategoryUseCase(sl()));
  sl.registerLazySingleton<CategoryInterface>(() => CategoryRepository(sl()));
  sl.registerLazySingleton<CategoryDatasourceInterface>(
      () => CategoryDatasourceImpl());
}

Future<void> _subCategorySLInit() async {
  // sl.registerFactory(() => SubCategoryBloc(stepUseCase: sl<StepUseCase>()));
  sl.registerLazySingleton(() => SubCategoryUseCase(sl()));
  sl.registerLazySingleton<SubCategoryInterface>(
      () => SubCategoryRepository(sl()));
  sl.registerLazySingleton<SubCategoryDatasourceInterface>(
      () => SubCategoryDatasourceImpl());
}

Future<void> _untSlInit() async {
  sl.registerFactory(() => UntFullBloc(
      getSubjectsCase: sl<GetSubjectsCase>(),
      createAttemptCase: sl<CreateAttemptCase>()));
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
  sl.registerFactory(() => PassAttemptBloc(
        attemptCase: sl<GetAttemptCase>(),
        answerCase: sl<AnswerCase>(),
        answerResultCase: sl<AnswerResultCase>(),
        finishAttemptCase: sl<FinishAttemptCase>(),
      ));
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

Future<void> _newsSlInit() async {
  sl.registerLazySingleton(() => AllNewsCase(sl()));
  sl.registerLazySingleton(() => GetImportantNewsCase(sl()));
  sl.registerLazySingleton(() => GetSingleNewsCase(sl()));
  sl.registerLazySingleton<NewsInterface>(() => NewsRepository(sl()));
  sl.registerLazySingleton<NewsDataSourceInterface>(() => NewsDataSourceImpl());
}

Future<void> _notificationSlInit() async {
  sl.registerLazySingleton(() => CheckNotificationCase(sl()));
  sl.registerLazySingleton(() => GetNotificationAllCase(sl()));
  sl.registerLazySingleton(() => GetNotificationTypeCase(sl()));
  sl.registerLazySingleton(() => GetUnreadMessageCountCase(sl()));
  sl.registerLazySingleton(() => MyNotificationIdsCase(sl()));
  sl.registerLazySingleton<NotificationInterface>(
      () => NotificationRepository(sl()));
  sl.registerLazySingleton<NotificationDataSourceInterface>(
      () => NotificationDataSourceImpl());
}

Future<void> _statSlInit() async {
  sl.registerLazySingleton(() => FullStatCase(sl()));
  sl.registerLazySingleton(() => ResultByAttemptIdCase(sl()));
  sl.registerLazySingleton(() => StatByAttemptIdCase(sl()));
  sl.registerLazySingleton(() => StatBySubjectIdCase(sl()));
  sl.registerLazySingleton<StatInterface>(() => StatRepository(sl()));
  sl.registerLazySingleton<StatDataSourceInterface>(() => StatDataSourceImpl());
  sl.registerFactory(() => StatMainBloc(
      getUntStatCase: sl<GetUntStatCase>(),
      allAttemptsCase: sl<AllAttemptsCase>()));
  sl.registerFactory(() =>
      AttemptResultBloc(resultByAttemptIdCase: sl<ResultByAttemptIdCase>()));
  sl.registerFactory(
      () => StatAttemptBloc(statByAttemptIdCase: sl<StatByAttemptIdCase>()));
  sl.registerFactory(() => FullStatBloc(
        fullStatCase: sl<FullStatCase>(),
        subjectUseCase: sl<SubjectUseCase>(),
        allAttemptTypesCase: sl<AllAttemptTypesCase>(),
      ));
}

Future<void> _techSupportSlInit() async {
  sl.registerLazySingleton(() => CloseTechSupportTicketCase(sl()));
  sl.registerLazySingleton(() => CreateTechSupportMessageCase(sl()));
  sl.registerLazySingleton(() => CreateTechSupportTicketCase(sl()));
  sl.registerLazySingleton(() => GetMyTechSupportTicketsCase(sl()));
  sl.registerLazySingleton(() => GetTechSupportCategoriesCase(sl()));
  sl.registerLazySingleton(() => GetTechSupportTicketDetailCase(sl()));
  sl.registerLazySingleton(() => GetTechSupportTypesCase(sl()));
  sl.registerLazySingleton<TechSupportInterface>(
      () => TechSupportRepository(sl()));
  sl.registerLazySingleton<TechSupportDataSourceInterface>(
      () => TechSupportDataSourceImpl());
}

Future<void> _accountSlInit() async {
  sl.registerLazySingleton(() => AccountCase(sl()));
  sl.registerLazySingleton(() => AccountChangeCase(sl()));
  sl.registerLazySingleton(() => FindUserByEmailCase(sl()));
  sl.registerLazySingleton<UserInterface>(() => UserRepository(sl()));
  sl.registerLazySingleton<UserDataSourceInterface>(() => UserDataSourceImpl());
}

Future<void> _questionSlInit() async {
  sl.registerLazySingleton(() => GetCategoryQuestionCase(sl()));
  sl.registerLazySingleton(() => GetMySavedQuestionByIdCase(sl()));
  sl.registerLazySingleton(() => GetMySavedQuestionsCase(sl()));
  sl.registerLazySingleton(() => GetSubCategoryQuestionCountCase(sl()));
  sl.registerLazySingleton<QuestionInterface>(() => QuestionRepository(sl()));
  sl.registerLazySingleton<QuestionDataSourceInterface>(
      () => QuestionDataSourceImpl());
}

Future<void> _singleUntSlInit() async {
  sl.registerFactory(() => UntSingleBloc(
      getSubjectsCase: sl<GetSubjectsCase>(),
      createAttemptCase: sl<CreateAttemptCase>()));
}
