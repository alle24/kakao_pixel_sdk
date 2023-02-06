
import 'kakao_pixel_sdk_platform_interface.dart';

class KakaoPixelSdk {
  Future<String?> getPlatformVersion() {
    return KakaoPixelSdkPlatform.instance.getPlatformVersion();
  }

  Future<bool> invokeEventInAppPurchase(String tag, String productId, String productName, int quantity, double price) {
    return KakaoPixelSdkPlatform.instance.invokeEventInAppPurchase(tag, productId, productName, quantity, price);
  }

  Future<bool> invokeEventSearch(String tag, String keyword) {
    return KakaoPixelSdkPlatform.instance.invokeEventSearch(tag, keyword);
  }

  Future<bool> invokeEventJoin(String tag) {
    return KakaoPixelSdkPlatform.instance.invokeEventJoin(tag);
  }
}
