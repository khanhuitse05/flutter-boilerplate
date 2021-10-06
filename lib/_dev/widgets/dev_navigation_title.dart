import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
        context.router.pushNamed(screenName);
      },
    );
  }
}
