import 'package:flutter/cupertino.dart';

mixin RuleMixin {
  String? getRuleKk();
  String? getRuleRu();

  String getLocalizedRule(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getRuleKk() ?? '';
    } else {
      return getRuleRu() ?? '';
    }
  }
}