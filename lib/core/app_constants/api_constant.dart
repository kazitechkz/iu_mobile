class ApiConstant {
  // static const String baseApiUrl = "http://10.0.2.2:8000/api/";
  static const String baseApiUrl = "http://192.168.0.104/api/";
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
}
