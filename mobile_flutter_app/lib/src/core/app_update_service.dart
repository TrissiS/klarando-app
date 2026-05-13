import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'klarando_api.dart';

enum MobileAppFlavor { customer, driver, orderdesk }

class UpdateCheckResult {
  const UpdateCheckResult({
    required this.flavor,
    required this.currentVersion,
    required this.currentBuildNumber,
    required this.manifest,
    required this.updateAvailable,
    required this.forceUpdate,
  });

  final MobileAppFlavor flavor;
  final String currentVersion;
  final int currentBuildNumber;
  final MobileAppUpdateManifest manifest;
  final bool updateAvailable;
  final bool forceUpdate;
}

class AppUpdateService {
  AppUpdateService({KlarandoApi? api}) : _api = api ?? const KlarandoApi();

  final KlarandoApi _api;

  static MobileAppFlavor resolveFlavorFromPackageName(String packageName) {
    final normalized = packageName.trim().toLowerCase();
    if (normalized == 'com.klarando.driver') {
      return MobileAppFlavor.driver;
    }
    if (normalized == 'com.klarando.orderdesk') {
      return MobileAppFlavor.orderdesk;
    }
    return MobileAppFlavor.customer;
  }

  static String appKeyForFlavor(MobileAppFlavor flavor) {
    switch (flavor) {
      case MobileAppFlavor.customer:
        return 'customer';
      case MobileAppFlavor.driver:
        return 'driver';
      case MobileAppFlavor.orderdesk:
        return 'orderdesk';
    }
  }

  Future<UpdateCheckResult> checkForUpdate({
    required String baseUrl,
    required MobileAppFlavor expectedFlavor,
  }) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final detectedFlavor = resolveFlavorFromPackageName(packageInfo.packageName);
    if (detectedFlavor != expectedFlavor) {
      throw const ApiException(
        'Diese App-Konfiguration passt nicht zum erwarteten Update-Kanal.',
      );
    }

    final currentBuildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;
    final currentVersion = packageInfo.version.trim();
    final appKey = appKeyForFlavor(expectedFlavor);

    final manifest = await _api.fetchMobileUpdateManifest(
      baseUrl: baseUrl,
      appKey: appKey,
      currentVersion: currentVersion,
      currentBuildNumber: currentBuildNumber,
    );

    final updateAvailable =
        manifest.enabled && manifest.updateAvailable && manifest.apkUrl.trim().isNotEmpty;

    return UpdateCheckResult(
      flavor: expectedFlavor,
      currentVersion: currentVersion,
      currentBuildNumber: currentBuildNumber,
      manifest: manifest,
      updateAvailable: updateAvailable,
      forceUpdate: updateAvailable && manifest.forceUpdate,
    );
  }

  Future<File> downloadAndVerifyApk({
    required Uri apkUri,
    String? sha256Hex,
  }) async {
    final client = HttpClient();
    try {
      final request = await client.getUrl(apkUri);
      final response = await request.close();
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw ApiException('APK-Download fehlgeschlagen (HTTP ${response.statusCode}).');
      }

      final bytes = await consolidateHttpClientResponseBytes(response);
      final cacheDir = await getTemporaryDirectory();
      final file = File('${cacheDir.path}/klarando-update.apk');
      await file.writeAsBytes(bytes, flush: true);

      final expectedHash = sha256Hex?.trim().toLowerCase();
      if (expectedHash != null && expectedHash.isNotEmpty) {
        final digest = sha256.convert(bytes).toString().toLowerCase();
        if (digest != expectedHash) {
          await file.delete().catchError((_) => file);
          throw const ApiException('APK-Integritätsprüfung fehlgeschlagen (SHA256).');
        }
      }

      return file;
    } finally {
      client.close(force: true);
    }
  }

  Future<void> startApkInstallation(File apkFile) async {
    final result = await OpenFilex.open(
      apkFile.path,
      type: 'application/vnd.android.package-archive',
    );
    if (result.type != ResultType.done) {
      throw ApiException('Installation konnte nicht gestartet werden: ${result.message}');
    }
  }

  String formatReleaseNotes(String releaseNotes) {
    final trimmed = releaseNotes.trim();
    if (trimmed.isEmpty) {
      return 'Keine Hinweise hinterlegt.';
    }
    if (trimmed.startsWith('[') || trimmed.startsWith('{')) {
      try {
        final parsed = jsonDecode(trimmed);
        if (parsed is List) {
          return parsed.map((entry) => '- ${entry.toString()}').join('\n');
        }
      } catch (_) {
        return trimmed;
      }
    }
    return trimmed;
  }
}
