import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'kakao_pixel_sdk_method_channel.dart';

abstract class KakaoPixelSdkPlatform extends PlatformInterface {
  /// Constructs a KakaoPixelSdkPlatform.
  KakaoPixelSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static KakaoPixelSdkPlatform _instance = MethodChannelKakaoPixelSdk();

  /// The default instance of [KakaoPixelSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelKakaoPixelSdk].
  static KakaoPixelSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KakaoPixelSdkPlatform] when
  /// they register themselves.
  static set instance(KakaoPixelSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> invokeEventJoin(String tag) {
    throw UnimplementedError('invokeEventJoin() has not been implemented.');
  }

  Future<bool> invokeEventSearch(String tag, String keyword) {
    throw UnimplementedError('invokeEventSearch() has not been implemented.');
  }

  Future<bool> invokeEventInAppPurchase(String tag, String productId, String productName, int quantity, double price) {
    throw UnimplementedError('invokeEventInAppPurchase() has not been implemented.');
  }
}