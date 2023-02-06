import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kakao_pixel_sdk/kakao_pixel_sdk_method_channel.dart';

void main() {
  MethodChannelKakaoPixelSdk platform = MethodChannelKakaoPixelSdk();
  const MethodChannel channel = MethodChannel('kakao_pixel_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
