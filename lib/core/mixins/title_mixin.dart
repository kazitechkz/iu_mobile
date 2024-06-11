import 'package:flutter/cupertino.dart';

mixin TitleMixin {
  String? getTitleKk();
  String? getTitleRu();



  String getLocalizedTitle(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getTitleKk() ?? '';
    } else {
      return getTitleRu() ?? '';
    }
  }
}