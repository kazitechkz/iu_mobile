import 'package:flutter/cupertino.dart';

mixin ContentMixin {
  String? getContentKk();
  String? getContentRu();

  String getLocalizedContent(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getContentKk() ?? '';
    } else {
      return getContentRu() ?? '';
    }
  }
}