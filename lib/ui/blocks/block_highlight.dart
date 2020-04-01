import 'package:flutter/material.dart';

class BlockHighlight extends StatelessWidget {
  const BlockHighlight(
      {@required this.child,
        this.padding,
        this.margin,
        this.radius = 15,
        this.color = Colors.white,
        this.colorBorder = Colors.blue});

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double radius;
  final Color color;
  final Color colorBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: colorBorder,
          boxShadow: [
            BoxShadow(
              color: colorBorder.withAlpha(50),
              offset: const Offset(1, 4),
              blurRadius: 5,
            ),
          ]),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
