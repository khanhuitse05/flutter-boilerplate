import 'package:flutter/material.dart';

class BlockShadow extends StatelessWidget {
  const BlockShadow(
      {@required this.child,
        this.padding,
        this.margin,
        this.radius = 15,
        this.width,
        this.height,
        this.color = Colors.white});

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double radius;
  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withAlpha(50),
              offset: const Offset(1, 4),
              blurRadius: 5,
            ),
          ]),
      child: child,
    );
  }
}
