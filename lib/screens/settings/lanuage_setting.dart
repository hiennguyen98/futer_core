

import 'package:Futer/common/enumeration.dart';
import 'package:Futer/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class LanguageSetting {

  AvailableLanguage availableLanguage;

  LanguageSetting(this.availableLanguage);

  String getDisplayName(BuildContext context) {
    switch (availableLanguage) {
      case AvailableLanguage.ENGLISH:
        return 'English (en)';
        break;
      case AvailableLanguage.VIETNAMESE:
        return 'Tiếng Việt (vi)';
        break;
      default:
        return null;
    }
  }

  String getLocaleString() {
    switch(availableLanguage) {
      case AvailableLanguage.ENGLISH:
        return 'en';
        break;
      case AvailableLanguage.VIETNAMESE:
        return 'vi';
        break;
      default:
        return 'DEFAULT';
    }
  }

  Locale getLocale() {
    String localeStr = getLocaleString();
    if(localeStr == 'DEFAULT') {
      return Locale('en');
    }
    return Locale(localeStr);
  }

  String getId() {
    return availableLanguage.toString();
  }
}