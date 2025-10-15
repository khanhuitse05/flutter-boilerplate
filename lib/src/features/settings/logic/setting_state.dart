part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final ThemeMode themeMode;

  const SettingState({
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object?> get props => [themeMode];

  SettingState copyWith({
    ThemeMode? themeMode,
  }) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
