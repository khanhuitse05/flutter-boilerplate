

import 'dart:io';

class Config {

  static final Config instance = Config._internal();

  factory Config() => instance;

  Config._internal() {
    /// init
  }

}