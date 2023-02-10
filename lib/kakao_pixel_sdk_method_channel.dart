import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kakao_pixel_sdk_platform_interface.dart';

/// An implementation of [KakaoPixelSdkPlatform] that uses method channels.
class MethodChannelKakaoPixelSdk extends KakaoPixelSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('kakao_pixel_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> invokeEventInAppPurchase(String tag, String productId, String productName, int quantity, double price) async {
    final result = await methodChannel.invokeMethod<bool>('invokeEventInAppPurchase', {'tag': tag, 'productId': productId, 'productName': productName, 'quantity': quantity, 'price': price});
    return result ?? false;
  }

  @override
  Future<bool> invokeEventSearch(String tag, String keyword) async {
    final result = await methodChannel.invokeMethod<bool>('invokeEventSearch', {'tag': tag, 'keyword': keyword});
    return result ?? false;
  }

  @override
  Future<bool> invokeEventJoin(String tag) async {
    final result = await methodChannel.invokeMethod<bool>('invokeEventJoin', {'tag': tag});
    return result ?? false;
  }
}