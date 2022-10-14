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
        return Icons.home;
      default:
        return Icons.person;
    }
  }

  static String nameAt(int index) {
    if (index == TapIndex.account.index) {
      return 'Account';
    } else {
      return 'Home';
    }
  }
}

class DashBoardState extends Equatable {
  DashBoardState();

  @override
  List<Object?> get props => [];
}
