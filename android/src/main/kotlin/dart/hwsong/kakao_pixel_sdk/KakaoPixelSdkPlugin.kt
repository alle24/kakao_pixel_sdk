package dart.hwsong.kakao_pixel_sdk

import androidx.annotation.NonNull
import com.kakao.ad.common.json.CompleteRegistration
import com.kakao.ad.common.json.Product
import com.kakao.ad.common.json.Purchase
import com.kakao.ad.common.json.Search
import com.kakao.ad.tracker.send

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.util.*

/** KakaoPixelSdkPlugin */
class KakaoPixelSdkPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kakao_pixel_sdk")
        channel.setMethodCallHandler(this)dd
    }

    private fun paramCheck(param: Any?): Boolean {
        return param != null && (param !is String || param.isNotEmpty())
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            "invokeEventInAppPurchase" -> {
                val tag = call.argument<String>("tag")
                val productId = call.argument<String>("productId")
                val productName = call.argument<String>("productName")
                val quantity = call.argument<Int>("quantity")
                val price = call.argument<Double>("price")
                if (paramCheck(tag) && paramCheck(productId) && paramCheck(productName) && paramCheck(quantity) && paramCheck(price)) {
                    val event = Purchase()
                    event.tag = tag // 분류
                    event.products = // 구매 상품 목록
                        listOf(
                            Product().also { product ->
                                product.id = productId
                                product.name = productName
                                product.quantity = quantity ?: 0
                                product.price = price ?: 0.0
                            },
                        )
                    event.currency = Currency.getInstance(Locale.KOREA) // 통화코드(ISO-4217)
                    event.total_quantity = quantity
                    event.total_price = price
                    event.send()
                    result.success(true)
                } else {
                    result.success(false)
                }
            }
            "invokeEventSearch" -> {
                val tag = call.argument<String>("tag")
                val keyword = call.argument<String>("keyword")
                if (paramCheck(tag) && paramCheck(keyword)) {
                    val event = Search()
                    event.tag = tag
                    event.search_string = keyword
                    event.send()
                    result.success(true)
                } else {
                    result.success(false)
                }
            }
            "invokeEventJoin" -> {
                val tag = call.argument<String>("tag")
                if (paramCheck(tag)) {
                    val event = CompleteRegistration()
                    event.tag = tag
                    event.send()
                    result.success(true)
                } else {
                    result.success(false)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}