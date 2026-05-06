import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

import 'klarando_api.dart';

enum EscPosPrinterMode { disabled, tcp, sunmi, debugLog, platformChannel }

class EscPosPrinterSettings {
  const EscPosPrinterSettings({
    required this.mode,
    this.tcpHost,
    this.tcpPort = 9100,
  });

  final EscPosPrinterMode mode;
  final String? tcpHost;
  final int tcpPort;
}

class ReceiptPrintQueueEntry {
  const ReceiptPrintQueueEntry({
    required this.id,
    required this.orderId,
    required this.kind,
    required this.createdAt,
    required this.escposBase64,
    required this.attempts,
    required this.status,
    this.errorMessage,
  });

  final String id;
  final String orderId;
  final String kind;
  final DateTime createdAt;
  final String escposBase64;
  final int attempts;
  final String status;
  final String? errorMessage;

  ReceiptPrintQueueEntry copyWith({
    int? attempts,
    String? status,
    String? errorMessage,
  }) {
    return ReceiptPrintQueueEntry(
      id: id,
      orderId: orderId,
      kind: kind,
      createdAt: createdAt,
      escposBase64: escposBase64,
      attempts: attempts ?? this.attempts,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

abstract class EscPosPrinterTransport {
  Future<void> printBase64(
    String base64Payload,
    EscPosPrinterSettings settings,
  );
}

class TcpEscPosPrinterTransport implements EscPosPrinterTransport {
  const TcpEscPosPrinterTransport();

  @override
  Future<void> printBase64(
    String base64Payload,
    EscPosPrinterSettings settings,
  ) async {
    final host = settings.tcpHost?.trim() ?? '';
    if (host.isEmpty) {
      throw const ApiException('TCP Drucker-IP/Host fehlt.');
    }
    final port = settings.tcpPort <= 0 ? 9100 : settings.tcpPort;
    final bytes = base64Decode(base64Payload);

    final socket = await Socket.connect(
      host,
      port,
      timeout: const Duration(seconds: 4),
    );

    try {
      socket.add(bytes);
      await socket.flush().timeout(const Duration(seconds: 4));
    } finally {
      await socket.close();
      socket.destroy();
    }
  }
}

class PlatformEscPosPrinterTransport implements EscPosPrinterTransport {
  const PlatformEscPosPrinterTransport();

  static const MethodChannel _channel = MethodChannel('klarando/escpos');

  @override
  Future<void> printBase64(
    String base64Payload,
    EscPosPrinterSettings settings,
  ) async {
    final ok = await _channel.invokeMethod<bool>('printEscPosBase64', {
      'payload': base64Payload,
      'mode': settings.mode.name,
    });
    if (ok != true) {
      throw const ApiException('Plattformdruck fehlgeschlagen.');
    }
  }
}

class ReceiptPrintQueue {
  ReceiptPrintQueue({
    required this.settings,
    required this.onChanged,
    this.maxAttempts = 3,
  }) {
    _transport = _resolveTransport(settings.mode);
  }

  EscPosPrinterSettings settings;
  final void Function(List<ReceiptPrintQueueEntry> entries) onChanged;
  final int maxAttempts;

  final List<ReceiptPrintQueueEntry> _entries = <ReceiptPrintQueueEntry>[];
  bool _processing = false;
  late EscPosPrinterTransport _transport;

  List<ReceiptPrintQueueEntry> get entries => List.unmodifiable(_entries);

  void updateSettings(EscPosPrinterSettings nextSettings) {
    settings = nextSettings;
    _transport = _resolveTransport(nextSettings.mode);
  }

  void enqueue({
    required String orderId,
    required PublicOrderDisplayReceiptJob job,
  }) {
    final entry = ReceiptPrintQueueEntry(
      id: 'q_${DateTime.now().microsecondsSinceEpoch}_${_entries.length + 1}',
      orderId: orderId,
      kind: job.kind,
      createdAt: DateTime.now(),
      escposBase64: job.escposBase64,
      attempts: 0,
      status: 'PENDING',
    );
    _entries.insert(0, entry);
    _emit();
  }

  Future<void> process() async {
    if (_processing || settings.mode == EscPosPrinterMode.disabled) {
      return;
    }
    _processing = true;
    try {
      while (true) {
        final index = _entries.indexWhere((entry) => entry.status == 'PENDING');
        if (index < 0) {
          break;
        }
        var current = _entries[index];
        current = current.copyWith(
          status: 'PRINTING',
          attempts: current.attempts + 1,
        );
        _entries[index] = current;
        _emit();

        try {
          await _transport.printBase64(current.escposBase64, settings);
          _entries[index] = current.copyWith(
            status: 'DONE',
            errorMessage: null,
          );
          _emit();
        } catch (error) {
          final message = error is ApiException
              ? error.message
              : error.toString();
          if (current.attempts >= maxAttempts) {
            _entries[index] = current.copyWith(
              status: 'FAILED',
              errorMessage: message,
            );
          } else {
            _entries[index] = current.copyWith(
              status: 'PENDING',
              errorMessage: message,
            );
            await Future<void>.delayed(
              Duration(milliseconds: 900 * current.attempts),
            );
          }
          _emit();
        }
      }
    } finally {
      _processing = false;
    }
  }

  void clearFinished() {
    _entries.removeWhere((entry) => entry.status == 'DONE');
    _emit();
  }

  EscPosPrinterTransport _resolveTransport(EscPosPrinterMode mode) {
    if (mode == EscPosPrinterMode.tcp) {
      return const TcpEscPosPrinterTransport();
    }
    if (mode == EscPosPrinterMode.sunmi) {
      return const SunmiEscPosPrinterTransport();
    }
    if (mode == EscPosPrinterMode.debugLog) {
      return const DebugLogEscPosPrinterTransport();
    }
    if (mode == EscPosPrinterMode.platformChannel) {
      return const PlatformEscPosPrinterTransport();
    }
    return const _DisabledTransport();
  }

  void _emit() {
    onChanged(List.unmodifiable(_entries));
  }
}

class _DisabledTransport implements EscPosPrinterTransport {
  const _DisabledTransport();

  @override
  Future<void> printBase64(
    String base64Payload,
    EscPosPrinterSettings settings,
  ) async {
    throw const ApiException('Drucker ist deaktiviert.');
  }
}

class SunmiEscPosPrinterTransport implements EscPosPrinterTransport {
  const SunmiEscPosPrinterTransport();

  @override
  Future<void> printBase64(
    String base64Payload,
    EscPosPrinterSettings settings,
  ) async {
    if (!Platform.isAndroid) {
      throw const ApiException(
        'Sunmi-Druck wird nur auf Android unterstuetzt.',
      );
    }

    final bytes = base64Decode(base64Payload);
    try {
      await SunmiPrinter.printEscPos(bytes);
    } catch (error) {
      throw ApiException('Sunmi-Druck fehlgeschlagen: $error');
    }
  }
}

class DebugLogEscPosPrinterTransport implements EscPosPrinterTransport {
  const DebugLogEscPosPrinterTransport();

  static String? _lastLogFilePath;
  static String? get lastLogFilePath => _lastLogFilePath;

  @override
  Future<void> printBase64(
    String base64Payload,
    EscPosPrinterSettings settings,
  ) async {
    final now = DateTime.now();
    final bytes = base64Decode(base64Payload);
    final directory = Directory(
      '${Directory.systemTemp.path}${Platform.pathSeparator}klarando_cashier_receipt_logs',
    );
    await directory.create(recursive: true);

    final file = File(
      '${directory.path}${Platform.pathSeparator}receipt_${_dateStamp(now)}.jsonl',
    );
    final line =
        jsonEncode({
          'ts': now.toIso8601String(),
          'bytesLength': bytes.length,
          'base64Preview': base64Payload.length <= 120
              ? base64Payload
              : '${base64Payload.substring(0, 120)}...',
        }) +
        '\n';
    await file.writeAsString(line, mode: FileMode.append, flush: true);
    _lastLogFilePath = file.path;
  }
}

String _dateStamp(DateTime value) {
  final y = value.year.toString().padLeft(4, '0');
  final m = value.month.toString().padLeft(2, '0');
  final d = value.day.toString().padLeft(2, '0');
  return '$y$m$d';
}
