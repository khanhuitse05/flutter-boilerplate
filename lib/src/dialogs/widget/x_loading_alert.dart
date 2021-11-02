import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/router/coordinator.dart';

String _dialogMessage = '';
StreamController<String> _streamController =
    StreamController<String>.broadcast();

_XLoadingAlert? _progressDialog;

Future<void> showLoading({String message = ''}) async {
  if (_progressDialog == null) {
    _progressDialog = _XLoadingAlert();
    _dialogMessage = message;
    return _progressDialog?.show(XCoordinator.context);
  }
}

void hideLoading() {
  if (_progressDialog != null) {
    _streamController.add('close');
  }
}

void updateLoading(String message) {
  _dialogMessage = message;
  _streamController.add(message);
}

class _XLoadingAlert {
  _XLoadingAlert();

  void _hide(BuildContext context) {
    Navigator.of(context).pop();
    _progressDialog = null;
  }

  void show(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: StreamBuilder<String>(
            initialData: _dialogMessage,
            stream: _streamController.stream,
            builder: (_, snapshot) {
              if (snapshot.data == 'close') {
                _hide(context);
              }
              return Center(
                child: Container(
                  width: _dialogMessage.isEmpty ? 80 : 130,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: _dialogMessage.isEmpty ? 80 : null,
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: kIsWeb || Platform.isAndroid
                            ? SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation(
                                      Theme.of(context).primaryColor),
                                ),
                              )
                            : const CupertinoActivityIndicator(
                                radius: 15,
                              ),
                      ),
                      if (_dialogMessage.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          width: double.infinity,
                          child: Text(
                            _dialogMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
