import 'package:flutter/material.dart';
import 'package:my_app/src/dialog/toast_service.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                  Toast.showNoti('Home', 'Thanks for clicked');
                }),
          ],
        ),
      ),
    );
  }
}
