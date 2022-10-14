import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/dialogs/toast_wrapper.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/router/router_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.pushNamed(XRoutes.setting);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text('Show Toast'),
              onPressed: () {
                XToast.show('Clicked');
              },
            ),
            TextButton(
              child: const Text('Show Order navigator stack'),
              onPressed: () {
                context.router.pushNamed(XRoutes.order);
              },
            ),
            TextButton(
              child: const Text('Show sample view'),
              onPressed: () {
                context.router.pushNamed(XRoutes.sample);
              },
            ),
            TextButton(
              child: const Text('Show Dev view'),
              onPressed: () {
                XCoordinator.showDev();
              },
            )
          ],
        ),
      ),
    );
  }
}
