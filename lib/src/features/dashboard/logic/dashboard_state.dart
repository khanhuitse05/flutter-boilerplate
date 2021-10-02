part of 'dashboard_bloc.dart';

class DashBoardState extends Equatable {
  DashBoardState({
    this.tapIndex = 0,
  });
  final int tapIndex;

  @override
  List<Object?> get props => [tapIndex];

  DashBoardState copyWith({
    int? tapIndex,
  }) {
    return DashBoardState(
      tapIndex: tapIndex ?? this.tapIndex,
    );
  }
}
