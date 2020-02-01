import 'package:chat_app/core/utility.dart';
import 'package:chat_app/ui/utility/progress_dialog.dart';
import 'package:flutter/material.dart';

class AppPopup {

  static TextStyle styleTitle({Color color = Colors.black87}) {
    return TextStyle(
        color: color, fontWeight: FontWeight.w500, fontSize: 16);
  }

  static TextStyle styleBody({Color color = Colors.black87}) {
    return TextStyle(
        color: color, fontWeight: FontWeight.w400, fontSize: 14);
  }

  static Future<void> showImageDialog(BuildContext context,
      {String title,
      Widget image,
      ButtonData btnHighlight,
      ButtonData btnNormal,
      bool barrierDismissible = true}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        List<Widget> _actions = new List();
        if (btnNormal != null) {
          _actions.add(
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: btnNormal.buildNormal(context),
            ),
          );
        }
        if (btnHighlight != null) {
          _actions.add(
            Container(
              margin: EdgeInsets.only(
                bottom: 10,
                right: 10,
                left: 10,
              ),
              child: btnHighlight.buildHighlight(context),
            ),
          );
        }

        return AlertDialog(
          title: Container(width: 64, height: 64, child: image),
          content: Text(
            title ?? '',
            style: styleTitle(),
            textAlign: TextAlign.center,
          ),
          actions: _actions,
        );
      },
    );
  }

  static Future<void> showCustomDialog(BuildContext context,
      {String title,
      Widget titleWidget,
      String message,
      Widget messageWidget,
      ButtonData btnHighlight,
      ButtonData btnNormal,
      bool barrierDismissible = true}) async {
    List<Widget> _actions = new List();
    if (btnNormal != null) {
      _actions.add(
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: btnNormal.buildNormal(context),
        ),
      );
    }
    if (btnHighlight != null) {
      _actions.add(
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: btnHighlight.buildHighlight(context),
        ),
      );
    }

    if (titleWidget == null && Utility.isNullOrEmpty(title) == false) {
      titleWidget = Text(
        title,
        style: styleTitle(),
        textAlign: TextAlign.center,
      );
    }
    if (messageWidget == null &&
        Utility.isNullOrEmpty(message) == false) {
      messageWidget = Text(
        message,
        style: styleBody(),
        textAlign: TextAlign.center,
      );
    }

    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: titleWidget,
          content: messageWidget,
          actions: _actions,
        );
      },
    );
  }

  static Future<void> showComplexDialog(BuildContext context,
      {String title,
      String body,
      Widget image,
      ButtonData btnHighlight,
      ButtonData btnNormal,
      bool closeButton = true,
      bool barrierDismissible = true}) async {
    return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// Image
                image != null
                    ? Container(
                        height: 100,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            image,
                            closeButton
                                ? Container(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black87,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      )
                    : Container(
                        height: 20,
                      ),
                Utility.isNullOrEmpty(title)
                    ? Container()
                    : Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Text(
                          title,
                          style: styleTitle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                Utility.isNullOrEmpty(body)
                    ? Container()
                    : Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Text(
                          body,
                          style: styleBody(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
                  child: Row(
                    mainAxisAlignment: btnNormal == null
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.end,
                    children: <Widget>[
                      btnHighlight != null
                          ? Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 40,
                              child: btnHighlight.buildHighlight(context),
                            )
                          : Container(),
                      btnNormal != null
                          ? Container(
                              height: 40,
                              child: btnNormal.buildNormal(context),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonData {
  ButtonData({this.title, this.callback});

  static TextStyle styleButton({Color color}) {
    return TextStyle(
        color: color, fontWeight: FontWeight.w500, fontSize: 14);
  }

  String title;
  VoidCallback callback;

  Widget buildNormal(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: styleButton(color: Colors.black87),
      ),
      onPressed: () {
        Navigator.pop(context);
        if (callback != null) callback();
      },
    );
  }

  Widget buildHighlight(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: styleButton(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
        if (callback != null) callback();
      },
    );
  }
}

ProgressDialog _progressDialog;

showLoading(context, {message = 'Loading...'}) {
  if (_progressDialog == null) {
    _progressDialog = ProgressDialog(context, message: message)..show();
  }
}

hideLoading(context) {
  if (_progressDialog != null) {
    _progressDialog.hide(context);
    _progressDialog = null;
  }
}

updateLoading(String message) {
  if (_progressDialog != null) {
    _progressDialog.updateMessage(message);
  }
}
