import 'package:flutter/material.dart';

class DevButtonTitle extends StatelessWidget {
  const DevButtonTitle(this.title, {required this.onTap, super.key});
  final GestureTapCallback? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}
