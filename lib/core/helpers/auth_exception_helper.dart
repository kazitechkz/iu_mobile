import 'package:iu/core/errors/exception.dart';

AuthException parseApiException(String input) {
  // Регулярное выражение для извлечения значений
  final RegExp regExp = RegExp(r'{token: (.*?), role: (.*?), user: (.*?), isFirst: (.*?), redirectURL: (.*)}');
  final Match? match = regExp.firstMatch(input);

  if (match != null) {
    final String token = match.group(1)?.trim() ?? '';
    final String role = match.group(2)?.trim() ?? '';
    final String user = match.group(3)?.trim() ?? '';
    final bool isFirst = match.group(4)?.trim() == 'false' ? false : true;
    final String redirectURL = match.group(5)?.trim() ?? '';

    return AuthException(
      redirectURL: redirectURL
    );
  } else {
    throw const FormatException('The input string does not match the expected format');
  }
}

String extractRedirectURL(String input) {
  // Регулярное выражение для извлечения URL из строки
  final RegExp regExp = RegExp(r'redirectURL: (https?://[^\s]+)');

  final Match? match = regExp.firstMatch(input);

  if (match != null) {
    return match.group(1) ?? '';
  } else {
    return '';
  }
}