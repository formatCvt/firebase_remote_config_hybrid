library firebase_remote_config_hybrid_web;

import 'package:firebase_remote_config_hybrid_platform_interface/firebase_remote_config_hybrid_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class FirebaseRemoteConfigWeb extends FirebaseRemoteConfigPlatformInterface {
  static void registerWith(Registrar registrar) {
    FirebaseRemoteConfigPlatformInterface.instance = FirebaseRemoteConfigWeb();
  }

  @override
  String hello() {
    return 'Hello from web';
  }
}
