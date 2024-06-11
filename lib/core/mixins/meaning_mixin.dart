import 'package:flutter/cupertino.dart';

mixin MeaningMixin {
  String? getMeaningKk();
  String? getMeaningRu();

  String getLocalizedMeaning(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getMeaningKk() ?? '';
    } else {
      return getMeaningRu() ?? '';
    }
  }
}