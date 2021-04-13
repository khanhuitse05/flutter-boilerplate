import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/_devmode/view/dev_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

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
