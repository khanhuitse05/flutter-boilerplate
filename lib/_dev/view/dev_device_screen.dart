import 'package:flutter/material.dart';

import '../widgets/dev_screen_layout.dart';

class DevDeviceScreen extends StatelessWidget {
  const DevDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DeviceInfo device = AppInfo.device;
    // PackageInfo package = AppInfo.package;
    return DevScreenLayout(
      'Device',
      children: [
        // DevTitle('Device Info'),
        // DevCopyTitle('Device UID', device.uid),
        // DevCopyTitle('Device Name', device.name),
        // DevCopyTitle('Device Platform Name', device.platformName),
        // DevCopyTitle('Device Version', device.platformVersion),
        // DevCopyTitle('Device Model', device.model),
        // DevTitle('Package Info'),
        // DevCopyTitle('App Name', package.appName),
        // DevCopyTitle('Package Name', package.packageName),
        // DevCopyTitle('Version', '${package.version} +${package.buildNumber}'),
        // DevCopyTitle('Build Signature', package.buildSignature),
      ],
    );
  }
}
