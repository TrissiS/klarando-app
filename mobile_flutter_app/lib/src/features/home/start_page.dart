import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../../core/klarando_api.dart';

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
    required this.onSelectTenant,
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
  final void Function(TenantDiscoveryTenant tenant) onSelectTenant;
  final void Function(String tenantId) onToggleFavorite;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _searchController = TextEditingController();
  DiscoveryMode _mode = DiscoveryMode.delivery;
  bool _searchCollapsed = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _isZipCode(String input) {
    return RegExp(r'^\d{5}$').hasMatch(input.trim());
  }

  Future<void> _submitSearch() async {
    final value = _searchController.text.trim();
    if (_isZipCode(value)) {
      await widget.onSearchByZip(value, _mode);
      if (!mounted) {
        return;
      }
      setState(() {
        _searchCollapsed = true;
      });
      return;
    }

    if (!mounted) {
      return;
    }
    setState(() {
      _searchCollapsed = value.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rawQuery = _searchController.text.trim();
    final textQuery = _isZipCode(rawQuery) ? '' : rawQuery.toLowerCase();
    final filtered = widget.results.where((entry) {
      if (textQuery.isEmpty) {
        return true;
      }
      final tenant = entry.tenantName.toLowerCase();
      final chain = (entry.chainName ?? '').toLowerCase();
      return tenant.contains(textQuery) || chain.contains(textQuery);
    }).toList(growable: false);

    final favorites = filtered
        .where((entry) => widget.favoriteTenantIds.contains(entry.tenantId))
        .toList(growable: false);
    final others = filtered
        .where((entry) => !widget.favoriteTenantIds.contains(entry.tenantId))
        .toList(growable: false);

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _StartHeaderDelegate(
            minHeight: 96,
            maxHeight: 224,
            builder: (context, collapse) {
              return _StartHeaderContent(
                collapse: collapse,
                languageCode: widget.languageCode,
                loading: widget.loading,
                mode: _mode,
                userAddress: widget.userAddress,
                zipCode: widget.activeZipCode,
                searchController: _searchController,
                collapsedSearch: _searchCollapsed,
                onExpandSearch: () {
                  setState(() {
                    _searchCollapsed = false;
                  });
                },
                onSubmitSearch: _submitSearch,
                onModeChanged: (nextMode) {
                  setState(() {
                    _mode = nextMode;
                  });
                  widget.onSearchByZip(widget.activeZipCode, nextMode);
                },
              );
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
    required this.userAddress,
    required this.zipCode,
    required this.searchController,
    required this.collapsedSearch,
    required this.onExpandSearch,
    required this.onSubmitSearch,
    required this.onModeChanged,
  });

  final double collapse;
  final String languageCode;
  final bool loading;
  final DiscoveryMode mode;
  final String userAddress;
  final String zipCode;
  final TextEditingController searchController;
  final bool collapsedSearch;
  final VoidCallback onExpandSearch;
  final Future<void> Function() onSubmitSearch;
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
                  Container(
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
                      children: [
                        const Icon(Icons.location_on_rounded, color: Colors.white, size: 16),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            '$zipCode | $userAddress',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: lerpDouble(14, 12, collapse),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: lerpDouble(10, 6, collapse)),
            _SearchPanel(
              languageCode: languageCode,
              loading: loading,
              mode: mode,
              searchController: searchController,
              collapsed: collapsedSearch,
              compact: collapse > 0.5,
              onExpand: onExpandSearch,
              onSubmit: onSubmitSearch,
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
          ),
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
    required this.searchController,
    required this.collapsed,
    required this.compact,
    required this.onSubmit,
    required this.onExpand,
    required this.onModeChanged,
  });

  final String languageCode;
  final bool loading;
  final DiscoveryMode mode;
  final TextEditingController searchController;
  final bool collapsed;
  final bool compact;
  final Future<void> Function() onSubmit;
  final VoidCallback onExpand;
  final ValueChanged<DiscoveryMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    if (collapsed) {
      return InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onExpand,
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: compact ? 12 : 14, vertical: compact ? 10 : 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(color: const Color(0xFFEDEDED)),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 18, color: Color(0xFFFF5A1F)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  searchController.text.trim().isEmpty
                      ? _t(languageCode, 'home_search_hint')
                      : searchController.text.trim(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
              const Icon(Icons.expand_more, size: 18),
            ],
          ),
        ),
      );
    }

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
          TextField(
            controller: searchController,
            onSubmitted: (_) => onSubmit(),
            decoration: InputDecoration(
              hintText: _t(languageCode, 'home_search_hint'),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: compact ? 10 : 12,
                vertical: compact ? 10 : 12,
              ),
              prefixIcon: Icon(Icons.search, size: compact ? 20 : 22),
              suffixIcon: IconButton(
                onPressed: loading ? null : onSubmit,
                icon: const Icon(Icons.arrow_forward),
              ),
              filled: true,
              fillColor: const Color(0xFFF7F7F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StartHeaderDelegate extends SliverPersistentHeaderDelegate {
  _StartHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.builder,
  });

  final double minHeight;
  final double maxHeight;
  final Widget Function(BuildContext context, double collapse) builder;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final extentDelta = (maxExtent - minExtent).clamp(1, double.infinity);
    final collapse = (shrinkOffset / extentDelta).clamp(0.0, 1.0);
    return builder(context, collapse);
  }

  @override
  bool shouldRebuild(covariant _StartHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.builder != builder;
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
  });

  final TenantDiscoveryTenant item;
  final DiscoveryMode mode;
  final String languageCode;
  final bool isSelected;
  final bool isFavorite;
  final TenantRatingInfo? rating;
  final VoidCallback onToggleFavorite;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final serviceAvailable = mode == DiscoveryMode.delivery
        ? item.deliveryAvailable
        : item.pickupAvailable;
    final isOpen = serviceAvailable && item.orderingEnabled;
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
        color: Colors.white,
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
        onTap: isOpen ? onOpen : null,
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
                            _StatusTag(
                              label: _t(languageCode, 'delivery'),
                              active: item.deliveryAvailable,
                            ),
                            _StatusTag(
                              label: _t(languageCode, 'pickup'),
                              active: item.pickupAvailable,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (item.minOrderValue != null)
                          _MetaLine(
                            icon: Icons.shopping_bag_outlined,
                            text:
                                '${_t(languageCode, 'min_order')}: ${item.minOrderValue}',
                          ),
                        if (item.deliveryFeeNote != null)
                          _MetaLine(
                            icon: Icons.local_shipping_outlined,
                            text:
                                '${_t(languageCode, 'delivery_fee')}: ${item.deliveryFeeNote}',
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
                            onPressed: isOpen ? onOpen : null,
                            child: Text(
                              isOpen
                                  ? _t(languageCode, 'open_menu')
                                  : _t(languageCode, 'not_available'),
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
                    _t(languageCode, 'closed_overlay'),
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
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: active ? const Color(0xFFFFEFE8) : const Color(0xFFF3F4F6),
        border: Border.all(
          color: active ? const Color(0xFFFF5A1F) : const Color(0xFFD1D5DB),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: active ? const Color(0xFF9A3412) : const Color(0xFF6B7280),
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
    'favorites_nearby': 'Favoriten in deiner Nähe',
    'other_places': 'Weitere verfügbare Lokale',
    'new_rating': 'Neu',
    'min_order': 'Mindestbestellwert',
    'delivery_fee': 'Liefergebühr',
    'open_menu': 'Speisekarte',
    'not_available': 'Nicht verfügbar',
    'closed_overlay': 'Geschlossen / aktuell keine Bestellannahme möglich',
  };

  const en = {
    'home_subtitle': 'Order your favorites in just a few taps.',
    'delivery': 'Delivery',
    'pickup': 'Pickup',
    'home_search_hint': 'Search places or enter a new ZIP code',
    'favorites_nearby': 'Favorites near you',
    'other_places': 'More available places',
    'new_rating': 'New',
    'min_order': 'Minimum order',
    'delivery_fee': 'Delivery fee',
    'open_menu': 'Open menu',
    'not_available': 'Unavailable',
    'closed_overlay': 'Closed / no orders possible right now',
  };

  const tr = {
    'home_subtitle': 'Birkac tikla ile hizli siparis.',
    'delivery': 'Teslimat',
    'pickup': 'Gel al',
    'home_search_hint': 'Mekan ara veya yeni posta kodu gir',
    'favorites_nearby': 'Yakindaki favoriler',
    'other_places': 'Diger mekanlar',
    'new_rating': 'Yeni',
    'min_order': 'Minimum siparis',
    'delivery_fee': 'Teslimat ucreti',
    'open_menu': 'Menue',
    'not_available': 'Uygun degil',
    'closed_overlay': 'Kapali / su anda siparis alinmiyor',
  };

  if (languageCode == 'en') {
    return en[key] ?? de[key] ?? key;
  }
  if (languageCode == 'tr') {
    return tr[key] ?? de[key] ?? key;
  }
  return de[key] ?? key;
}
