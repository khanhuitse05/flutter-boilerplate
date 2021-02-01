import 'package:flutter/material.dart';
import 'package:my_app/services/locator.dart';
import 'package:ping9/ping9.dart';
import 'core/app_delegate.dart';
import 'my_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await UserDefaults.instance.initAsync();
  runApp(MyApp());
}
