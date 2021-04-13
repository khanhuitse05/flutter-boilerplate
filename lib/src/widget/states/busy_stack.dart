import 'package:flutter/material.dart';

import 'busy_overlay.dart';

/// A modal overlay that will show over your child widget (fullscreen) when the show value is true
///
/// Wrap your scaffold in this widget and set show value to model.isBusy to show a loading modal when
/// your model state is Busy
class BusyStack extends StatelessWidget {
  const BusyStack(
      {required this.child, this.title = 'Please wait...', this.show = false});

  final Widget child;
  final String? title;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          child,
          IgnorePointer(
            child: Opacity(
              opacity: show ? 1.0 : 0.0,
              child: BusyOverlay(title: title ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}
