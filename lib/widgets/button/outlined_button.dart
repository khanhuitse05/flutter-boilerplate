import 'package:flutter/material.dart';
import 'package:my_app/src/theme/colors.dart';

import 'button.dart';

class XOutlinedButton extends StatelessWidget {
  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;

  const XOutlinedButton({
    this.onPressed,
    this.title,
    this.child,
    this.busy = false,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled
          ? () {
              if (onPressed != null || busy == false) {
                onPressed?.call();
              }
            }
          : null,
      child: XBusyTitle(
        style: TextStyle(color: XColors.primary),
        busy: busy,
        title: title,
        child: child,
      ),
    );
  }
}
