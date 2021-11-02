import 'package:flutter/material.dart';
import 'package:my_app/src/config/env/env.dart';
import 'package:my_app/src/router/coordinator.dart';

int _tapCount = 0;

class DevWrapButton extends StatelessWidget {
  const DevWrapButton({this.child, Key? key}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ENV.isDev
          ? () {
              _tapCount++;
              if (_tapCount > 5) {
                _tapCount = 0;
                XCoordinator.showDev();
              }
            }
          : null,
      child: Container(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}
