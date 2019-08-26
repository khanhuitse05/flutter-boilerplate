import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _dialogMessage = "Loading...";

bool _isShowing = false;

class ProgressDialog {
  _MyDialog _dialog;

  BuildContext _buildContext, _context;

  ProgressDialog(BuildContext buildContext) {
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
      Navigator.of(contextHide??_context).pop();
      debugPrint('ProgressDialog dismissed');
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new _MyDialog();
      _isShowing = true;
      debugPrint('ProgressDialog shown');
      showDialog<dynamic>(
        context: _buildContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Material(
              type: MaterialType.transparency,
              child: Center(child: _dialog));
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
    debugPrint('ProgressDialog dismissed by back button');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 120,
        width: 140,
        color: Colors.black87,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 5,
                ),
              ),
              Container(
                height: 10,
              ),
              Text(_dialogMessage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))
            ]),
      ),
    );
  }
}
