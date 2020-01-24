library firebase_remote_config_hybrid_web;

import 'package:firebase/firebase.dart' as core;
import 'package:firebase_remote_config_hybrid_platform_interface/firebase_remote_config_hybrid_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'dart:async';

class FirebaseRemoteConfigWeb extends FirebaseRemoteConfigPlatformInterface {
  core.RemoteConfig _instance;
  FirebaseRemoteConfigWeb._(core.RemoteConfig instance) : _instance = instance;

  static void registerWith(Registrar registrar) {
    FirebaseRemoteConfigPlatformInterface.instance =
        FirebaseRemoteConfigWeb._(core.remoteConfig());
  }

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
    return _instance?.getBoolean(key);
  }

  @override
  double getDouble(String key) {
    return _instance?.getNumber(key)?.toDouble();
  }

  @override
  int getInt(String key) {
    return _instance?.getNumber(key)?.toInt();
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
    return await _instance?.activate();
  }

  @override
  Future<void> fetch() async {
    await _instance?.fetch();
  }

  RemoteConfigValue _coreConfigValueToPlugin(core.RemoteConfigValue coreValue) {
    return coreValue == null ? null : RemoteConfigValue();
  }
}
