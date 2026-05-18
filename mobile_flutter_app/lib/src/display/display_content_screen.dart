import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
  int _pageTick = 0;
  VideoPlayerController? _videoController;
  String? _videoUrl;

  @override
  void didUpdateWidget(covariant DisplayContentScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncBackgroundVideoIfNeeded();
  }

  @override
  void dispose() {
    _pageTimer?.cancel();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = (widget.content['screen'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final screenConfig =
        (widget.content['screenConfig'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final items =
        (widget.content['items'] as List?)?.cast<Map<String, dynamic>>() ?? const <Map<String, dynamic>>[];
    final products =
        (widget.content['products'] as List?)?.cast<Map<String, dynamic>>() ?? const <Map<String, dynamic>>[];
    final backgroundColor = _parseColor(screen['backgroundColor'] as String?) ?? const Color(0xFF111827);
    final accentColor = _parseColor(screen['accentColor'] as String?) ??
        _parseColor(screenConfig['accentColor'] as String?) ??
        const Color(0xFFFBBF24);
    final backgroundMode = '${screenConfig['backgroundMode'] ?? ''}'.toUpperCase();
    final backgroundValue = screenConfig['backgroundValue'] as String?;
    final backgroundMediaUrl = screenConfig['backgroundMediaUrl'] as String?;
    final showPrices = (screenConfig['showPrices'] as bool?) ?? true;
    final showCategory = (screenConfig['showCategoryOnCard'] as bool?) ?? true;
    final showCategoryHeaders = (screenConfig['showCategoryHeaders'] as bool?) ?? false;
    final showIngredients = (screenConfig['showAllergens'] as bool?) ?? true;
    final showLogo = ((screenConfig['logoUrl'] as String?) ?? '').trim().isNotEmpty;
    final logoUrl = (screenConfig['logoUrl'] as String?) ?? '';
    final logoSize = (((screenConfig['logoSize'] as num?)?.toDouble() ?? 120).clamp(60, 220)).toDouble();
    final fontFamily = (screenConfig['fontFamily'] as String?)?.trim();
    final cardPadding = (((screenConfig['cardPadding'] as num?)?.toDouble() ?? 16).clamp(8, 40)).toDouble();
    final productFontSize =
        (((screenConfig['productFontSize'] as num?)?.toDouble() ?? 24).clamp(14, 48)).toDouble();
    final categoryFontSize =
        (((screenConfig['categoryFontSize'] as num?)?.toDouble() ?? 14).clamp(10, 34)).toDouble();
    final priceFontSize =
        (((screenConfig['priceFontSize'] as num?)?.toDouble() ?? 24).clamp(12, 54)).toDouble();
    final ingredientFontSize =
        (((screenConfig['ingredientFontSize'] as num?)?.toDouble() ?? 14).clamp(10, 34)).toDouble();
    final ingredientTextColor = _parseColor(screenConfig['ingredientTextColor'] as String?) ?? Colors.white70;
    final cardStyle = '${screenConfig['cardStyle'] ?? 'SOFT'}'.toUpperCase();
    final enableAnimations = '${screenConfig['overlayAnimation'] ?? 'NONE'}'.toUpperCase() != 'NONE';
    final configuredColumns = (screenConfig['defaultColumnCount'] as num?)?.toInt();
    _syncBackgroundVideo(backgroundMediaUrl, backgroundMode);
    final menuRows = products
        .map((entry) => <String, String>{
              'name': '${entry['name'] ?? '-'}',
              'category': '${entry['categoryName'] ?? 'Weitere'}',
              'price': showPrices ? _formatPrice(entry['price']) : '',
              'ingredients': (entry['ingredients'] as List?)
                      ?.cast<Map<String, dynamic>>()
                      .map((ingredient) => '${ingredient['name'] ?? ''}'.trim())
                      .where((name) => name.isNotEmpty)
                      .take(4)
                      .join(', ') ??
                  '',
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
          final sync = (widget.content['sync'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
          final layout = (widget.content['layout'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
          final pageDurationSecRaw = (sync['pageDurationSec'] as num?)?.toInt() ?? 10;
          final pageDurationSec = pageDurationSecRaw.clamp(8, 18);
          final serverTimeMs = (sync['serverTimeMs'] as num?)?.toInt() ?? DateTime.now().millisecondsSinceEpoch;
          final displayIndex = (layout['displayIndex'] as num?)?.toInt() ?? 0;
          final nowMs = DateTime.now().millisecondsSinceEpoch;
          final elapsedSec = ((nowMs - serverTimeMs) ~/ 1000).clamp(0, 864000);
          final calculatedPageIndex = pages.isEmpty || pageDurationSec <= 0
              ? 0
              : ((elapsedSec ~/ pageDurationSec) + displayIndex) % pages.length;
          final safePageIndex = pages.isEmpty ? 0 : calculatedPageIndex;
          _syncPageTimer(pages.length);
          final scaleFactor = (constraints.maxWidth / 1920).clamp(0.72, 1.35);

          final hasPlaylistItems = pages.isNotEmpty;
          final currentItem =
              hasPlaylistItems ? pages[safePageIndex].isNotEmpty ? pages[safePageIndex][0] : null : null;
          final currentItemType = '${currentItem?['type'] ?? ''}'.toUpperCase();

          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              gradient: backgroundMode == 'COLOR' && (backgroundValue?.startsWith('linear-gradient') ?? false)
                  ? const LinearGradient(colors: [Color(0xFF111827), Color(0xFF1f2937)])
                  : null,
            ),
            child: Stack(
              children: <Widget>[
                if (_videoController != null && _videoController!.value.isInitialized)
                  Positioned.fill(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _videoController!.value.size.width,
                        height: _videoController!.value.size.height,
                        child: VideoPlayer(_videoController!),
                      ),
                    ),
                  ),
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
                        : hasPlaylistItems
                            ? (currentItemType == 'PRODUCT_GRID' || menuRows.isNotEmpty)
                                ? _MenuProductBoard(
                                    rows: menuRows,
                                    maxHeight: usableHeight,
                                    maxWidth: constraints.maxWidth - (horizontalPadding * 2),
                                    showCategory: showCategory,
                                    configuredColumns: configuredColumns,
                                    accentColor: accentColor,
                                    showPrices: showPrices,
                                    fontFamily: fontFamily,
                                    cardPadding: cardPadding,
                                    productFontSize: productFontSize,
                                    categoryFontSize: categoryFontSize,
                                    priceFontSize: priceFontSize,
                                    ingredientFontSize: ingredientFontSize,
                                    ingredientTextColor: ingredientTextColor,
                                    enableAnimations: enableAnimations,
                                    showIngredients: showIngredients,
                                    showCategoryHeaders: showCategoryHeaders,
                                    cardStyle: cardStyle,
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
                                  )
                            : _MenuProductBoard(
                                rows: menuRows,
                                maxHeight: usableHeight,
                                maxWidth: constraints.maxWidth - (horizontalPadding * 2),
                                showCategory: showCategory,
                                configuredColumns: configuredColumns,
                                accentColor: accentColor,
                                showPrices: showPrices,
                                fontFamily: fontFamily,
                                cardPadding: cardPadding,
                                productFontSize: productFontSize,
                                categoryFontSize: categoryFontSize,
                                priceFontSize: priceFontSize,
                                ingredientFontSize: ingredientFontSize,
                                ingredientTextColor: ingredientTextColor,
                                enableAnimations: enableAnimations,
                                showIngredients: showIngredients,
                                showCategoryHeaders: showCategoryHeaders,
                                cardStyle: cardStyle,
                              ),
                  ),
                ),
                if (showLogo)
                  Positioned(
                    left: 16,
                    top: 16,
                    child: SizedBox(
                      width: logoSize,
                      height: logoSize * 0.36,
                      child: Image.network(
                        logoUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
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
                // Runtime debug overlay stays hidden in live display mode.
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

  void _syncBackgroundVideoIfNeeded() {
    final screenConfig =
        (widget.content['screenConfig'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final mode = '${screenConfig['backgroundMode'] ?? ''}'.toUpperCase();
    final mediaUrl = screenConfig['backgroundMediaUrl'] as String?;
    _syncBackgroundVideo(mediaUrl, mode);
  }

  void _syncBackgroundVideo(String? mediaUrl, String backgroundMode) {
    final normalizedUrl = mediaUrl?.trim();
    final canUseVideo = backgroundMode == 'IMAGE' &&
        normalizedUrl != null &&
        normalizedUrl.isNotEmpty &&
        (normalizedUrl.toLowerCase().endsWith('.mp4') || normalizedUrl.toLowerCase().endsWith('.webm'));
    if (!canUseVideo) {
      if (_videoController != null) {
        _videoController!.dispose();
        _videoController = null;
        _videoUrl = null;
      }
      return;
    }
    if (_videoUrl == normalizedUrl && _videoController != null) return;
    _videoController?.dispose();
    _videoController = VideoPlayerController.networkUrl(Uri.parse(normalizedUrl!))
      ..setLooping(true)
      ..setVolume(0);
    _videoUrl = normalizedUrl;
    _videoController!.initialize().then((_) {
      if (!mounted) return;
      _videoController!.play();
      setState(() {});
    }).catchError((_) {
      // Keep static background if video cannot be loaded.
    });
  }

  void _syncPageTimer(int pageCount) {
    _pageTimer?.cancel();
    if (pageCount <= 1) return;
    _pageTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        _pageTick = (_pageTick + 1) % 1000000;
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
    required this.showCategory,
    required this.accentColor,
    required this.showPrices,
    required this.cardPadding,
    required this.productFontSize,
    required this.categoryFontSize,
    required this.priceFontSize,
    required this.ingredientFontSize,
    required this.ingredientTextColor,
    required this.enableAnimations,
    required this.showIngredients,
    required this.showCategoryHeaders,
    required this.cardStyle,
    this.configuredColumns,
    this.fontFamily,
  });

  final List<Map<String, String>> rows;
  final double maxHeight;
  final double maxWidth;
  final bool showCategory;
  final Color accentColor;
  final bool showPrices;
  final double cardPadding;
  final double productFontSize;
  final double categoryFontSize;
  final double priceFontSize;
  final double ingredientFontSize;
  final Color ingredientTextColor;
  final bool enableAnimations;
  final bool showIngredients;
  final bool showCategoryHeaders;
  final String cardStyle;
  final int? configuredColumns;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    final isLandscape = maxWidth >= maxHeight;
    final requestedColumns = configuredColumns != null && configuredColumns! > 0
        ? configuredColumns!.clamp(1, 5)
        : null;
    final columnCount = requestedColumns ?? (isLandscape ? 2 : 1);
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
                for (int rowIndex = 0; rowIndex < chunks[column].length; rowIndex++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: enableAnimations ? 0.96 : 1.0, end: 1.0),
                        duration: Duration(milliseconds: enableAnimations ? 420 : 1),
                        curve: Curves.easeOutCubic,
                        builder: (context, value, child) => Transform.scale(scale: value, child: child),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: cardStyle == 'NONE'
                                ? Colors.transparent
                                : cardStyle == 'GLASS'
                                    ? Colors.white.withOpacity(0.08)
                                    : Colors.black.withOpacity(0.24),
                            border: cardStyle == 'BORDER'
                                ? Border.all(color: accentColor.withOpacity(0.75))
                                : null,
                            borderRadius: cardStyle == 'NONE' ? BorderRadius.zero : BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: (cardPadding * 0.75).clamp(8, 22),
                              vertical: (cardPadding * 0.5).clamp(6, 16),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (showCategoryHeaders &&
                                          rowIndex > 0 &&
                                          chunks[column][rowIndex - 1]['category'] !=
                                              chunks[column][rowIndex]['category'])
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            chunks[column][rowIndex]['category'] ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: (categoryFontSize + 1).clamp(10, 40),
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: fontFamily,
                                            ),
                                          ),
                                        ),
                                      Text(
                                        chunks[column][rowIndex]['name'] ?? '-',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: productFontSize,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: fontFamily,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      if (showCategory)
                                        Text(
                                          chunks[column][rowIndex]['category'] ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: categoryFontSize,
                                            color: Colors.white70,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                      if (showIngredients &&
                                          (chunks[column][rowIndex]['ingredients'] ?? '').isNotEmpty)
                                        Text(
                                          chunks[column][rowIndex]['ingredients'] ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: ingredientFontSize,
                                            color: ingredientTextColor,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                if (showPrices &&
                                    (chunks[column][rowIndex]['price'] ?? '').isNotEmpty)
                                  Text(
                                    chunks[column][rowIndex]['price'] ?? '-',
                                    style: TextStyle(
                                      fontSize: priceFontSize,
                                      color: accentColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontFamily,
                                    ),
                                  ),
                              ],
                            ),
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
