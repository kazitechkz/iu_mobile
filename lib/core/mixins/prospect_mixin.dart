import 'package:flutter/cupertino.dart';

mixin ProspectMixin {
  String? getProspectKk();
  String? getProspectRu();

  String getLocalizedProspect(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (locale.languageCode == 'kk') {
      return getProspectKk() ?? '';
    } else {
      return getProspectRu() ?? '';
    }
  }
}