import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:my_app/devmode/view/dev_screen.dart';

class FloatDevButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: const Key("FloatDevButton"),
      onPressed: () => Get.to(DevScreen()),
      child: const Icon(MaterialCommunityIcons.access_point),
    );
  }
}
