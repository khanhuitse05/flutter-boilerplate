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
          DevNavigationTitle('1. Device Info', screenName: DevRouters.device),
          DevNavigationTitle('2. Theme', screenName: DevRouters.theme),
          DevNavigationTitle('3. Text Theme', screenName: DevRouters.textTheme),
          DevNavigationTitle('4. Button', screenName: DevRouters.button),
          DevNavigationTitle('5. Text Input', screenName: DevRouters.input),
          DevNavigationTitle('6. Dialog', screenName: DevRouters.dialog),
          DevNavigationTitle('7. Other', screenName: DevRouters.other),
        ],
      ),
    );
  }
}
