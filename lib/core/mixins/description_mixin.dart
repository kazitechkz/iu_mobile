import 'package:flutter/cupertino.dart';

mixin DescriptionMixin {
  String? getDescriptionKk();
  String? getDescriptionRu();

  String getLocalizedDescription(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getDescriptionKk() ?? '';
    } else {
      return getDescriptionRu() ?? '';
    }
  }
}