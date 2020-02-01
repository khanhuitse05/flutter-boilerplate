import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _dialogMessage = '';

bool _isShowing = false;
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

class ProgressDialog {
  _MyDialog _dialog;

  BuildContext _buildContext;

  ProgressDialog(BuildContext buildContext, {String message = 'Loading...'}) {
    _dialogMessage = message;
    _buildContext = buildContext;
  }

  void updateMessage(String message) {
    _dialogMessage = message;
    _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide(BuildContext context) {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(context).pop();
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new _MyDialog();
      _isShowing = true;
      showDialog<dynamic>(
        context: _buildContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
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
  }

  @override
  Widget build(BuildContext context) {
    final colorBG = Colors.black87;
    return Container(
      width: _dialogMessage.isEmpty ? 80 : 130,
      decoration: BoxDecoration(
        color: colorBG,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
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
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
              ),
            ),
          ),

          /// Bottom
          _dialogMessage.isEmpty
              ? SizedBox()
              : Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            width: double.infinity,
            child: Text(
              _dialogMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
