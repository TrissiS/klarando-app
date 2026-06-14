package com.klarando.mobile

import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.WindowManager
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import androidx.core.view.WindowInsetsControllerCompat
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
  companion object {
    private const val PRINTER_LOG_TAG = "KlarandoPrinter"
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    enableKioskFullscreen()
  }

  override fun onResume() {
    super.onResume()
    enableKioskFullscreen()
  }

  override fun onWindowFocusChanged(hasFocus: Boolean) {
    super.onWindowFocusChanged(hasFocus)
    if (hasFocus) {
      enableKioskFullscreen()
    }
  }

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    Log.d(PRINTER_LOG_TAG, "configureFlutterEngine: registering printer MethodChannel")

    val printerAdapter = IncarNyxPrinterAdapter(applicationContext)
    MethodChannel(
      flutterEngine.dartExecutor.binaryMessenger,
      IncarNyxPrinterAdapter.CHANNEL_NAME,
    ).setMethodCallHandler { call, result ->
      Log.d(PRINTER_LOG_TAG, "MethodChannel call received: method=${call.method}")
      try {
        when (call.method) {
          "isPrinterAvailable" -> {
            Log.d(PRINTER_LOG_TAG, "Dispatching isPrinterAvailable")
            printerAdapter.isPrinterAvailable(result)
          }
          "printTest" -> {
            Log.d(PRINTER_LOG_TAG, "Dispatching printTest")
            printerAdapter.printTest(result)
          }
          "printKitchenTicket" -> {
            Log.d(PRINTER_LOG_TAG, "Dispatching printKitchenTicket")
            val arguments = call.arguments as? Map<*, *> ?: emptyMap<Any?, Any?>()
            printerAdapter.printKitchenTicket(arguments, result)
          }
          "printCustomerTicket" -> {
            Log.d(PRINTER_LOG_TAG, "Dispatching printCustomerTicket")
            val arguments = call.arguments as? Map<*, *> ?: emptyMap<Any?, Any?>()
            printerAdapter.printCustomerTicket(arguments, result)
          }
          else -> {
            Log.d(PRINTER_LOG_TAG, "Method not implemented: method=${call.method}")
            result.notImplemented()
          }
        }
      } catch (error: Throwable) {
        Log.e(PRINTER_LOG_TAG, "MethodChannel handler crashed for method=${call.method}", error)
        result.error(
          "PRINTER_CHANNEL_ERROR",
          error.message ?: "MethodChannel handler failed",
          null,
        )
      }
    }
  }

  private fun enableKioskFullscreen() {
    WindowCompat.setDecorFitsSystemWindows(window, false)
    val controller = WindowInsetsControllerCompat(window, window.decorView)
    controller.hide(WindowInsetsCompat.Type.systemBars())
    controller.systemBarsBehavior =
      WindowInsetsControllerCompat.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE

    @Suppress("DEPRECATION")
    window.decorView.systemUiVisibility =
      View.SYSTEM_UI_FLAG_LAYOUT_STABLE or
      View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or
      View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
      View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
      View.SYSTEM_UI_FLAG_FULLSCREEN or
      View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
  }
}
