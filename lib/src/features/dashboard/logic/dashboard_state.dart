part of 'dashboard_bloc.dart';

enum TapIndex {
  home,
  account,
}

extension ETapIndex on TapIndex {
  String nameOf() {
    return nameAt(this.index);
  }

  IconData iconOf() {
    switch (this) {
      case TapIndex.home:
        return Icons.person;
      default:
        return Icons.home;
    }
  }

  static String nameAt(int index) {
    if (index == TapIndex.account.index) {
      return 'account';
    } else {
      return 'Home';
    }
  }
}

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
