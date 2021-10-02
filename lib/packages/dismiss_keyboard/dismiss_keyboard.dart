import 'package:flutter/material.dart';

class DismissKeyBoard extends StatelessWidget {
  const DismissKeyBoard({this.child, Key? key}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        hideKeyboard(context);
      },
      child: child,
    );
  }
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
