import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/_dev/router/dev_coordinator.dart';
import 'package:my_app/_dev/router/dev_routers.dart';
import 'package:my_app/_dev/widgets/dev_navigation_title.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: CloseButton(
            onPressed: () {
              context.read<DevCoordinator>().onExit(context);
            },
          ),
          title: Text('Dev Only')),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          DevNavigationTitle('Device Info', screenName: DevRouters.device),
          DevNavigationTitle('Theme', screenName: DevRouters.theme),
          DevNavigationTitle('Text Theme', screenName: DevRouters.textTheme),
          DevNavigationTitle('Button', screenName: DevRouters.button),
          DevNavigationTitle('Text Input', screenName: DevRouters.input),
          DevNavigationTitle('Dialog', screenName: DevRouters.dialog),
          DevNavigationTitle('Other', screenName: DevRouters.other),
        ],
      ),
    );
  }
}
