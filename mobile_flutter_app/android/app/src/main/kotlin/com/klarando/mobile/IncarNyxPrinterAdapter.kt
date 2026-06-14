package com.klarando.mobile

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.PackageManager
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.atomic.AtomicBoolean

class IncarNyxPrinterAdapter(
  private val context: Context,
) {
  companion object {
    const val CHANNEL_NAME = "klarando/orderdesk_printer"
    private const val TAG = "KlarandoPrinter"

    private const val PRINTER_SERVICE_PACKAGE = "com.incar.printerservice"
    private const val PRINTER_SERVICE_ACTION = "com.incar.printerservice.IPrinterService"
    private const val PRINTER_SERVICE_CLASS =
      "net.nyx.printerservice.print.PrinterService"
    private const val SDK_MISSING_MESSAGE =
      "Nyx/Incar Druckservice gefunden, aber SDK/AIDL-Schnittstelle noch nicht eingebunden."
  }

  fun isPrinterAvailable(result: MethodChannel.Result) {
    Log.d(TAG, "isPrinterAvailable start")
    try {
      val availability = buildAvailability()
      Log.d(TAG, "isPrinterAvailable result: ${availability.toMap()}")
      result.success(availability.serviceAvailable)
    } catch (error: Throwable) {
      Log.e(TAG, "isPrinterAvailable failed", error)
      throw error
    }
  }

  fun printTest(result: MethodChannel.Result) {
    Log.d(TAG, "printTest start")
    performPrintProbe("test", result)
  }

  fun printKitchenTicket(arguments: Map<*, *>, result: MethodChannel.Result) {
    performPrintProbe(
      "kitchen",
      result,
      extraDetails = mapOf(
        "preview" to buildKitchenTicketPreview(arguments),
      ),
    )
  }

  fun printCustomerTicket(arguments: Map<*, *>, result: MethodChannel.Result) {
    performPrintProbe(
      "customer",
      result,
      extraDetails = mapOf(
        "preview" to buildCustomerTicketPreview(arguments),
      ),
    )
  }

  private fun performPrintProbe(
    ticketType: String,
    result: MethodChannel.Result,
    extraDetails: Map<String, Any?> = emptyMap(),
  ) {
    val availability = buildAvailability()
    if (!availability.serviceInstalled || !availability.serviceDeclared) {
      Log.e(TAG, "printProbe[$ticketType] service unavailable: ${availability.toMap(ticketType = ticketType, extraDetails = extraDetails)}")
      result.error(
        "PRINTER_UNAVAILABLE",
        "Nyx/Incar Druckservice nicht gefunden.",
        availability.toMap(ticketType = ticketType, extraDetails = extraDetails),
      )
      return
    }

    val intent = buildPrinterIntent()
    val mainHandler = Handler(Looper.getMainLooper())
    val resolved = AtomicBoolean(false)
    val didBind = AtomicBoolean(false)
    val onServiceConnectedCalled = AtomicBoolean(false)
    val bindAttemptDetails = availability.toMap(
      ticketType = ticketType,
      extraDetails = extraDetails + mapOf(
        "packageAvailable" to availability.serviceInstalled,
        "serviceIntent" to describeIntent(intent),
      ),
    )

    Log.d(TAG, "printProbe[$ticketType] start: $bindAttemptDetails")
    Log.d(TAG, "bindService attempt: intent=${describeIntent(intent)}")

    lateinit var connection: ServiceConnection
    val timeout = Runnable {
      if (!resolved.compareAndSet(false, true)) {
        return@Runnable
      }
      safelyUnbind(connection, didBind.get())
      val timeoutDetails = bindAttemptDetails + mapOf(
        "bindTimedOut" to true,
        "bindServiceReturned" to didBind.get(),
        "onServiceConnectedCalled" to onServiceConnectedCalled.get(),
      )
      Log.d(TAG, "printProbe[$ticketType] timeout: $timeoutDetails")
      result.error(
        "PRINTER_BIND_TIMEOUT",
        SDK_MISSING_MESSAGE,
        timeoutDetails,
      )
    }

    connection = object : ServiceConnection {
      override fun onServiceConnected(name: ComponentName?, service: IBinder?) {
        onServiceConnectedCalled.set(true)
        Log.d(TAG, "onServiceConnected: component=${name?.flattenToShortString()} binderPresent=${service != null}")
        if (!resolved.compareAndSet(false, true)) {
          return
        }
        mainHandler.removeCallbacks(timeout)
        val descriptor = try {
          service?.interfaceDescriptor
        } catch (error: Throwable) {
          Log.e(TAG, "Failed reading binder descriptor", error)
          null
        }
        Log.d(TAG, "binder descriptor: $descriptor")
        // TODO(printer): Sobald der echte Binder-Descriptor stabil bekannt ist,
        // die passende Nyx/Incar-AIDL-Datei einbinden und hier das konkrete
        // Service-Interface statt der reinen Bind-Diagnose verwenden.
        val connectedDetails = bindAttemptDetails + mapOf(
          "bound" to true,
          "bindServiceReturned" to didBind.get(),
          "onServiceConnectedCalled" to true,
          "binderObjectPresent" to (service != null),
          "binderInterfaceDescriptor" to descriptor,
          "aidlTodo" to "AIDL/SDK fehlt noch. Binder-Descriptor fuer Interface-Namen auswerten und passende AIDL-Datei einbinden.",
          "serviceComponent" to name?.flattenToShortString(),
        )
        Log.d(TAG, "printProbe[$ticketType] connected: $connectedDetails")
        safelyUnbind(this, didBind.get())
        result.error(
          "PRINTER_SDK_MISSING",
          SDK_MISSING_MESSAGE,
          connectedDetails,
        )
      }

      override fun onNullBinding(name: ComponentName?) {
        Log.d(TAG, "onNullBinding: component=${name?.flattenToShortString()}")
        if (!resolved.compareAndSet(false, true)) {
          return
        }
        mainHandler.removeCallbacks(timeout)
        safelyUnbind(this, didBind.get())
        val details = bindAttemptDetails + mapOf(
          "nullBinding" to true,
          "bindServiceReturned" to didBind.get(),
          "onServiceConnectedCalled" to onServiceConnectedCalled.get(),
          "serviceComponent" to name?.flattenToShortString(),
        )
        Log.d(TAG, "printProbe[$ticketType] nullBinding: $details")
        result.error(
          "PRINTER_NULL_BINDING",
          SDK_MISSING_MESSAGE,
          details,
        )
      }

      override fun onServiceDisconnected(name: ComponentName?) {
        Log.d(TAG, "onServiceDisconnected: component=${name?.flattenToShortString()}")
      }

      override fun onBindingDied(name: ComponentName?) {
        Log.e(TAG, "onBindingDied: component=${name?.flattenToShortString()}")
        if (!resolved.compareAndSet(false, true)) {
          return
        }
        mainHandler.removeCallbacks(timeout)
        safelyUnbind(this, didBind.get())
        val details = bindAttemptDetails + mapOf(
          "bindingDied" to true,
          "bindServiceReturned" to didBind.get(),
          "onServiceConnectedCalled" to onServiceConnectedCalled.get(),
          "serviceComponent" to name?.flattenToShortString(),
        )
        Log.d(TAG, "printProbe[$ticketType] bindingDied: $details")
        result.error(
          "PRINTER_BINDING_DIED",
          SDK_MISSING_MESSAGE,
          details,
        )
      }
    }

    val bound = try {
      context.bindService(intent, connection, Context.BIND_AUTO_CREATE)
    } catch (error: SecurityException) {
      Log.e(TAG, "bindService security exception", error)
      false
    } catch (error: Throwable) {
      Log.e(TAG, "bindService exception", error)
      false
    }
    didBind.set(bound)
    Log.d(
      TAG,
      "printProbe[$ticketType] bindService returned: ${didBind.get()} intent=${describeIntent(intent)}",
    )
    if (!bound) {
      val details = bindAttemptDetails + mapOf(
        "bindReturnedFalse" to true,
        "bindServiceReturned" to false,
        "onServiceConnectedCalled" to false,
      )
      Log.d(TAG, "printProbe[$ticketType] bindFailed: $details")
      result.error(
        "PRINTER_BIND_FAILED",
        SDK_MISSING_MESSAGE,
        details,
      )
      return
    }

    mainHandler.postDelayed(timeout, 1500)
  }

  private fun safelyUnbind(connection: ServiceConnection, wasBound: Boolean) {
    if (!wasBound) {
      return
    }
    try {
      context.unbindService(connection)
      Log.d(TAG, "unbindService success")
    } catch (_: IllegalArgumentException) {
      // Service already disconnected.
      Log.d(TAG, "unbindService skipped: already disconnected")
    } catch (error: Throwable) {
      // Keep failure isolated from Flutter response flow.
      Log.e(TAG, "unbindService failed", error)
    }
  }

  private fun buildAvailability(): PrinterAvailability {
    val serviceInstalled = try {
      @Suppress("DEPRECATION")
      context.packageManager.getPackageInfo(PRINTER_SERVICE_PACKAGE, 0)
      true
    } catch (_: PackageManager.NameNotFoundException) {
      false
    }

    val resolvedService = context.packageManager.resolveService(
      buildPrinterIntent(),
      0,
    )

    return PrinterAvailability(
      serviceInstalled = serviceInstalled,
      serviceDeclared = resolvedService != null,
    )
  }

  private fun buildPrinterIntent(): Intent {
    return Intent(PRINTER_SERVICE_ACTION).apply {
      setClassName(PRINTER_SERVICE_PACKAGE, PRINTER_SERVICE_CLASS)
      `package` = PRINTER_SERVICE_PACKAGE
    }
  }

  private fun describeIntent(intent: Intent): Map<String, String?> {
    return mapOf(
      "action" to intent.action,
      "package" to intent.`package`,
      "component" to intent.component?.flattenToShortString(),
    )
  }

  private fun buildKitchenTicketPreview(arguments: Map<*, *>): String {
    val orderNumber = arguments["orderNumber"]?.toString()?.ifBlank { "-" } ?: "-"
    val timeLabel = arguments["time"]?.toString()?.ifBlank { "-" } ?: "-"
    val notes = arguments["notes"]?.toString()?.trim().orEmpty()
    val items = (arguments["items"] as? List<*>)?.joinToString("\n") { "- ${it.toString()}" }
      ?.ifBlank { "- Keine Artikel" } ?: "- Keine Artikel"

    return buildString {
      appendLine("KLARANDO KUECHE")
      appendLine("Bestellnummer: $orderNumber")
      appendLine("Uhrzeit: $timeLabel")
      appendLine("------------------------------")
      appendLine(items)
      if (notes.isNotEmpty()) {
        appendLine("------------------------------")
        appendLine("Hinweise:")
        appendLine(notes)
      }
    }.trim()
  }

  private fun buildCustomerTicketPreview(arguments: Map<*, *>): String {
    val orderNumber = arguments["orderNumber"]?.toString()?.ifBlank { "-" } ?: "-"
    val serviceType = arguments["serviceType"]?.toString()?.ifBlank { "-" } ?: "-"
    val customer = arguments["customer"]?.toString()?.ifBlank { "-" } ?: "-"
    val address = arguments["address"]?.toString()?.ifBlank { "-" } ?: "-"
    val payment = arguments["payment"]?.toString()?.ifBlank { "-" } ?: "-"
    val total = arguments["total"]?.toString()?.ifBlank { "-" } ?: "-"
    val items = (arguments["items"] as? List<*>)?.joinToString("\n") { "- ${it.toString()}" }
      ?.ifBlank { "- Keine Artikel" } ?: "- Keine Artikel"

    return buildString {
      appendLine("KLARANDO")
      appendLine("Bestellnummer: $orderNumber")
      appendLine("Lieferart: $serviceType")
      appendLine("Kunde: $customer")
      appendLine("Adresse: $address")
      appendLine("Zahlung: $payment")
      appendLine("------------------------------")
      appendLine(items)
      appendLine("------------------------------")
      appendLine("Gesamtbetrag: $total")
    }.trim()
  }

  private data class PrinterAvailability(
    val serviceInstalled: Boolean,
    val serviceDeclared: Boolean,
  ) {
    val serviceAvailable: Boolean
      get() = serviceInstalled && serviceDeclared

    fun toMap(
      ticketType: String? = null,
      extraDetails: Map<String, Any?> = emptyMap(),
    ): Map<String, Any?> {
      return buildMap {
        put("serviceInstalled", serviceInstalled)
        put("serviceDeclared", serviceDeclared)
        put("serviceAvailable", serviceAvailable)
        put("printerPackage", PRINTER_SERVICE_PACKAGE)
        put("printerAction", PRINTER_SERVICE_ACTION)
        put("printerClass", PRINTER_SERVICE_CLASS)
        if (ticketType != null) {
          put("ticketType", ticketType)
        }
        putAll(extraDetails)
      }
    }
  }
}
