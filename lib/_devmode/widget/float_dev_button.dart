import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/_devmode/view/dev_screen.dart';

class FloatDevButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: const Key("FloatDevButton"),
      onPressed: () => Get.to(DevScreen()),
      child: const Icon(Icons.ac_unit),
    );
  }
}
