import 'dart:async';
import 'package:my_app/src/dialog/toast_service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebScreen extends StatelessWidget {
  WebScreen(this.url);

  final String url;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(url),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/web-view',
                  arguments: url);
            },
          ),
        ],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: _controller.complete,
        javascriptChannels: {
          _toasterJavascriptChannel(context),
        },
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'ABCD',
      onMessageReceived: (message) {
        Toast.show(message.message);
      },
    );
  }
}
