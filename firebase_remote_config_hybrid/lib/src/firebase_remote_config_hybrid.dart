part of firebase_remote_config_hybrid;

class FirebaseRemoteConfig {
  FirebaseRemoteConfigPlatformInterface _platformInstance;
  FirebaseRemoteConfig._(FirebaseRemoteConfigPlatformInterface platformInstance)
      : _platformInstance = platformInstance;

  static Future<FirebaseRemoteConfig> get instance async =>
      FirebaseRemoteConfig._(
          await FirebaseRemoteConfigPlatformInterface.getinstance());

  RemoteConfigValue getValue(String key) {
    return _platformInstance?.getValue(key);
  }

  int getInt(String key) {
    return _platformInstance?.getInt(key);
  }

  double getDouble(String key) {
    return _platformInstance?.getDouble(key);
  }

  String getString(String key) {
    return _platformInstance?.getString(key);
  }

  Map<String, RemoteConfigValue> getAll() {
    return _platformInstance?.getAll();
  }

  Future<void> fetch() async {
    await _platformInstance?.fetch();
  }

  Future<bool> activateFetched() async {
    return await _platformInstance?.activateFetched();
  }
}
