import Flutter
import UIKit
import KakaoAdSDK

public class SwiftKakaoPixelSdkPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kakao_pixel_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftKakaoPixelSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    private func paramCheck(param: Any?) -> Bool {
        return param != nil && (!(param is String) || !(param as! String).isEmpty)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "invokeEventInAppPurchase":
            guard let argMaps = call.arguments as? Dictionary<String, Any>,
                  let tag = argMaps["tag"] as? String,
                  let productId = argMaps["productId"] as? String,
                  let productName = argMaps["productName"] as? String,
                  let quantity = argMaps["quantity"] as? Int,
                  let price = argMaps["price"] as? Double else {
                result(FlutterError(code: call.method, message: "Missing some arguments", details: nil))
                return
            }
            if (paramCheck(param: tag) && paramCheck(param: productId) && paramCheck(param: productName) && paramCheck(param: quantity)) {
                
                let product = KakaoAdDetailProduct(name: productName, quantity: quantity, price: price)
                let currency = "KRW"
                
                KakaoAdTracker.sendPurchaseEvent(tag: tag, totalQuantity: quantity, totalPrice: price, currency:currency, products:[product])
                result(true)
            } else {
                result(false)
            }
        case "invokeEventSearch":
            guard let argMaps = call.arguments as? Dictionary<String, Any>,
                  let tag = argMaps["tag"] as? String,
                  let keyword = argMaps["keyword"] as? String else {
                result(FlutterError(code: call.method, message: "Missing argument: tag or keyword", details: nil))
                return
            }
            if (paramCheck(param: tag) && paramCheck(param: keyword)) {
                KakaoAdTracker.sendSearchEvent(tag: tag, searchString: keyword)
                result(true)
            } else {
                result(false)
            }
        case "invokeEventJoin":
            guard let argMaps = call.arguments as? Dictionary<String, Any>,
                  let tag = argMaps["tag"] as? String else {
                result(FlutterError(code: call.method, message: "Missing argument: tag", details: nil))
                return
            }
            if (paramCheck(param: tag)) {
                KakaoAdTracker.sendCompleteRegisterEvent(tag: tag)
                result(true)
            } else {
                result(false)
            }
        default:
            result(FlutterMethodNotImplemented)
            
        }
    }
}
