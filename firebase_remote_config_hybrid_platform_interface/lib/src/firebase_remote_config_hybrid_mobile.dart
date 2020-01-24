part of firebase_remote_config_hybrid_platform_interface;

class FirebaseRemoteConfigMobile extends FirebaseRemoteConfigPlatformInterface {
  FirebaseRemoteConfigMobile._(core.RemoteConfig platformInstance)
      : _instance = platformInstance;
  core.RemoteConfig _instance;

  @override
  Map<String, RemoteConfigValue> getAll() {
    Map<String, core.RemoteConfigValue> coreResult = _instance?.getAll();
    if (coreResult == null) return null;
    Map<String, RemoteConfigValue> pluginResult = {};
    for (String key in coreResult.keys) {
      pluginResult[key] = _coreConfigValueToPlugin(coreResult[key]);
    }
    return pluginResult;
  }

  @override
  bool getBool(String key) {
    return _instance?.getBool(key);
  }

  @override
  double getDouble(String key) {
    return _instance?.getDouble(key);
  }

  @override
  int getInt(String key) {
    return _instance?.getInt(key);
  }

  @override
  String getString(String key) {
    return _instance?.getString(key);
  }

  @override
  RemoteConfigValue getValue(String key) {
    return _coreConfigValueToPlugin(_instance?.getValue(key));
  }

  @override
  Future<bool> activateFetched() async {
    return await _instance?.activateFetched();
  }

  @override
  Future<void> fetch() async {
    await _instance?.fetch(expiration: Duration.zero);
  }

  RemoteConfigValue _coreConfigValueToPlugin(core.RemoteConfigValue coreValue) {
    return coreValue == null ? null : RemoteConfigValue();
  }
}
