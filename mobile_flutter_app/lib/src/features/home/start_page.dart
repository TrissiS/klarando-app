import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../../core/klarando_api.dart';

double? _parseMoneyValue(String? raw) {
  if (raw == null || raw.trim().isEmpty) return null;
  final normalized = raw.replaceAll(',', '.');
  final match = RegExp(r'-?\d+(?:\.\d+)?').firstMatch(normalized);
  if (match == null) return null;
  return double.tryParse(match.group(0) ?? '');
}

String _formatCurrency(double value) {
  final normalized = value.toStringAsFixed(2).replaceAll('.', ',');
  return '$normalized €';
}

String _formatMoneyLabel(String? raw) {
  final parsed = _parseMoneyValue(raw);
  if (parsed == null) {
    return raw?.trim() ?? '';
  }
  return _formatCurrency(parsed);
}

class TenantRatingInfo {
  const TenantRatingInfo({
    required this.average,
    required this.count,
  });

  final double average;
  final int count;
}

class StartPage extends StatefulWidget {
  const StartPage({
    required this.loading,
    required this.message,
    required this.results,
    required this.selectedTenantId,
    required this.userAddress,
    required this.activeZipCode,
    required this.languageCode,
    required this.favoriteTenantIds,
    required this.tenantRatings,
    required this.onSearchByZip,
    required this.onEditAddress,
    required this.onUseCurrentLocation,
    required this.onSelectTenant,
    required this.onSelectUnavailableTenant,
    required this.onToggleFavorite,
    super.key,
  });

  final bool loading;
  final String message;
  final List<TenantDiscoveryTenant> results;
  final String? selectedTenantId;
  final String userAddress;
  final String activeZipCode;
  final String languageCode;
  final Set<String> favoriteTenantIds;
  final Map<String, TenantRatingInfo> tenantRatings;
  final Future<void> Function(String zipCode, DiscoveryMode mode) onSearchByZip;
  final Future<void> Function() onEditAddress;
  final Future<void> Function() onUseCurrentLocation;
  final void Function(TenantDiscoveryTenant tenant) onSelectTenant;
  final void Function(TenantDiscoveryTenant tenant) onSelectUnavailableTenant;
  final void Function(String tenantId) onToggleFavorite;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  DiscoveryMode _mode = DiscoveryMode.delivery;

  @override
  void dispose() => super.dispose();

  bool _isZipCode(String input) {
    return RegExp(r'^\d{5}$').hasMatch(input.trim());
  }

  bool get _hasValidAddressSource =>
      widget.userAddress.trim().isNotEmpty && _isZipCode(widget.activeZipCode);

  String get _addressLabel {
    final address = widget.userAddress.trim();
    final zipCode = widget.activeZipCode.trim();
    if (address.isEmpty && zipCode.isEmpty) {
      return _t(widget.languageCode, 'home_address_missing');
    }
    if (address.isEmpty) {
      return zipCode;
    }
    if (zipCode.isEmpty || address.contains(zipCode)) {
      return address;
    }
    return '$address, $zipCode';
  }

  @override
  Widget build(BuildContext context) {
    final filtered = widget.results.toList(growable: false);

    final favorites = filtered
        .where((entry) => widget.favoriteTenantIds.contains(entry.tenantId))
        .toList(growable: false);
    final others = filtered
        .where((entry) => !widget.favoriteTenantIds.contains(entry.tenantId))
        .toList(growable: false);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _StartHeaderContent(
            collapse: 0,
            languageCode: widget.languageCode,
            loading: widget.loading,
            mode: _mode,
            addressLabel: _addressLabel,
            hasValidAddress: _hasValidAddressSource,
            onEditAddress: widget.onEditAddress,
            onUseCurrentLocation: widget.onUseCurrentLocation,
            onModeChanged: (nextMode) {
              setState(() {
                _mode = nextMode;
              });
              if (_hasValidAddressSource) {
                widget.onSearchByZip(widget.activeZipCode, nextMode);
              }
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed([
              if (favorites.isNotEmpty) ...[
                _SectionTitle(title: _t(widget.languageCode, 'favorites_nearby')),
                const SizedBox(height: 8),
                ...favorites.map(
                  (item) => _TenantCard(
                    item: item,
                    mode: _mode,
                    languageCode: widget.languageCode,
                    isSelected: widget.selectedTenantId == item.tenantId,
                    isFavorite: widget.favoriteTenantIds.contains(item.tenantId),
                    rating: widget.tenantRatings[item.tenantId],
                    onToggleFavorite: () => widget.onToggleFavorite(item.tenantId),
                    onOpen: () => widget.onSelectTenant(item),
                    onUnavailableTap: () => widget.onSelectUnavailableTenant(item),
                  ),
                ),
                const SizedBox(height: 10),
              ],
              _SectionTitle(title: _t(widget.languageCode, 'other_places')),
              const SizedBox(height: 8),
              if (others.isEmpty && favorites.isEmpty)
                _EmptyState(message: widget.message)
              else
                ...others.map(
                  (item) => _TenantCard(
                    item: item,
                    mode: _mode,
                    languageCode: widget.languageCode,
                    isSelected: widget.selectedTenantId == item.tenantId,
                    isFavorite: widget.favoriteTenantIds.contains(item.tenantId),
                    rating: widget.tenantRatings[item.tenantId],
                    onToggleFavorite: () => widget.onToggleFavorite(item.tenantId),
                    onOpen: () => widget.onSelectTenant(item),
                    onUnavailableTap: () => widget.onSelectUnavailableTenant(item),
                  ),
                ),
            ]),
          ),
        ),
      ],
    );
  }
}

class _StartHeaderContent extends StatelessWidget {
  const _StartHeaderContent({
    required this.collapse,
    required this.languageCode,
    required this.loading,
    required this.mode,
    required this.addressLabel,
    required this.hasValidAddress,
    required this.onEditAddress,
    required this.onUseCurrentLocation,
    required this.onModeChanged,
  });

  final double collapse;
  final String languageCode;
  final bool loading;
  final DiscoveryMode mode;
  final String addressLabel;
  final bool hasValidAddress;
  final Future<void> Function() onEditAddress;
  final Future<void> Function() onUseCurrentLocation;
  final ValueChanged<DiscoveryMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    final subtitleOpacity = (1 - collapse * 1.25).clamp(0, 1).toDouble();
    final headerPadding = EdgeInsets.fromLTRB(
      12,
      lerpDouble(12, 6, collapse) ?? 8,
      12,
      lerpDouble(10, 6, collapse) ?? 8,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: headerPadding,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: lerpDouble(12, 10, collapse) ?? 10,
                vertical: lerpDouble(10, 6, collapse) ?? 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFE6007E), Color(0xFFFF5A1F), Color(0xFFFFBC00)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x24FF5A1F).withOpacity(1 - (collapse * 0.5)),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subtitleOpacity > 0.05)
                    Opacity(
                      opacity: subtitleOpacity,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          _t(languageCode, 'home_subtitle'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => onEditAddress(),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: lerpDouble(10, 8, collapse) ?? 8,
                        vertical: lerpDouble(8, 6, collapse) ?? 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.22),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on_rounded, color: Colors.white, size: 16),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              addressLabel,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: lerpDouble(14, 12, collapse),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => onUseCurrentLocation(),
                                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.my_location_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                tooltip: _t(languageCode, 'use_location'),
                              ),
                              IconButton(
                                onPressed: () => onEditAddress(),
                                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.edit_location_alt_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                tooltip: _t(
                                  languageCode,
                                  hasValidAddress ? 'change_address' : 'enter_address',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (subtitleOpacity > 0.05) ...[
                    if (!hasValidAddress)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          _t(languageCode, 'address_required_hint'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ),
            SizedBox(height: lerpDouble(10, 6, collapse)),
            _SearchPanel(
              languageCode: languageCode,
              loading: loading,
              mode: mode,
              compact: collapse > 0.5,
              onModeChanged: onModeChanged,
            ),
            if (loading) ...[
              const SizedBox(height: 8),
              const LinearProgressIndicator(
                minHeight: 3,
                borderRadius: BorderRadius.all(Radius.circular(999)),
                color: Color(0xFFFF5A1F),
                backgroundColor: Color(0x1AFF5A1F),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SearchPanel extends StatelessWidget {
  const _SearchPanel({
    required this.languageCode,
    required this.loading,
    required this.mode,
    required this.compact,
    required this.onModeChanged,
  });

  final String languageCode;
  final bool loading;
  final DiscoveryMode mode;
  final bool compact;
  final ValueChanged<DiscoveryMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 10 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDEDED)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 18,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SegmentedButton<DiscoveryMode>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: DiscoveryMode.delivery,
                label: Text(_t(languageCode, 'delivery')),
                icon: const Icon(Icons.delivery_dining_rounded),
              ),
              ButtonSegment(
                value: DiscoveryMode.pickup,
                label: Text(_t(languageCode, 'pickup')),
                icon: const Icon(Icons.storefront_rounded),
              ),
            ],
            selected: {mode},
            onSelectionChanged: (selection) {
              final nextMode = selection.isEmpty ? null : selection.first;
              if (nextMode == null) {
                return;
              }
              onModeChanged(nextMode);
            },
            style: SegmentedButton.styleFrom(
              selectedBackgroundColor: const Color(0xFFFFE2D7),
              selectedForegroundColor: const Color(0xFF9A3412),
              side: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
          ),
          SizedBox(height: compact ? 8 : 10),
          Text(
            loading
                ? _t(languageCode, 'home_results_refreshing')
                : _t(languageCode, 'home_mode_hint'),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}

class _TenantCard extends StatelessWidget {
  const _TenantCard({
    required this.item,
    required this.mode,
    required this.languageCode,
    required this.isSelected,
    required this.isFavorite,
    required this.rating,
    required this.onToggleFavorite,
    required this.onOpen,
    required this.onUnavailableTap,
  });

  final TenantDiscoveryTenant item;
  final DiscoveryMode mode;
  final String languageCode;
  final bool isSelected;
  final bool isFavorite;
  final TenantRatingInfo? rating;
  final VoidCallback onToggleFavorite;
  final VoidCallback onOpen;
  final VoidCallback onUnavailableTap;

  @override
  Widget build(BuildContext context) {
    final serviceAvailable = mode == DiscoveryMode.delivery
        ? item.deliveryAvailable
        : item.pickupAvailable;
    final serviceStatus = mode == DiscoveryMode.delivery ? item.deliveryStatus : item.pickupStatus;
    final isConfigPending = mode == DiscoveryMode.delivery
        ? item.deliveryConfigPending
        : item.pickupConfigPending;
    final isOrderIntakePaused = item.orderIntake.paused;
    final orderIntakeReason = item.orderIntake.reason?.trim().isNotEmpty == true
        ? item.orderIntake.reason!.trim()
        : 'Aufgrund hoher Auslastung nimmt dieses Lokal aktuell keine neuen Online-Bestellungen an.';
    final isOpen = (serviceAvailable || isConfigPending) && item.orderingEnabled && !isOrderIntakePaused;
    final baseRatingAverage = item.ratingAverage ?? 0;
    final baseRatingCount = item.ratingCount;
    final localRatingAverage = rating?.average ?? 0;
    final localRatingCount = rating?.count ?? 0;
    final ratingCount = baseRatingCount + localRatingCount;
    final ratingAverage = ratingCount > 0
        ? ((baseRatingAverage * baseRatingCount) + (localRatingAverage * localRatingCount)) /
            ratingCount
        : 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected ? const Color(0xFFFF5A1F) : const Color(0xFFE7E5E4),
          width: isSelected ? 1.6 : 1,
        ),
        color: isOpen ? Colors.white : const Color(0xFFF8FAFC),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: isOpen ? onOpen : onUnavailableTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TenantPreviewImage(logoUrl: item.logoUrl),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                item.tenantName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            IconButton(
                              tooltip: _t(languageCode, 'favorites_nearby'),
                              onPressed: onToggleFavorite,
                              icon: Icon(
                                isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                                color: isFavorite ? const Color(0xFFF59E0B) : Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        if ((item.chainName ?? '').trim().isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              item.chainName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            const Icon(Icons.star_rounded, size: 15, color: Color(0xFFF59E0B)),
                            const SizedBox(width: 4),
                            Text(
                              ratingCount > 0
                                  ? '${ratingAverage.toStringAsFixed(1)} ($ratingCount)'
                                  : _t(languageCode, 'new_rating'),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4B5563),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (item.distanceKm != null) ...[
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.directions_walk_rounded,
                                size: 15,
                                color: Color(0xFF4B5563),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${item.distanceKm!.toStringAsFixed(1)} km',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4B5563),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _StatusTag(label: _t(languageCode, 'delivery'), active: item.deliveryAvailable),
                            _StatusTag(label: _t(languageCode, 'pickup'), active: item.pickupAvailable),
                            if (isOrderIntakePaused)
                              const _StatusTag(
                                label: 'Bestellannahme pausiert',
                                active: true,
                                activeColor: Color(0xFFB91C1C),
                              ),
                          ],
                        ),
                        if (isOrderIntakePaused)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              orderIntakeReason,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF991B1B),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        if (!serviceAvailable &&
                            item.deliveryStatus == 'OUTSIDE_SCHEDULE' &&
                            item.deliveryNextAvailableAt != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Lieferung wieder ab ${_formatNextSlot(item.deliveryNextAvailableAt!)} möglich',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF92400E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        const SizedBox(height: 8),
                        if (item.minOrderValue != null)
                          _MetaLine(
                            icon: Icons.shopping_bag_outlined,
                            text:
                                '${_t(languageCode, 'min_order')}: ${_formatMoneyLabel(item.minOrderValue)}',
                          ),
                        if (item.deliveryFeeNote != null)
                          _MetaLine(
                            icon: Icons.local_shipping_outlined,
                            text:
                                '${_t(languageCode, 'delivery_fee')}: ${_formatMoneyLabel(item.deliveryFeeNote)}',
                          ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  isOpen ? const Color(0xFFFF5A1F) : const Color(0xFF9CA3AF),
                            ),
                            onPressed: isOpen ? onOpen : onUnavailableTap,
                            child: Text(
                              isOpen
                                  ? _t(languageCode, 'open_menu')
                                  : _unavailableLabel(
                                      languageCode,
                                      serviceStatus,
                                      isConfigPending,
                                      isOrderIntakePaused,
                                      orderIntakeReason,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!isOpen)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.42),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _overlayLabel(
                      languageCode,
                      serviceStatus,
                      isConfigPending,
                      isOrderIntakePaused,
                      orderIntakeReason,
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _unavailableLabel(
    String languageCode,
    String serviceStatus,
    bool isConfigPending,
    bool isOrderIntakePaused,
    String orderIntakeReason,
  ) {
    if (isOrderIntakePaused) {
      return 'Bestellannahme pausiert';
    }
    if (isConfigPending || serviceStatus == 'CONFIG_PENDING') {
      return _t(languageCode, 'area_checking');
    }
    if (serviceStatus == 'LOCATION_REQUIRED') {
      return _t(languageCode, 'location_required');
    }
    return _t(languageCode, 'not_available');
  }

  String _overlayLabel(
    String languageCode,
    String serviceStatus,
    bool isConfigPending,
    bool isOrderIntakePaused,
    String orderIntakeReason,
  ) {
    if (isOrderIntakePaused) {
      return 'Bestellannahme aktuell pausiert\n$orderIntakeReason';
    }
    if (isConfigPending || serviceStatus == 'CONFIG_PENDING') {
      return _t(languageCode, 'area_checking_overlay');
    }
    if (serviceStatus == 'LOCATION_REQUIRED') {
      return _t(languageCode, 'location_required_overlay');
    }
    if (serviceStatus == 'OUT_OF_AREA') {
      return _t(languageCode, 'out_of_area_overlay');
    }
    return _t(languageCode, 'closed_overlay');
  }

  String _formatNextSlot(DateTime value) {
    final local = value.toLocal();
    final weekday = [
      'So',
      'Mo',
      'Di',
      'Mi',
      'Do',
      'Fr',
      'Sa',
    ][local.weekday % 7];
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$weekday $hour:$minute';
  }
}

class _TenantPreviewImage extends StatelessWidget {
  const _TenantPreviewImage({
    required this.logoUrl,
  });

  final String? logoUrl;

  @override
  Widget build(BuildContext context) {
    final normalizedUrl = (logoUrl ?? '').trim();
    final inlineImage =
        normalizedUrl.isEmpty ? null : _decodeInlineTenantImageData(normalizedUrl);
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: 94,
        height: 108,
        child: normalizedUrl.isEmpty
            ? Image.asset('assets/klarando_icon.png', fit: BoxFit.cover)
            : inlineImage != null
            ? Image.memory(
                inlineImage,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Image.asset('assets/klarando_icon.png', fit: BoxFit.cover),
              )
            : Image.network(
                normalizedUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Image.asset('assets/klarando_icon.png', fit: BoxFit.cover),
              ),
      ),
    );
  }
}

Uint8List? _decodeInlineTenantImageData(String value) {
  final lower = value.toLowerCase();
  if (!lower.startsWith('data:image/')) {
    return null;
  }
  final commaIndex = value.indexOf(',');
  if (commaIndex <= 0) {
    return null;
  }
  final meta = lower.substring(0, commaIndex);
  if (!meta.contains(';base64')) {
    return null;
  }
  final payload = value.substring(commaIndex + 1);
  if (payload.isEmpty) {
    return null;
  }
  try {
    return base64Decode(payload);
  } catch (_) {
    return null;
  }
}

class _MetaLine extends StatelessWidget {
  const _MetaLine({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 14, color: const Color(0xFF6B7280)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _StatusTag extends StatelessWidget {
  const _StatusTag({
    required this.label,
    required this.active,
    this.activeColor,
  });

  final String label;
  final bool active;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final tone = activeColor ?? const Color(0xFFFF5A1F);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: active ? tone.withOpacity(0.12) : const Color(0xFFF3F4F6),
        border: Border.all(
          color: active ? tone : const Color(0xFFD1D5DB),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: active ? tone : const Color(0xFF6B7280),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.search_off_rounded, color: Color(0xFF9CA3AF)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message.isEmpty ? 'Keine passenden Lokale gefunden.' : message,
              style: const TextStyle(color: Color(0xFF4B5563)),
            ),
          ),
        ],
      ),
    );
  }
}

String _t(String languageCode, String key) {
  const de = {
    'home_subtitle': 'Lecker bestellen in wenigen Klicks.',
    'delivery': 'Lieferung',
    'pickup': 'Abholung',
    'home_search_hint': 'Lokale suchen oder neue PLZ eingeben',
    'change_address': 'Adresse ändern',
    'enter_address': 'Adresse eingeben',
    'use_location': 'Standort verwenden',
    'home_address_missing': 'Bitte Lieferadresse auswählen',
    'address_required_hint': 'Bitte zuerst eine gültige Adresse auswählen oder den Standort verwenden.',
    'home_mode_hint': 'Lokale werden automatisch anhand deiner Adresse und der gewählten Bestellart geladen.',
    'home_results_refreshing': 'Lokale werden für deine gespeicherte Adresse aktualisiert …',
    'favorites_nearby': 'Favoriten in deiner Nähe',
    'other_places': 'Weitere verfügbare Lokale',
    'new_rating': 'Neu',
    'min_order': 'Mindestbestellwert',
    'delivery_fee': 'Liefergebühr',
    'open_menu': 'Speisekarte',
    'not_available': 'Nicht verfügbar',
    'area_checking': 'Liefergebiet wird geprüft',
    'location_required': 'Adresse prüfen',
    'closed_overlay': 'Geschlossen / aktuell keine Bestellannahme möglich',
    'area_checking_overlay': 'Liefergebiet wird geprüft. Bitte Adresse prüfen.',
    'location_required_overlay': 'Bitte Standort oder Adresse freigeben.',
    'out_of_area_overlay': 'Adresse liegt außerhalb des Liefergebiets.',
  };

  const en = {
    'home_subtitle': 'Order your favorites in just a few taps.',
    'delivery': 'Delivery',
    'pickup': 'Pickup',
    'home_search_hint': 'Search places or enter a new ZIP code',
    'change_address': 'Change address',
    'enter_address': 'Enter address',
    'use_location': 'Use location',
    'home_address_missing': 'Please choose a delivery address first',
    'address_required_hint': 'Please select a valid address or use your location first.',
    'home_mode_hint': 'Places are loaded automatically using your saved address and selected order type.',
    'home_results_refreshing': 'Refreshing places for your saved address …',
    'favorites_nearby': 'Favorites near you',
    'other_places': 'More available places',
    'new_rating': 'New',
    'min_order': 'Minimum order',
    'delivery_fee': 'Delivery fee',
    'open_menu': 'Open menu',
    'not_available': 'Unavailable',
    'area_checking': 'Area check pending',
    'location_required': 'Check address',
    'closed_overlay': 'Closed / no orders possible right now',
    'area_checking_overlay': 'Service area is being checked. Please verify address.',
    'location_required_overlay': 'Please allow location or enter your address.',
    'out_of_area_overlay': 'Address is outside the delivery area.',
  };

  const tr = {
    'home_subtitle': 'Birkac tikla ile hizli siparis.',
    'delivery': 'Teslimat',
    'pickup': 'Gel al',
    'home_search_hint': 'Mekan ara veya yeni posta kodu gir',
    'change_address': 'Adresi değiştir',
    'enter_address': 'Adres gir',
    'use_location': 'Konumu kullan',
    'home_address_missing': 'Lütfen önce teslimat adresi seçin',
    'address_required_hint': 'Lütfen önce geçerli bir adres seçin veya konumu kullanın.',
    'home_mode_hint': 'Mekanlar kayıtlı adresine ve seçilen sipariş türüne göre otomatik yüklenir.',
    'home_results_refreshing': 'Kayıtlı adresin için mekanlar yenileniyor …',
    'favorites_nearby': 'Yakindaki favoriler',
    'other_places': 'Diger mekanlar',
    'new_rating': 'Yeni',
    'min_order': 'Minimum siparis',
    'delivery_fee': 'Teslimat ucreti',
    'open_menu': 'Menue',
    'not_available': 'Uygun degil',
    'area_checking': 'Bolge kontrol ediliyor',
    'location_required': 'Adresi kontrol et',
    'closed_overlay': 'Kapali / su anda siparis alinmiyor',
    'area_checking_overlay': 'Teslimat bolgesi kontrol ediliyor. Lutfen adresi kontrol edin.',
    'location_required_overlay': 'Lutfen konumu acin veya adres girin.',
    'out_of_area_overlay': 'Adres teslimat bolgesi disinda.',
  };

  if (languageCode == 'en') {
    return en[key] ?? de[key] ?? key;
  }
  if (languageCode == 'tr') {
    return tr[key] ?? de[key] ?? key;
  }
  return de[key] ?? key;
}
