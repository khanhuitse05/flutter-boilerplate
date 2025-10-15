part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.user,
    this.locale = 'vi',
  });
  factory AccountState.ds() {
    return AccountState(
      user: UserPrefs.I.getUser() ?? MUser.empty(),
    );
  }

  final MUser user;
  final String locale;

  bool get isLogin => user.id.isNotEmpty; // && token.isNotEmpty

  @override
  List<Object?> get props => [user, locale];

  AccountState login(MUser user) {
    return copyWith(user: user);
  }

  AccountState logOut() {
    return copyWith(user: MUser.empty());
  }

  AccountState copyWith({
    MUser? user,
    String? locale,
  }) {
    return AccountState(
      user: user ?? this.user,
      locale: locale ?? this.locale,
    );
  }
}
