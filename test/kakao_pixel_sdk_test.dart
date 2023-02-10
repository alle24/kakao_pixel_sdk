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
  Future<bool> invokeEventInAppPurchase(String tag, String productId, String productName, int quantity, double price) {
    // TODO: implement invokeEventInAppPurchase
    throw UnimplementedError();
  }

  @override
  Future<bool> invokeEventJoin(String tag) {
    // TODO: implement invokeEventJoin
    throw UnimplementedError();
  }

  @override
  Future<bool> invokeEventSearch(String tag, String keyword) {
    // TODO: implement invokeEventSearch
    throw UnimplementedError();
  }
}

void main() {
  final KakaoPixelSdkPlatform initialPlatform = KakaoPixelSdkPlatform.instance;

  test('$MethodChannelKakaoPixelSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKakaoPixelSdk>());
  });

  test('getPlatformVersion', () async {
    KakaoPixelSdk kakaoPixelSdkPlugin = KakaoPixelSdk();
    MockKakaoPixelSdkPlatform fakePlatform = MockKakaoPixelSdkPlatform();
    KakaoPixelSdkPlatform.instance = fakePlatform;

    expect(await kakaoPixelSdkPlugin.getPlatformVersion(), '42');
  });
}
