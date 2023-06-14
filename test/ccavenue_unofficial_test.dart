import 'package:flutter_test/flutter_test.dart';
import 'package:ccavenue_unofficial/ccavenue_unofficial.dart';
import 'package:ccavenue_unofficial/ccavenue_unofficial_platform_interface.dart';
import 'package:ccavenue_unofficial/ccavenue_unofficial_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCcavenueUnofficialPlatform
    with MockPlatformInterfaceMixin
    implements CcavenueUnofficialPlatform {
  @override
  Future<String?> initiatePayment() => Future.value('Mukesh Joshi');
}

void main() {
  final CcavenueUnofficialPlatform initialPlatform =
      CcavenueUnofficialPlatform.instance;

  test('$MethodChannelCcavenueUnofficial is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCcavenueUnofficial>());
  });

  test('CC_Avenue_Unofficial', () async {
    CcavenueUnofficial ccavenueUnofficialPlugin = CcavenueUnofficial();
    MockCcavenueUnofficialPlatform fakePlatform =
        MockCcavenueUnofficialPlatform();
    CcavenueUnofficialPlatform.instance = fakePlatform;

    expect(await ccavenueUnofficialPlugin.initiatePayment(), 'Mukesh Joshi');
  });
}
