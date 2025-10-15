import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class XIndicator extends StatelessWidget {
  const XIndicator({this.radius = 15, this.color, super.key});
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isAndroid) {
      return SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: CircularProgressIndicator(
          backgroundColor: color ?? Theme.of(context).colorScheme.onSurface,
          strokeWidth: 1.5,
        ),
      );
    }
    return CupertinoActivityIndicator(
      radius: radius,
      color: color,
    );
  }
}
