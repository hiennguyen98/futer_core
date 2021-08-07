
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtil {

  static pushPage(BuildContext context,
      {@required Widget page,
      bool fullscreenDialog = false,
      Function(dynamic) onThen}) {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (_)=> page, fullscreenDialog: fullscreenDialog))
        .then((value) => onThen != null ? onThen(value) : null);
  }

  static pushAndRemoveUntil(BuildContext context,
    {@required Widget page, bool fullScreenDialog = true}) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page, fullscreenDialog:  fullScreenDialog),
            (_)=> false
    );
  }

  static void pushReplacementPage(BuildContext context, {@required String pageName}) {
    if(context == null || pageName.isEmpty) return;
    Navigator.pushReplacementNamed(context, pageName);
  }
  
  static popPage(BuildContext context, {dynamic data}) {
    Navigator.of(context).pop(data);
  }
  
  static popToRoot(BuildContext context, {@required String rootRoute}) {
    Navigator.popUntil(context, ModalRoute.withName(rootRoute));
  }
}