import 'package:flutter/cupertino.dart';

mixin TextMixin {
  String? getTextKk();
  String? getTextRu();

  String getLocalizedText(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getTextKk() ?? '';
    } else {
      return getTextRu() ?? '';
    }
  }
}