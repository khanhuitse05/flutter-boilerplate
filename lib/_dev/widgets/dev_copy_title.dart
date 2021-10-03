import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DevCopyTitle extends StatelessWidget {
  const DevCopyTitle(
    this.title,
    this.body, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String? body;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(body ?? ''),
      trailing: Icon(Icons.copy_outlined),
      onTap: () {
        Clipboard.setData(ClipboardData(text: body ?? ''));
      },
    );
  }
}
