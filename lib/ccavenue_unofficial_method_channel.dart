import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ccavenue_unofficial_platform_interface.dart';

/// An implementation of [CcavenueUnofficialPlatform] that uses method channels.
class MethodChannelCcavenueUnofficial extends CcavenueUnofficialPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ccavenue_unofficial');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> initiate() async {
    final text =
        await methodChannel.invokeMethod<String>('CC_Avenue_Unofficial');
    return text;
  }
}
