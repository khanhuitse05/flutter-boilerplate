import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/services/remote_config/remote_config.dart';

class RemoteConfigService {
  static RemoteConfig config = RemoteConfig.ds();

  static Future getRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 5),
      ));
      await remoteConfig.fetchAndActivate();
      await remoteConfig.ensureInitialized();
      final version = remoteConfig.getString("force_update_version");
      config = RemoteConfig.fromConfig(version);
    } catch (exception) {
      debugPrint(
          'Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }
}
