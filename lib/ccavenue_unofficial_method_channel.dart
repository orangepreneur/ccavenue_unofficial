import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ccavenue_unofficial_platform_interface.dart';

/// An implementation of [CcavenueUnofficialPlatform] that uses method channels.
class MethodChannelCcavenueUnofficial extends CcavenueUnofficialPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ccavenue_unofficial');

  @override
  Future<String?> initiatePayment({
    required String transUrl,
    required String accessCode,
    required String merchantId,
    required String orderId,
    required String currencyType,
    required String amount,
    required String cancelUrl,
    required String redirectUrl,
    required String rsaKeyUrl,
  }) async {
    final text =
        await methodChannel.invokeMethod<String>('CC_Avenue_Unofficial', {
      'transUrl': transUrl,
      'accessCode': accessCode,
      'merchantId': merchantId,
      'orderId': orderId,
      'currencyType': currencyType,
      'amount': amount,
      'cancelUrl': cancelUrl,
      'redirectUrl': redirectUrl,
      'rsaKeyUrl': rsaKeyUrl
    });
    return text;
  }
}
