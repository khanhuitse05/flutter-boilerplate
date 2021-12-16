import 'package:flutter/material.dart';
import 'package:my_app/_dev/widgets/dev_copy_title.dart';
import 'package:my_app/_dev/widgets/dev_title.dart';
import 'package:my_app/src/config/devices/app_Info.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../widgets/dev_screen_layout.dart';

class DevDeviceView extends StatelessWidget {
  const DevDeviceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfo device = AppInfo.device;
    PackageInfo package = AppInfo.package;
    return DevScreenLayout(
      'Device',
      children: [
        DevTitle('Device Info'),
        DevCopyTitle('Device UID', device.uid),
        DevCopyTitle('Device Name', device.name),
        DevCopyTitle('Device Platform Name', device.platformName),
        DevCopyTitle('Device Version', device.platformVersion),
        DevCopyTitle('Device Model', device.model),
        DevTitle('Package Info'),
        DevCopyTitle('App Name', package.appName),
        DevCopyTitle('Package Name', package.packageName),
        DevCopyTitle('Version', '${package.version} +${package.buildNumber}'),
        DevCopyTitle('Build Signature', package.buildSignature),
      ],
    );
  }
}
