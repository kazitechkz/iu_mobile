class ApiConstant {
  static const String baseApiUrl = "http://192.168.0.127/api/";
  // static const String baseApiUrl = "http://192.168.0.104/api/";
  static const String backApiLogin = "${baseApiUrl}auth/login";
  static const String backApiRegister = "${baseApiUrl}auth/register";
  static const String backVerifyEmail = "${baseApiUrl}auth/verify-email";
  static const String backResetToken = "${baseApiUrl}auth/send-reset-token";
  static const String backResetPassword = "${baseApiUrl}auth/reset";
  static const String getAllStep = "${baseApiUrl}steps";
  static const String getAllSubjects = "${baseApiUrl}subjects";
  static const String userAttempts = "${baseApiUrl}user-attempts";
  static const String allAttemptTypes = "${baseApiUrl}attempt-types";
  static const String createAttempt = "${baseApiUrl}attempt";
  static const String getAttemptById = "${baseApiUrl}attempt_by/";
  static const String answer = "${baseApiUrl}answer";
  static const String answerResult = "${baseApiUrl}answer-result/";
  static const String getAttemptByPromoCode =
      "${baseApiUrl}attempt-by-promo-code/";
  static const String finishAttempt = "${baseApiUrl}finish/";
  static const String getStatAttemptById =
      "${baseApiUrl}statistics-attempt-by/";
  static const String getUntStat = "${baseApiUrl}user-unt-statistics";
  static const String saveQuestion = "${baseApiUrl}save-question/";
  static const String getAllTournament = "${baseApiUrl}tournaments-all";
  static const String getListTournament = "${baseApiUrl}tournaments-list";
  static const String getTournamentDetail = "${baseApiUrl}tournament-detail/";
  static const String getSubTournamentDetail =
      "${baseApiUrl}sub-tournament-detail/";
  static const String createTournamentAttempt =
      "${baseApiUrl}tournament-attempt";
  static const String payTournament = "${baseApiUrl}pay-tournament";
  static const String getSubTournamentParticipants =
      "${baseApiUrl}sub-tournament-participants/";
  static const String participateTournament =
      "${baseApiUrl}participate-tournament";
  static const String getSubTournamentResults =
      "${baseApiUrl}sub-tournament-results/";
  static const String getSubTournamentRivals =
      "${baseApiUrl}sub-tournament-rivals/";
  static const String getTournamentAwards = "${baseApiUrl}tournament-awards/";
  static const String getSubTournamentWinners =
      "${baseApiUrl}sub-tournament-winners/";
  static const String battleCreate = "${baseApiUrl}battle-create";
  static const String getBattleByPromoCode = "${baseApiUrl}battle/";
  static const String getBattleHistory = "${baseApiUrl}battle-history";
  static const String myActiveBattles = "${baseApiUrl}my-active-battles";
  static const String getBattleStats = "${baseApiUrl}battle-stats";
  static const String getActiveBattles = "${baseApiUrl}battles";
  static const String joinToBattle =
      "${baseApiUrl}join-to-battle-by-promo-code";
  static const String getBattleSubjects = "${baseApiUrl}battle-subjects/";
  static const String battleStepCreate = "${baseApiUrl}battle-step-create";
  static const String getBattleStep = "${baseApiUrl}battle-by-step/";
  static const String battleAnswer = "${baseApiUrl}battle-by-step-answer";
  static const String getBattleQuestionsByPromoCode =
      "${baseApiUrl}battle-questions/";
  static const String finishBattleResult = "${baseApiUrl}battle-finish-result/";
  static const String getCareerQuizzes = "${baseApiUrl}career-quizzes";
  static const String getCareerQuizDetail = "${baseApiUrl}career-quiz-detail/";
  static const String getCareerQuizGroupList =
      "${baseApiUrl}career-quiz-groups-list";
  static const String myCareerAttempts = "${baseApiUrl}my-career-attempts";
  static const String passCareerQuiz = "${baseApiUrl}pass-career-quiz/";
  static const String resultCareerQuiz = "${baseApiUrl}result-career-quiz/";
  static const String payCareer = "${baseApiUrl}pay-career";
  static const String finishCareerQuiz = "${baseApiUrl}finish-career-quiz";
  static const String getAllVideos = "${baseApiUrl}all-videos";
  static const String getMainVideos = "${baseApiUrl}main-videos";
  static const String getVideoAuthor = "${baseApiUrl}video-author-detail/";
  static const String getVideoDetail = "${baseApiUrl}video-detail/";
  static const String allForum = "${baseApiUrl}forum/index";
  static const String createDiscuss = "${baseApiUrl}discuss/create";
  static const String forumCreate = "${baseApiUrl}forum/create";
  static const String getForum = "${baseApiUrl}forum/show/";
  static const String getForumDiscuss = "${baseApiUrl}forum/discuss/";
  static const String ratingForum = "${baseApiUrl}forum/rating";
  static const String getAllNews = "${baseApiUrl}all-news";
  static const String getImportantNews = "${baseApiUrl}important-news";
  static const String getSingleNews = "${baseApiUrl}single-news/";
}
