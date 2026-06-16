package com.klarando.mobile

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.PackageManager
import android.os.Handler
import android.os.IBinder
import android.os.IInterface
import android.os.Parcel
import android.os.Looper
import android.os.RemoteException
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import net.nyx.printerservice.print.PrintTextFormat
import java.lang.reflect.Method
import java.util.concurrent.atomic.AtomicBoolean

class IncarNyxPrinterAdapter(
  private val context: Context,
) {
  companion object {
    const val CHANNEL_NAME = "klarando/orderdesk_printer"
    private const val TAG = "KlarandoPrinter"
    private const val PRINTER_INTERFACE_DESCRIPTOR =
      "net.nyx.printerservice.print.IPrinterService"

    private const val PRINTER_SERVICE_PACKAGE = "com.incar.printerservice"
    private const val PRINTER_SERVICE_ACTION = "com.incar.printerservice.IPrinterService"
    private const val PRINTER_SERVICE_CLASS =
      "net.nyx.printerservice.print.PrinterService"
    private const val SDK_MISSING_MESSAGE =
      "Nyx/Incar Druckservice gefunden, aber SDK/AIDL-Schnittstelle noch nicht eingebunden."
    private const val TRANSACTION_PRINT_TEXT = 7
    private const val TRANSACTION_PRINT_TEXT_WITH_POSITION = 8
    private const val TRANSACTION_COMMIT_PRINT_JOB = 21
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
    cleanupActiveBinding()

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
        val localInterface = try {
          if (service != null && descriptor != null) {
            service.queryLocalInterface(descriptor)
          } else {
            null
          }
        } catch (error: Throwable) {
          Log.e(TAG, "Failed querying local interface", error)
          null
        }
        val discoveredMethods = describeBinderMethods(
          binder = service,
          localInterface = localInterface,
          typedPrinterService = localInterface,
        )
        Log.d(TAG, "binder descriptor: $descriptor")
        Log.d(
          TAG,
          "KLARANDO_PRINTER_METHODS ${mapOf(
            "binderClass" to service?.javaClass?.name,
            "binderDescriptor" to descriptor,
            "directDescriptorMatch" to (descriptor == PRINTER_INTERFACE_DESCRIPTOR),
            "localInterfaceClass" to localInterface?.javaClass?.name,
            "binderMethods" to discoveredMethods["binderMethods"],
            "localInterfaceMethods" to discoveredMethods["localInterfaceMethods"],
            "typedInterfaceMethods" to discoveredMethods["typedInterfaceMethods"],
          )}",
        )
        val printOutcome = if (ticketType == "test" && service != null) {
          executeVendorTestPrint(service)
        } else {
          PrintAttemptResult.skipped("Nur Testdruck fuehrt aktuell einen echten Vendor-Druck aus.")
        }
        val connectedDetails = bindAttemptDetails + mapOf(
          "bound" to true,
          "bindServiceReturned" to didBind.get(),
          "onServiceConnectedCalled" to true,
          "binderObjectPresent" to (service != null),
          "binderInterfaceDescriptor" to descriptor,
          "preparedAidlInterface" to PRINTER_INTERFACE_DESCRIPTOR,
          "directDescriptorMatch" to (descriptor == PRINTER_INTERFACE_DESCRIPTOR),
          "localInterfaceClass" to localInterface?.javaClass?.name,
          "binderMethods" to discoveredMethods["binderMethods"],
          "localInterfaceMethods" to discoveredMethods["localInterfaceMethods"],
          "typedInterfaceMethods" to discoveredMethods["typedInterfaceMethods"],
          "printAttempted" to printOutcome.attempted,
          "printSucceeded" to printOutcome.succeeded,
          "printResultCodes" to printOutcome.resultCodes,
          "printError" to printOutcome.error,
          "serviceComponent" to name?.flattenToShortString(),
        )
        Log.d(TAG, "printProbe[$ticketType] connected: $connectedDetails")
        rememberActiveBinding(this, service, localInterface)
        if (printOutcome.succeeded) {
          result.success(connectedDetails)
        } else {
          result.error(
            "PRINTER_PRINT_FAILED",
            printOutcome.error ?: SDK_MISSING_MESSAGE,
            connectedDetails,
          )
        }
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

  @Volatile
  private var activeConnection: ServiceConnection? = null

  @Volatile
  private var activeBinder: IBinder? = null

  @Volatile
  private var activePrinterService: IInterface? = null

  private fun rememberActiveBinding(
    connection: ServiceConnection,
    binder: IBinder?,
    printerService: IInterface?,
  ) {
    activeConnection = connection
    activeBinder = binder
    activePrinterService = printerService
  }

  private fun cleanupActiveBinding() {
    val connection = activeConnection ?: return
    safelyUnbind(connection, true)
    activeConnection = null
    activeBinder = null
    activePrinterService = null
  }

  private fun executeVendorTestPrint(service: IBinder): PrintAttemptResult {
    Log.d(TAG, "executeVendorTestPrint start")
    val format = PrintTextFormat().apply {
      b(1)
      c(32)
      a(1)
    }
    val resultCodes = linkedMapOf<String, Int>()

    return try {
      resultCodes["headline"] = transactPrintText(
        binder = service,
        text = "KLARANDO ORDERDESK TEST\n",
        format = format,
      )

      format.b(0)
      format.c(24)
      format.a(0)

      resultCodes["body"] = transactPrintText(
        binder = service,
        text = "Drucker erkannt und Vendor-Service angebunden.\n",
        format = format,
      )
      resultCodes["body2"] = transactPrintText(
        binder = service,
        text = "Wenn dieser Text auf Papier erscheint, ist der Textdruck aktiv.\n\n",
        format = format,
      )

      format.a(1)
      resultCodes["footer"] = transactPrintText(
        binder = service,
        text = "*** Testdruck abgeschlossen ***\n",
        format = format,
      )

      resultCodes["commit"] = transactCommitPrintJob(service)
      Log.d(TAG, "executeVendorTestPrint success: $resultCodes")
      PrintAttemptResult.success(resultCodes)
    } catch (error: Throwable) {
      Log.e(TAG, "executeVendorTestPrint failed", error)
      PrintAttemptResult.failure(resultCodes, error)
    }
  }

  private fun transactPrintText(
    binder: IBinder,
    text: String,
    format: PrintTextFormat,
  ): Int {
    val data = Parcel.obtain()
    val reply = Parcel.obtain()
    return try {
      data.writeInterfaceToken(PRINTER_INTERFACE_DESCRIPTOR)
      data.writeString(text)
      data.writeInt(1)
      format.writeToParcel(data, 0)
      val transacted = binder.transact(TRANSACTION_PRINT_TEXT, data, reply, 0)
      Log.d(
        TAG,
        "transactPrintText: transacted=$transacted text=${text.trim()} formatSize=${format.h} align=${format.p} style=${format.q}",
      )
      if (!transacted) {
        throw RemoteException("Printer transact($TRANSACTION_PRINT_TEXT) returned false")
      }
      reply.readException()
      reply.readInt()
    } finally {
      reply.recycle()
      data.recycle()
    }
  }

  private fun transactCommitPrintJob(binder: IBinder): Int {
    val data = Parcel.obtain()
    val reply = Parcel.obtain()
    return try {
      data.writeInterfaceToken(PRINTER_INTERFACE_DESCRIPTOR)
      val transacted = binder.transact(TRANSACTION_COMMIT_PRINT_JOB, data, reply, 0)
      Log.d(TAG, "transactCommitPrintJob: transacted=$transacted")
      if (!transacted) {
        throw RemoteException("Printer transact($TRANSACTION_COMMIT_PRINT_JOB) returned false")
      }
      reply.readException()
      reply.readInt()
    } finally {
      reply.recycle()
      data.recycle()
    }
  }

  private fun describeBinderMethods(
    binder: IBinder?,
    localInterface: IInterface?,
    typedPrinterService: IInterface?,
  ): Map<String, List<String>> {
    return mapOf(
      "binderMethods" to extractMethodSignatures(binder?.javaClass),
      "localInterfaceMethods" to extractMethodSignatures(localInterface?.javaClass),
      "typedInterfaceMethods" to extractMethodSignatures(typedPrinterService?.javaClass),
    )
  }

  private fun extractMethodSignatures(type: Class<*>?): List<String> {
    if (type == null) {
      return emptyList()
    }

    return type.methods
      .map(::formatMethodSignature)
      .distinct()
      .sorted()
  }

  private fun formatMethodSignature(method: Method): String {
    val parameterList = method.parameterTypes.joinToString(",") { it.simpleName }
    return "${method.name}($parameterList): ${method.returnType.simpleName}"
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

  private data class PrintAttemptResult(
    val attempted: Boolean,
    val succeeded: Boolean,
    val resultCodes: Map<String, Int>,
    val error: String?,
  ) {
    companion object {
      fun success(resultCodes: Map<String, Int>): PrintAttemptResult {
        return PrintAttemptResult(
          attempted = true,
          succeeded = true,
          resultCodes = resultCodes,
          error = null,
        )
      }

      fun failure(resultCodes: Map<String, Int>, error: Throwable): PrintAttemptResult {
        return PrintAttemptResult(
          attempted = true,
          succeeded = false,
          resultCodes = resultCodes,
          error = error.message ?: error.javaClass.simpleName,
        )
      }

      fun skipped(reason: String): PrintAttemptResult {
        return PrintAttemptResult(
          attempted = false,
          succeeded = false,
          resultCodes = emptyMap(),
          error = reason,
        )
      }
    }
  }
}
