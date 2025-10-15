import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/router/route_name.dart';

int _tapCount = 0;

class DevWrapButton extends StatelessWidget {
  const DevWrapButton({this.child, super.key});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: kDebugMode
          ? () {
              _tapCount++;
              if (_tapCount > 5) {
                _tapCount = 0;
                context.pushNamed(AppRouteNames.dev.name);
              }
            }
          : null,
      child: Container(color: Colors.transparent, child: child),
    );
  }
}
