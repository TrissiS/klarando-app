import 'package:flutter/services.dart';

import 'klarando_api.dart';

class OrderDeskNativePrinter {
  const OrderDeskNativePrinter();

  static const MethodChannel _channel = MethodChannel(
    'klarando/orderdesk_printer',
  );

  Future<bool> isPrinterAvailable() async {
    try {
      final available = await _channel.invokeMethod<bool>('isPrinterAvailable');
      return available ?? false;
    } on PlatformException catch (error) {
      throw _mapPlatformException(error);
    }
  }

  Future<Map<String, dynamic>?> printTest() async {
    try {
      final response = await _channel.invokeMethod<dynamic>('printTest');
      if (response is Map) {
        return Map<String, dynamic>.from(
          response.map(
            (key, value) => MapEntry(key.toString(), value),
          ),
        );
      }
      return null;
    } on PlatformException catch (error) {
      throw _mapPlatformException(error);
    }
  }

  Future<void> printKitchenTicket({
    required String orderNumber,
    required String time,
    required List<String> items,
    String? notes,
  }) async {
    try {
      await _channel.invokeMethod<void>('printKitchenTicket', {
        'orderNumber': orderNumber,
        'time': time,
        'items': items,
        'notes': notes,
      });
    } on PlatformException catch (error) {
      throw _mapPlatformException(error);
    }
  }

  Future<void> printCustomerTicket({
    required String orderNumber,
    required String serviceType,
    required String customer,
    required String address,
    required String payment,
    required List<String> items,
    required String total,
  }) async {
    try {
      await _channel.invokeMethod<void>('printCustomerTicket', {
        'orderNumber': orderNumber,
        'serviceType': serviceType,
        'customer': customer,
        'address': address,
        'payment': payment,
        'items': items,
        'total': total,
      });
    } on PlatformException catch (error) {
      throw _mapPlatformException(error);
    }
  }

  ApiException _mapPlatformException(PlatformException error) {
    final details = error.details;
    final responseBody = details is Map
        ? Map<String, dynamic>.from(
            details.map(
              (key, value) => MapEntry(key.toString(), value),
            ),
          )
        : <String, dynamic>{};
    responseBody['platformCode'] = error.code;
    return ApiException(
      error.message?.trim().isNotEmpty == true
          ? error.message!.trim()
          : 'Druckeraktion fehlgeschlagen (${error.code}).',
      responseBody: responseBody,
    );
  }
}
