import 'package:flutter/material.dart';
import 'package:my_app/services/locator.dart';
import 'package:my_app/src/core/user_defaults.dart';
import 'my_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await UserDefaults.instance.initAsync();
  runApp(MyApp());
}
