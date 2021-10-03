import 'package:flutter/material.dart';
import 'package:my_app/widgets/common/indicator.dart';

/// A button that shows a busy indicator in place of title
class XButton extends StatelessWidget {
  final bool busy;
  final bool enabled;
  final String? title;
  final Widget? child;
  final VoidCallback? onPressed;

  const XButton({
    this.onPressed,
    this.title,
    this.child,
    this.busy = false,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled
          ? () {
              if (onPressed != null || busy == false) {
                onPressed?.call();
              }
            }
          : null,
      child: XBusyTitle(
        busy: busy,
        title: title,
        child: child,
      ),
    );
  }
}

class XBusyTitle extends StatelessWidget {
  final bool busy;
  final String? title;
  final Widget? child;
  const XBusyTitle({
    this.title,
    this.child,
    this.busy = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 12;
    return SizedBox(
      height: Theme.of(context).buttonTheme.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: padding * 2),
          child ??
              Text(
                title ?? '',
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
          if (busy)
            const XIndicator(radius: padding)
          else
            const SizedBox(width: padding * 2),
        ],
      ),
    );
  }
}
