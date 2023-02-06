package dart.hwsong.kakao_pixel_sdk_example

import android.os.Bundle
import com.kakao.ad.tracker.KakaoAdTracker
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        if (!KakaoAdTracker.isInitialized) {
            KakaoAdTracker.init(applicationContext, getString(R.string.kakao_ad_track_id))
        }
    }
}
