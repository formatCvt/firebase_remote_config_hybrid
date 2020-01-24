library firebase_remote_config_hybrid_platform_interface;

part 'src/firebase_remote_config_hybrid_mobile.dart';

abstract class FirebaseRemoteConfigPlatformInterface {
  static FirebaseRemoteConfigPlatformInterface instance =
      FirebaseRemoteConfigMobile();

  String hello();
}
