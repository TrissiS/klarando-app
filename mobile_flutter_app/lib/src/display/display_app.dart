import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'display_api.dart';
import 'display_content_screen.dart';
import 'display_pairing_screen.dart';

const _prefsDeviceToken = 'klarando_display_device_token';
const _prefsDisplayId = 'klarando_display_id';
const _prefsScreenId = 'klarando_display_screen_id';
const _prefsTenantId = 'klarando_display_tenant_id';
const _prefsDeviceCode = 'klarando_display_device_code';
const _prefsPairingToken = 'klarando_display_pairing_token';
const _prefsPairingSessionId = 'klarando_display_pairing_session_id';

class KlarandoDisplayApp extends StatelessWidget {
  const KlarandoDisplayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klarando Display',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFFF97316),
      ),
      home: const _DisplayRoot(),
    );
  }
}

class _DisplayRoot extends StatefulWidget {
  const _DisplayRoot();

  @override
  State<_DisplayRoot> createState() => _DisplayRootState();
}

class _DisplayRootState extends State<_DisplayRoot> {
  final _api = DisplayApi();

  Timer? _pairingPollTimer;
  Timer? _countdownTimer;
  Timer? _heartbeatTimer;
  Timer? _refreshTimer;

  String? _deviceToken;
  String? _deviceCode;
  String? _pairingToken;
  String? _pairingSessionId;
  String _pairingCode = '------';
  DateTime? _expiresAt;
  Map<String, dynamic>? _qrPayload;
  Map<String, dynamic>? _content;
  String? _message;
  bool _pairingSessionReady = false;
  int? _lastPairingHttpStatus;
  DateTime? _lastPairingAttemptAt;
  String _lastPollStatus = '-';
  String _lastPollState = '-';
  String _lastPollError = '-';
  bool _lastPollTokenReceived = false;
  String _lastContentEndpoint = '/api/display-runtime/:deviceCode/manifest';
  int? _lastContentHttpStatus;
  String _lastContentError = '-';
  int _lastContentProductCount = 0;
  String? _contentEtag;
  String _lastContentVersion = '-';
  String _savedDisplayId = '-';
  String _savedTenantId = '-';
  String _savedDeviceCode = '-';
  String _rendererVersion = 'flutter-manifest-renderer-v1';
  String _lastManifestUrl = '-';
  String _lastManifestBodyPreview = '-';
  String _lastPairingTokenPreview = '-';
  String _lastPairingSessionId = '-';
  bool _strictManifestFailed = false;
  static const String _pairingEndpoint = '/api/display/pairing/session';

  @override
  void initState() {
    super.initState();
    _prepareFullscreen();
    _bootstrap();
  }

  @override
  void dispose() {
    _pairingPollTimer?.cancel();
    _countdownTimer?.cancel();
    _heartbeatTimer?.cancel();
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _prepareFullscreen() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<void> _clearStoredDisplayState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsDeviceToken);
    await prefs.remove(_prefsDeviceCode);
    await prefs.remove(_prefsDisplayId);
    await prefs.remove(_prefsScreenId);
    await prefs.remove(_prefsTenantId);
    await prefs.remove(_prefsPairingToken);
    await prefs.remove(_prefsPairingSessionId);
  }

  Future<void> _restartPairingFlow() async {
    await _clearStoredDisplayState();
    _deviceToken = null;
    _deviceCode = null;
    _pairingToken = null;
    _pairingSessionId = null;
    _savedDeviceCode = '-';
    _savedDisplayId = '-';
    _savedTenantId = '-';
    _lastPairingTokenPreview = '-';
    _lastPairingSessionId = '-';
    _lastManifestUrl = '-';
    _lastManifestBodyPreview = '-';
    _lastContentHttpStatus = null;
    _lastContentVersion = '-';
    _lastContentProductCount = 0;
    _contentEtag = null;
    _content = null;
    _strictManifestFailed = false;
    _message = 'Neuer Pairing-Code wird erstellt …';
    if (mounted) {
      setState(() {});
    }
    await _startPairing();
  }

  Future<void> _bootstrap() async {
    final prefs = await SharedPreferences.getInstance();
    _deviceToken = prefs.getString(_prefsDeviceToken);
    _deviceCode = prefs.getString(_prefsDeviceCode);
    _savedDisplayId = prefs.getString(_prefsDisplayId) ?? '-';
    _savedTenantId = prefs.getString(_prefsTenantId) ?? '-';
    _savedDeviceCode = prefs.getString(_prefsDeviceCode) ?? '-';

    if (_deviceToken != null && _deviceToken!.isNotEmpty) {
      if ((_deviceCode ?? '').trim().isEmpty) {
        _strictManifestFailed = true;
        _message = 'NO DEVICE CODE AVAILABLE - bitte neu koppeln.';
        await prefs.remove(_prefsDeviceToken);
        await prefs.remove(_prefsDeviceCode);
        _deviceToken = null;
        _deviceCode = null;
        setState(() {});
        await _startPairing();
        return;
      }
      final ok = await _loadContent();
      if (ok) {
        _strictManifestFailed = false;
        _startBackgroundJobs();
        return;
      }
      _strictManifestFailed = true;
      _message = 'STRICT MANIFEST FAILED - Legacy Renderer disabled';
      setState(() {});
      return;
    }

    await _startPairing();
  }

  Future<void> _startPairing() async {
    _pairingPollTimer?.cancel();
    _countdownTimer?.cancel();
    _heartbeatTimer?.cancel();
    _refreshTimer?.cancel();

    _lastPairingAttemptAt = DateTime.now();
    _lastPairingHttpStatus = null;
    _message = null;
    _pairingSessionReady = false;
    setState(() {});

    try {
      final ui.FlutterView view = ui.PlatformDispatcher.instance.views.first;
      final Size logicalSize = view.physicalSize / view.devicePixelRatio;
      final response = await _api.createPairingSession();
      _pairingToken = '${response['pairingToken'] ?? ''}';
      _pairingSessionId = '${response['sessionId'] ?? response['id'] ?? ''}'.trim();
      _lastPairingSessionId = _pairingSessionId ?? '-';
      final prefs = await SharedPreferences.getInstance();
      if ((_pairingToken ?? '').trim().isNotEmpty) {
        await prefs.setString(_prefsPairingToken, _pairingToken!.trim());
      }
      if ((_pairingSessionId ?? '').trim().isNotEmpty) {
        await prefs.setString(_prefsPairingSessionId, _pairingSessionId!.trim());
      }
      _pairingCode = '${response['pairingCode'] ?? '------'}';
      _expiresAt = DateTime.tryParse('${response['expiresAt'] ?? ''}');
      _qrPayload = response['qrPayload'] is Map<String, dynamic>
          ? response['qrPayload'] as Map<String, dynamic>
          : null;
      if (_qrPayload != null) {
        _qrPayload = {
          ..._qrPayload!,
          'deviceResolution': {
            'width': view.physicalSize.width.round(),
            'height': view.physicalSize.height.round(),
            'dpr': double.parse(view.devicePixelRatio.toStringAsFixed(2)),
            'logicalWidth': double.parse(logicalSize.width.toStringAsFixed(1)),
            'logicalHeight': double.parse(logicalSize.height.toStringAsFixed(1)),
            'orientation': view.physicalSize.width >= view.physicalSize.height ? 'LANDSCAPE' : 'PORTRAIT',
          }
        };
      }
      _pairingSessionReady = _pairingToken != null && _pairingToken!.isNotEmpty;
      setState(() {});

      _pairingPollTimer = Timer.periodic(const Duration(seconds: 2), (_) {
        unawaited(_pollPairing());
      });
      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        final expiresAt = _expiresAt;
        if (expiresAt == null) return;
        if (DateTime.now().isAfter(expiresAt)) {
          unawaited(_startPairing());
        } else {
          setState(() {});
        }
      });
    } catch (error) {
      _pairingSessionReady = false;
      if (error is DisplayApiException) {
        _lastPairingHttpStatus = error.statusCode;
      }
      _message = _toFriendlyError(error);
      setState(() {});
    }
  }

  Future<void> _pollPairing() async {
    final token = _pairingToken;
    if (token == null || token.isEmpty) return;

    try {
      _lastPairingAttemptAt = DateTime.now();
      final response = await _api.getPairingStatus(token);
      _lastPairingTokenPreview = token.length <= 10 ? token : '${token.substring(0, 10)}...';
      final rawStatus = '${response['status'] ?? ''}'.trim();
      final rawState = '${response['state'] ?? ''}'.trim();
      final statusUpper = rawStatus.toUpperCase();
      final stateUpper = rawState.toUpperCase();
      _lastPollStatus = rawStatus.isEmpty ? '-' : rawStatus;
      _lastPollState = rawState.isEmpty ? '-' : rawState;
      _lastPollError = '-';
      if (statusUpper == 'PENDING' || stateUpper == 'PENDING') {
        _lastPollTokenReceived = false;
        _message = null;
        setState(() {});
        return;
      }
      if (statusUpper == 'EXPIRED' || stateUpper == 'EXPIRED') {
        _lastPollTokenReceived = false;
        _message = 'Code abgelaufen. Neuer QR-Code wird erstellt …';
        setState(() {});
        await _startPairing();
        return;
      }
      final isConnectedLike = statusUpper == 'CONNECTED' ||
          statusUpper == 'CLAIMED' ||
          rawStatus.toLowerCase() == 'connected' ||
          rawStatus.toLowerCase() == 'claimed' ||
          stateUpper == 'CONNECTED' ||
          stateUpper == 'CLAIMED' ||
          rawState.toLowerCase() == 'connected' ||
          rawState.toLowerCase() == 'claimed';
      if (!isConnectedLike) {
        _lastPollTokenReceived = false;
        _message = 'Unbekannter Pairing-Status: ${rawStatus.isEmpty ? rawState : rawStatus}';
        setState(() {});
        return;
      }

      final deviceToken = '${response['deviceToken'] ?? response['authToken'] ?? ''}'.trim();
      final deviceCode = '${response['deviceCode'] ?? response['displayCode'] ?? ''}'.trim().toUpperCase();
      final displayIdFromPairing = '${response['displayId'] ?? response['deviceId'] ?? ''}'.trim();
      final tenantIdFromPairing = '${response['tenantId'] ?? ''}'.trim();
      _lastPollTokenReceived = deviceToken.isNotEmpty;
      if (deviceToken.isEmpty) {
        _message = 'Display verbunden, aber es fehlt ein gültiges Gerätetoken.';
        setState(() {});
        return;
      }
      if (deviceCode.isEmpty) {
        _message = 'Display verbunden, aber deviceCode fehlt. Manifest kann nicht geladen werden.';
        setState(() {});
        return;
      }
      if (displayIdFromPairing.isEmpty || tenantIdFromPairing.isEmpty) {
        _message = 'Pairing unvollständig: displayId oder tenantId fehlt.';
        setState(() {});
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsDeviceToken, deviceToken);
      await prefs.setString(_prefsDeviceCode, deviceCode);
      final displayId = displayIdFromPairing;
      final screenId = '${response['screenId'] ?? ''}'.trim();
      final tenantId = tenantIdFromPairing;
      if (displayId.isNotEmpty) {
        await prefs.setString(_prefsDisplayId, displayId);
        _savedDisplayId = displayId;
      }
      if (screenId.isNotEmpty) {
        await prefs.setString(_prefsScreenId, screenId);
      }
      if (tenantId.isNotEmpty) {
        await prefs.setString(_prefsTenantId, tenantId);
        _savedTenantId = tenantId;
      }
      _deviceToken = deviceToken;
      _deviceCode = deviceCode;
      _savedDeviceCode = deviceCode;
      _pairingPollTimer?.cancel();
      _countdownTimer?.cancel();
      _pairingSessionReady = false;
      _message = 'Display wird verbunden …';
      _strictManifestFailed = false;
      setState(() {});

      final ok = await _loadContent();
      if (ok) {
        _startBackgroundJobs();
      } else {
        await _startPairing();
      }
    } catch (error) {
      _lastPollTokenReceived = false;
      if (error is DisplayApiException) {
        _lastPairingHttpStatus = error.statusCode;
        if (error.statusCode == 410) {
          _lastPollError = error.message;
          _message = 'Code abgelaufen. Neuer QR-Code wird erstellt …';
          setState(() {});
          await _startPairing();
          return;
        }
      }
      _lastPollError = error.toString();
      _message = _toFriendlyError(error);
      setState(() {});
    }
  }

  Future<bool> _loadContent() async {
    final token = _deviceToken;
    final deviceCode = (_deviceCode ?? '').trim().toUpperCase();
    if (token == null || token.isEmpty || deviceCode.isEmpty) return false;

    try {
      debugPrint('DISPLAY MANIFEST LOAD START');
      debugPrint('DISPLAY CONTENT TOKEN PRESENT: true');
      final prefs = await SharedPreferences.getInstance();
      _savedDisplayId = prefs.getString(_prefsDisplayId) ?? '-';
      _savedTenantId = prefs.getString(_prefsTenantId) ?? '-';
      _savedDeviceCode = prefs.getString(_prefsDeviceCode) ?? deviceCode;
      debugPrint('DISPLAY CONTENT DISPLAY ID: $_savedDisplayId');
      debugPrint('DISPLAY CONTENT TENANT ID: $_savedTenantId');
      debugPrint('DISPLAY MANIFEST DEVICE CODE: $_savedDeviceCode');
      final response = await _api.getManifest(deviceCode, etag: _contentEtag);
      _lastContentHttpStatus = response.statusCode;
      _lastContentEndpoint = response.endpoint;
      _lastManifestUrl = response.requestUrl;
      _lastManifestBodyPreview = response.responsePreview ?? '-';
      if (response.notModified) {
        _lastContentError = '-';
        _message = null;
        setState(() {});
        return true;
      }
      final payload = response.content ?? const <String, dynamic>{};
      final mapped = _mapManifestPayloadToDisplayContent(deviceCode, payload);
      _contentEtag = response.etag ?? _contentEtag;
      _lastContentVersion = _contentEtag ?? '-';
      final products = (mapped['products'] as List?) ?? const [];
      _lastContentProductCount = products.length;
      _lastContentError = '-';
      debugPrint('DISPLAY MANIFEST PRODUCTS COUNT: $_lastContentProductCount');
      _content = mapped;
      if (_lastContentProductCount == 0) {
        _message = 'Keine Produkte für diesen Bildschirm freigegeben.';
      } else {
        _message = null;
      }
      setState(() {});
      return true;
    } catch (error) {
      debugPrint('DISPLAY MANIFEST ERROR: $error');
      _lastContentProductCount = 0;
      final message = '$error';
      if (error is DisplayApiException) {
        _lastContentHttpStatus = error.statusCode;
        _lastContentEndpoint = error.endpoint;
      }
      _lastContentError = _toFriendlyError(error);
      if (message.contains('ungültig') || message.contains('ungultig') || message.contains('401')) {
        return false;
      }
      if (error is DisplayApiException) {
        _lastManifestBodyPreview = error.responsePreview ?? '-';
      }
      _message = 'STRICT MANIFEST FAILED: $_lastContentError';
      _strictManifestFailed = true;
      _content = null;
      setState(() {});
      return false;
    }
  }

  Map<String, dynamic> _mapManifestPayloadToDisplayContent(
    String deviceCode,
    Map<String, dynamic> payload,
  ) {
    final displayManifest = (payload['displayManifest'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final runtime = (payload['runtime'] as Map<String, dynamic>?) ??
        (displayManifest['runtime'] as Map<String, dynamic>?) ??
        const <String, dynamic>{};
    final theme = (displayManifest['theme'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final layout = (displayManifest['layout'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final runtimeConfig = (runtime['runtimeConfig'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final productsRaw = (displayManifest['products'] as List?) ?? const [];
    final slidesRaw = (displayManifest['playlistItems'] as List?) ??
        (displayManifest['playlist'] as List?) ??
        const [];
    double? readPriceField(Map<String, dynamic> product, String field) {
      final value = product[field];
      if (value is num) return value.toDouble();
      if (value is String) {
        final normalized = value.replaceAll(',', '.').trim();
        return double.tryParse(normalized);
      }
      return null;
    }

    final mappedProducts = productsRaw.map((entry) {
      final product = (entry as Map?)?.cast<String, dynamic>() ?? const <String, dynamic>{};
      final ingredientsRaw = (product['ingredients'] as List?) ?? const [];
      final fallbackPrice = readPriceField(product, 'sellingPrice') ??
          readPriceField(product, 'salePrice') ??
          readPriceField(product, 'price') ??
          readPriceField(product, 'grossPrice') ??
          readPriceField(product, 'calculatedPrice') ??
          readPriceField(product, 'variantPrice');
      final finalPrice = fallbackPrice ?? 0;
      debugPrint(
        'DISPLAY PRICE RESOLUTION productId=${product['id'] ?? '-'} '
        'sellingPrice=${product['sellingPrice']} salePrice=${product['salePrice']} '
        'price=${product['price']} grossPrice=${product['grossPrice']} '
        'calculatedPrice=${product['calculatedPrice']} variantPrice=${product['variantPrice']} '
        'resolved=$finalPrice',
      );
      return <String, dynamic>{
        'id': product['id'],
        'name': product['name'],
        'categoryId': product['categoryId'],
        'categoryName': product['categoryName'],
        'price': finalPrice,
        'isHero': product['isHero'] == true,
        'isBestseller': product['isBestseller'] == true,
        'isNew': product['isNew'] == true,
        'isPromotion': product['isPromotion'] == true,
        'promotionText': product['promotionText'],
        'badgeLabel': product['badgeLabel'],
        'badgeColor': product['badgeColor'],
        'highlightPriority': (product['highlightPriority'] as num?)?.toInt() ?? 0,
        'heroImageUrl': product['heroImageUrl'],
        'originalPrice': readPriceField(product, 'originalPrice'),
        'promoPrice': readPriceField(product, 'promoPrice'),
        'validFrom': product['validFrom'],
        'validUntil': product['validUntil'],
        'ingredients': ingredientsRaw
            .map((ingredient) => <String, dynamic>{'name': '$ingredient'.trim()})
            .where((ingredient) => (ingredient['name'] as String).isNotEmpty)
            .toList(growable: false),
        'allergens': (product['allergens'] as List?) ?? const [],
        'isHero': product['isHero'] == true,
        'isPromo': product['isPromo'] == true,
      };
    }).toList(growable: false);

    final showCategoriesRaw = runtimeConfig['showCategories'];
    final showCategories = showCategoriesRaw is bool ? showCategoriesRaw : true;
    final showIngredientsRaw = runtimeConfig['showIngredients'];
    final showIngredients = showIngredientsRaw is bool
        ? showIngredientsRaw
        : (runtimeConfig['showAllergens'] as bool?) ?? true;

    final gradientFrom = (runtimeConfig['gradientFrom'] ?? theme['gradientFrom'] ?? runtimeConfig['backgroundFromColor']) as String?;
    final gradientTo = (runtimeConfig['gradientTo'] ?? theme['gradientTo'] ?? runtimeConfig['backgroundToColor']) as String?;
    final backgroundColor = (runtimeConfig['backgroundColor'] ?? theme['backgroundColor'] ?? '#111827') as String;
    final accentColor = (runtimeConfig['accentColor'] ?? theme['accentColor'] ?? '#f97316') as String;
    final cardOpacity = runtimeConfig['cardOpacity'] ?? theme['cardOpacity'] ?? 0.72;
    final distribution = (displayManifest['distribution'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final displayCount = (displayManifest['displayCount'] as num?)?.toInt() ?? (distribution['displayCount'] as num?)?.toInt() ?? 1;
    final displayIndex1Based = (displayManifest['displayIndex'] as num?)?.toInt() ?? (distribution['currentDisplayIndex'] as num?)?.toInt() ?? 1;
    final productsPerDisplay = (distribution['productsPerDisplay'] as num?)?.toInt() ?? mappedProducts.length;
    final totalProducts = (distribution['totalProducts'] as num?)?.toInt() ?? mappedProducts.length;
    final startProductNumber = totalProducts == 0 ? 0 : (((displayIndex1Based - 1) * productsPerDisplay) + 1).clamp(0, totalProducts);
    final endProductNumber = totalProducts == 0
        ? 0
        : (startProductNumber + mappedProducts.length - 1).clamp(0, totalProducts);
    final syncMode = '${displayManifest['syncMode'] ?? runtimeConfig['syncMode'] ?? ''}'.toUpperCase();

    return <String, dynamic>{
      'screen': <String, dynamic>{
        'backgroundColor': backgroundColor,
        'accentColor': accentColor,
      },
      'screenConfig': <String, dynamic>{
        'showPrices': runtimeConfig['showPrices'] ?? true,
        'showCategoryOnCard': runtimeConfig['showCategoryOnCard'] ?? showCategories,
        'showCategoryHeaders': runtimeConfig['showCategoryHeaders'] ?? false,
        'showCategories': showCategories,
        'showIngredients': showIngredients,
        'showAllergens': showIngredients,
        'logoUrl': runtimeConfig['logoUrl'],
        'logoSize': runtimeConfig['logoSize'] ?? 120,
        'fontFamily': runtimeConfig['fontFamily'],
        'cardPadding': runtimeConfig['cardPadding'] ?? 16,
        'productFontSize': runtimeConfig['productFontSize'] ?? 24,
        'categoryFontSize': runtimeConfig['categoryFontSize'] ?? 14,
        'priceFontSize': runtimeConfig['priceFontSize'] ?? 24,
        'ingredientFontSize': runtimeConfig['ingredientFontSize'] ?? 14,
        'ingredientTextColor': runtimeConfig['ingredientTextColor'] ?? '#d1d5db',
        'cardStyle': runtimeConfig['cardStyle'] ?? layout['cardStyle'] ?? 'SOFT',
        'overlayAnimation': runtimeConfig['overlayAnimation'] ?? 'NONE',
        'defaultColumnCount': runtimeConfig['defaultColumnCount'] ?? layout['defaultColumnCount'],
        'backgroundMode': runtimeConfig['backgroundMode'] ?? ((gradientFrom != null && gradientTo != null) ? 'GRADIENT' : 'COLOR'),
        'backgroundValue': runtimeConfig['backgroundValue'] ?? backgroundColor,
        'gradientFrom': gradientFrom,
        'gradientTo': gradientTo,
        'cardOpacity': cardOpacity,
        'backgroundMediaUrl': runtimeConfig['backgroundMediaUrl'],
      },
      'items': slidesRaw.isNotEmpty
          ? slidesRaw
              .map((entry) => (entry as Map?)?.cast<String, dynamic>() ?? const <String, dynamic>{})
              .toList(growable: false)
          : const <Map<String, dynamic>>[
              <String, dynamic>{'type': 'MENU', 'durationSeconds': 12},
            ],
      'playlist': slidesRaw,
      'products': mappedProducts,
      'sync': <String, dynamic>{
        'pageDurationSec': runtimeConfig['offerMediaRotateSec'] ?? 10,
        'serverTimeMs': DateTime.now().millisecondsSinceEpoch,
      },
      'layout': <String, dynamic>{
        'displayIndex': (displayIndex1Based - 1).clamp(0, 1000),
        'displayCount': displayCount,
        'displayGroupId': displayManifest['displayGroupId'] ?? distribution['displayGroupId'] ?? 'tenant-default',
        'displayGroupName': displayManifest['displayGroupName'] ?? displayManifest['displayGroupId'] ?? 'Displaygruppe',
        'syncMode': syncMode.isEmpty ? 'SPLIT_PRODUCTS' : syncMode,
        'productsPerDisplay': productsPerDisplay,
        'productsRangeStart': startProductNumber,
        'productsRangeEnd': endProductNumber,
        'totalProducts': totalProducts,
      },
      'manifestDebug': <String, dynamic>{
        'rendererVersion': _rendererVersion,
        'runtimeRoute': payload['route'] ?? '/api/display-runtime/:deviceCode/manifest',
        'manifestVersion': displayManifest['manifestVersion'] ?? '-',
        'deviceCode': deviceCode,
        'template': layout['template'] ?? '-',
        'showCategories': runtimeConfig['showCategoryOnCard'] ?? false,
        'showIngredients': showIngredients,
        'displayGroupId': displayManifest['displayGroupId'] ?? distribution['displayGroupId'] ?? 'tenant-default',
        'displayIndex': displayIndex1Based,
        'displayCount': displayCount,
        'syncMode': syncMode.isEmpty ? 'SPLIT_PRODUCTS' : syncMode,
        'debugAlways': runtimeConfig['debug'] == true,
        'debugEnabled': runtimeConfig['debug'] == true,
      },
    };
  }

  String _toFriendlyError(Object error) {
    if (error is DisplayApiException) {
      return 'Fehler ${error.statusCode} bei ${error.endpoint}: ${error.message}';
    }
    final raw = error.toString().replaceFirst('Exception:', '').trim();
    if (raw.isEmpty) {
      return 'Verbindung konnte nicht hergestellt werden.';
    }
    return raw;
  }

  void _startBackgroundJobs() {
    _heartbeatTimer?.cancel();
    _refreshTimer?.cancel();

    _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      final code = (_deviceCode ?? '').trim().toUpperCase();
      if (code.isEmpty) return;
      unawaited(_api.heartbeat(code));
    });

    _scheduleNextRefreshWithJitter();
  }

  void _scheduleNextRefreshWithJitter() {
    _refreshTimer?.cancel();
    const int baseSeconds = 30;
    const int jitterMaxSeconds = 9;
    final int jitter = Random().nextInt(jitterMaxSeconds + 1);
    final int nextInSeconds = baseSeconds + jitter;
    _refreshTimer = Timer(Duration(seconds: nextInSeconds), () async {
      await _loadContent();
      if (!mounted) return;
      _scheduleNextRefreshWithJitter();
    });
  }

  String _countdownLabel() {
    final expiresAt = _expiresAt;
    if (expiresAt == null) return '--:--';
    final seconds = expiresAt.difference(DateTime.now()).inSeconds;
    if (seconds <= 0) return '00:00';
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final rest = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$rest';
  }

  @override
  Widget build(BuildContext context) {
    final diagnostics = <String>[
      'route: /screen/[deviceCode] (native display)',
      'renderer: $_rendererVersion',
      'build: ${const String.fromEnvironment('APP_BUILD_VERSION', defaultValue: '0.1.22')}',
      'deviceCode: ${_savedDeviceCode.isEmpty ? '-' : _savedDeviceCode}',
      'displayId: $_savedDisplayId',
      'tenantId: $_savedTenantId',
      'runtimeApi: $_lastContentEndpoint',
      'manifestUrl: $_lastManifestUrl',
      'manifestHttp: ${_lastContentHttpStatus?.toString() ?? '-'}',
      'manifestBody: $_lastManifestBodyPreview',
      'manifestVersion: $_lastContentVersion',
      'products: $_lastContentProductCount',
      'heroProducts: ${((_content?['products'] as List?) ?? const []).where((p) => (p as Map<String, dynamic>)['isHero'] == true).length}',
      'promoProducts: ${((_content?['products'] as List?) ?? const []).where((p) => (p as Map<String, dynamic>)['isPromotion'] == true).length}',
      'pairingSession: $_lastPairingSessionId',
      'pairingToken: $_lastPairingTokenPreview',
      'deviceToken: ${(_deviceToken ?? '').isEmpty ? '-' : '${_deviceToken!.substring(0, _deviceToken!.length > 10 ? 10 : _deviceToken!.length)}...'}',
      'lastError: $_lastContentError',
      'loadedAt: ${DateTime.now().toIso8601String()}',
    ];

    if (_content != null) {
      return DisplayContentScreen(
        content: _content!,
        connectionMessage: _message,
        debugLines: diagnostics,
      );
    }

    if (_strictManifestFailed) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'STRICT MANIFEST FAILED - Legacy Renderer disabled',
                  style: TextStyle(color: Colors.redAccent, fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                Text(
                  _message ?? 'Kein gültiges Display-Manifest geladen.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(12),
                      children: diagnostics
                          .map(
                            (line) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(line, style: const TextStyle(color: Colors.white, fontSize: 12)),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    FilledButton(
                      onPressed: (_savedDeviceCode.trim().isEmpty || _savedDeviceCode == '-')
                          ? null
                          : () async {
                        final ok = await _loadContent();
                        if (ok) {
                          _strictManifestFailed = false;
                          _startBackgroundJobs();
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: const Text('Manifest neu laden'),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: _restartPairingFlow,
                      child: const Text('Neu koppeln'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (!_pairingSessionReady) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  _message ?? 'Pairing-Session wird geladen …',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _startPairing,
                  child: const Text('Erneut versuchen'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final qrPayloadMap = _qrPayload ??
        <String, dynamic>{
          'type': 'DISPLAY_PAIRING',
          'pairingToken': _pairingToken,
          'pairingCode': _pairingCode,
          'apiBaseUrl': 'https://api.klarando.com',
          'expiresAt': _expiresAt?.toIso8601String(),
          if ((_pairingSessionId ?? '').isNotEmpty) 'sessionId': _pairingSessionId,
        };
    final qrPayload = jsonEncode(qrPayloadMap);
    final qrUrl = 'https://api.qrserver.com/v1/create-qr-code/?size=720x720&data=${Uri.encodeComponent(qrPayload)}';
    final debugLines = <String>[
      'API: ${_api.baseUrl}',
      'Endpoint: $_pairingEndpoint',
      'Letzter HTTP-Status: ${_lastPairingHttpStatus?.toString() ?? '-'}',
      'Letzter Versuch: ${_lastPairingAttemptAt?.toIso8601String() ?? '-'}',
      'Letzter Poll status: $_lastPollStatus',
      'Letzter Poll state: $_lastPollState',
      'Token erhalten: ${_lastPollTokenReceived ? 'ja' : 'nein'}',
      'Letzter Fehler: $_lastPollError',
    ];

    return DisplayPairingScreen(
      qrUrl: qrUrl,
      pairingCode: _pairingCode,
      countdown: _countdownLabel(),
      status: _message,
      debugLines: debugLines,
      onRetry: _startPairing,
    );
  }
}
