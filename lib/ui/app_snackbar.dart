import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static const _duration = Duration(seconds: 2, microseconds: 0);

  /// request Scaffold
  static showSnackBar(context, message, {duration = _duration}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
      duration: duration,
    ));
  }

  static Widget showFlushbar(context, message, {duration = _duration}) {
    return Flushbar(
      padding: const EdgeInsets.all(0),
//      forwardAnimationCurve: Curves.easeOutQuart,
      animationDuration: const Duration(milliseconds: 500),
      messageText: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        alignment: AlignmentDirectional.center,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      duration: duration,
    )..show(context);
  }

  // k_added_to_list
  static Widget showHighlightTopMessage(BuildContext context, String message) {
    return Flushbar(
      margin: const EdgeInsets.only(top: 55),
      padding: const EdgeInsets.all(0),
      forwardAnimationCurve: Curves.easeOutQuart,
      animationDuration: const Duration(milliseconds: 500),
      messageText: Container(
        color: Color(0xFFE5F6D1),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
              alignment: AlignmentDirectional.center,
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              height: 1.5,
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: Duration(seconds: 1, microseconds: 500),
    )..show(context);
  }
}
