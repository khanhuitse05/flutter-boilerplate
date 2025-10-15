import 'package:flutter/material.dart';
import 'package:myapp/widgets/common/indicator.dart';

import 'model/button_size.dart';

/// A button that shows a busy indicator in place of title
class XButton extends StatelessWidget {
  const XButton({
    this.onPressed,
    this.title,
    this.child,
    this.icon,
    this.busy = false,
    this.enabled = true,
    this.size,
    super.key,
  });

  final bool busy;
  final bool enabled;
  final Widget? icon;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;
  final ButtonSize? size;

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? ButtonSize.medium();
    final onPressed = enabled
        ? () {
            if (this.onPressed != null || busy == false) {
              this.onPressed?.call();
            }
          }
        : null;
    final foregroundColor = Theme.of(context).colorScheme.onPrimary;
    final indicator =
        XIndicator(radius: size.iconSize / 2, color: foregroundColor);
    return SizedBox(
      height: size.height,
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: Theme.of(context).colorScheme.primary,
            textStyle: size.style.copyWith(),
            minimumSize: Size(size.minWidth, size.height),
            padding: EdgeInsets.symmetric(horizontal: size.padding),
          ),
        ),
        child: icon != null
            ? ElevatedButton.icon(
                onPressed: onPressed,
                label: child ?? Text(title ?? ''),
                icon: busy
                    ? indicator
                    : IconTheme(
                        data: IconThemeData(
                            size: size.iconSize, color: foregroundColor),
                        child: icon!),
              )
            : ElevatedButton(
                onPressed: onPressed,
                child: busy ? indicator : (child ?? Text(title ?? '')),
              ),
      ),
    );
  }
}
