import 'package:flutter/material.dart';

import 'dev_nested_navigation.dart';

void showDevScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => DevNestedNavigation()),
  );
}
