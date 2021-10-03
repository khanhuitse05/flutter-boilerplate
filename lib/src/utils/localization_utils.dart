import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/src/router/routing.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: avoid_classes_with_only_static_members
class S {
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static AppLocalizations get text {
    return AppLocalizations.of(XRouting.context)!;
  }
}
