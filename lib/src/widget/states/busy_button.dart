import 'package:flutter/material.dart';
import 'package:my_app/src/widget/common/indicator.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool busy;

  const BusyButton({
    required this.title,
    this.onPressed,
    this.busy = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: enabled
            ? () {
                if (busy == false) {
                  onPressed?.call();
                }
              }
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (busy)
              const Indicator(radius: 12)
            else
              Text(
                title,
                key: ValueKey('text_ButtonWidget$title'),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
          ],
        ));
  }
}

class BusyIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool busy;

  const BusyIconButton({
    required this.icon,
    this.onPressed,
    this.busy = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled
          ? () {
              if (busy == false) {
                onPressed?.call();
              }
            }
          : null,
      icon: busy ? const Indicator(radius: 12) : icon,
    );
  }
}
