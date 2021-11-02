import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/_dev/widgets/dev_float_button.dart';
import 'package:my_app/src/dialogs/toast_wrapper.dart';
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
              context.router.pushNamed(XRoutes.sample);
            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              context.router.pushNamed(XRoutes.setting);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: DevFloatButton(),
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
              child: const Text('Order'),
              onPressed: () {
                context.router.pushNamed(XRoutes.order);
              },
            ),
          ],
        ),
      ),
    );
  }
}
