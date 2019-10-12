

class GlobalConfig {

  static final GlobalConfig instance = GlobalConfig._internal();

  factory GlobalConfig() => instance;

  GlobalConfig._internal() {
    /// init
  }

  var appVersion = '2.0.2';

  var language = 'en';

}