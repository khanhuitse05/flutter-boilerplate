import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/_dev/router/dev_coordinator.dart';

class DevNestedNavigation extends StatefulWidget {
  const DevNestedNavigation({Key? key}) : super(key: key);
  @override
  _DevNestedNavigationState createState() => _DevNestedNavigationState();
}

class _DevNestedNavigationState extends State<DevNestedNavigation> {
  late DevCoordinator coordinator;
  @override
  void initState() {
    super.initState();
    coordinator = DevCoordinator();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => coordinator,
      child: WillPopScope(
        onWillPop: () async {
          coordinator.onBack();
          return false;
        },
        child: Scaffold(
          body: coordinator.getNavigator(),
        ),
      ),
    );
  }
}
