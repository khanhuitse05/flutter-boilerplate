import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/dashboard/logic/dashboard_bloc.dart';

class XBottomNavigationBar extends StatelessWidget {
  XBottomNavigationBar(this.tabsRouter, {Key? key}) : super(key: key);
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) =>
          context.read<DashBoardBloc>().setActiveIndex(index, context: context),
      items: [
        ...TapIndex.values
            .map((e) => BottomNavigationBarItem(
                  label: e.nameOf(),
                  icon: Icon(e.iconOf()),
                ))
            .toList(),
      ],
    );
  }
}
