import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ccavenue_unofficial_method_channel.dart';

abstract class CcavenueUnofficialPlatform extends PlatformInterface {
  /// Constructs a CcavenueUnofficialPlatform.
  CcavenueUnofficialPlatform() : super(token: _token);

  static final Object _token = Object();

  static CcavenueUnofficialPlatform _instance =
      MethodChannelCcavenueUnofficial();

  /// The default instance of [CcavenueUnofficialPlatform] to use.
  ///
  /// Defaults to [MethodChannelCcavenueUnofficial].
  static CcavenueUnofficialPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CcavenueUnofficialPlatform] when
  /// they register themselves.
  static set instance(CcavenueUnofficialPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> initiate() {
    throw UnimplementedError("initiate() has not been implemented");
  }
}
