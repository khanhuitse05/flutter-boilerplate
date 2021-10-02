import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/_dev/router/dev_coordinator.dart';

class DevNavigationTitle extends StatelessWidget {
  const DevNavigationTitle(
    this.title, {
    required this.screenName,
    Key? key,
  }) : super(key: key);
  final String screenName;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: Icon(Icons.navigate_next_outlined),
      onTap: () {
        context.read<DevCoordinator>().pushNamed(screenName);
      },
    );
  }
}
