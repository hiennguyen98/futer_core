
import 'package:Futer/common/enumeration.dart';

class AppConfig {
//[START] App config
  static const String APP_NAME = "Goter";
  static const APP_ENVIRONMENT = AppEnvironments.develop;//Setting eviroment application
//[END] App config
}

const APIConfig = {
  AppEnvironments.demo : 'https://demo.com.vn',
  AppEnvironments.develop : 'https://dev.com.vn',
  AppEnvironments.staging : 'https://staging.com.vn',
  AppEnvironments.production : 'https://production.com.vn',
};