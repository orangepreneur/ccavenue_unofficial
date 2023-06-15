import 'ccavenue_unofficial_platform_interface.dart';

class CcavenueUnofficial {
  Future<String?> initiatePayment(
      {required String transUrl,
      required String accessCode,
      required String merchantId,
      required String orderId,
      required String currencyType,
      required String amount,
      required String cancelUrl,
      required String redirectUrl,
      required String rsaKeyUrl}) {
    return CcavenueUnofficialPlatform.instance.initiatePayment(
        transUrl: transUrl,
        accessCode: accessCode,
        merchantId: merchantId,
        orderId: orderId,
        currencyType: currencyType,
        amount: amount,
        cancelUrl: cancelUrl,
        redirectUrl: redirectUrl,
        rsaKeyUrl: rsaKeyUrl);
  }
}
