import 'package:flutter/material.dart';
import 'package:myapp/widgets/image/image_network.dart';

class XImageAppBar extends SliverPersistentHeaderDelegate {
  XImageAppBar(
      {required this.title, required this.banner, this.leading, this.actions}) {
    isShow = false;
  }

  final double expandedHeight = 180;
  final String title;
  final String banner;
  Widget? leading;
  final List<Widget>? actions;

  late bool isShow;

  void checkShow(BuildContext context, double dt) {
    final isNew = dt >= 0.7;
    if (isNew != isShow) {
      isShow = isNew;
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    /// 0 -> 1
    final double dt = shrinkOffset / expandedHeight;
    checkShow(context, dt);
    return Stack(
      fit: StackFit.expand,
      children: [
        XImageNetwork(
          banner,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              backgroundColor: isShow ? null : Colors.transparent,
              title: isShow
                  ? Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  : null,
              leading: leading,
              actions: actions,
              elevation: isShow ? Theme.of(context).appBarTheme.elevation : 0,
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
