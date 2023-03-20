import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/_dev/router/dev_router.dart';
import 'package:my_app/_dev/widgets/dev_navigation_title.dart';
import 'package:my_app/src/router/coordinator.dart';

@RoutePage()
class DevHomeView extends StatelessWidget {
  const DevHomeView({Key? key}) : super(key: key);

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
          DevNavigationTitle('1. Device Info', screenName: DevRoutes.device),
          DevNavigationTitle('2. Theme', screenName: DevRoutes.theme),
          DevNavigationTitle('3. Text Theme', screenName: DevRoutes.textTheme),
          DevNavigationTitle('4. Button', screenName: DevRoutes.button),
          DevNavigationTitle('5. Text Input', screenName: DevRoutes.input),
          DevNavigationTitle('6. Dialog', screenName: DevRoutes.dialog),
          DevNavigationTitle('7. Other', screenName: DevRoutes.other),
        ],
      ),
    );
  }
}
