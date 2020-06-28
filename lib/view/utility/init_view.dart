import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/core/application.dart';
import 'package:my_app/ui/utility/indicator.dart';

class InitView extends StatefulWidget {
  @override
  _InitViewState createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
  @override
  void initState() {
    super.initState();
    Application.instance.setupFuture.then(onSetup);
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
