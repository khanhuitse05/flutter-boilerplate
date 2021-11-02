import 'package:flutter/material.dart';
import 'package:my_app/_dev/router/dev_router.dart';
import 'package:my_app/_dev/widgets/dev_navigation_title.dart';
import 'package:my_app/src/router/coordinator.dart';

class DevView extends StatelessWidget {
  const DevView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: CloseButton(
            onPressed: () {
              XCoordinator.pop();
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
