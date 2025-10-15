import 'package:flutter/material.dart';

import 'view/dev_button_screen.dart';
import 'view/dev_card_screen.dart';
import 'view/dev_common_screen.dart';
import 'view/dev_device_screen.dart';
import 'view/dev_dialog_screen.dart';
import 'widget/dev_navigation_title.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dev Only')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          DevNavigationTitle('Device Info', (_) => const DevDeviceScreen()),
          DevNavigationTitle('Button', (_) => const DevButtonScreen()),
          DevNavigationTitle('Dialog', (_) => const DevDialogScreen()),
          DevNavigationTitle('Card', (_) => const DevCardScreen()),
          DevNavigationTitle('Common Screen', (_) => const DevCommonScreen()),
        ],
      ),
    );
  }
}
