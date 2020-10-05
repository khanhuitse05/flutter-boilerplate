import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ping9/ping9.dart';

class InitView extends StatefulWidget {
  @override
  _InitViewState createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  @override
  void initState() {
    super.initState();
    AppDelegate.instance.setupFuture.then(onSetup);
  }

  FutureOr onSetup(_) {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Indicator(),
    );
  }
}
