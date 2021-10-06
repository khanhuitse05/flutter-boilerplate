import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashBoardBloc extends Cubit<DashBoardState> {
  DashBoardBloc() : super(DashBoardState());
  final StreamController<int> reTap = StreamController<int>.broadcast();
  TabsRouter? tabsRouter;
  void setActiveIndex(int index) {
    if (index != state.tapIndex) {
      tabsRouter?.setActiveIndex(index);
      emit(state.copyWith(tapIndex: index));
    } else {
      reTap.add(index);
    }
  }
}
