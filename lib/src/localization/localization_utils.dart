import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as AL;
import 'package:my_app/src/router/coordinator.dart';

// ignore: avoid_classes_with_only_static_members
class S {
  static get delegate => AL.AppLocalizations.delegate;
  static AL.AppLocalizations of(BuildContext context) {
    return AL.AppLocalizations.of(context)!;
  }

  static AL.AppLocalizations get text {
    return AL.AppLocalizations.of(XCoordinator.context)!;
  }
}

extension StringFormat on String {
  String formatWith(List<dynamic> values) {
    if (values.isEmpty) {
      return this;
    }
    String text = '$this';
    for (int i = 0; i < values.length; i++) {
      text = text.replaceAll('\{$i\}', '${values[i]}');
    }
    return text;
  }
}
