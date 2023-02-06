import UIKit
import KakaoAdSDK
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        KakaoAdTracker.trackId = "4999657123241543393"
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        // 이벤트 트래커를 활성화 시킵니다. 이곳에 구현할 경우 앱이 active (비활성화 상태에서 활성화 상태로 돌아올 때) 될 때 마다 앱실행 이벤트가 발생합니다.
        KakaoAdTracker.activate()
    }
}
