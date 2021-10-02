import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingBloc extends Cubit<SettingState> {
  SettingBloc() : super(SettingState());

  void onChangeTheme(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }
}
