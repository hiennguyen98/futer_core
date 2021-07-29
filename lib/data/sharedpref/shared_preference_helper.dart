
import 'package:Futer/data/sharedpref/preferences_defines.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  // constructor
  SharedPreferenceHelper();

  Future<String> get authToken async {
    return await _sharedPreferences.then((prefs){
      String authToken =  prefs.getString(PreferenceDefines.auth_token);
      return authToken;
    });
  }

  Future<bool> saveAuthToken(String authToken) async {
    return await _sharedPreferences.then((prefs){
      var setAuth = prefs.setString(PreferenceDefines.auth_token, authToken);
      return setAuth;
    });
  }

  Future<bool> removeAuthToken() async {
    return await _sharedPreferences.then((prefs){
      var removeAuth = prefs.remove(PreferenceDefines.auth_token);
      return removeAuth;
    });
  }

  /// LOGIN
  Future<bool> get isLoggedIn async {
    return await _sharedPreferences.then((prefs){
      bool isLogin =  prefs.getString(PreferenceDefines.IS_LOGGED_IN) ?? false;
      return isLogin;
    });
  }

  Future<bool> saveIsLoggedIn (bool value) async {
    return await _sharedPreferences.then((prefs){
      var setIsLoggedIn = prefs.setBool(PreferenceDefines.IS_LOGGED_IN, value);
      return setIsLoggedIn;
    });
  }

  /// LANGUAGE
  Future<String> get localeLanguage async {
    return await _sharedPreferences.then((prefs){
      String locale =  prefs.getString(PreferenceDefines.LOCALE_LANGUAGE);
      return locale;
    });
  }

  Future<bool> saveLocaleLanguage(String language) async {
    return await _sharedPreferences.then((prefs){
      var setLocale = prefs.setString(PreferenceDefines.LOCALE_LANGUAGE, language);
      return setLocale;
    });
  }


}