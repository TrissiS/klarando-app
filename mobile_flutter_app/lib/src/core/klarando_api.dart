import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_environment.dart';

const _connectionTimeout = Duration(seconds: 3);
const _requestTimeout = Duration(seconds: 8);

class ApiException implements Exception {
  const ApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class AccessUser {
  const AccessUser({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.chainId,
    required this.tenantId,
  });

  final String id;
  final String email;
  final String name;
  final String role;
  final String? chainId;
  final String? tenantId;

  factory AccessUser.fromJson(Map<String, dynamic> json) {
    return AccessUser(
      id: _readString(json['id']),
      email: _readString(json['email']),
      name: _readString(json['name']),
      role: _readString(json['role']),
      chainId: _readNullableString(json['chainId']),
      tenantId: _readNullableString(json['tenantId']),
    );
  }
}

class LoginResponse {
  const LoginResponse({
    required this.token,
    required this.user,
    required this.permissions,
  });

  final String token;
  final AccessUser user;
  final List<String> permissions;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: _readString(json['token']),
      user: AccessUser.fromJson(_readMap(json['user'])),
      permissions: _readStringList(json['permissions']),
    );
  }
}

class PaypalCheckoutOrderResponse {
  const PaypalCheckoutOrderResponse({
    required this.orderId,
    required this.paypalOrderId,
    required this.approvalUrl,
    required this.status,
    required this.environment,
  });

  final String orderId;
  final String paypalOrderId;
  final String approvalUrl;
  final String status;
  final String environment;

  factory PaypalCheckoutOrderResponse.fromJson(Map<String, dynamic> json) {
    return PaypalCheckoutOrderResponse(
      orderId: _readString(json['orderId']),
      paypalOrderId: _readString(json['paypalOrderId']),
      approvalUrl: _readString(json['approvalUrl']),
      status: _readString(json['status']),
      environment: _readString(json['environment']),
    );
  }
}

class PaypalCheckoutCaptureResponse {
  const PaypalCheckoutCaptureResponse({
    required this.ok,
    required this.orderId,
    required this.paypalOrderId,
    required this.captureId,
    required this.status,
    required this.paymentStatus,
  });

  final bool ok;
  final String orderId;
  final String paypalOrderId;
  final String? captureId;
  final String? status;
  final String paymentStatus;

  factory PaypalCheckoutCaptureResponse.fromJson(Map<String, dynamic> json) {
    return PaypalCheckoutCaptureResponse(
      ok: _readBool(json['ok']),
      orderId: _readString(json['orderId']),
      paypalOrderId: _readString(json['paypalOrderId']),
      captureId: _readNullableString(json['captureId']),
      status: _readNullableString(json['status']),
      paymentStatus: _readString(json['paymentStatus']),
    );
  }
}

class DriverDeviceSessionInfo {
  const DriverDeviceSessionInfo({
    required this.sessionId,
    required this.tenantId,
    required this.displayCode,
    required this.deviceLabel,
    required this.expiresAt,
    required this.secondsUntilExpiry,
  });

  final String sessionId;
  final String tenantId;
  final String displayCode;
  final String deviceLabel;
  final DateTime? expiresAt;
  final int secondsUntilExpiry;

  factory DriverDeviceSessionInfo.fromJson(Map<String, dynamic> json) {
    return DriverDeviceSessionInfo(
      sessionId: _readString(json['sessionId']),
      tenantId: _readString(json['tenantId']),
      displayCode: _readString(json['displayCode']),
      deviceLabel: _readString(json['deviceLabel']),
      expiresAt: _readNullableDateTime(json['expiresAt']),
      secondsUntilExpiry: _readInt(json['secondsUntilExpiry']),
    );
  }
}

class DriverDeviceLoginResponse {
  const DriverDeviceLoginResponse({
    required this.authToken,
    required this.session,
    required this.driverUserId,
    required this.driverName,
    required this.mode,
  });

  final String authToken;
  final DriverDeviceSessionInfo session;
  final String? driverUserId;
  final String driverName;
  final String mode;

  factory DriverDeviceLoginResponse.fromJson(Map<String, dynamic> json) {
    final driver = _readMap(json['driver']);
    return DriverDeviceLoginResponse(
      authToken: _readString(json['authToken']),
      session: DriverDeviceSessionInfo.fromJson(_readMap(json['session'])),
      driverUserId: _readNullableString(driver['userId']),
      driverName: _readString(driver['name']),
      mode: _readString(json['mode']),
    );
  }
}

class OrderDeskBindingInfo {
  const OrderDeskBindingInfo({
    required this.id,
    required this.tenantId,
    required this.displayId,
    required this.displayCode,
    required this.deviceSerial,
    required this.deviceAlias,
    required this.deviceModel,
    required this.devicePlatform,
    required this.appVersion,
    required this.firstBoundAt,
    required this.boundAt,
    required this.lastSeenAt,
    required this.isActive,
  });

  final String id;
  final String tenantId;
  final String displayId;
  final String displayCode;
  final String deviceSerial;
  final String? deviceAlias;
  final String? deviceModel;
  final String? devicePlatform;
  final String? appVersion;
  final DateTime? firstBoundAt;
  final DateTime? boundAt;
  final DateTime? lastSeenAt;
  final bool isActive;

  factory OrderDeskBindingInfo.fromJson(Map<String, dynamic> json) {
    return OrderDeskBindingInfo(
      id: _readString(json['id']),
      tenantId: _readString(json['tenantId']),
      displayId: _readString(json['displayId']),
      displayCode: _readString(json['displayCode']),
      deviceSerial: _readString(json['deviceSerial']),
      deviceAlias: _readNullableString(json['deviceAlias']),
      deviceModel: _readNullableString(json['deviceModel']),
      devicePlatform: _readNullableString(json['devicePlatform']),
      appVersion: _readNullableString(json['appVersion']),
      firstBoundAt: _readNullableDateTime(json['firstBoundAt']),
      boundAt: _readNullableDateTime(json['boundAt']),
      lastSeenAt: _readNullableDateTime(json['lastSeenAt']),
      isActive: _readBool(json['isActive']),
    );
  }
}

class OrderDeskBindResponse {
  const OrderDeskBindResponse({
    required this.authToken,
    required this.binding,
    required this.displayCode,
    required this.expiresAt,
    required this.secondsUntilExpiry,
  });

  final String authToken;
  final OrderDeskBindingInfo binding;
  final String displayCode;
  final DateTime? expiresAt;
  final int secondsUntilExpiry;

  factory OrderDeskBindResponse.fromJson(Map<String, dynamic> json) {
    final display = _readMap(json['display']);
    return OrderDeskBindResponse(
      authToken: _readString(json['authToken']),
      binding: OrderDeskBindingInfo.fromJson(_readMap(json['binding'])),
      displayCode: _readString(display['displayCode']),
      expiresAt: _readNullableDateTime(json['expiresAt']),
      secondsUntilExpiry: _readInt(json['secondsUntilExpiry']),
    );
  }
}

class OrderDeskContactUser {
  const OrderDeskContactUser({
    required this.id,
    required this.name,
    required this.email,
  });

  final String id;
  final String name;
  final String email;

  factory OrderDeskContactUser.fromJson(Map<String, dynamic> json) {
    return OrderDeskContactUser(
      id: _readString(json['id']),
      name: _readString(json['name']),
      email: _readString(json['email']),
    );
  }
}

class OrderDeskHeartbeatResponse {
  const OrderDeskHeartbeatResponse({
    required this.bindingId,
    required this.displayCode,
    required this.tenantId,
    required this.tenantName,
    required this.admins,
    required this.chainadmins,
    required this.activeDriverDevices,
    required this.onlineDriverDevices,
    required this.serverTime,
  });

  final String bindingId;
  final String displayCode;
  final String tenantId;
  final String? tenantName;
  final List<OrderDeskContactUser> admins;
  final List<OrderDeskContactUser> chainadmins;
  final int activeDriverDevices;
  final int onlineDriverDevices;
  final DateTime? serverTime;

  factory OrderDeskHeartbeatResponse.fromJson(Map<String, dynamic> json) {
    final tenant = _readMap(json['tenant']);
    final driverDevices = _readMap(json['driverDevices']);
    final adminsRaw = json['admins'];
    final chainAdminsRaw = json['chainadmins'];
    return OrderDeskHeartbeatResponse(
      bindingId: _readString(json['bindingId']),
      displayCode: _readString(json['displayCode']),
      tenantId: _readString(tenant['id']),
      tenantName: _readNullableString(tenant['name']),
      admins: adminsRaw is List
          ? adminsRaw
                .whereType<Map<String, dynamic>>()
                .map(OrderDeskContactUser.fromJson)
                .toList(growable: false)
          : const [],
      chainadmins: chainAdminsRaw is List
          ? chainAdminsRaw
                .whereType<Map<String, dynamic>>()
                .map(OrderDeskContactUser.fromJson)
                .toList(growable: false)
          : const [],
      activeDriverDevices: _readInt(driverDevices['activeCount']),
      onlineDriverDevices: _readInt(driverDevices['onlineCount']),
      serverTime: _readNullableDateTime(json['serverTime']),
    );
  }
}

class ManagedTenant {
  const ManagedTenant({
    required this.id,
    required this.name,
    required this.email,
    required this.chainId,
  });

  final String id;
  final String name;
  final String? email;
  final String? chainId;

  factory ManagedTenant.fromJson(Map<String, dynamic> json) {
    return ManagedTenant(
      id: _readString(json['id']),
      name: _readString(json['name']),
      email: _readNullableString(json['email']),
      chainId: _readNullableString(json['chainId']),
    );
  }
}

class AccessContext {
  const AccessContext({required this.tenants});

  final List<ManagedTenant> tenants;

  factory AccessContext.fromJson(Map<String, dynamic> json) {
    final rawTenants = json['tenants'];
    if (rawTenants is! List) {
      return const AccessContext(tenants: []);
    }

    return AccessContext(
      tenants: rawTenants
          .whereType<Map<String, dynamic>>()
          .map(ManagedTenant.fromJson)
          .toList(growable: false),
    );
  }
}

enum DiscoveryMode { all, delivery, pickup }

class TenantDiscoveryTenant {
  const TenantDiscoveryTenant({
    required this.tenantId,
    required this.tenantName,
    required this.chainName,
    required this.deliveryFeeNote,
    required this.minOrderValue,
    required this.logoUrl,
    required this.titleImageUrl,
    required this.localInfoTitle,
    required this.localInfoText,
    required this.contactPhone,
    required this.contactEmail,
    required this.addressLine,
    required this.deliveryAvailable,
    required this.pickupAvailable,
    required this.deliveryStatus,
    required this.deliveryStrategy,
    required this.deliveryPolygonPoints,
    required this.pickupStatus,
    required this.deliveryConfigPending,
    required this.pickupConfigPending,
    required this.distanceKm,
    required this.orderingEnabled,
    required this.guestCheckoutEnabled,
    required this.orderIntake,
    required this.ratingAverage,
    required this.ratingCount,
  });

  final String tenantId;
  final String tenantName;
  final String? chainName;
  final String? deliveryFeeNote;
  final String? minOrderValue;
  final String? logoUrl;
  final String? titleImageUrl;
  final String? localInfoTitle;
  final String? localInfoText;
  final String? contactPhone;
  final String? contactEmail;
  final String? addressLine;
  final bool deliveryAvailable;
  final bool pickupAvailable;
  final String deliveryStatus;
  final String deliveryStrategy;
  final int deliveryPolygonPoints;
  final String pickupStatus;
  final bool deliveryConfigPending;
  final bool pickupConfigPending;
  final double? distanceKm;
  final bool orderingEnabled;
  final bool guestCheckoutEnabled;
  final TenantOrderIntakeInfo orderIntake;
  final double? ratingAverage;
  final int ratingCount;

  factory TenantDiscoveryTenant.fromJson(
    Map<String, dynamic> json, {
    required String baseUrl,
  }) {
    final chain = _readNullableMap(json['chain']);
    final services = _readMap(json['services']);
    final customerApp = _readNullableMap(json['customerApp']);
    final delivery = _readNullableMap(services['delivery']);
    final pickup = _readNullableMap(services['pickup']);
    final orderIntake = _readNullableMap(json['orderIntake']);
    final contact = _readNullableMap(json['contact']);
    final address = _readNullableMap(json['address']);

    final deliveryDistance = _readNullableDouble(delivery?['distanceKm']);
    final pickupDistance = _readNullableDouble(pickup?['distanceKm']);

    return TenantDiscoveryTenant(
      tenantId: _readString(json['tenantId']),
      tenantName: _readString(json['tenantName']),
      chainName: chain == null ? null : _readNullableString(chain['name']),
      deliveryFeeNote: _readNullableString(json['deliveryFeeNote']),
      minOrderValue: _readNullableString(json['minOrderValue']),
      logoUrl: _resolvePublicAssetUrl(
        baseUrl,
        _readNullableString(json['logoUrl']),
      ),
      titleImageUrl: _resolvePublicAssetUrl(
        baseUrl,
        _readOrderHeaderImage(customerApp, json),
      ),
      localInfoTitle: customerApp == null
          ? null
          : _readNullableString(customerApp['localInfoTitle']),
      localInfoText: customerApp == null
          ? null
          : _readNullableString(customerApp['localInfoText']),
      contactPhone: contact == null
          ? null
          : _readNullableString(contact['phone']),
      contactEmail: contact == null
          ? null
          : _readNullableString(contact['email']),
      addressLine: _buildAddressLine(address),
      deliveryAvailable: _readBool(delivery?['available']),
      pickupAvailable: _readBool(pickup?['available']),
      deliveryStatus: _readNullableString(delivery?['status']) ?? 'OUT_OF_AREA',
      deliveryStrategy: _readNullableString(delivery?['strategy']) ?? 'UNKNOWN',
      deliveryPolygonPoints: _readInt(delivery?['polygonPoints']),
      pickupStatus: _readNullableString(pickup?['status']) ?? 'OUT_OF_AREA',
      deliveryConfigPending: _readBool(delivery?['configurationIncomplete']),
      pickupConfigPending: _readBool(pickup?['configurationIncomplete']),
      distanceKm: deliveryDistance ?? pickupDistance,
      orderingEnabled: customerApp == null
          ? false
          : _readBool(customerApp['orderingEnabled']),
      guestCheckoutEnabled: customerApp == null
          ? false
          : _readBool(customerApp['guestCheckoutEnabled']),
      orderIntake: TenantOrderIntakeInfo.fromJson(orderIntake),
      ratingAverage: _readNullableDouble(json['ratingAverage']),
      ratingCount: _readInt(json['ratingCount']),
    );
  }
}

class TenantOrderIntakeInfo {
  const TenantOrderIntakeInfo({
    required this.enabled,
    required this.reason,
    required this.pausedUntil,
    required this.customerMessage,
    required this.deliveryEnabled,
    required this.pickupEnabled,
    required this.tableOrderingEnabled,
  });

  final bool enabled;
  final String? reason;
  final DateTime? pausedUntil;
  final String? customerMessage;
  final bool deliveryEnabled;
  final bool pickupEnabled;
  final bool tableOrderingEnabled;

  factory TenantOrderIntakeInfo.fromJson(Map<String, dynamic>? json) {
    final source = json ?? const <String, dynamic>{};
    final services = _readNullableMap(source['services']);
    return TenantOrderIntakeInfo(
      enabled: source['enabled'] is bool ? _readBool(source['enabled']) : true,
      reason: _readNullableString(source['reason']),
      pausedUntil: _readNullableDateTime(source['pausedUntil']),
      customerMessage: _readNullableString(source['customerMessage']),
      deliveryEnabled: services?['delivery'] is bool ? _readBool(services?['delivery']) : true,
      pickupEnabled: services?['pickup'] is bool ? _readBool(services?['pickup']) : true,
      tableOrderingEnabled:
          services?['tableOrdering'] is bool ? _readBool(services?['tableOrdering']) : true,
    );
  }
}

class TenantCatalogIngredient {
  const TenantCatalogIngredient({required this.name, required this.allergens});

  final String name;
  final List<String> allergens;

  factory TenantCatalogIngredient.fromJson(Map<String, dynamic> json) {
    return TenantCatalogIngredient(
      name: _readString(json['name']),
      allergens: _readStringList(json['allergens']),
    );
  }
}

class TenantCatalogModifier {
  const TenantCatalogModifier({
    required this.id,
    required this.name,
    required this.kind,
    required this.ingredientId,
    required this.ingredientName,
    required this.priceDelta,
    required this.isDefaultSelected,
  });

  final String id;
  final String name;
  final String kind;
  final String? ingredientId;
  final String? ingredientName;
  final double priceDelta;
  final bool isDefaultSelected;
  bool get isSize => kind == 'SIZE';

  factory TenantCatalogModifier.fromJson(Map<String, dynamic> json) {
    final parsedKind = _readString(json['kind']).toUpperCase() == 'SIZE'
        ? 'SIZE'
        : 'OPTION';
    return TenantCatalogModifier(
      id: _readString(json['id']),
      name: _readString(json['name']),
      kind: parsedKind,
      ingredientId: _readNullableString(json['ingredientId']),
      ingredientName: _readNullableString(json['ingredientName']),
      priceDelta: _readDouble(json['priceDelta']),
      isDefaultSelected: _readBool(json['isDefaultSelected']),
    );
  }
}

class TenantCatalogProduct {
  const TenantCatalogProduct({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.beverageContainerType,
    required this.articleInfo,
    required this.foodBusinessOperator,
    required this.nutritionInfo,
    required this.nutrition,
    required this.price,
    required this.originalPrice,
    required this.offerLabel,
    required this.offerValueType,
    required this.offerValue,
    required this.depositAmount,
    required this.imageUrl,
    required this.allergens,
    required this.additives,
    required this.ingredients,
    required this.modifiers,
  });

  final String id;
  final String name;
  final String? categoryName;
  final String beverageContainerType;
  final String? articleInfo;
  final String? foodBusinessOperator;
  final String? nutritionInfo;
  final TenantProductNutrition? nutrition;
  final double price;
  final double? originalPrice;
  final String? offerLabel;
  final String? offerValueType;
  final double? offerValue;
  final double depositAmount;
  final String? imageUrl;
  final List<String> allergens;
  final List<String> additives;
  final List<TenantCatalogIngredient> ingredients;
  final List<TenantCatalogModifier> modifiers;

  factory TenantCatalogProduct.fromJson(
    Map<String, dynamic> json, {
    required String baseUrl,
  }) {
    final ingredientsRaw = json['ingredients'];
    final modifiersRaw = json['modifiers'];

    return TenantCatalogProduct(
      id: _readString(json['id']),
      name: _readString(json['name']),
      categoryName: _readNullableString(json['categoryName']),
      beverageContainerType: () {
        final value = _readString(json['beverageContainerType']).toUpperCase();
        if (value == 'EINWEG' || value == 'MEHRWEG') {
          return value;
        }
        return 'NONE';
      }(),
      articleInfo: _readNullableString(json['articleInfo']),
      foodBusinessOperator: _readNullableString(json['foodBusinessOperator']),
      nutritionInfo: _readNullableString(json['nutritionInfo']),
      nutrition: TenantProductNutrition.fromJson(json['nutrition']),
      price: _readDouble(json['price']),
      originalPrice: _readNullableDouble(json['originalPrice']),
      offerLabel: _readNullableString(json['offerLabel']),
      offerValueType: _readNullableString(json['offerValueType']),
      offerValue: _readNullableDouble(json['offerValue']),
      depositAmount: _readDouble(json['depositAmount']),
      imageUrl: _resolvePublicAssetUrl(
        baseUrl,
        _readNullableString(json['imageUrl']),
      ),
      allergens: _readStringList(json['allergens']),
      additives: _readStringList(json['additives']),
      ingredients: ingredientsRaw is List
          ? ingredientsRaw
                .whereType<Map<String, dynamic>>()
                .map(TenantCatalogIngredient.fromJson)
                .toList(growable: false)
          : const [],
      modifiers: modifiersRaw is List
          ? modifiersRaw
                .whereType<Map<String, dynamic>>()
                .map(TenantCatalogModifier.fromJson)
                .toList(growable: false)
          : const [],
    );
  }
}

class TenantProductNutrition {
  const TenantProductNutrition({
    required this.referenceAmount,
    required this.referenceUnit,
    required this.energyKj,
    required this.energyKcal,
    required this.fat,
    required this.saturatedFat,
    required this.carbohydrates,
    required this.sugar,
    required this.protein,
    required this.salt,
    required this.fiber,
    required this.portionSize,
    required this.portionUnit,
  });

  final String? referenceAmount;
  final String? referenceUnit;
  final double? energyKj;
  final double? energyKcal;
  final double? fat;
  final double? saturatedFat;
  final double? carbohydrates;
  final double? sugar;
  final double? protein;
  final double? salt;
  final double? fiber;
  final double? portionSize;
  final String? portionUnit;

  bool get hasValues =>
      energyKj != null ||
      energyKcal != null ||
      fat != null ||
      saturatedFat != null ||
      carbohydrates != null ||
      sugar != null ||
      protein != null ||
      salt != null ||
      fiber != null;

  static TenantProductNutrition? fromJson(Object? json) {
    if (json is! Map<String, dynamic>) {
      return null;
    }
    return TenantProductNutrition(
      referenceAmount: _readNullableString(json['referenceAmount']),
      referenceUnit: _readNullableString(json['referenceUnit']),
      energyKj: _readNullableDouble(json['energyKj']),
      energyKcal: _readNullableDouble(json['energyKcal']),
      fat: _readNullableDouble(json['fat']),
      saturatedFat: _readNullableDouble(json['saturatedFat']),
      carbohydrates: _readNullableDouble(json['carbohydrates']),
      sugar: _readNullableDouble(json['sugar']),
      protein: _readNullableDouble(json['protein']),
      salt: _readNullableDouble(json['salt']),
      fiber: _readNullableDouble(json['fiber']),
      portionSize: _readNullableDouble(json['portionSize']),
      portionUnit: _readNullableString(json['portionUnit']),
    );
  }
}

class TenantCatalog {
  const TenantCatalog({
    required this.tenantId,
    required this.tenantName,
    required this.logoUrl,
    required this.titleImageUrl,
    required this.localInfoTitle,
    required this.localInfoText,
    required this.contactPhone,
    required this.contactEmail,
    required this.addressLine,
    required this.minOrderValue,
    required this.deliveryFeeNote,
    required this.orderIntake,
    required this.products,
  });

  final String tenantId;
  final String tenantName;
  final String? logoUrl;
  final String? titleImageUrl;
  final String? localInfoTitle;
  final String? localInfoText;
  final String? contactPhone;
  final String? contactEmail;
  final String? addressLine;
  final String? minOrderValue;
  final String? deliveryFeeNote;
  final TenantOrderIntakeInfo orderIntake;
  final List<TenantCatalogProduct> products;

  factory TenantCatalog.fromJson(
    Map<String, dynamic> json, {
    required String baseUrl,
  }) {
    final tenant = _readMap(json['tenant']);
    final customerApp = _readNullableMap(json['customerApp']);
    final orderIntake = _readNullableMap(json['orderIntake']);
    final contact = _readNullableMap(tenant['contact']);
    final address = _readNullableMap(tenant['address']);
    final productsRaw = json['products'];
    return TenantCatalog(
      tenantId: _readString(tenant['id']),
      tenantName: _readString(tenant['name']),
      logoUrl: _resolvePublicAssetUrl(
        baseUrl,
        _readNullableString(tenant['logoUrl']),
      ),
      titleImageUrl: _resolvePublicAssetUrl(
        baseUrl,
        _readOrderHeaderImage(customerApp, tenant),
      ),
      localInfoTitle: customerApp == null
          ? null
          : _readNullableString(customerApp['localInfoTitle']),
      localInfoText: customerApp == null
          ? null
          : _readNullableString(customerApp['localInfoText']),
      contactPhone: contact == null
          ? null
          : _readNullableString(contact['phone']),
      contactEmail: contact == null
          ? null
          : _readNullableString(contact['email']),
      addressLine: _buildAddressLine(address),
      minOrderValue: _readNullableString(tenant['minOrderValue']),
      deliveryFeeNote: _readNullableString(tenant['deliveryFeeNote']),
      orderIntake: TenantOrderIntakeInfo.fromJson(orderIntake),
      products: productsRaw is List
          ? productsRaw
                .whereType<Map<String, dynamic>>()
                .map(
                  (entry) =>
                      TenantCatalogProduct.fromJson(entry, baseUrl: baseUrl),
                )
                .toList(growable: false)
          : const [],
    );
  }
}

class CreateOrderItem {
  const CreateOrderItem({
    required this.productId,
    required this.quantity,
    this.modifierIds = const [],
  });

  final String productId;
  final int quantity;
  final List<String> modifierIds;

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      if (modifierIds.isNotEmpty) 'modifierIds': modifierIds,
    };
  }
}

class AppCustomerUser {
  const AppCustomerUser({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.street,
    required this.zipCode,
    required this.city,
    required this.marketingOptIn,
    required this.deletionRequestedAt,
  });

  final String id;
  final String email;
  final String fullName;
  final String? phone;
  final String? street;
  final String? zipCode;
  final String? city;
  final bool marketingOptIn;
  final DateTime? deletionRequestedAt;

  factory AppCustomerUser.fromJson(Map<String, dynamic> json) {
    return AppCustomerUser(
      id: _readString(json['id']),
      email: _readString(json['email']),
      fullName: _readString(json['fullName']),
      phone: _readNullableString(json['phone']),
      street: _readNullableString(json['street']),
      zipCode: _readNullableString(json['zipCode']),
      city: _readNullableString(json['city']),
      marketingOptIn: _readBool(json['marketingOptIn']),
      deletionRequestedAt: _readNullableDateTime(json['deletionRequestedAt']),
    );
  }
}

class AppAuthResponse {
  const AppAuthResponse({required this.token, required this.user});

  final String token;
  final AppCustomerUser user;

  factory AppAuthResponse.fromJson(Map<String, dynamic> json) {
    return AppAuthResponse(
      token: _readString(json['token']),
      user: AppCustomerUser.fromJson(_readMap(json['user'])),
    );
  }
}

class AppCustomerEmailStatus {
  const AppCustomerEmailStatus({
    required this.exists,
    required this.known,
  });

  final bool exists;
  final bool known;
}

class PublicOrderItemSummary {
  const PublicOrderItemSummary({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.modifierIds,
    required this.modifierNames,
  });

  final String? productId;
  final String productName;
  final int quantity;
  final double price;
  final List<String> modifierIds;
  final List<String> modifierNames;

  factory PublicOrderItemSummary.fromJson(Map<String, dynamic> json) {
    final product = _readMap(json['product']);
    final modifierSnapshotRaw = json['modifierSnapshot'];
    final modifiers = modifierSnapshotRaw is List
        ? modifierSnapshotRaw.whereType<Map<String, dynamic>>().toList(
            growable: false,
          )
        : const <Map<String, dynamic>>[];

    return PublicOrderItemSummary(
      productId: _readNullableString(product['id']),
      productName: _readString(product['name']),
      quantity: _readInt(json['quantity']),
      price: _readDouble(json['price']),
      modifierIds: modifiers
          .map((entry) => _readNullableString(entry['id']))
          .whereType<String>()
          .toList(growable: false),
      modifierNames: modifiers
          .map((entry) => _readNullableString(entry['name']))
          .whereType<String>()
          .toList(growable: false),
    );
  }
}

class DriverLocationPoint {
  const DriverLocationPoint({
    required this.latitude,
    required this.longitude,
    required this.accuracyMeters,
    required this.heading,
    required this.speedKmh,
    required this.updatedAt,
  });

  final double latitude;
  final double longitude;
  final double? accuracyMeters;
  final double? heading;
  final double? speedKmh;
  final DateTime? updatedAt;

  factory DriverLocationPoint.fromJson(Map<String, dynamic> json) {
    return DriverLocationPoint(
      latitude: _readDouble(json['latitude']),
      longitude: _readDouble(json['longitude']),
      accuracyMeters: _readNullableDouble(json['accuracyMeters']),
      heading: _readNullableDouble(json['heading']),
      speedKmh: _readNullableDouble(json['speedKmh']),
      updatedAt: _readNullableDateTime(json['updatedAt']),
    );
  }
}

class PublicOrderComplaint {
  const PublicOrderComplaint({
    required this.id,
    required this.message,
    required this.images,
    required this.createdAt,
    required this.createdBy,
    required this.isResolved,
  });

  final String id;
  final String message;
  final List<String> images;
  final DateTime? createdAt;
  final String? createdBy;
  final bool isResolved;

  factory PublicOrderComplaint.fromJson(Map<String, dynamic> json) {
    final rawImages = json['images'];
    return PublicOrderComplaint(
      id: _readString(json['id']),
      message: _readString(json['message']),
      images: rawImages is List
          ? rawImages
                .whereType<String>()
                .map((entry) => entry.trim())
                .where((entry) => entry.isNotEmpty)
                .toList(growable: false)
          : const [],
      createdAt: _readNullableDateTime(json['createdAt']),
      createdBy: _readNullableString(json['createdBy']),
      isResolved: _readBool(json['isResolved']),
    );
  }
}

class PublicOrderSummary {
  const PublicOrderSummary({
    required this.id,
    required this.tenantId,
    required this.tenantName,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.customerZipCode,
    required this.customerCity,
    required this.serviceType,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.status,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.sourceChannel,
    required this.createdAt,
    required this.paidAt,
    required this.acceptedAt,
    required this.estimatedReadyAt,
    required this.estimatedMinutes,
    required this.pickupNumber,
    required this.assignedDriverId,
    required this.assignedDriverName,
    required this.driverAssignedAt,
    required this.driverDepartedAt,
    required this.driverLocation,
    required this.complaintOpen,
    required this.complaintCount,
    required this.latestComplaintAt,
    required this.latestComplaintMessage,
    required this.latestComplaintImageCount,
    required this.complaints,
    required this.signatureCaptured,
    required this.signatureCapturedAt,
    required this.signatureSignerName,
    required this.signatureImageDataUrl,
    required this.items,
  });

  final String id;
  final String tenantId;
  final String? tenantName;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final String? customerZipCode;
  final String? customerCity;
  final String? serviceType;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String status;
  final String paymentStatus;
  final String? paymentMethod;
  final String sourceChannel;
  final DateTime? createdAt;
  final DateTime? paidAt;
  final DateTime? acceptedAt;
  final DateTime? estimatedReadyAt;
  final int? estimatedMinutes;
  final int? pickupNumber;
  final String? assignedDriverId;
  final String? assignedDriverName;
  final DateTime? driverAssignedAt;
  final DateTime? driverDepartedAt;
  final DriverLocationPoint? driverLocation;
  final bool complaintOpen;
  final int complaintCount;
  final DateTime? latestComplaintAt;
  final String? latestComplaintMessage;
  final int latestComplaintImageCount;
  final List<PublicOrderComplaint> complaints;
  final bool signatureCaptured;
  final DateTime? signatureCapturedAt;
  final String? signatureSignerName;
  final String? signatureImageDataUrl;
  final List<PublicOrderItemSummary> items;

  factory PublicOrderSummary.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    final tenant = _readNullableMap(json['tenant']);
    return PublicOrderSummary(
      id: _readString(json['id']),
      tenantId: _readString(json['tenantId']),
      tenantName: tenant == null ? null : _readNullableString(tenant['name']),
      customerName: _readNullableString(json['customerName']),
      customerPhone: _readNullableString(json['customerPhone']),
      customerAddress: _readNullableString(json['customerAddress']),
      customerZipCode: _readNullableString(json['customerZipCode']),
      customerCity: _readNullableString(json['customerCity']),
      serviceType: _readNullableString(json['serviceType']),
      subtotal: _readDouble(json['subtotal']),
      deliveryFee: _readDouble(json['deliveryFee']),
      total: _readDouble(json['total']),
      status: _readString(json['status']),
      paymentStatus: _readString(json['paymentStatus']),
      paymentMethod: _readNullableString(json['paymentMethod']),
      sourceChannel: _readString(json['sourceChannel']),
      createdAt: _readNullableDateTime(json['createdAt']),
      paidAt: _readNullableDateTime(json['paidAt']),
      acceptedAt: _readNullableDateTime(json['acceptedAt']),
      estimatedReadyAt: _readNullableDateTime(json['estimatedReadyAt']),
      estimatedMinutes: _readNullableInt(json['estimatedMinutes']),
      pickupNumber: _readNullableInt(json['pickupNumber']),
      assignedDriverId: _readNullableString(json['assignedDriverId']),
      assignedDriverName: _readNullableString(json['assignedDriverName']),
      driverAssignedAt: _readNullableDateTime(json['driverAssignedAt']),
      driverDepartedAt: _readNullableDateTime(json['driverDepartedAt']),
      driverLocation: () {
        final location = _readNullableMap(json['driverLocation']);
        if (location == null) {
          return null;
        }
        return DriverLocationPoint.fromJson(location);
      }(),
      complaintOpen: _readBool(json['complaintOpen']),
      complaintCount: _readInt(json['complaintCount']),
      latestComplaintAt: _readNullableDateTime(json['latestComplaintAt']),
      latestComplaintMessage: _readNullableString(
        json['latestComplaintMessage'],
      ),
      latestComplaintImageCount: _readInt(json['latestComplaintImageCount']),
      complaints: () {
        final rawComplaints = json['complaints'];
        if (rawComplaints is! List) {
          return const <PublicOrderComplaint>[];
        }
        return rawComplaints
            .whereType<Map<String, dynamic>>()
            .map(PublicOrderComplaint.fromJson)
            .toList(growable: false);
      }(),
      signatureCaptured: _readBool(json['signatureCaptured']),
      signatureCapturedAt: _readNullableDateTime(json['signatureCapturedAt']),
      signatureSignerName: _readNullableString(json['signatureSignerName']),
      signatureImageDataUrl: _readNullableString(json['signatureImageDataUrl']),
      items: rawItems is List
          ? rawItems
                .whereType<Map<String, dynamic>>()
                .map(PublicOrderItemSummary.fromJson)
                .toList(growable: false)
          : const [],
    );
  }
}

class DriverAssignedFeed {
  const DriverAssignedFeed({
    required this.orders,
    required this.locationTrackingEnabled,
    required this.locationUpdateSeconds,
    required this.customerLiveTrackingEnabled,
  });

  final List<PublicOrderSummary> orders;
  final bool locationTrackingEnabled;
  final int locationUpdateSeconds;
  final bool customerLiveTrackingEnabled;

  factory DriverAssignedFeed.fromJson(Map<String, dynamic> json) {
    final rawOrders = json['orders'];
    final rawDriverSettings = _readNullableMap(json['driverSettings']);
    final parsedInterval = rawDriverSettings == null
        ? 15
        : _readNullableInt(rawDriverSettings['locationUpdateSeconds']) ?? 15;

    return DriverAssignedFeed(
      orders: rawOrders is List
          ? rawOrders
                .whereType<Map<String, dynamic>>()
                .map(PublicOrderSummary.fromJson)
                .toList(growable: false)
          : const [],
      locationTrackingEnabled: rawDriverSettings == null
          ? true
          : _readBool(rawDriverSettings['locationTrackingEnabled']),
      locationUpdateSeconds: (parsedInterval.clamp(5, 300) as num).toInt(),
      customerLiveTrackingEnabled: rawDriverSettings == null
          ? true
          : _readBool(rawDriverSettings['customerLiveTrackingEnabled']),
    );
  }
}

class PublicOrderDisplayDriver {
  const PublicOrderDisplayDriver({required this.id, required this.name});

  final String id;
  final String name;

  factory PublicOrderDisplayDriver.fromJson(Map<String, dynamic> json) {
    return PublicOrderDisplayDriver(
      id: _readString(json['id']),
      name: _readString(json['name']),
    );
  }
}

class PublicOrderDisplayDriverDevice {
  const PublicOrderDisplayDriverDevice({
    required this.sessionId,
    required this.displayCode,
    required this.deviceLabel,
    required this.driverUserId,
    required this.driverName,
    required this.isActive,
    required this.isOnline,
  });

  final String sessionId;
  final String displayCode;
  final String deviceLabel;
  final String? driverUserId;
  final String? driverName;
  final bool isActive;
  final bool isOnline;

  factory PublicOrderDisplayDriverDevice.fromJson(Map<String, dynamic> json) {
    return PublicOrderDisplayDriverDevice(
      sessionId: _readString(json['sessionId']),
      displayCode: _readString(json['displayCode']),
      deviceLabel: _readString(json['deviceLabel']),
      driverUserId: _readNullableString(json['driverUserId']),
      driverName: _readNullableString(json['driverName']),
      isActive: _readBool(json['isActive']),
      isOnline: _readBool(json['isOnline']),
    );
  }
}

class PublicOrderDisplayInfo {
  const PublicOrderDisplayInfo({
    required this.id,
    required this.tenantId,
    required this.name,
    required this.displayCode,
    required this.displayRole,
    required this.refreshIntervalSec,
  });

  final String id;
  final String tenantId;
  final String name;
  final String displayCode;
  final String displayRole;
  final int refreshIntervalSec;

  factory PublicOrderDisplayInfo.fromJson(Map<String, dynamic> json) {
    return PublicOrderDisplayInfo(
      id: _readString(json['id']),
      tenantId: _readString(json['tenantId']),
      name: _readString(json['name']),
      displayCode: _readString(json['displayCode']),
      displayRole: _readString(json['displayRole']),
      refreshIntervalSec: _readInt(json['refreshIntervalSec']),
    );
  }
}

class PublicOrderDisplayFeed {
  const PublicOrderDisplayFeed({
    required this.display,
    required this.orders,
    required this.drivers,
    required this.activeDriverDevices,
    required this.generatedAt,
  });

  final PublicOrderDisplayInfo display;
  final List<PublicOrderSummary> orders;
  final List<PublicOrderDisplayDriver> drivers;
  final List<PublicOrderDisplayDriverDevice> activeDriverDevices;
  final DateTime? generatedAt;

  factory PublicOrderDisplayFeed.fromJson(Map<String, dynamic> json) {
    final rawOrders = json['orders'];
    final rawDrivers = json['drivers'];
    final rawDriverDevices = json['activeDriverDevices'];
    return PublicOrderDisplayFeed(
      display: PublicOrderDisplayInfo.fromJson(_readMap(json['display'])),
      orders: rawOrders is List
          ? rawOrders
                .whereType<Map<String, dynamic>>()
                .map(PublicOrderSummary.fromJson)
                .toList(growable: false)
          : const [],
      drivers: rawDrivers is List
          ? rawDrivers
                .whereType<Map<String, dynamic>>()
                .map(PublicOrderDisplayDriver.fromJson)
                .toList(growable: false)
          : const [],
      activeDriverDevices: rawDriverDevices is List
          ? rawDriverDevices
                .whereType<Map<String, dynamic>>()
                .map(PublicOrderDisplayDriverDevice.fromJson)
                .toList(growable: false)
          : const [],
      generatedAt: _readNullableDateTime(json['generatedAt']),
    );
  }
}

class PublicOrderDisplayReceiptJob {
  const PublicOrderDisplayReceiptJob({
    required this.kind,
    required this.templateId,
    required this.codepage,
    required this.charsPerLine,
    required this.escposBase64,
    required this.escposHex,
    required this.bytesLength,
  });

  final String kind;
  final String templateId;
  final String codepage;
  final int charsPerLine;
  final String escposBase64;
  final String escposHex;
  final int bytesLength;

  factory PublicOrderDisplayReceiptJob.fromJson(Map<String, dynamic> json) {
    return PublicOrderDisplayReceiptJob(
      kind: _readString(json['kind']),
      templateId: _readString(json['templateId']),
      codepage: _readString(json['codepage']),
      charsPerLine: _readInt(json['charsPerLine']),
      escposBase64: _readString(json['escposBase64']),
      escposHex: _readString(json['escposHex']),
      bytesLength: _readInt(json['bytesLength']),
    );
  }
}

class PublicOrderDisplayReceiptJobsResponse {
  const PublicOrderDisplayReceiptJobsResponse({
    required this.ok,
    required this.displayCode,
    required this.orderId,
    required this.requestedAt,
    required this.jobs,
  });

  final bool ok;
  final String displayCode;
  final String orderId;
  final DateTime? requestedAt;
  final List<PublicOrderDisplayReceiptJob> jobs;

  factory PublicOrderDisplayReceiptJobsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawJobs = json['jobs'];
    return PublicOrderDisplayReceiptJobsResponse(
      ok: _readBool(json['ok']),
      displayCode: _readString(json['displayCode']),
      orderId: _readString(json['orderId']),
      requestedAt: _readNullableDateTime(json['requestedAt']),
      jobs: rawJobs is List
          ? rawJobs
                .whereType<Map<String, dynamic>>()
                .map(PublicOrderDisplayReceiptJob.fromJson)
                .toList(growable: false)
          : const [],
    );
  }
}

class MobileAppUpdateManifest {
  const MobileAppUpdateManifest({
    required this.ok,
    required this.appKey,
    required this.platform,
    required this.latestVersion,
    required this.minRequiredVersion,
    required this.buildNumber,
    required this.apkUrl,
    required this.sha256,
    required this.releaseNotes,
    required this.forceUpdate,
    required this.enabled,
    required this.updateAvailable,
    required this.publishedAt,
  });

  final bool ok;
  final String appKey;
  final String platform;
  final String latestVersion;
  final String minRequiredVersion;
  final int buildNumber;
  final String apkUrl;
  final String? sha256;
  final String releaseNotes;
  final bool forceUpdate;
  final bool enabled;
  final bool updateAvailable;
  final DateTime? publishedAt;

  factory MobileAppUpdateManifest.fromJson(Map<String, dynamic> json) {
    return MobileAppUpdateManifest(
      ok: _readBool(json['ok']),
      appKey: _readString(json['appKey']),
      platform: _readString(json['platform']),
      latestVersion: _readString(json['latestVersion']),
      minRequiredVersion: _readString(json['minRequiredVersion']),
      buildNumber: _readInt(json['buildNumber']),
      apkUrl: _readString(json['apkUrl']),
      sha256: _readNullableString(json['sha256']),
      releaseNotes: _readString(json['releaseNotes']),
      forceUpdate: _readBool(json['forceUpdate']),
      enabled: _readBool(json['enabled']),
      updateAvailable: _readBool(json['updateAvailable']),
      publishedAt: _readNullableDateTime(json['publishedAt']),
    );
  }
}

typedef CashierAppUpdateManifest = MobileAppUpdateManifest;

class KlarandoApi {
  const KlarandoApi();

  Future<AppAuthResponse> registerAppCustomer({
    required String baseUrl,
    required String email,
    required String fullName,
    required String password,
    String? phone,
    String? street,
    String? zipCode,
    String? city,
    bool marketingOptIn = false,
    bool privacyAccepted = false,
    bool termsAccepted = false,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/app-auth/register',
      body: {
        'email': email,
        'fullName': fullName,
        'password': password,
        'phone': phone,
        'street': street,
        'zipCode': zipCode,
        'city': city,
        'marketingOptIn': marketingOptIn,
        'privacyAccepted': privacyAccepted,
        'termsAccepted': termsAccepted,
      },
    );
    return AppAuthResponse.fromJson(response);
  }

  Future<AppAuthResponse> socialQuickstartAppCustomer({
    required String baseUrl,
    required String provider,
    required String email,
    required String fullName,
    String? phone,
    String? street,
    String? zipCode,
    String? city,
    bool marketingOptIn = false,
    bool privacyAccepted = false,
    bool termsAccepted = false,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/app-auth/social-quickstart',
      body: {
        'provider': provider,
        'email': email,
        'fullName': fullName,
        'phone': phone,
        'street': street,
        'zipCode': zipCode,
        'city': city,
        'marketingOptIn': marketingOptIn,
        'privacyAccepted': privacyAccepted,
        'termsAccepted': termsAccepted,
      },
    );
    return AppAuthResponse.fromJson(response);
  }

  Future<AppAuthResponse> loginAppCustomerWithGoogle({
    required String baseUrl,
    required String idToken,
    String? email,
    String? name,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/auth/social/google',
      body: {
        'idToken': idToken,
        if (email != null && email.trim().isNotEmpty) 'email': email.trim(),
        if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
      },
    );
    return AppAuthResponse.fromJson(response);
  }

  Future<AppAuthResponse> loginAppCustomerWithFacebook({
    required String baseUrl,
    required String accessToken,
    String? email,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/app-auth/social/facebook',
      body: {
        'accessToken': accessToken,
        if (email != null && email.trim().isNotEmpty) 'email': email.trim(),
      },
    );
    return AppAuthResponse.fromJson(response);
  }

  Future<AppAuthResponse> loginAppCustomer({
    required String baseUrl,
    required String email,
    required String password,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/app-auth/login',
      body: {'email': email, 'password': password},
    );
    return AppAuthResponse.fromJson(response);
  }

  Future<AppCustomerEmailStatus> checkAppCustomerEmailStatus({
    required String baseUrl,
    required String email,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/app-auth/email-status',
      body: {
        'email': email,
      },
    );
    return AppCustomerEmailStatus(
      exists: _readBool(response['exists']),
      known: true,
    );
  }

  Future<AppCustomerUser> fetchCurrentAppCustomer({
    required String baseUrl,
    required String appAuthToken,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/app-auth/me',
      headers: {'Authorization': 'Bearer $appAuthToken'},
    );
    return AppCustomerUser.fromJson(_readMap(response['user']));
  }

  Future<AppCustomerUser> updateCurrentAppCustomer({
    required String baseUrl,
    required String appAuthToken,
    required String fullName,
    String? phone,
    String? street,
    String? zipCode,
    String? city,
    bool marketingOptIn = false,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'PATCH',
      path: '/api/app-auth/me',
      headers: {'Authorization': 'Bearer $appAuthToken'},
      body: {
        'fullName': fullName,
        'phone': phone,
        'street': street,
        'zipCode': zipCode,
        'city': city,
        'marketingOptIn': marketingOptIn,
      },
    );
    return AppCustomerUser.fromJson(_readMap(response['user']));
  }

  Future<DateTime?> requestAppAccountDeletion({
    required String baseUrl,
    required String appAuthToken,
    String? note,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/app-auth/request-deletion',
      headers: {'Authorization': 'Bearer $appAuthToken'},
      body: {'note': note},
    );
    return _readNullableDateTime(response['deletionRequestedAt']);
  }

  Future<Map<String, dynamic>> fetchCustomerPrivacyMe({
    required String baseUrl,
    required String appAuthToken,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/customer/privacy/me',
      headers: {'Authorization': 'Bearer $appAuthToken'},
    );
    return response;
  }

  Future<Map<String, dynamic>> exportCustomerPrivacyData({
    required String baseUrl,
    required String appAuthToken,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/customer/privacy/export',
      headers: {'Authorization': 'Bearer $appAuthToken'},
    );
    return response;
  }

  Future<Map<String, dynamic>> createCustomerPrivacyDeleteRequest({
    required String baseUrl,
    required String appAuthToken,
    String? reason,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/customer/privacy/delete-request',
      headers: {'Authorization': 'Bearer $appAuthToken'},
      body: {'reason': reason},
    );
    return response;
  }

  Future<Map<String, dynamic>> updateCustomerPrivacyConsents({
    required String baseUrl,
    required String appAuthToken,
    required bool locationUsage,
    required bool deliveryUpdates,
    required bool favoriteOffers,
    required bool marketing,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'PATCH',
      path: '/api/customer/privacy/consents',
      headers: {'Authorization': 'Bearer $appAuthToken'},
      body: {
        'locationUsage': locationUsage,
        'deliveryUpdates': deliveryUpdates,
        'favoriteOffers': favoriteOffers,
        'marketing': marketing,
      },
    );
    return response;
  }

  Future<LoginResponse> login({
    required String baseUrl,
    required String email,
    required String password,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/auth/login',
      body: {'email': email, 'password': password},
    );
    return LoginResponse.fromJson(response);
  }

  Future<DriverDeviceLoginResponse> loginDriverDevice({
    required String baseUrl,
    required String pairingTokenOrPayload,
    String? driverEmail,
    String? driverPassword,
    String? driverName,
    int? accessHours,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders/driver/device-login',
      body: {
        'pairingToken': pairingTokenOrPayload,
        if (driverEmail != null && driverEmail.trim().isNotEmpty)
          'driverEmail': driverEmail,
        if (driverPassword != null && driverPassword.isNotEmpty)
          'driverPassword': driverPassword,
        if (driverName != null && driverName.trim().isNotEmpty)
          'driverName': driverName,
        if (accessHours != null) 'accessHours': accessHours,
      },
    );
    return DriverDeviceLoginResponse.fromJson(response);
  }

  Future<void> sendDriverDeviceHeartbeat({
    required String baseUrl,
    required String authToken,
  }) async {
    await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders/driver/device-heartbeat',
      headers: {'Authorization': 'Bearer $authToken'},
      body: const {},
    );
  }

  Future<OrderDeskBindResponse> bindOrderDeskDevice({
    required String baseUrl,
    required String pairingTokenOrPayload,
    required String deviceSerial,
    String? deviceAlias,
    String? deviceModel,
    String? devicePlatform,
    String? appVersion,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orderdesk-devices/public/bind',
      body: {
        'pairingToken': pairingTokenOrPayload,
        'deviceSerial': deviceSerial,
        if (deviceAlias != null && deviceAlias.trim().isNotEmpty)
          'deviceAlias': deviceAlias,
        if (deviceModel != null && deviceModel.trim().isNotEmpty)
          'deviceModel': deviceModel,
        if (devicePlatform != null && devicePlatform.trim().isNotEmpty)
          'devicePlatform': devicePlatform,
        if (appVersion != null && appVersion.trim().isNotEmpty)
          'appVersion': appVersion,
      },
    );
    return OrderDeskBindResponse.fromJson(response);
  }

  Future<OrderDeskHeartbeatResponse> sendOrderDeskHeartbeat({
    required String baseUrl,
    required String authToken,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orderdesk-devices/public/heartbeat',
      headers: {'Authorization': 'Bearer $authToken'},
      body: const {},
    );
    return OrderDeskHeartbeatResponse.fromJson(response);
  }

  Future<AccessContext> getAccessContext({
    required String baseUrl,
    required String token,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/access/context',
      headers: {'Authorization': 'Bearer $token'},
    );
    return AccessContext.fromJson(response);
  }

  Future<List<TenantDiscoveryTenant>> discoverTenants({
    required String baseUrl,
    required String zipCode,
    required DiscoveryMode mode,
    String? street,
    double? latitude,
    double? longitude,
    bool includeOutOfArea = false,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/tenants/public/discovery',
      query: {
        'zipCode': zipCode,
        'mode': mode.name,
        if (street != null && street.trim().isNotEmpty) 'street': street.trim(),
        if (latitude != null && latitude.isFinite) 'latitude': latitude.toString(),
        if (longitude != null && longitude.isFinite) 'longitude': longitude.toString(),
        if (includeOutOfArea) 'includeOutOfArea': 'true',
      },
    );

    final rawTenants = response['tenants'];
    if (rawTenants is! List) {
      return const [];
    }

    return rawTenants
        .whereType<Map<String, dynamic>>()
        .map((entry) => TenantDiscoveryTenant.fromJson(entry, baseUrl: baseUrl))
        .toList(growable: false);
  }

  Future<TenantCatalog> fetchTenantCatalog({
    required String baseUrl,
    required String tenantId,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/tenants/public/$tenantId/catalog',
    );
    return TenantCatalog.fromJson(response, baseUrl: baseUrl);
  }

  Future<PublicOrderSummary> createOrder({
    required String baseUrl,
    required String tenantId,
    required List<CreateOrderItem> items,
    required String sourceChannel,
    required String paymentMethod,
    String? serviceType,
    String? customerName,
    String? customerPhone,
    String? customerAddress,
    String? customerZipCode,
    String? customerCity,
    String? appAuthToken,
    bool markPaid = false,
  }) async {
    final headers = <String, String>{
      if (appAuthToken != null && appAuthToken.trim().isNotEmpty)
        'Authorization': 'Bearer $appAuthToken',
    };

    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders',
      headers: headers,
      body: {
        'tenantId': tenantId,
        'items': items.map((entry) => entry.toJson()).toList(growable: false),
        'sourceChannel': sourceChannel,
        'paymentMethod': paymentMethod,
        'markPaid': markPaid,
        'serviceType': serviceType,
        'customerName': customerName,
        'customerPhone': customerPhone,
        'customerAddress': customerAddress,
        'customerZipCode': customerZipCode,
        'customerCity': customerCity,
      },
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<PaypalCheckoutOrderResponse> createPaypalCheckoutOrder({
    required String baseUrl,
    required String authToken,
    required String orderId,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/payments/paypal/create-order',
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      body: {
        'orderId': orderId,
      },
    );
    return PaypalCheckoutOrderResponse.fromJson(response);
  }

  Future<PaypalCheckoutCaptureResponse> capturePaypalCheckoutOrder({
    required String baseUrl,
    required String paypalOrderId,
    String? orderId,
    String? authToken,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/payments/paypal/capture-order',
      headers: {
        if (authToken != null && authToken.trim().isNotEmpty)
          'Authorization': 'Bearer $authToken',
      },
      body: {
        'paypalOrderId': paypalOrderId,
        if (orderId != null && orderId.trim().isNotEmpty) 'orderId': orderId,
      },
    );
    return PaypalCheckoutCaptureResponse.fromJson(response);
  }

  Future<List<PublicOrderSummary>> fetchOrders({
    required String baseUrl,
    String? tenantId,
    String? appAuthToken,
  }) async {
    final response = await _requestList(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/orders',
      query: {
        if (tenantId != null && tenantId.trim().isNotEmpty)
          'tenantId': tenantId,
        if (appAuthToken != null && appAuthToken.trim().isNotEmpty)
          'channel': 'APP_ONLY',
      },
      headers: {
        if (appAuthToken != null && appAuthToken.trim().isNotEmpty)
          'Authorization': 'Bearer $appAuthToken',
      },
    );

    return response
        .whereType<Map<String, dynamic>>()
        .map(PublicOrderSummary.fromJson)
        .toList(growable: false);
  }

  Future<PublicOrderDisplayFeed> fetchPublicOrderDisplayFeed({
    required String baseUrl,
    required String displayCode,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/order-displays/public/$displayCode/feed',
    );
    return PublicOrderDisplayFeed.fromJson(response);
  }

  Future<PublicOrderSummary> acceptPublicOrderDisplayOrder({
    required String baseUrl,
    required String displayCode,
    required String orderId,
    required int estimatedMinutes,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/order-displays/public/$displayCode/orders/$orderId/accept',
      body: {'estimatedMinutes': estimatedMinutes},
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<PublicOrderSummary> updatePublicOrderDisplayPaymentStatus({
    required String baseUrl,
    required String displayCode,
    required String orderId,
    required bool paid,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/order-displays/public/$displayCode/orders/$orderId/payment',
      body: {'paid': paid},
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<PublicOrderSummary> dispatchPublicOrderDisplayOrder({
    required String baseUrl,
    required String displayCode,
    required String orderId,
    String? driverUserId,
    String? driverName,
    int? estimatedMinutes,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/order-displays/public/$displayCode/orders/$orderId/dispatch',
      body: {
        'driverUserId': driverUserId,
        'driverName': driverName,
        'estimatedMinutes': estimatedMinutes,
      },
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<PublicOrderSummary> updatePublicOrderDisplayOrderStatus({
    required String baseUrl,
    required String displayCode,
    required String orderId,
    required String status,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/order-displays/public/$displayCode/orders/$orderId/status',
      body: {'status': status},
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<PublicOrderSummary> updatePublicOrderDisplayItemStatus({
    required String baseUrl,
    required String displayCode,
    required String orderId,
    required String itemId,
    required String status,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path:
          '/api/order-displays/public/$displayCode/orders/$orderId/items/$itemId/status',
      body: {'status': status},
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<PublicOrderDisplayReceiptJobsResponse>
  fetchPublicOrderDisplayReceiptJobs({
    required String baseUrl,
    required String displayCode,
    required String orderId,
    String kind = 'both',
    String? trackingUrl,
    String locale = 'de-DE',
    String timeZone = 'Europe/Berlin',
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path:
          '/api/order-displays/public/$displayCode/orders/$orderId/receipt-jobs',
      query: {
        'kind': kind,
        if (trackingUrl != null && trackingUrl.trim().isNotEmpty)
          'trackingUrl': trackingUrl,
        'locale': locale,
        'timeZone': timeZone,
      },
    );
    return PublicOrderDisplayReceiptJobsResponse.fromJson(response);
  }

  Future<MobileAppUpdateManifest> fetchMobileUpdateManifest({
    required String baseUrl,
    required String appKey,
    String? currentVersion,
    int? currentBuildNumber,
  }) async {
    final normalizedKey = appKey.trim().toLowerCase();
    if (normalizedKey.isEmpty) {
      throw const ApiException('Update-Kanal fehlt.');
    }
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/mobile-updates/$normalizedKey',
      query: {
        if (currentVersion != null && currentVersion.trim().isNotEmpty)
          'currentVersion': currentVersion.trim(),
        if (currentBuildNumber != null && currentBuildNumber > 0)
          'buildNumber': '$currentBuildNumber',
      },
    );
    return MobileAppUpdateManifest.fromJson(response);
  }

  Future<MobileAppUpdateManifest> fetchOrderDeskUpdateManifest({
    required String baseUrl,
    String? currentVersion,
    int? currentBuildNumber,
  }) async {
    return fetchMobileUpdateManifest(
      baseUrl: baseUrl,
      appKey: 'orderdesk',
      currentVersion: currentVersion,
      currentBuildNumber: currentBuildNumber,
    );
  }

  Future<MobileAppUpdateManifest> fetchDriverUpdateManifest({
    required String baseUrl,
    String? currentVersion,
    int? currentBuildNumber,
  }) async {
    return fetchMobileUpdateManifest(
      baseUrl: baseUrl,
      appKey: 'driver',
      currentVersion: currentVersion,
      currentBuildNumber: currentBuildNumber,
    );
  }

  Future<MobileAppUpdateManifest> fetchCustomerUpdateManifest({
    required String baseUrl,
    String? currentVersion,
    int? currentBuildNumber,
  }) async {
    return fetchMobileUpdateManifest(
      baseUrl: baseUrl,
      appKey: 'customer',
      currentVersion: currentVersion,
      currentBuildNumber: currentBuildNumber,
    );
  }

  Future<List<PublicOrderSummary>> fetchDriverAssignedOrders({
    required String baseUrl,
    required String authToken,
  }) async {
    final feed = await fetchDriverAssignedFeed(
      baseUrl: baseUrl,
      authToken: authToken,
    );
    return feed.orders;
  }

  Future<DriverAssignedFeed> fetchDriverAssignedFeed({
    required String baseUrl,
    required String authToken,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'GET',
      path: '/api/orders/driver/assigned',
      headers: {'Authorization': 'Bearer $authToken'},
    );
    return DriverAssignedFeed.fromJson(response);
  }

  Future<void> sendDriverLocation({
    required String baseUrl,
    required String authToken,
    required String orderId,
    required double latitude,
    required double longitude,
    double? accuracyMeters,
    double? heading,
    double? speedKmh,
  }) async {
    await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders/driver/location',
      headers: {'Authorization': 'Bearer $authToken'},
      body: {
        'orderId': orderId,
        'latitude': latitude,
        'longitude': longitude,
        if (accuracyMeters != null) 'accuracyMeters': accuracyMeters,
        if (heading != null) 'heading': heading,
        if (speedKmh != null) 'speedKmh': speedKmh,
      },
    );
  }

  Future<PublicOrderSummary> startDriverRoute({
    required String baseUrl,
    required String authToken,
    required String orderId,
    int? estimatedMinutes,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders/driver/route-start',
      headers: {'Authorization': 'Bearer $authToken'},
      body: {
        'orderId': orderId,
        if (estimatedMinutes != null) 'estimatedMinutes': estimatedMinutes,
      },
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<PublicOrderSummary> updateOrderStatus({
    required String baseUrl,
    required String orderId,
    required String status,
    String? authToken,
  }) async {
    final response = await _request(
      baseUrl: baseUrl,
      method: 'PATCH',
      path: '/api/orders/$orderId/status',
      headers: {
        if (authToken != null && authToken.trim().isNotEmpty)
          'Authorization': 'Bearer $authToken',
      },
      body: {'status': status},
    );
    return PublicOrderSummary.fromJson(response);
  }

  Future<void> submitOrderRating({
    required String baseUrl,
    required String orderId,
    required int stars,
    String? comment,
  }) async {
    if (stars < 1 || stars > 5) {
      throw const ApiException('Sterne muessen zwischen 1 und 5 liegen.');
    }

    await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders/$orderId/rating',
      body: {'stars': stars, 'comment': comment},
    );
  }

  Future<void> submitOrderComplaint({
    required String baseUrl,
    required String orderId,
    required String appAuthToken,
    required String message,
    List<String> images = const [],
  }) async {
    final trimmedMessage = message.trim();
    if (trimmedMessage.isEmpty) {
      throw const ApiException('Bitte einen Reklamationstext eingeben.');
    }

    await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders/$orderId/complaints',
      headers: {'Authorization': 'Bearer $appAuthToken'},
      body: {
        'message': trimmedMessage,
        'images': images
            .where((entry) => entry.trim().isNotEmpty)
            .toList(growable: false),
      },
    );
  }

  Future<void> submitDriverSignature({
    required String baseUrl,
    required String authToken,
    required String orderId,
    required String signerName,
    required String signatureImageDataUrl,
  }) async {
    final trimmedSignerName = signerName.trim();
    final trimmedSignature = signatureImageDataUrl.trim();
    if (trimmedSignerName.isEmpty) {
      throw const ApiException('Bitte Namen fuer die Unterschrift eingeben.');
    }
    if (trimmedSignature.isEmpty) {
      throw const ApiException('Bitte erst eine Unterschrift zeichnen.');
    }

    await _request(
      baseUrl: baseUrl,
      method: 'POST',
      path: '/api/orders/driver/signature',
      headers: {'Authorization': 'Bearer $authToken'},
      body: {
        'orderId': orderId,
        'signerName': trimmedSignerName,
        'signatureImageDataUrl': trimmedSignature,
      },
    );
  }

  Future<Map<String, dynamic>> _request({
    required String baseUrl,
    required String method,
    required String path,
    Map<String, String>? query,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final normalizedBase = _normalizeBaseUrl(baseUrl);
    final uri = Uri.parse(
      '$normalizedBase$path',
    ).replace(queryParameters: query);
    final response = await _sendRequest(
      method: method,
      uri: uri,
      headers: headers,
      body: body,
    );
    final responseJson = _tryDecodeMap(response.body);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(
        _resolveErrorMessage(responseJson, response.statusCode),
        statusCode: response.statusCode,
      );
    }

    return responseJson;
  }

  Future<List<dynamic>> _requestList({
    required String baseUrl,
    required String method,
    required String path,
    Map<String, String>? query,
    Map<String, String>? headers,
  }) async {
    final normalizedBase = _normalizeBaseUrl(baseUrl);
    final uri = Uri.parse(
      '$normalizedBase$path',
    ).replace(queryParameters: query);
    final response = await _sendRequest(
      method: method,
      uri: uri,
      headers: headers,
    );
    final responseJson = _tryDecode(response.body);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      final errorMap = responseJson is Map<String, dynamic>
          ? responseJson
          : <String, dynamic>{};
      throw ApiException(
        _resolveErrorMessage(errorMap, response.statusCode),
        statusCode: response.statusCode,
      );
    }

    if (responseJson is List) {
      return responseJson;
    }

    throw const ApiException('Ungültige Antwort vom Server');
  }

  Future<http.Response> _sendRequest({
    required String method,
    required Uri uri,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final mergedHeaders = <String, String>{
      'accept': 'application/json',
      if (headers != null) ...headers,
    };

    final normalizedMethod = method.trim().toUpperCase();
    final payload = body == null ? null : jsonEncode(body);
    if (payload != null) {
      mergedHeaders['content-type'] = 'application/json';
    }

    final timeout = _connectionTimeout + _requestTimeout;

    try {
      final responseFuture = switch (normalizedMethod) {
        'GET' => http.get(uri, headers: mergedHeaders),
        'POST' => http.post(uri, headers: mergedHeaders, body: payload),
        'PATCH' => http.patch(uri, headers: mergedHeaders, body: payload),
        'PUT' => http.put(uri, headers: mergedHeaders, body: payload),
        'DELETE' => http.delete(uri, headers: mergedHeaders, body: payload),
        _ => throw ApiException('Ungültige HTTP-Methode: $method'),
      };

      return await responseFuture.timeout(timeout);
    } on TimeoutException {
      throw const ApiException(
        'Verbindung konnte nicht hergestellt werden.',
      );
    } on http.ClientException {
      throw const ApiException(
        'Verbindung konnte nicht hergestellt werden.',
      );
    } on FormatException {
      throw const ApiException('Ungültige Antwort vom Server');
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiException(
        'Verbindung konnte nicht hergestellt werden.',
      );
    }
  }
}

String _normalizeBaseUrl(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return defaultApiBaseUrl;
  }
  return trimmed.endsWith('/')
      ? trimmed.substring(0, trimmed.length - 1)
      : trimmed;
}

String? _resolvePublicAssetUrl(String baseUrl, String? rawUrl) {
  final trimmed = rawUrl?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  if (trimmed.startsWith('data:')) {
    return trimmed;
  }

  final parsed = Uri.tryParse(trimmed);
  if (parsed != null && parsed.hasScheme) {
    return trimmed;
  }

  final baseUri = Uri.parse('${_normalizeBaseUrl(baseUrl)}/');
  return baseUri.resolve(trimmed).toString();
}

String? _buildAddressLine(Map<String, dynamic>? address) {
  if (address == null) {
    return null;
  }
  final street = _readNullableString(address['street']);
  final zipCode = _readNullableString(address['zipCode']);
  final city = _readNullableString(address['city']);

  final line1 = <String>[if (street != null) street].join(' ').trim();
  final line2 = <String>[
    if (zipCode != null) zipCode,
    if (city != null) city,
  ].join(' ').trim();

  final segments = <String>[
    if (line1.isNotEmpty) line1,
    if (line2.isNotEmpty) line2,
  ];

  if (segments.isEmpty) {
    return null;
  }
  return segments.join(', ');
}

String? _readOrderHeaderImage(
  Map<String, dynamic>? customerApp,
  Map<String, dynamic>? fallbackSource,
) {
  final appImage = customerApp == null
      ? null
      : _readNullableString(customerApp['orderHeaderImageUrl']);
  if (appImage != null) {
    return appImage;
  }

  final legacyAppImage = customerApp == null
      ? null
      : _readNullableString(customerApp['titleImageUrl']);
  if (legacyAppImage != null) {
    return legacyAppImage;
  }

  return fallbackSource == null
      ? null
      : _readNullableString(fallbackSource['titleImageUrl']);
}

Map<String, dynamic> _tryDecodeMap(String raw) {
  if (raw.trim().isEmpty) {
    return <String, dynamic>{};
  }
  final decoded = jsonDecode(raw);
  if (decoded is Map<String, dynamic>) {
    return decoded;
  }
  throw const ApiException('Ungültige Antwort vom Server');
}

dynamic _tryDecode(String raw) {
  if (raw.trim().isEmpty) {
    return <String, dynamic>{};
  }
  return jsonDecode(raw);
}

String _resolveErrorMessage(Map<String, dynamic> data, int statusCode) {
  final message = data['error'];
  if (message is String && message.trim().isNotEmpty) {
    return message;
  }
  return 'Serverfehler ($statusCode)';
}

Map<String, dynamic> _readMap(dynamic value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}

Map<String, dynamic>? _readNullableMap(dynamic value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return null;
}

String _readString(dynamic value) {
  return value is String ? value : '';
}

String? _readNullableString(dynamic value) {
  if (value is String) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
  return null;
}

bool _readBool(dynamic value) {
  return value is bool ? value : false;
}

double? _readNullableDouble(dynamic value) {
  if (value is num) {
    return value.toDouble();
  }
  if (value is String) {
    final parsed = double.tryParse(value);
    return parsed;
  }
  return null;
}

double _readDouble(dynamic value) {
  if (value is num) {
    return value.toDouble();
  }
  if (value is String) {
    return double.tryParse(value.replaceAll(',', '.')) ?? 0;
  }
  return 0;
}

int _readInt(dynamic value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value) ?? 0;
  }
  return 0;
}

int? _readNullableInt(dynamic value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}

DateTime? _readNullableDateTime(dynamic value) {
  if (value is! String || value.trim().isEmpty) {
    return null;
  }
  return DateTime.tryParse(value);
}

List<String> _readStringList(dynamic value) {
  if (value is! List) {
    return const [];
  }
  return value.whereType<String>().toList(growable: false);
}
