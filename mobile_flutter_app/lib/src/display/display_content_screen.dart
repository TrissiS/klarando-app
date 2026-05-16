import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DisplayContentScreen extends StatefulWidget {
  const DisplayContentScreen({
    super.key,
    required this.content,
    required this.connectionMessage,
    this.debugLines = const <String>[],
  });

  final Map<String, dynamic> content;
  final String? connectionMessage;
  final List<String> debugLines;

  @override
  State<DisplayContentScreen> createState() => _DisplayContentScreenState();
}

class _DisplayContentScreenState extends State<DisplayContentScreen> {
  Timer? _pageTimer;
  int _pageIndex = 0;

  @override
  void dispose() {
    _pageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = (widget.content['screen'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final items =
        (widget.content['items'] as List?)?.cast<Map<String, dynamic>>() ?? const <Map<String, dynamic>>[];
    final products =
        (widget.content['products'] as List?)?.cast<Map<String, dynamic>>() ?? const <Map<String, dynamic>>[];
    final backgroundColor = _parseColor(screen['backgroundColor'] as String?) ?? const Color(0xFF111827);
    final menuRows = products
        .map((entry) => <String, String>{
              'name': '${entry['name'] ?? '-'}',
              'category': '${entry['categoryName'] ?? 'Weitere'}',
              'price': _formatPrice(entry['price']),
            })
        .toList(growable: false);

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final media = MediaQuery.of(context);
          final size = media.size;
          final isLandscape = size.width >= size.height;
          final horizontalPadding = constraints.maxWidth * 0.04;
          final verticalPadding = constraints.maxHeight * 0.04;
          final cardHeight = isLandscape
              ? (constraints.maxHeight * 0.18).clamp(92.0, 220.0)
              : (constraints.maxHeight * 0.13).clamp(82.0, 180.0);
          final gap = (constraints.maxHeight * 0.015).clamp(8.0, 20.0);
          final usableHeight = constraints.maxHeight - (verticalPadding * 2);
          final itemsPerPage = usableHeight <= 0
              ? 1
              : ((usableHeight + gap) / (cardHeight + gap)).floor().clamp(1, 10);
          final pages = _chunk(items, itemsPerPage);
          final safePageIndex = pages.isEmpty ? 0 : _pageIndex % pages.length;
          _syncPageTimer(pages.length);
          final scaleFactor = (constraints.maxWidth / 1920).clamp(0.72, 1.35);

          return Container(
            color: backgroundColor,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                    child: pages.isEmpty && menuRows.isEmpty
                        ? const Center(
                            child: Text(
                              'Keine Produkte für diesen Bildschirm freigegeben.',
                              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : menuRows.isNotEmpty
                            ? _MenuProductBoard(
                                rows: menuRows,
                                maxHeight: usableHeight,
                                maxWidth: constraints.maxWidth - (horizontalPadding * 2),
                              )
                            : Column(
                            children: <Widget>[
                              for (int i = 0; i < pages[safePageIndex].length; i++) ...<Widget>[
                                _ItemCard(
                                  item: pages[safePageIndex][i],
                                  scaleFactor: scaleFactor,
                                  fixedHeight: cardHeight,
                                ),
                                if (i < pages[safePageIndex].length - 1) SizedBox(height: gap),
                              ],
                            ],
                          ),
                  ),
                ),
                if (widget.connectionMessage != null)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.72),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        child: Text(
                          widget.connectionMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                if (pages.length > 1)
                  Positioned(
                    right: 16,
                    top: 16,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Text(
                          'Seite ${safePageIndex + 1}/${pages.length}',
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                if (kDebugMode)
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: widget.connectionMessage != null ? 64 : 12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Text(
                          'logical ${size.width.toStringAsFixed(0)}x${size.height.toStringAsFixed(0)} · '
                          'physical ${(size.width * media.devicePixelRatio).round()}x${(size.height * media.devicePixelRatio).round()} · '
                          'dpr ${media.devicePixelRatio.toStringAsFixed(2)} · '
                          '${isLandscape ? 'LANDSCAPE' : 'PORTRAIT'} · '
                          'scale ${scaleFactor.toStringAsFixed(2)} · '
                          'pro Seite $itemsPerPage'
                          '${widget.debugLines.isNotEmpty ? '\n${widget.debugLines.join(' | ')}' : ''}',
                          style: const TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatPrice(dynamic value) {
    final parsed = value is num ? value.toDouble() : double.tryParse('$value');
    if (parsed == null) return '-';
    return '${parsed.toStringAsFixed(2).replaceAll('.', ',')} €';
  }

  void _syncPageTimer(int pageCount) {
    _pageTimer?.cancel();
    if (pageCount <= 1) return;
    _pageTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!mounted) return;
      setState(() {
        _pageIndex = (_pageIndex + 1) % pageCount;
      });
    });
  }

  List<List<Map<String, dynamic>>> _chunk(List<Map<String, dynamic>> input, int size) {
    if (input.isEmpty) return const <List<Map<String, dynamic>>>[];
    final result = <List<Map<String, dynamic>>>[];
    for (int i = 0; i < input.length; i += size) {
      result.add(input.sublist(i, (i + size).clamp(0, input.length)));
    }
    return result;
  }

  Color? _parseColor(String? value) {
    if (value == null || value.isEmpty) return null;
    final normalized = value.replaceAll('#', '');
    if (normalized.length != 6) return null;
    final parsed = int.tryParse('FF$normalized', radix: 16);
    if (parsed == null) return null;
    return Color(parsed);
  }
}

class _MenuProductBoard extends StatelessWidget {
  const _MenuProductBoard({
    required this.rows,
    required this.maxHeight,
    required this.maxWidth,
  });

  final List<Map<String, String>> rows;
  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final isLandscape = maxWidth >= maxHeight;
    final columnCount = isLandscape ? 2 : 1;
    final rowHeight = isLandscape ? 74.0 : 68.0;
    final rowsPerColumn = (maxHeight / rowHeight).floor().clamp(1, 20);
    final maxRowsVisible = rowsPerColumn * columnCount;
    final visibleRows = rows.take(maxRowsVisible).toList(growable: false);
    final chunks = <List<Map<String, String>>>[];
    for (int i = 0; i < visibleRows.length; i += rowsPerColumn) {
      chunks.add(visibleRows.sublist(i, (i + rowsPerColumn).clamp(0, visibleRows.length)));
    }

    return Row(
      children: [
        for (int column = 0; column < chunks.length; column++) ...[
          Expanded(
            child: Column(
              children: [
                for (final row in chunks[column])
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.24),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      row['name'] ?? '-',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      row['category'] ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14, color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                row['price'] ?? '-',
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFFFBBF24),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (column < chunks.length - 1) const SizedBox(width: 10),
        ],
      ],
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    required this.item,
    required this.scaleFactor,
    required this.fixedHeight,
  });

  final Map<String, dynamic> item;
  final double scaleFactor;
  final double fixedHeight;

  @override
  Widget build(BuildContext context) {
    final config = (item['config'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    return SizedBox(
      height: fixedHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all((12 * scaleFactor).clamp(10, 18).toDouble()),
          child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${item['type'] ?? 'ITEM'}',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: (11 * scaleFactor).clamp(10, 15).toDouble(),
                    ),
                  ),
                  SizedBox(height: (4 * scaleFactor).clamp(2, 7).toDouble()),
                  Text(
                    '${config['title'] ?? config['name'] ?? 'Inhalt'}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (26 * scaleFactor).clamp(18, 34).toDouble(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (config['text'] != null) ...<Widget>[
                    SizedBox(height: (6 * scaleFactor).clamp(4, 10).toDouble()),
                    Text(
                      '${config['text']}',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: (16 * scaleFactor).clamp(12, 22).toDouble(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
