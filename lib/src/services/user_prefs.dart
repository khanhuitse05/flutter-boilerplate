class UserPrefs {
  factory UserPrefs() => instance;
  UserPrefs._internal();

  static final UserPrefs instance = UserPrefs._internal();
  // late SharedPreferences preferences;
  Future initialize() async {
    // preferences = await SharedPreferences.getInstance();
  }
}
