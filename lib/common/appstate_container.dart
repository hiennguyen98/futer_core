
import 'package:Futer/common/enumeration.dart';
import 'package:Futer/data/sharedpref/shared_preference_helper.dart';
import 'package:Futer/screens/settings/lanuage_setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
      Key key,
    @required this.data,
    @required Widget child
  });


  @override
  bool updateShouldNotify(_InheritedStateContainer old) {
    return true;
  }

}

class StateContainer extends StatefulWidget {
  final Widget child;

  StateContainer({@required this.child});

  static StateContainerState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType() as _InheritedStateContainer).data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  // THEME

  // LANGUAGE
  LanguageSetting curLanguage = LanguageSetting(AvailableLanguage.DEFAULT);

  // CURRENCY
  String currencyLocal;
  Locale deviceLocale = Locale('vi', 'VI');

  _getLanguage() async {
    String langEnumStr = await SharedPreferenceHelper().localeLanguage ??
        AvailableLanguage.DEFAULT.toString();
    AvailableLanguage lang;
    for(AvailableLanguage aLang in AvailableLanguage.values) {
      if(aLang.toString() == langEnumStr) {
        lang = aLang;
        break;
      }
    }

    setState(() {
      curLanguage = LanguageSetting(lang);
    });
  }

  setLanguage(LanguageSetting language) async {
    await SharedPreferenceHelper().saveLocaleLanguage(language.getId());
  }

  // Change language
  void _updateLanguage(LanguageSetting language) {
    setState(() {
      curLanguage = language;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
