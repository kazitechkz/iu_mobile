import 'package:flutter/cupertino.dart';

mixin ProgressMixin {
  int? getProgressKk();
  int? getProgressRu();

  int getLocalizedProgress(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getProgressKk() ?? 0;
    } else {
      return getProgressRu() ?? 0;
    }
  }
}