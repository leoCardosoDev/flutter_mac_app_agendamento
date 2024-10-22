import 'package:firebase_remote_config/firebase_remote_config.dart';

enum AppRemoteConfigKeys {
  appMinVersion('app_min_version', 1),
  maintenance('maintenance', false);

  final String key;
  final dynamic defaultValue;
  const AppRemoteConfigKeys(this.key, this.defaultValue);
}

class AppRemoteConfig {
  final FirebaseRemoteConfig _remoteConfig;
  AppRemoteConfig(this._remoteConfig);

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
    await _remoteConfig.setDefaults({
      AppRemoteConfigKeys.appMinVersion.key:
          AppRemoteConfigKeys.appMinVersion.defaultValue,
      AppRemoteConfigKeys.maintenance.key:
          AppRemoteConfigKeys.maintenance.defaultValue,
    });
    await _remoteConfig.fetchAndActivate();
  }

  int get appMinVersion =>
      _remoteConfig.getInt(AppRemoteConfigKeys.appMinVersion.key);

  bool get isMaintenance =>
      _remoteConfig.getBool(AppRemoteConfigKeys.maintenance.key);
}
