import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DevCopyTitle extends StatelessWidget {
  const DevCopyTitle(
    this.title,
    this.body, {
    super.key,
  });
  final String title;
  final String? body;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(body ?? ''),
      trailing: const Icon(Icons.copy_outlined),
      onTap: () {
        Clipboard.setData(ClipboardData(text: body ?? ''));
      },
    );
  }
}
