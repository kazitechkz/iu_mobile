import 'package:flutter/cupertino.dart';

class LocalizationHelper {
  static String getTitle(BuildContext context, String titleKk, String titleRu) {
    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return titleKk;
    } else {
      return titleRu;
    }
  }
}