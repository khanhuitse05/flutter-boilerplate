import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/sample/router/sample_coordinator.dart';

class SampleView extends StatefulWidget {
  SampleView({Key? key}) : super(key: key);

  @override
  _SampleViewState createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  final coordinator = SampleCoordinator();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => coordinator,
      child: WillPopScope(
        onWillPop: () async {
          coordinator.pop();
          return false;
        },
        child: Scaffold(
          body: coordinator.getNavigator(),
        ),
      ),
    );
  }
}
