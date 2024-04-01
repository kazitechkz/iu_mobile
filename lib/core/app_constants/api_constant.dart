class ApiConstant{
  static const String baseApiUrl = "http://192.168.0.127/api/";
  // static const String baseApiUrl = "http://192.168.0.104/api/";
  static const String backApiLogin = "${baseApiUrl}auth/login";
  static const String backApiRegister = "${baseApiUrl}auth/register";
  static const String backVerifyEmail = "${baseApiUrl}auth/verify-email";
  static const String backResetToken = "${baseApiUrl}auth/send-reset-token";
  static const String backResetPassword = "${baseApiUrl}auth/reset";
}