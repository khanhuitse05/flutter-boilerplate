import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/services/user_prefs.dart';

part 'setting_state.dart';

class SettingBloc extends Cubit<SettingState> {
  SettingBloc() : super(SettingState(themeMode: UserPrefs.instance.getTheme()));

  void onChangeTheme(ThemeMode? mode) {
    if (mode != null) {
      emit(state.copyWith(themeMode: mode));
      UserPrefs.instance.setTheme(mode);
    }
  }
}
