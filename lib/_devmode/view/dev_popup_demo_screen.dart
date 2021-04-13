import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/dialog/model/dialog_model.dart';
import 'package:my_app/src/dialog/toast_service.dart';
import 'package:my_app/src/dialog/widget/app_dialog.dart';
import 'package:my_app/src/dialog/widget/loading_dialog.dart';

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
          TextButton(onPressed: _showPopup, child: const Text("Show popup")),
          TextButton(onPressed: _showPopup2, child: const Text("Show popup 2")),
          TextButton(
              onPressed: _showLoading, child: const Text("Show loading")),
        ],
      ),
    );
  }

  Future _showPopup() async {
    Get.dialog(AppDialog(
      title: "Hello!",
      content: "This is demo popup",
      actions: [
        DialogButton(
            title: "Yes",
            onPressed: () {
              Toast.show('Pressed Yes');
            }),
      ],
    ));
  }

  Future _showPopup2() async {
    Get.dialog(AppDialog(
      title: "Hello!",
      content: "This is demo popup",
      automaticallyImplyBack: false,
      actions: [
        for (int i = 0; i < 4; i++)
          DialogButton(
              title: "Option $i",
              onPressed: () {
                Toast.show('Clicked Option $i');
              }),
      ],
    ));
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
