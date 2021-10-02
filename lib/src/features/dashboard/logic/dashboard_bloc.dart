import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashBoardBloc extends Cubit<DashBoardState> {
  DashBoardBloc() : super(DashBoardState());
  final StreamController<int> reTap = StreamController<int>.broadcast();

  void onTapChanged(int index) {
    if (index != state.tapIndex) {
      emit(state.copyWith(tapIndex: index));
    } else {
      reTap.add(index);
    }
  }
}
