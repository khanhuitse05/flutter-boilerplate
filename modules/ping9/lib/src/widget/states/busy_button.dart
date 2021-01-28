import 'package:flutter/material.dart';
import 'package:ping9/src/widget/common/indicator.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatelessWidget {
  final bool busy;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;

  const BusyButton({
    @required this.title,
    @required this.onPressed,
    this.busy = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: enabled
            ? () {
                if (onPressed != null || busy == false) {
                  onPressed();
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
  final bool busy;
  final Widget icon;
  final VoidCallback onPressed;
  final bool enabled;

  const BusyIconButton({
    @required this.icon,
    @required this.onPressed,
    this.busy = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled
          ? () {
              if (onPressed != null || busy == false) {
                onPressed();
              }
            }
          : null,
      icon: busy
          ? const Indicator(
              radius: 12,
            )
          : icon,
    );
  }
}
