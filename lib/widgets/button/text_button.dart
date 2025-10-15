import 'package:flutter/material.dart';
import 'package:myapp/widgets/button/model/button_size.dart';
import 'package:myapp/widgets/common/indicator.dart';

class XTextButton extends StatelessWidget {
  const XTextButton({
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
    final foregroundColor = Theme.of(context).primaryColor;
    final onPressed = enabled
        ? () {
            if (this.onPressed != null || busy == false) {
              this.onPressed?.call();
            }
          }
        : null;
    final indicator =
        XIndicator(radius: size.iconSize / 2, color: foregroundColor);
    return SizedBox(
      height: size.height,
      child: TextButtonTheme(
        data: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor,
            textStyle: size.style,
            minimumSize: Size(size.minWidth, size.height),
            padding: EdgeInsets.symmetric(horizontal: size.padding),
          ),
        ),
        child: icon != null
            ? TextButton.icon(
                onPressed: onPressed,
                label: child ?? Text(title ?? ''),
                icon: busy
                    ? indicator
                    : IconTheme(
                        data: IconThemeData(
                            size: size.iconSize, color: foregroundColor),
                        child: icon!),
              )
            : TextButton(
                onPressed: onPressed,
                child: busy ? indicator : (child ?? Text(title ?? '')),
              ),
      ),
    );
  }
}
