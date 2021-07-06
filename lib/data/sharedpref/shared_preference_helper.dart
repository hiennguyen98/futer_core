
import 'package:Futer/data/sharedpref/preferences_defines.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final SharedPreferences _sharedPreferences;

  // constructor
  SharedPreferenceHelper(this._sharedPreferences);

  Future<String> get authToken async {
    return _sharedPreferences.getString(PreferenceDefines.auth_token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreferences.setString(PreferenceDefines.auth_token, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreferences.remove(PreferenceDefines.auth_token);
  }

  /// LOGIN
  Future<bool> get isLoggedIn async {
    return _sharedPreferences.getBool(PreferenceDefines.IS_LOGGED_IN) ?? false;
  }

  Future<bool> saveIsLoggedIn (bool value) async {
    return _sharedPreferences.setBool(PreferenceDefines.IS_LOGGED_IN, value);
  }


}