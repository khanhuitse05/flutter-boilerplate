import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_app/src/router/routes.dart';

// ignore: avoid_classes_with_only_static_members
class S {
  static get delegate => AppLocalizations.delegate;
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static AppLocalizations get text {
    return AppLocalizations.of(XCoordinator.context)!;
  }
}
