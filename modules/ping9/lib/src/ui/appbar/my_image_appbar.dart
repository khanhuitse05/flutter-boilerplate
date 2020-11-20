import 'package:flutter/material.dart';
import 'package:ping9/src/ui/common/app_image.dart';

class MyImageAppBar extends SliverPersistentHeaderDelegate {
  MyImageAppBar(
      {@required this.title,
        @required this.banner,
        this.leading,
        this.actions}) {
    isShow = false;
  }

  final double expandedHeight = 180;
  final String title;
  final String banner;
  Widget leading;
  final List<Widget> actions;

  bool isShow;

  void checkShow(BuildContext context, double dt) {
    final _new = dt >= 0.7;
    if (_new != isShow) {
      isShow = _new;
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
      overflow: Overflow.visible,
      children: [
        AppImage(
          banner,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: kToolbarHeight,
            child: AppBar(
              backgroundColor: isShow ? null : Colors.transparent,
              title: isShow && title != null
                  ? Text(
                title,
                style: Theme.of(context).textTheme.headline6,
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
