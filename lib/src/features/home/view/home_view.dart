import 'package:flutter/material.dart';
import 'package:my_app/_dev/location/dev_location.dart';
import 'package:my_app/src/dialogs/toast_wrapper.dart';
import 'package:my_app/src/router/routes.dart';
import 'package:my_app/src/router/routing.dart';

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
              XRouting.pushNamed(XRoutes.sample);
            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              XRouting.pushNamed(XRoutes.setting);
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
              child: const Text('Home'),
              onPressed: () {
                XToast.show('Clicked');
              },
            ),
            TextButton(
              child: const Text('Show Dev View'),
              onPressed: () {
                showDevScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
