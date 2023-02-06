#import "KakaoPixelSdkPlugin.h"
#if __has_include(<kakao_pixel_sdk/kakao_pixel_sdk-Swift.h>)
#import <kakao_pixel_sdk/kakao_pixel_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kakao_pixel_sdk-Swift.h"
#endif

@implementation KakaoPixelSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKakaoPixelSdkPlugin registerWithRegistrar:registrar];
}
@end
