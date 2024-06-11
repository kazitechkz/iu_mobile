import 'package:flutter/cupertino.dart';

mixin ActivityMixin {
  String? getActivityKk();
  String? getActivityRu();

  String getLocalizedActivity(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getActivityKk() ?? '';
    } else {
      return getActivityRu() ?? '';
    }
  }
}