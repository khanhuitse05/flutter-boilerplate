import 'package:flutter/material.dart';
import 'package:my_app/src/dialogs/toast_wrapper.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
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
                }),
          ],
        ),
      ),
    );
  }
}
