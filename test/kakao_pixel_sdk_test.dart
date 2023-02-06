import 'package:flutter_test/flutter_test.dart';
import 'package:kakao_pixel_sdk/kakao_pixel_sdk.dart';
import 'package:kakao_pixel_sdk/kakao_pixel_sdk_platform_interface.dart';
import 'package:kakao_pixel_sdk/kakao_pixel_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKakaoPixelSdkPlatform
    with MockPlatformInterfaceMixin
    implements KakaoPixelSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> invokeEventInAppPurchase(String tag, String productId, String productName, int quantity, double price) => Future.value(true);

  @override
  Future<bool> invokeEventJoin(String tag) => Future.value(true);

  @override
  Future<bool> invokeEventSearch(String tag, String keyword) => Future.value(true);
}

void main() {
  final KakaoPixelSdkPlatform initialPlatform = KakaoPixelSdkPlatform.instance;

  test('$MethodChannelKakaoPixelSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKakaoPixelSdk>());
  });

  KakaoPixelSdk kakaoPixelSdkPlugin = KakaoPixelSdk();
  MockKakaoPixelSdkPlatform fakePlatform = MockKakaoPixelSdkPlatform();
  KakaoPixelSdkPlatform.instance = fakePlatform;

  test('getPlatformVersion', () async {
    expect(await kakaoPixelSdkPlugin.getPlatformVersion(), '42');
  });

  test('invokeEventInAppPurchase', () async {
    expect(await kakaoPixelSdkPlugin.invokeEventInAppPurchase('EVENT_IN_APP_PURCHASE', 'testID', 'testName', 1, 5900.0), true);
  });

  test('invokeEventJoin', () async {
    expect(await kakaoPixelSdkPlugin.invokeEventJoin('EVENT_JOIN'), true);
  });

  test('invokeEventSearch', () async {
    expect(await kakaoPixelSdkPlugin.invokeEventSearch('EVENT_SEARCH', 'TEST SEARCH KEYWORD'), true);
  });
}
