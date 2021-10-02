import 'package:flutter/material.dart';

class XCommonSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  XCommonSliverPersistentHeaderDelegate({
    required this.height,
    required this.child,
  });

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(XCommonSliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
