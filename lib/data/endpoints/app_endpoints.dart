class Endpoints {
  /// AUTHENTICATION
  static const String _AUTHENTICATION = '/v1/authentication/';
  static const String LOGOUT = _AUTHENTICATION + 'logout';
  static const String REFRESHER_TOKEN = _AUTHENTICATION + 'refresh_token';
  static const String LOGIN = _AUTHENTICATION + 'login';
  static const String REGISTER = _AUTHENTICATION +'register';
}