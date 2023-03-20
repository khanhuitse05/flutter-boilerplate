import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/_dev/widgets/dev_screen_layout.dart';

@RoutePage()
class DevThemeView extends StatelessWidget {
  const DevThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout('Theme',
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        children: []);
  }
}
