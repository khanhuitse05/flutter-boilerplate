import 'package:flutter/material.dart';

class XBottomBarButton extends StatelessWidget {
  const XBottomBarButton({super.key, this.child, this.onPressed});

  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return XBottomAppBar(
        child: ElevatedButton(
      onPressed: onPressed,
      child: child,
    ));
  }
}

class XBottomAppBar extends StatelessWidget {
  const XBottomAppBar({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).bottomAppBarTheme.color,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            16, 8, 16, 10 + MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    );
  }
}
