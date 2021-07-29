
import 'package:Futer/common/enumeration.dart';
import 'package:Futer/generated/l10n.dart';
import 'package:Futer/screens/settings/lanuage_setting.dart';
import 'package:flutter/cupertino.dart';

class CustomAppLocalizationDelegate extends LocalizationsDelegate<S> {
  final LanguageSetting languageSetting;

  CustomAppLocalizationDelegate(this.languageSetting);

  @override
  bool isSupported(Locale locale) {
    return languageSetting != null ;
  }

  @override
  Future<S> load(Locale locale) {
    if(languageSetting.availableLanguage == AvailableLanguage.DEFAULT) {
      return S.load(locale);
    }
    return S.load(Locale(languageSetting.getLocaleString()));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<S> old) {
   return true;
  }


}