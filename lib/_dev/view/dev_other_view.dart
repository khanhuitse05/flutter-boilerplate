import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/_dev/widgets/dev_screen_layout.dart';

class DevOtherView extends StatelessWidget {
  const DevOtherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Other Widgets',
      children: [],
    );
  }
}
