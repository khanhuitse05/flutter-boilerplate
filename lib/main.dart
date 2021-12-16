import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/common/app_bloc/bloc_observer.dart';
import 'package:my_app/src/locator.dart';

import 'src/app.dart';

Future main() async {
  await initializeApp();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: XBlocObserver(),
  );
}
