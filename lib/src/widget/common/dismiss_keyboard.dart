import 'dart:io';

import 'package:flutter/material.dart';

class DismissKeyBoard extends StatelessWidget {
  const DismissKeyBoard({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return child;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child,
    );
  }
}
