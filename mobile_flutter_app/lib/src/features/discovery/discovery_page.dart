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

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({
    required this.baseUrl,
    super.key,
  });

  final String baseUrl;

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final _api = const KlarandoApi();
  final _zipController = TextEditingController(text: '45127');
  final _streetController = TextEditingController();
  DiscoveryMode _mode = DiscoveryMode.all;
  bool _loading = false;
  String _message = 'Suche nach Filialen in deinem Liefer-/Abholgebiet.';
  List<TenantDiscoveryTenant> _results = const [];

  @override
  void dispose() {
    _zipController.dispose();
    _streetController.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    final zipCode = _zipController.text.trim();
    if (zipCode.length != 5) {
      setState(() {
        _message = 'Bitte eine 5-stellige PLZ eingeben.';
      });
      return;
    }

    setState(() {
      _loading = true;
      _message = '';
    });

    try {
      final rows = await _api.discoverTenants(
        baseUrl: widget.baseUrl,
        zipCode: zipCode,
        street: _streetController.text.trim(),
        mode: _mode,
      );

      for (final item in rows) {
        // ignore: avoid_print
        print('CUSTOMER_APP_DISCOVERY_RESPONSE {'
            'endpoint: /api/tenants/public/discovery, '
            'tenantId: ${item.tenantId}, '
            'deliveryAvailable: ${item.deliveryAvailable}, '
            'pickupAvailable: ${item.pickupAvailable}, '
            'strategy: ${item.deliveryStrategy}, '
            'polygonPoints: ${item.deliveryPolygonPoints}'
            '}');
      }

      setState(() {
        _results = rows;
        _message = rows.isEmpty
            ? 'Keine Filialen für diese PLZ gefunden.'
            : '${rows.length} Filialen gefunden.';
      });
    } on ApiException catch (error) {
      setState(() {
        _results = const [];
        _message = error.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filialsuche',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _zipController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'PLZ',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _streetController,
                  decoration: const InputDecoration(
                    labelText: 'Straße + Hausnummer (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<DiscoveryMode>(
                  value: _mode,
                  items: DiscoveryMode.values
                      .map(
                        (mode) => DropdownMenuItem(
                          value: mode,
                          child: Text(_modeLabel(mode)),
                        ),
                      )
                      .toList(growable: false),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _mode = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Service',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _loading ? null : _search,
                    child: Text(_loading ? 'Suche läuft...' : 'Filialen suchen'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            _message,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            itemCount: _results.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = _results[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.tenantName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (item.chainName != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          item.chainName!,
                          style: const TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _statusChip(
                            label: item.deliveryAvailable ? 'Lieferung aktiv' : 'Lieferung aus',
                            active: item.deliveryAvailable,
                          ),
                          _statusChip(
                            label: item.pickupAvailable ? 'Abholung aktiv' : 'Abholung aus',
                            active: item.pickupAvailable,
                          ),
                        ],
                      ),
                      if (item.minOrderValue != null || item.deliveryFeeNote != null) ...[
                        const SizedBox(height: 8),
                        if (item.minOrderValue != null)
                          Text('Mindestbestellwert: ${_formatMoneyLabel(item.minOrderValue)}'),
                        if (item.deliveryFeeNote != null)
                          Text('Liefergebühr: ${_formatMoneyLabel(item.deliveryFeeNote)}'),
                      ],
                      if (item.distanceKm != null) ...[
                        const SizedBox(height: 8),
                        Text('Entfernung: ${item.distanceKm!.toStringAsFixed(1)} km'),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

String _modeLabel(DiscoveryMode mode) {
  switch (mode) {
    case DiscoveryMode.all:
      return 'Lieferung + Abholung';
    case DiscoveryMode.delivery:
      return 'Nur Lieferung';
    case DiscoveryMode.pickup:
      return 'Nur Abholung';
  }
}

Widget _statusChip({required String label, required bool active}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: active ? const Color(0xFFECFDF3) : const Color(0xFFF5F5F5),
      border: Border.all(
        color: active ? const Color(0xFF10B981) : const Color(0xFF9CA3AF),
      ),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 12,
        color: active ? const Color(0xFF047857) : const Color(0xFF374151),
      ),
    ),
  );
}
