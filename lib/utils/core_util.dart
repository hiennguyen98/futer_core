
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CoreUtils {
  static const double EDIT_HEIGHT = 40.0;

  static const textScaleFactor = 1.0;

  static MediaQueryData getMediaQueryData(BuildContext context) {
    return MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor , devicePixelRatio: 3.0);
  }

  static bool isNullOrEmpty (dynamic v) {
    return v == null || v.toString().trim().isEmpty;
  }

  static toJson(Object _data){
    return json.encode(_data);
  }

  static toMap(String _data){
    return json.decode(_data);
  }
}