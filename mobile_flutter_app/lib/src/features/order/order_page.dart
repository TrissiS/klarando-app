import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../core/klarando_api.dart';

String _formatCurrency(double value) {
  final normalized = value.toStringAsFixed(2).replaceAll('.', ',');
  return '$normalized €';
}

class OrderPage extends StatefulWidget {
  const OrderPage({
    required this.tenant,
    required this.catalog,
    required this.loading,
    required this.message,
    required this.products,
    required this.onAddToCart,
    super.key,
  });

  final TenantDiscoveryTenant? tenant;
  final TenantCatalog? catalog;
  final bool loading;
  final String message;
  final List<TenantCatalogProduct> products;
  final void Function(
    TenantCatalogProduct product,
    List<TenantCatalogModifier> selectedModifiers,
  )
  onAddToCart;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _searchController = TextEditingController();
  String? _selectedCategory;
  bool _headerCompact = false;

  void _openLocalInfoSheet({
    String? title,
    String? text,
    String? address,
    String? phone,
    String? email,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        final infoTitle =
            (title?.trim().isNotEmpty ?? false) ? title!.trim() : 'Infos zum Lokal';
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    infoTitle,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  if (text != null && text.trim().isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(
                      text.trim(),
                      style: const TextStyle(fontSize: 14, height: 1.35),
                    ),
                  ],
                  if (address != null && address.trim().isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Adresse',
                      value: address.trim(),
                    ),
                  ],
                  if (phone != null && phone.trim().isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _InfoRow(
                      icon: Icons.phone_outlined,
                      label: 'Telefon',
                      value: phone.trim(),
                    ),
                  ],
                  if (email != null && email.trim().isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _InfoRow(
                      icon: Icons.alternate_email_rounded,
                      label: 'E-Mail',
                      value: email.trim(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tenant = widget.tenant;
    if (tenant == null) {
      return const Center(
        child: Text(
          'Wähle zuerst auf Start eine Filiale aus.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    final categories = widget.products
        .map((entry) => entry.categoryName)
        .whereType<String>()
        .toSet()
        .toList(growable: false)
      ..sort();

    final query = _searchController.text.trim().toLowerCase();
    final filtered = widget.products.where((product) {
      final inCategory = _selectedCategory == null || product.categoryName == _selectedCategory;
      if (!inCategory) {
        return false;
      }
      if (query.isEmpty) {
        return true;
      }
      final ingredients = product.ingredients.map((entry) => entry.name.toLowerCase()).join(' ');
      return product.name.toLowerCase().contains(query) || ingredients.contains(query);
    }).toList(growable: false);

    final catalog = widget.catalog;
    final logoUrl = catalog?.logoUrl ?? tenant.logoUrl;
    final titleImageUrl = catalog?.titleImageUrl ?? tenant.titleImageUrl;
    final localInfoTitle =
        (catalog?.localInfoTitle?.trim().isNotEmpty ?? false)
            ? catalog!.localInfoTitle
            : tenant.localInfoTitle;
    final localInfoText =
        (catalog?.localInfoText?.trim().isNotEmpty ?? false)
            ? catalog!.localInfoText
            : tenant.localInfoText;
    final contactPhone = catalog?.contactPhone ?? tenant.contactPhone;
    final contactEmail = catalog?.contactEmail ?? tenant.contactEmail;
    final addressLine = catalog?.addressLine ?? tenant.addressLine;
    final hasInfo = (localInfoTitle?.trim().isNotEmpty ?? false) ||
        (localInfoText?.trim().isNotEmpty ?? false) ||
        (contactPhone?.trim().isNotEmpty ?? false) ||
        (contactEmail?.trim().isNotEmpty ?? false) ||
        (addressLine?.trim().isNotEmpty ?? false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MenuHeader(
          tenantName: tenant.tenantName,
          logoUrl: logoUrl,
          titleImageUrl: titleImageUrl,
          compact: _headerCompact,
          hasInfo: hasInfo,
          onOpenInfo: hasInfo
              ? () => _openLocalInfoSheet(
                    title: localInfoTitle,
                    text: localInfoText,
                    address: addressLine,
                    phone: contactPhone,
                    email: contactEmail,
                  )
              : null,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _searchController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: 'Produkt oder Zutat suchen',
            prefixIcon: const Icon(Icons.search_rounded),
            filled: true,
            fillColor: Colors.white,
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
        if (categories.isNotEmpty) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length + 1,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ChoiceChip(
                    label: const Text('Alle'),
                    selected: _selectedCategory == null,
                    onSelected: (_) {
                      setState(() {
                        _selectedCategory = null;
                      });
                    },
                  );
                }
                final category = categories[index - 1];
                return ChoiceChip(
                  label: Text(category),
                  selected: _selectedCategory == category,
                  onSelected: (_) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                );
              },
            ),
          ),
        ],
        const SizedBox(height: 8),
        if (widget.loading)
          const Expanded(child: Center(child: CircularProgressIndicator()))
        else if (filtered.isEmpty)
          Expanded(
            child: Center(
              child: Text(
                widget.message.isEmpty ? 'Keine Produkte gefunden.' : widget.message,
                style: const TextStyle(color: Color(0xFF4B5563)),
              ),
            ),
          )
        else
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                final shouldCompact = notification.metrics.pixels > 24;
                if (shouldCompact != _headerCompact) {
                  setState(() {
                    _headerCompact = shouldCompact;
                  });
                }
                return false;
              },
              child: ListView.separated(
                itemCount: filtered.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final product = filtered[index];
                  return _ProductCard(
                    product: product,
                    onAddToCart: widget.onAddToCart,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

}

class _MenuHeader extends StatelessWidget {
  const _MenuHeader({
    required this.tenantName,
    required this.logoUrl,
    required this.titleImageUrl,
    required this.compact,
    required this.hasInfo,
    this.onOpenInfo,
  });

  final String tenantName;
  final String? logoUrl;
  final String? titleImageUrl;
  final bool compact;
  final bool hasInfo;
  final VoidCallback? onOpenInfo;

  @override
  Widget build(BuildContext context) {
    final titleImageHeight = compact ? 88.0 : 132.0;
    final logoSize = compact ? 34.0 : 40.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleImageUrl != null && titleImageUrl!.trim().isNotEmpty) ...[
          GestureDetector(
            onTap: hasInfo ? onOpenInfo : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                width: double.infinity,
                height: titleImageHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _RemoteOrAssetImage(
                      imageUrl: titleImageUrl,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0x99000000)],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: hasInfo ? 56 : 10,
                      bottom: 8,
                      child: Text(
                        tenantName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: compact ? 13 : 15,
                          shadows: const [
                            Shadow(
                              color: Color(0xAA000000),
                              offset: Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (hasInfo)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          tooltip: 'Infos zum Lokal',
                          onPressed: onOpenInfo,
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0x55000000),
                          ),
                          icon: const Icon(Icons.info_outline_rounded, color: Colors.white),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (titleImageUrl == null || titleImageUrl!.trim().isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: logoSize,
                  height: logoSize,
                  child: _RemoteOrAssetImage(imageUrl: logoUrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tenantName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFF111827),
                      fontWeight: FontWeight.w800,
                      fontSize: compact ? 15 : 16,
                    ),
                  ),
                ),
                if (hasInfo)
                  IconButton(
                    tooltip: 'Infos zum Lokal',
                    onPressed: onOpenInfo,
                    icon: const Icon(Icons.info_outline_rounded),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.onAddToCart,
  });

  final TenantCatalogProduct product;
  final void Function(
    TenantCatalogProduct product,
    List<TenantCatalogModifier> selectedModifiers,
  )
  onAddToCart;

  @override
  Widget build(BuildContext context) {
    final sizeCount = product.modifiers.where((entry) => entry.isSize).length;
    final optionCount = product.modifiers.length - sizeCount;
    final disclosure = _buildDisclosureData(product);
    final ingredientPreview = _ingredientPreview(product, disclosure);
    final articleDetails = _buildArticleDetails(product);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductName(product.name),
                  if (_productBadges(product).isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: _productBadges(product),
                    ),
                  ],
                  if (ingredientPreview != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      ingredientPreview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    _priceLabel(product),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  if (product.modifiers.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      sizeCount > 0
                          ? '$sizeCount Größen + $optionCount Optionen beim Hinzufügen auswählbar'
                          : 'Optionen beim Hinzufügen auswählbar',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                  if (disclosure.hasDetails) ...[
                    const SizedBox(height: 4),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: const EdgeInsets.only(bottom: 4),
                      title: const Text(
                        'Zutaten & Allergene',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      children: _buildDisclosureRows(disclosure),
                    ),
                  ],
                  if (articleDetails.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    ExpansionTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -2),
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: const EdgeInsets.only(bottom: 2),
                      title: const Text(
                        'Artikeldetails',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      children: articleDetails,
                    ),
                  ],
                  const SizedBox(height: 6),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5A1F),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                    onPressed: () async {
                      if (product.modifiers.isEmpty) {
                        onAddToCart(product, const []);
                        return;
                      }

                      final selected = await showDialog<List<TenantCatalogModifier>>(
                        context: context,
                        builder: (context) => _ModifierSelectionDialog(product: product),
                      );

                      if (selected == null) {
                        return;
                      }

                      onAddToCart(product, selected);
                    },
                    icon: const Icon(Icons.add_shopping_cart_rounded),
                    label: const Text('In den Warenkorb'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            _ProductImage(
              imageUrl: product.imageUrl,
              isBeverage: product.isBeverage,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({
    required this.imageUrl,
    required this.isBeverage,
  });

  final String? imageUrl;
  final bool isBeverage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: isBeverage ? 112 : 96,
        height: isBeverage ? 112 : 96,
        child: _RemoteOrAssetImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          showLogoFallback: false,
        ),
      ),
    );
  }
}

class _RemoteOrAssetImage extends StatelessWidget {
  const _RemoteOrAssetImage({
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.showLogoFallback = true,
  });

  final String? imageUrl;
  final BoxFit fit;
  final bool showLogoFallback;

  Widget _buildNeutralPlaceholder() {
    return Container(
      color: const Color(0xFFF3F4F6),
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.image_not_supported_outlined, color: Color(0xFF9CA3AF), size: 20),
          SizedBox(height: 4),
          Text(
            'Kein Bild vorhanden',
            style: TextStyle(fontSize: 10, color: Color(0xFF6B7280), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildFallback() {
    if (showLogoFallback) {
      return Image.asset('assets/klarando_icon.png', fit: fit);
    }
    return _buildNeutralPlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    final normalizedUrl = (imageUrl ?? '').trim();
    if (normalizedUrl.isEmpty) {
      return _buildFallback();
    }

    final inlineImage = _decodeInlineImageData(normalizedUrl);
    if (inlineImage != null) {
      return Image.memory(
        inlineImage,
        fit: fit,
        errorBuilder: (_, __, ___) => _buildFallback(),
      );
    }

    return Image.network(
      normalizedUrl,
      fit: fit,
      errorBuilder: (_, __, ___) => _buildFallback(),
    );
  }
}

Uint8List? _decodeInlineImageData(String value) {
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: const Color(0xFF6B7280)),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Color(0xFF111827)),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DisclosureData {
  const _DisclosureData({
    required this.ingredientLines,
    required this.containsAllergenCodes,
    required this.containsAdditiveCodes,
    required this.allergenLegend,
    required this.additiveLegend,
  });

  final List<_IngredientDisclosureLine> ingredientLines;
  final List<String> containsAllergenCodes;
  final List<String> containsAdditiveCodes;
  final Map<String, String> allergenLegend;
  final Map<String, String> additiveLegend;

  bool get hasDetails =>
      ingredientLines.isNotEmpty ||
      containsAllergenCodes.isNotEmpty ||
      containsAdditiveCodes.isNotEmpty ||
      allergenLegend.isNotEmpty ||
      additiveLegend.isNotEmpty;
}

_DisclosureData _buildDisclosureData(TenantCatalogProduct product) {
  final allergenLegend = <String, String>{};
  final additiveLegend = <String, String>{};

  List<String> resolveAllergenCodes(Iterable<String> rawValues) {
    final codes = <String>{};
    for (final raw in rawValues) {
      final resolved = _resolveAllergenDescriptor(raw);
      if (resolved == null) {
        continue;
      }
      codes.add(resolved.code);
      allergenLegend[resolved.code] = resolved.name;
    }
    final sorted = codes.toList(growable: false)..sort((a, b) => a.compareTo(b));
    return sorted;
  }

  List<String> resolveAdditiveCodes(Iterable<String> rawValues) {
    final codes = <String>{};
    for (final raw in rawValues) {
      final resolved = _resolveAdditiveDescriptor(raw);
      if (resolved == null) {
        continue;
      }
      codes.add(resolved.code);
      additiveLegend[resolved.code] = resolved.name;
    }
    final sorted = codes.toList(growable: false)
      ..sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    return sorted;
  }

  final ingredientLines = product.ingredients.map((entry) {
    final allergenCodes = resolveAllergenCodes(entry.allergens);
    return _IngredientDisclosureLine(
      name: entry.name,
      allergenCodes: allergenCodes,
      additiveCodes: const [],
    );
  }).toList(growable: false);

  final containsAllergenCodes = resolveAllergenCodes(product.allergens);
  final containsAdditiveCodes = resolveAdditiveCodes(product.additives);

  return _DisclosureData(
    ingredientLines: ingredientLines,
    containsAllergenCodes: containsAllergenCodes,
    containsAdditiveCodes: containsAdditiveCodes,
    allergenLegend: allergenLegend,
    additiveLegend: additiveLegend,
  );
}

Widget _buildProductName(String name) {
  return Text(
    name,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: Color(0xFF111827),
    ),
  );
}

List<Widget> _buildDisclosureRows(_DisclosureData disclosure) {
  final rows = <Widget>[];
  for (final line in disclosure.ingredientLines) {
    rows.add(_disclosureIngredientBullet(line));
  }
  if (disclosure.containsAllergenCodes.isNotEmpty) {
    rows.add(
      _disclosureBullet(
        'Enthält: ${disclosure.containsAllergenCodes.join(', ')}',
      ),
    );
  }
  if (disclosure.containsAdditiveCodes.isNotEmpty) {
    rows.add(
      _disclosureBullet(
        'Zusatzstoffe: ${disclosure.containsAdditiveCodes.join(', ')}',
      ),
    );
  }
  final allergenLegendEntries = disclosure.allergenLegend.entries.toList(growable: false)
    ..sort((a, b) => a.key.compareTo(b.key));
  final additiveLegendEntries = disclosure.additiveLegend.entries.toList(growable: false)
    ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));

  for (final entry in allergenLegendEntries) {
    rows.add(_disclosureLegendBullet('${entry.key} = ${entry.value}'));
  }
  for (final entry in additiveLegendEntries) {
    rows.add(_disclosureLegendBullet('${entry.key} = ${entry.value}'));
  }
  return rows;
}

Widget _disclosureIngredientBullet(_IngredientDisclosureLine line) {
  final suffix = [...line.allergenCodes, ...line.additiveCodes].join('');
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.fiber_manual_record, size: 10, color: Color(0xFF9CA3AF)),
        const SizedBox(width: 8),
        Expanded(child: _buildSuperscriptText(line.name, suffix)),
      ],
    ),
  );
}

Widget _disclosureLegendBullet(String label) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 18),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Color(0xFF4B5563),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _disclosureBullet(String label) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.fiber_manual_record, size: 10, color: Color(0xFF9CA3AF)),
        const SizedBox(width: 8),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 12))),
      ],
    ),
  );
}

String? _ingredientPreview(TenantCatalogProduct product, _DisclosureData disclosure) {
  if (disclosure.ingredientLines.isNotEmpty) {
    return disclosure.ingredientLines.map((entry) => entry.name).join(', ');
  }
  if (product.ingredients.isEmpty) {
    if (disclosure.containsAllergenCodes.isEmpty && disclosure.containsAdditiveCodes.isEmpty) {
      return null;
    }
    final parts = <String>[];
    if (disclosure.containsAllergenCodes.isNotEmpty) {
      parts.add('Enthält: ${disclosure.containsAllergenCodes.join(', ')}');
    }
    if (disclosure.containsAdditiveCodes.isNotEmpty) {
      parts.add('Zusatzstoffe: ${disclosure.containsAdditiveCodes.join(', ')}');
    }
    return parts.join(' • ');
  }
  return product.ingredients.map((entry) => entry.name).join(', ');
}

class _IngredientDisclosureLine {
  const _IngredientDisclosureLine({
    required this.name,
    required this.allergenCodes,
    required this.additiveCodes,
  });

  final String name;
  final List<String> allergenCodes;
  final List<String> additiveCodes;
}

class _AllergenDescriptor {
  const _AllergenDescriptor(this.code, this.name);
  final String code;
  final String name;
}

class _AdditiveDescriptor {
  const _AdditiveDescriptor(this.code, this.name);
  final String code;
  final String name;
}

Widget _buildSuperscriptText(String base, String suffix) {
  if (suffix.trim().isEmpty) {
    return Text(base, style: const TextStyle(fontSize: 12));
  }
  return RichText(
    text: TextSpan(
      text: base,
      style: const TextStyle(fontSize: 12, color: Color(0xFF111827)),
      children: [
        WidgetSpan(
          alignment: PlaceholderAlignment.top,
          child: Transform.translate(
            offset: const Offset(1, -3),
            child: Text(
              suffix,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: Color(0xFF374151),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

const Map<String, String> _allergenCodeNames = {
  'A': 'Glutenhaltiges Getreide',
  'B': 'Krebstiere',
  'C': 'Eier',
  'D': 'Fisch',
  'E': 'Erdnüsse',
  'F': 'Soja',
  'G': 'Milch',
  'H': 'Schalenfrüchte',
  'I': 'Sellerie',
  'J': 'Senf',
  'K': 'Sesam',
  'L': 'Schwefeldioxid und Sulfite',
  'M': 'Lupinen',
  'N': 'Weichtiere',
};

const Map<String, String> _additiveCodeNames = {
  '1': 'Farbstoff',
  '2': 'Konservierungsstoff',
  '3': 'Antioxidationsmittel',
  '4': 'Geschmacksverstärker',
  '5': 'Geschwefelt',
  '6': 'Geschwärzt',
  '7': 'Gewachst',
  '8': 'Phosphat',
  '9': 'Süßungsmittel',
  '10': 'Phenylalaninquelle',
};

_AllergenDescriptor? _resolveAllergenDescriptor(String raw) {
  final value = raw.trim();
  if (value.isEmpty) {
    return null;
  }
  final letterOnly = RegExp(r'^[A-Na-n]$');
  if (letterOnly.hasMatch(value)) {
    final code = value.toUpperCase();
    final name = _allergenCodeNames[code];
    if (name == null) {
      return null;
    }
    return _AllergenDescriptor(code, name);
  }

  final split = value.split(RegExp(r'[:=-]')).map((entry) => entry.trim()).where((entry) => entry.isNotEmpty).toList(growable: false);
  if (split.length >= 2 && letterOnly.hasMatch(split.first)) {
    final code = split.first.toUpperCase();
    final fallbackName = _allergenCodeNames[code];
    final name = split.sublist(1).join(' ');
    if (name.isNotEmpty) {
      return _AllergenDescriptor(code, name);
    }
    if (fallbackName != null) {
      return _AllergenDescriptor(code, fallbackName);
    }
  }

  final normalized = value.toLowerCase();
  for (final entry in _allergenCodeNames.entries) {
    if (normalized.contains(entry.value.toLowerCase())) {
      return _AllergenDescriptor(entry.key, entry.value);
    }
  }
  return null;
}

_AdditiveDescriptor? _resolveAdditiveDescriptor(String raw) {
  final value = raw.trim();
  if (value.isEmpty) {
    return null;
  }
  final matchNumber = RegExp(r'^(\d{1,2})').firstMatch(value);
  if (matchNumber != null) {
    final code = matchNumber.group(1)!;
    final fallbackName = _additiveCodeNames[code];
    final namePart = value.replaceFirst(RegExp(r'^\d{1,2}\s*[:=-]?\s*'), '').trim();
    if (namePart.isNotEmpty) {
      return _AdditiveDescriptor(code, namePart);
    }
    if (fallbackName != null) {
      return _AdditiveDescriptor(code, fallbackName);
    }
    return null;
  }

  final normalized = value.toLowerCase();
  for (final entry in _additiveCodeNames.entries) {
    if (normalized.contains(entry.value.toLowerCase())) {
      return _AdditiveDescriptor(entry.key, entry.value);
    }
  }
  return null;
}

List<Widget> _buildArticleDetails(TenantCatalogProduct product) {
  final rows = <Widget>[];

  void addRow(String label, String? value) {
    final normalized = value?.trim();
    if (normalized == null || normalized.isEmpty) {
      return;
    }
    rows.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.fiber_manual_record,
              size: 10,
              color: Color(0xFF9CA3AF),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '$label: $normalized',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addRow('Artikelinfo', product.articleInfo);
  addRow('Lebensmittelunternehmer', product.foodBusinessOperator);
  final nutrition = product.nutrition;
  if (nutrition != null && nutrition.hasValues) {
    final unitLabel = () {
      final unit = (nutrition.referenceUnit ?? '').trim().toLowerCase();
      if (unit == 'ml') return '100 ml';
      if (unit == 'portion') {
        final portion = nutrition.portionSize != null
            ? '${_formatNutrientValue(nutrition.portionSize!)} ${nutrition.portionUnit ?? ''}'.trim()
            : 'Portion';
        return portion;
      }
      return '100 g';
    }();

    rows.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Durchschnittliche Nährwerte pro $unitLabel',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            ..._buildNutritionLines(nutrition),
          ],
        ),
      ),
    );
  }
  addRow('Nährwertangaben', product.nutritionInfo);

  return rows;
}

List<Widget> _buildNutritionLines(TenantProductNutrition nutrition) {
  Widget line(String label, double? value, {String unit = 'g'}) {
    if (value == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text('$label: ${_formatNutrientValue(value)} $unit', style: const TextStyle(fontSize: 12)),
    );
  }

  final widgets = <Widget>[];
  if (nutrition.energyKj != null || nutrition.energyKcal != null) {
    widgets.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          'Energie: ${nutrition.energyKj != null ? '${_formatNutrientValue(nutrition.energyKj!)} kJ' : '-'}'
          '${nutrition.energyKcal != null ? ' / ${_formatNutrientValue(nutrition.energyKcal!)} kcal' : ''}',
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
  widgets.add(line('Fett', nutrition.fat));
  widgets.add(line('davon gesättigte Fettsäuren', nutrition.saturatedFat));
  widgets.add(line('Kohlenhydrate', nutrition.carbohydrates));
  widgets.add(line('davon Zucker', nutrition.sugar));
  widgets.add(line('Eiweiß', nutrition.protein));
  widgets.add(line('Salz', nutrition.salt));
  widgets.add(line('Ballaststoffe', nutrition.fiber));
  return widgets.where((widget) => widget is! SizedBox).toList(growable: false);
}

String _formatNutrientValue(double value) {
  final rounded = value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
  return rounded.replaceAll('.', ',');
}

String _priceLabel(TenantCatalogProduct product) {
  final basePrice = _formatCurrency(product.price);
  var base = basePrice;
  if (product.depositAmount > 0) {
    base = '$basePrice zzgl. ${_formatCurrency(product.depositAmount)} Pfand';
  }
  final containerLabel = _beverageContainerLabel(product);
  final literPrice = _literPriceLabel(product);
  if (containerLabel != null || literPrice != null) {
    final details = <String>[];
    if (containerLabel != null) {
      details.add(containerLabel.replaceAll('(', '').replaceAll(')', ''));
    }
    if (literPrice != null) {
      details.add(literPrice);
    }
    return '$base · (${details.join(', ')})';
  }
  return base;
}

String? _literPriceLabel(TenantCatalogProduct product) {
  final liters = product.unitSizeLiters;
  final looksLikeBeverage = product.isBeverage ||
      _beverageContainerLabel(product) != null ||
      product.depositAmount > 0;
  if (!looksLikeBeverage || liters == null || liters <= 0) {
    return null;
  }
  final literPrice = product.price / liters;
  return '${_formatCurrency(literPrice)}/l';
}

List<Widget> _productBadges(TenantCatalogProduct product) {
  final badges = <Widget>[];
  if (product.isVegan) {
    badges.add(_productBadge('Vegan', const Color(0xFF16A34A)));
  }
  if (product.isVegetarian) {
    badges.add(_productBadge('Vegetarisch', const Color(0xFF65A30D)));
  }
  if (product.isSpicy) {
    badges.add(_productBadge('Scharf', const Color(0xFFDC2626)));
  }
  if (product.ageRestriction == 18) {
    badges.add(_productBadge('+18', const Color(0xFF7F1D1D)));
  } else if (product.ageRestriction == 16) {
    badges.add(_productBadge('+16', const Color(0xFFB45309)));
  }
  return badges;
}

Widget _productBadge(String label, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(999),
      border: Border.all(color: color.withValues(alpha: 0.35)),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

String? _beverageContainerLabel(TenantCatalogProduct product) {
  final value = product.beverageContainerType.toUpperCase();
  if (value == 'EINWEG') {
    return '(EINWEG)';
  }
  if (value == 'MEHRWEG') {
    return '(MEHRWEG)';
  }
  return null;
}

class _ModifierSelectionDialog extends StatefulWidget {
  const _ModifierSelectionDialog({
    required this.product,
  });

  final TenantCatalogProduct product;

  @override
  State<_ModifierSelectionDialog> createState() => _ModifierSelectionDialogState();
}

class _ModifierGroupConfig {
  const _ModifierGroupConfig({
    required this.key,
    required this.label,
    required this.required,
    required this.modifiers,
  });

  final String key;
  final String label;
  final bool required;
  final List<TenantCatalogModifier> modifiers;
}

class _ModifierSelectionDialogState extends State<_ModifierSelectionDialog> {
  late final List<_ModifierGroupConfig> _modifierGroups;
  late final Map<String, String?> _selectedModifierIdByGroup;

  @override
  void initState() {
    super.initState();
    final sizeModifiers = widget.product.modifiers.where((entry) => entry.isSize).toList(growable: false);
    final groupedOptionModifiers = <String, List<TenantCatalogModifier>>{};
    final optionGroupLabels = <String, String>{};

    for (final modifier in widget.product.modifiers.where((entry) => !entry.isSize)) {
      final key = (modifier.ingredientId?.trim().isNotEmpty ?? false)
          ? modifier.ingredientId!.trim()
          : '__default';
      final label = (modifier.ingredientName?.trim().isNotEmpty ?? false)
          ? modifier.ingredientName!.trim()
          : 'Option';
      groupedOptionModifiers.putIfAbsent(key, () => <TenantCatalogModifier>[]).add(modifier);
      optionGroupLabels[key] = label;
    }

    final groups = <_ModifierGroupConfig>[];
    if (sizeModifiers.isNotEmpty) {
      groups.add(
        _ModifierGroupConfig(
          key: 'SIZE',
          label: 'Groesse',
          required: true,
          modifiers: sizeModifiers,
        ),
      );
    }

    groupedOptionModifiers.forEach((key, modifiers) {
      groups.add(
        _ModifierGroupConfig(
          key: 'OPTION:$key',
          label: optionGroupLabels[key] ?? 'Option',
          required: false,
          modifiers: modifiers,
        ),
      );
    });

    _modifierGroups = groups;
    _selectedModifierIdByGroup = <String, String?>{
      for (final group in _modifierGroups)
        group.key: (() {
          final defaultModifier = group.modifiers.cast<TenantCatalogModifier?>().firstWhere(
                (entry) => entry?.isDefaultSelected == true,
                orElse: () => null,
              );
          if (defaultModifier != null) {
            return defaultModifier.id;
          }
          if (group.required && group.modifiers.isNotEmpty) {
            return group.modifiers.first.id;
          }
          return null;
        })(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Optionen: ${widget.product.name}'),
      content: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_modifierGroups.isEmpty)
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Keine Zusatzoptionen verfügbar.'),
                ),
              ..._modifierGroups.map((group) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        group.required ? '${group.label} *' : group.label,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 4),
                    ...group.modifiers.map(
                      (modifier) => RadioListTile<String>(
                        value: modifier.id,
                        groupValue: _selectedModifierIdByGroup[group.key],
                        toggleable: !group.required,
                        contentPadding: EdgeInsets.zero,
                        title: Text(modifier.name),
                        subtitle: Text(
                          modifier.priceDelta >= 0
                              ? '+ ${_formatCurrency(modifier.priceDelta)}'
                              : '- ${_formatCurrency(modifier.priceDelta.abs())}',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedModifierIdByGroup[group.key] = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Abbrechen'),
        ),
        FilledButton(
          onPressed: () {
            final selected = <TenantCatalogModifier>[];
            for (final group in _modifierGroups) {
              var selectedId = _selectedModifierIdByGroup[group.key];
              if (selectedId == null && group.required && group.modifiers.isNotEmpty) {
                selectedId = group.modifiers.first.id;
              }
              if (selectedId == null) {
                continue;
              }
              final selectedModifier = group.modifiers.cast<TenantCatalogModifier?>().firstWhere(
                    (entry) => entry?.id == selectedId,
                    orElse: () => null,
                  );
              if (selectedModifier != null) {
                selected.add(selectedModifier);
              }
            }
            Navigator.of(context).pop(selected);
          },
          child: const Text('Hinzufuegen'),
        ),
      ],
    );
  }
}
