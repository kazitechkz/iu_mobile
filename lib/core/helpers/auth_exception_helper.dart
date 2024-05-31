import 'package:iu/core/errors/exception.dart';

AuthException parseApiException(String input) {
  // Регулярное выражение для извлечения значений
  final RegExp regExp = RegExp(r'ApiException\(\{token: (.*?), role: (.*?), user: (.*?), isFirst: (.*?), redirectURL: (.*?)}\), (\d+), (null|\{.*\})');

  final Match? match = regExp.firstMatch(input);

  if (match != null) {
    final String token = match.group(1) ?? '';
    final String role = match.group(2) ?? '';
    final String user = match.group(3) ?? 'null';
    final bool isFirst = match.group(4) == 'true';
    final String redirectURL = match.group(5) ?? '';
    final int errorCode = int.parse(match.group(6) ?? '0');
    final dynamic errorDetails = match.group(7) == 'null' ? null : match.group(7);

    return AuthException(
      token: token,
      role: role,
      user: user == 'null' ? null : user,
      isFirst: isFirst,
      redirectURL: redirectURL,
      errorCode: errorCode,
      errorDetails: errorDetails,
    );
  } else {
    throw const FormatException('The input string does not match the expected format');
  }
}