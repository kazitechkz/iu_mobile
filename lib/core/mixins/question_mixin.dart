import 'package:flutter/cupertino.dart';

mixin QuestionMixin {
  String? getQuestionKk();
  String? getQuestionRu();

  String getLocalizedQuestion(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getQuestionKk() ?? '';
    } else {
      return getQuestionRu() ?? '';
    }
  }
}