import 'package:chat_app/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _dialogMessage = "Loading...";

bool _isShowing = false;

class ProgressDialog {
  _MyDialog _dialog;

  BuildContext _buildContext, _context;

  ProgressDialog(BuildContext buildContext, {String message = 'Loading...'}) {
    _dialogMessage = message;
    _buildContext = buildContext;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
  }

  void update(String message) {
    _dialogMessage = message;
    _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide({BuildContext contextHide}) {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(contextHide ?? _context).pop();
//      debugPrint('ProgressDialog dismissed');
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new _MyDialog();
      _isShowing = true;
//      debugPrint('ProgressDialog shown');
      showDialog<dynamic>(
        context: _buildContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Material(
              type: MaterialType.transparency, child: Center(child: _dialog));
        },
      );
    }
  }
}

// ignore: must_be_immutable
class _MyDialog extends StatefulWidget {
  var _dialog = new _MyDialogState();

  update() {
    _dialog.changeState();
  }

  @override
  // ignore: must_be_immutable
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  changeState() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _isShowing = false;
//    debugPrint('ProgressDialog dismissed by back button');
  }

  @override
  Widget build(BuildContext context) {
    final colorBG = Colors.black87;
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: colorBG,
        borderRadius: BorderRadius.all( Radius.circular(15), ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Container(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 5,
              ),
            ),
          ),

          /// Bottom
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            width: double.infinity,
            child: Text(
              _dialogMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: AppFonts.nuNiToSemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
