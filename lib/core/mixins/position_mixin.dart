import 'package:flutter/cupertino.dart';

mixin PositionMixin {
  String? getPositionKk();
  String? getPositionRu();

  String getLocalizedDescription(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getPositionKk() ?? '';
    } else {
      return getPositionRu() ?? '';
    }
  }
}