import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashBoardBloc extends Cubit<DashBoardState> {
  DashBoardBloc() : super(DashBoardState());
  final StreamController<TapIndex> reTap =
      StreamController<TapIndex>.broadcast();
  TabsRouter? tabsRouter;
  void setActiveIndex(int index, {BuildContext? context}) {
    final tap = TapIndex.values[index];
    int currentIndex = tabsRouter?.activeIndex ?? -1;
    if (currentIndex != index) {
      // switch tap
      tabsRouter?.setActiveIndex(index);
    } else if (context != null) {
      final router = tabsRouter?.stackRouterOfIndex(index);
      if (router != null) {
        if (router.canPop()) {
          // back to root
          tabsRouter?.stackRouterOfIndex(index)?.popUntilRoot();
        } else {
          // retap
          reTap.add(tap);
        }
      }
    }
  }
}
