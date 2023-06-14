import 'ccavenue_unofficial_platform_interface.dart';

class CcavenueUnofficial {
  Future<String?> initiatePayment() {
    return CcavenueUnofficialPlatform.instance.initiatePayment();
  }
}
