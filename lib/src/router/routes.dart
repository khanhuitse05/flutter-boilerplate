import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/router/router.gr.dart';

class XRoutes {
  static const dashBoard = '/';
  static const setting = '/setting';
  static const sample = '/sample';
  static const dev = '/dev';
  static const notFound = '/notFound';
}

class XCoordinator {
  static XRouter get router => GetIt.I<XRouter>();
  static BuildContext get context => router.navigatorKey.currentState!.context;

  static Future<bool> pop<T extends Object?>([T? result]) async {
    return router.pop(result);
  }
}
