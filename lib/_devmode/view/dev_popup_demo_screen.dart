import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping9/ping9.dart';

class DevPopupDemoScreen extends StatefulWidget {
  @override
  _DevPopupDemoScreenState createState() => _DevPopupDemoScreenState();
}

class _DevPopupDemoScreenState extends State<DevPopupDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popup'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FlatButton(onPressed: _showPopup, child: const Text("Show popup")),
          FlatButton(
              onPressed: _showLoading, child: const Text("Show loading")),
        ],
      ),
    );
  }

  Future _showPopup() async {
    Get.find<DialogService>().showConfirmDialog(
      title: "Hello!",
      body: "This is demo popup",
      actions: [
        DialogButton(
            title: "Yes",
            onPressed: () {
              Toast.show('Pressed Yes');
            }),
        DialogButton(title: "No"),
      ],
    );
  }

  Future _showLoading() async {
    showLoading(context, message: "Loading");
    await Future.delayed(const Duration(seconds: 1));
    updateLoading("90%");
    await Future.delayed(const Duration(seconds: 1));
    updateLoading("Finished");
    await Future.delayed(const Duration(seconds: 1));
    hideLoading(context);
  }
}
