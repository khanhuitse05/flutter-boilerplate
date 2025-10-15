import 'package:flutter/material.dart';

class XCard extends StatelessWidget {
  const XCard({
    this.padding = const EdgeInsets.all(16),
    this.child,
    this.borderColor,
    super.key,
  });
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: borderColor ?? const Color(0xFFD9D9D9),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
