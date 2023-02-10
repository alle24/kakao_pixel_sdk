import UIKit
import Flutter
import AdSupport
import AppTrackingTransparency
import KakaoAdSDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      print("didFinishLaunchingWithOptions")
      KakaoAdTracker.trackId = "4999657123241543393"
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  override func applicationDidBecomeActive(_ application: UIApplication) {
      print("applicationDidBecomeActive")
      KakaoAdTracker.activate()

      allowTracking()
  }
}

func allowTracking() {
    if #available(iOS 14, *) {
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                print("Authorized")
                print(ASIdentifierManager.shared().advertisingIdentifier)
            case .denied:
                print("Denied")
            case .notDetermined:
                print("Not Determined")
            case .restricted:
                print("Restricted")
            @unknown default:
                print("Unknown")
            }
        }
    }
}
