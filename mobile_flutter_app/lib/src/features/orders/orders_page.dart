import 'package:flutter/material.dart';

import '../../core/klarando_api.dart';

String _formatCurrency(double value) {
  final normalized = value.toStringAsFixed(2).replaceAll('.', ',');
  return '$normalized €';
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({
    required this.hasCartItems,
    required this.orders,
    required this.orderRatings,
    required this.onRateOrder,
    required this.onOpenOrder,
    super.key,
  });

  final bool hasCartItems;
  final List<PublicOrderSummary> orders;
  final Map<String, int> orderRatings;
  final Future<void> Function(String orderId, int stars) onRateOrder;
  final Future<void> Function(PublicOrderSummary order) onOpenOrder;

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFF4F4F5),
                  child: Icon(Icons.receipt_long, color: Color(0xFF52525B)),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Noch keine Bestellungen',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Sobald Bestellungen zu deinem Konto vorliegen, erscheinen sie hier sofort.',
                        style: TextStyle(color: Color(0xFF52525B)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (hasCartItems)
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'Du hast bereits Artikel im Warenkorb.',
                style: TextStyle(fontSize: 13, color: Color(0xFF52525B)),
              ),
            ),
        ],
      );
    }

    return ListView.separated(
      itemCount: orders.length + (hasCartItems ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        if (index >= orders.length) {
          return const Text(
            'Du hast bereits Artikel im Warenkorb.',
            style: TextStyle(fontSize: 13, color: Color(0xFF52525B)),
          );
        }

        final order = orders[index];
        return _OrderCard(
          order: order,
          currentStars: orderRatings[order.id],
          onRateOrder: onRateOrder,
          onOpenOrder: onOpenOrder,
        );
      },
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    required this.order,
    required this.currentStars,
    required this.onRateOrder,
    required this.onOpenOrder,
  });

  final PublicOrderSummary order;
  final int? currentStars;
  final Future<void> Function(String orderId, int stars) onRateOrder;
  final Future<void> Function(PublicOrderSummary order) onOpenOrder;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => onOpenOrder(order),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: _statusColor(order.status).withOpacity(0.12),
                  child: Icon(_statusIcon(order.status), color: _statusColor(order.status)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.tenantName ?? 'Filiale',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '#${_displayOrderNumber(order)} | ${_formatCurrency(order.total)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF52525B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _statusLabel(order.status),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: _statusColor(order.status),
                        ),
                      ),
                      if (order.status == 'out_for_delivery' &&
                          order.driverLocation != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Live-Standort: ${order.driverLocation!.latitude.toStringAsFixed(5)}, ${order.driverLocation!.longitude.toStringAsFixed(5)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF52525B),
                          ),
                        ),
                      ],
                      if (order.estimatedMinutes != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          'Voraussichtliche Zeit: ${order.estimatedMinutes} min',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF52525B),
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      _OrderRatingRow(
                        order: order,
                        currentStars: currentStars,
                        onRateOrder: onRateOrder,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Tippen für Details und erneut bestellen',
                        style: TextStyle(fontSize: 11, color: Color(0xFF71717A)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right_rounded, color: Color(0xFF6B7280)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OrderRatingRow extends StatelessWidget {
  const _OrderRatingRow({
    required this.order,
    required this.currentStars,
    required this.onRateOrder,
  });

  final PublicOrderSummary order;
  final int? currentStars;
  final Future<void> Function(String orderId, int stars) onRateOrder;

  @override
  Widget build(BuildContext context) {
    final availability = _resolveRatingAvailability(order, currentStars);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 2,
          runSpacing: 2,
          children: List.generate(5, (index) {
            final star = index + 1;
            final active = (currentStars ?? 0) >= star;
            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: availability.canRate ? () => onRateOrder(order.id, star) : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                child: Icon(
                  active ? Icons.star_rounded : Icons.star_border_rounded,
                  size: 20,
                  color: const Color(0xFFF59E0B),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 2),
        Text(
          availability.message,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF52525B),
          ),
        ),
      ],
    );
  }
}

class _RatingAvailability {
  const _RatingAvailability({
    required this.canRate,
    required this.message,
  });

  final bool canRate;
  final String message;
}

_RatingAvailability _resolveRatingAvailability(PublicOrderSummary order, int? currentStars) {
  if (currentStars != null) {
    return const _RatingAvailability(
      canRate: false,
      message: 'Bereits bewertet.',
    );
  }

  if (order.paymentStatus != 'PAID' || order.paidAt == null) {
    return const _RatingAvailability(
      canRate: false,
      message: 'Bewertung ist erst 1 Stunde nach Zahlung möglich.',
    );
  }

  final now = DateTime.now();
  final opensAt = order.paidAt!.add(const Duration(hours: 1));
  final closesAt = order.paidAt!.add(const Duration(hours: 24));

  if (now.isBefore(opensAt)) {
    return _RatingAvailability(
      canRate: false,
      message: 'Bewertung ab ${_formatDateTime(opensAt)} möglich.',
    );
  }

  if (now.isAfter(closesAt)) {
    return _RatingAvailability(
      canRate: false,
      message: 'Bewertungsfenster bis ${_formatDateTime(closesAt)} war aktiv.',
    );
  }

  return _RatingAvailability(
    canRate: true,
    message: 'Bewertung möglich bis ${_formatDateTime(closesAt)}.',
  );
}

String _formatDateTime(DateTime value) {
  final local = value.toLocal();
  final day = local.day.toString().padLeft(2, '0');
  final month = local.month.toString().padLeft(2, '0');
  final year = local.year.toString();
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  return '$day.$month.$year $hour:$minute';
}

Color _statusColor(String status) {
  switch (status) {
    case 'out_for_delivery':
      return const Color(0xFF7C3AED);
    case 'open':
      return const Color(0xFF2563EB);
    case 'preparing':
      return const Color(0xFFF97316);
    case 'done':
      return const Color(0xFF059669);
    case 'archived':
      return const Color(0xFF52525B);
    default:
      return const Color(0xFFDC2626);
  }
}

IconData _statusIcon(String status) {
  switch (status) {
    case 'pending_payment':
      return Icons.hourglass_top_rounded;
    case 'out_for_delivery':
      return Icons.delivery_dining_rounded;
    case 'open':
      return Icons.notifications_active_outlined;
    case 'preparing':
      return Icons.kitchen_outlined;
    case 'done':
      return Icons.check_circle_outline;
    case 'archived':
      return Icons.inventory_2_outlined;
    default:
      return Icons.receipt_long;
  }
}

String _statusLabel(String status) {
  switch (status) {
    case 'pending_payment':
      return 'Wartet auf Zahlung';
    case 'out_for_delivery':
      return 'Fahrer unterwegs';
    case 'open':
      return 'Offen';
    case 'preparing':
      return 'In Zubereitung';
    case 'done':
      return 'Fertig';
    case 'archived':
      return 'Erledigt';
    default:
      return 'In Bearbeitung';
  }
}

String _displayOrderNumber(PublicOrderSummary order) {
  final pickupNumber = order.pickupNumber;
  if (pickupNumber != null && pickupNumber > 0) {
    return pickupNumber.toString().padLeft(3, '0');
  }
  final id = order.id;
  final normalized = id.length >= 8 ? id.substring(0, 8) : id;
  return normalized.toUpperCase();
}
