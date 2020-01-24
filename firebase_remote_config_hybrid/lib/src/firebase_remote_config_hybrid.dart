part of firebase_remote_config_hybrid;

class FirebaseRemoteConfig {
  String hello() {
    return FirebaseRemoteConfigPlatformInterface.instance.hello();
  }
}
