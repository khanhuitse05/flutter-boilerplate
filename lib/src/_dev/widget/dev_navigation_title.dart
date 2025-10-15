import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevNavigationTitle extends StatelessWidget {
  const DevNavigationTitle(this.title, this.builder, {super.key});
  final WidgetBuilder builder;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(Icons.navigate_next_outlined),
      onTap: () {
        showCupertinoDialog(context: context, builder: builder);
      },
    );
  }
}
