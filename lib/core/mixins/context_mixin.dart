import 'package:flutter/cupertino.dart';

mixin ContextMixin {
  String? getContextKk();
  String? getContextRu();

  String getLocalizedContext(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getContextKk() ?? '';
    } else {
      return getContextRu() ?? '';
    }
  }
}