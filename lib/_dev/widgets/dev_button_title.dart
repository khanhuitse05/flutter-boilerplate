import 'package:flutter/material.dart';

class DevButtonTitle extends StatelessWidget {
  const DevButtonTitle(this.title, {required this.onTap, Key? key})
      : super(key: key);
  final GestureTapCallback? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }
}
