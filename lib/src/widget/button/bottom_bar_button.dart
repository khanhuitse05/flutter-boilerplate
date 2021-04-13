import 'package:flutter/material.dart';
import 'package:my_app/src/theme/app_styles.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({this.child, this.onPressed});

  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomBarWidget(
        child: ElevatedButton(
      child: child,
      onPressed: onPressed,
    ));
  }
}

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).backgroundColor,
      child: Container(
        padding: EdgeInsets.fromLTRB(hPadding, 8, hPadding,
            10 + MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    );
  }
}
