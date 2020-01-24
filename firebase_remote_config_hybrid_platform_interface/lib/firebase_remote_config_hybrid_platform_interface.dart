library firebase_remote_config_hybrid_platform_interface;

import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart' as core;
part 'src/firebase_remote_config_hybrid_mobile.dart';
part 'src/types/remote_config_value.dart';

abstract class FirebaseRemoteConfigPlatformInterface {
  static FirebaseRemoteConfigPlatformInterface instance;
  static Future<FirebaseRemoteConfigPlatformInterface> getinstance() async {
    if (instance == null)
      instance = FirebaseRemoteConfigMobile._(await core.RemoteConfig.instance);
    return instance;
  }

  bool getBool(String key);

  double getDouble(String key);

  int getInt(String key);

  String getString(String key);

  RemoteConfigValue getValue(String key);

  Map<String, RemoteConfigValue> getAll();

  Future<bool> activateFetched();

  Future<void> fetch();
}
