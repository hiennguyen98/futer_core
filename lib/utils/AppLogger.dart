import 'package:flutter/foundation.dart';

class AppLogger {
  static int level = 0;
  static String appName = 'Futer';

  static void log(Object object) {
    if (kDebugMode) {
      print('[Logger-$appName] ${object.toString()}');
    }
  }
}