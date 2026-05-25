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
  Timer? _debugAutoMinimizeTimer;
  int _pageTick = 0;
  VideoPlayerController? _videoController;
  String? _videoUrl;
  bool _debugExpanded = true;

  @override
  void initState() {
    super.initState();
    _scheduleDebugAutoMinimize();
  }

  @override
  void didUpdateWidget(covariant DisplayContentScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncBackgroundVideoIfNeeded();
    _scheduleDebugAutoMinimize();
  }

  @override
  void dispose() {
    _pageTimer?.cancel();
    _debugAutoMinimizeTimer?.cancel();
    _videoController?.dispose();
    super.dispose();
  }

  void _scheduleDebugAutoMinimize() {
    _debugAutoMinimizeTimer?.cancel();
    if (widget.debugLines.isEmpty) return;
    final manifestDebug = (widget.content['manifestDebug'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final debugAlways = manifestDebug['debugAlways'] as bool? ?? false;
    if (debugAlways) return;
    _debugAutoMinimizeTimer = Timer(const Duration(seconds: 10), () {
      if (!mounted) return;
      setState(() {
        _debugExpanded = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final manifestDebug = (widget.content['manifestDebug'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final debugAlways = manifestDebug['debugAlways'] as bool? ?? false;
    final debugEnabled = manifestDebug['debugEnabled'] as bool? ?? debugAlways;
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
    final showCategories = (screenConfig['showCategories'] as bool?) ?? true;
    final showCategory = showCategories && ((screenConfig['showCategoryOnCard'] as bool?) ?? true);
    final showCategoryHeaders = (screenConfig['showCategoryHeaders'] as bool?) ?? false;
    final showIngredients = (screenConfig['showIngredients'] as bool?) ?? (screenConfig['showAllergens'] as bool?) ?? true;
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
    final themePreset = '${screenConfig['themePreset'] ?? 'PREMIUM_DARK'}'.toUpperCase();
    final gradientFrom = _parseColor(screenConfig['gradientFrom'] as String?);
    final gradientTo = _parseColor(screenConfig['gradientTo'] as String?);
    final cardOpacity = ((screenConfig['cardOpacity'] as num?)?.toDouble() ?? 0.72).clamp(0.35, 1.0);

    Color accentResolved = accentColor;
    Color backgroundResolved = backgroundColor;
    Color? gradientStart = gradientFrom;
    Color? gradientEnd = gradientTo;

    if (themePreset == 'DOENER_NEON' || themePreset == 'NEON') {
      accentResolved = const Color(0xFF67E8F9);
      backgroundResolved = const Color(0xFF070b18);
      gradientStart ??= const Color(0xFF101426);
      gradientEnd ??= const Color(0xFF1a1f33);
    } else if (themePreset == 'FASTFOOD_MODERN') {
      accentResolved = const Color(0xFFF97316);
      backgroundResolved = const Color(0xFF111827);
      gradientStart ??= const Color(0xFF171f2d);
      gradientEnd ??= const Color(0xFF2a1f1a);
    } else if (themePreset == 'FINE_DINING') {
      accentResolved = const Color(0xFFE7C873);
      backgroundResolved = const Color(0xFF111111);
      gradientStart ??= const Color(0xFF151515);
      gradientEnd ??= const Color(0xFF26211d);
    } else if (themePreset == 'PIZZA_RUSTIC') {
      accentResolved = const Color(0xFFf59e0b);
      backgroundResolved = const Color(0xFF171312);
      gradientStart ??= const Color(0xFF201816);
      gradientEnd ??= const Color(0xFF2d221f);
    } else if (themePreset == 'BURGER_DARK') {
      accentResolved = const Color(0xFFf97316);
      backgroundResolved = const Color(0xFF121212);
      gradientStart ??= const Color(0xFF1b1b1b);
      gradientEnd ??= const Color(0xFF262626);
    } else if (themePreset == 'MINIMAL_WHITE') {
      accentResolved = const Color(0xFF1d4ed8);
      backgroundResolved = const Color(0xFFF8FAFC);
      gradientStart ??= const Color(0xFFFFFFFF);
      gradientEnd ??= const Color(0xFFE2E8F0);
    } else {
      gradientStart ??= const Color(0xFF0f172a);
      gradientEnd ??= const Color(0xFF1f2937);
    }
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
          final horizontalPadding = (constraints.maxWidth * 0.055).clamp(28.0, 110.0);
          final verticalPadding = (constraints.maxHeight * 0.055).clamp(24.0, 80.0);
          final cardHeight = isLandscape
              ? (constraints.maxHeight * 0.2).clamp(110.0, 280.0)
              : (constraints.maxHeight * 0.15).clamp(90.0, 230.0);
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
              color: backgroundResolved,
              gradient: (backgroundMode == 'GRADIENT' && gradientStart != null && gradientEnd != null)
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [gradientStart, gradientEnd],
                    )
                  : (backgroundMode == 'COLOR' && (backgroundValue?.startsWith('linear-gradient') ?? false)
                      ? LinearGradient(colors: [gradientStart!, gradientEnd!])
                      : null),
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
                                    accentColor: accentResolved,
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
                                    cardOpacity: cardOpacity,
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
                                accentColor: accentResolved,
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
                                cardOpacity: cardOpacity,
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
                if (debugEnabled && widget.debugLines.isNotEmpty)
                  Positioned(
                    right: 10,
                    top: 8,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: IgnorePointer(
                        ignoring: false,
                        child: GestureDetector(
                          onTap: () => setState(() => _debugExpanded = !_debugExpanded),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.62),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _debugExpanded ? 'DEBUG (tap)' : 'DEBUG',
                                    style: const TextStyle(
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                    ),
                                  ),
                                  if (_debugExpanded) ...[
                                    const SizedBox(height: 4),
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(maxHeight: 180),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (final line in widget.debugLines)
                                              Text(
                                                line,
                                                style: const TextStyle(color: Colors.white, fontSize: 10),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
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

  void _syncBackgroundVideoIfNeeded() {
    final screenConfig =
        (widget.content['screenConfig'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final mode = '${screenConfig['backgroundMode'] ?? ''}'.toUpperCase();
    final mediaUrl = screenConfig['backgroundMediaUrl'] as String?;
    _syncBackgroundVideo(mediaUrl, mode);
  }

  void _syncBackgroundVideo(String? mediaUrl, String backgroundMode) {
    final normalizedUrl = mediaUrl?.trim();
    final canUseVideo = (backgroundMode == 'IMAGE' || backgroundMode == 'VIDEO') &&
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
    required this.cardOpacity,
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
  final double cardOpacity;
  final int? configuredColumns;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    final isLandscape = maxWidth >= maxHeight;
    final requestedColumns = configuredColumns != null && configuredColumns! > 0
        ? configuredColumns!.clamp(1, 5)
        : null;
    final columnCount = requestedColumns ?? (isLandscape ? 3 : 2);
    final safeColumnCount = columnCount.clamp(1, 5);

    final showHeaderOnly = showCategoryHeaders && !showCategory;
    final flattened = <Map<String, String>>[];
    String? lastCategory;
    for (final row in rows) {
      final category = row['category'] ?? '';
      if (showHeaderOnly && category.isNotEmpty && category != lastCategory) {
        flattened.add(<String, String>{
          'type': 'header',
          'category': category,
        });
        lastCategory = category;
      }
      flattened.add(<String, String>{
        ...row,
        'type': 'product',
      });
    }

    final columns = List.generate(safeColumnCount, (_) => <Map<String, String>>[]);
    final columnWeights = List.generate(safeColumnCount, (_) => 0.0);
    for (final row in flattened) {
      final minIndex = columnWeights.indexOf(columnWeights.reduce((a, b) => a < b ? a : b));
      columns[minIndex].add(row);
      final type = row['type'] ?? 'product';
      final name = row['name'] ?? '';
      final ingredient = row['ingredients'] ?? '';
      final estimate = type == 'header'
          ? 0.95
          : 1.3 + (name.length > 28 ? 0.45 : 0) + (ingredient.isNotEmpty ? 0.25 : 0);
      columnWeights[minIndex] += estimate;
    }
    final nonEmptyColumns = columns.where((c) => c.isNotEmpty).toList(growable: false);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int column = 0; column < nonEmptyColumns.length; column++) ...[
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: nonEmptyColumns[column].length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final row = nonEmptyColumns[column][index];
                if ((row['type'] ?? '') == 'header') {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 4),
                    child: Text(
                      row['category'] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ((categoryFontSize + 3).clamp(12, 34)).toDouble(),
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w800,
                        fontFamily: fontFamily,
                      ),
                    ),
                  );
                }

                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: enableAnimations ? 0.98 : 1.0, end: 1.0),
                  duration: Duration(milliseconds: enableAnimations ? 350 : 1),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, child) => Transform.scale(scale: value, child: child),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: cardStyle == 'NONE'
                          ? Colors.transparent
                          : cardStyle == 'GLASS'
                              ? Colors.white.withOpacity((cardOpacity * 0.22).clamp(0.08, 0.32))
                              : Colors.black.withOpacity((cardOpacity * 0.4).clamp(0.18, 0.48)),
                      border: cardStyle == 'BORDER'
                          ? Border.all(color: accentColor.withOpacity(0.75))
                          : null,
                      boxShadow: cardStyle == 'NONE'
                          ? null
                          : [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.24),
                                blurRadius: 18,
                                offset: const Offset(0, 7),
                              ),
                            ],
                      borderRadius: cardStyle == 'NONE' ? BorderRadius.zero : BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: (cardPadding * 0.75).clamp(10, 24),
                        vertical: (cardPadding * 0.58).clamp(8, 18),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  row['name'] ?? '-',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ((productFontSize * 0.88).clamp(16, 44)).toDouble(),
                                    height: 1.15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: fontFamily,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                if (showCategory)
                                  Text(
                                    row['category'] ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: (categoryFontSize.clamp(10, 28)).toDouble(),
                                      color: Colors.white70,
                                      fontFamily: fontFamily,
                                    ),
                                  ),
                                if (showIngredients && (row['ingredients'] ?? '').isNotEmpty)
                                  Text(
                                    row['ingredients'] ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: (ingredientFontSize.clamp(10, 18)).toDouble(),
                                      color: ingredientTextColor,
                                      fontFamily: fontFamily,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),
                          if (showPrices && (row['price'] ?? '').isNotEmpty)
                            SizedBox(
                              width: 140,
                              child: Text(
                                row['price'] ?? '-',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: ((priceFontSize * 0.8).clamp(14, 38)).toDouble(),
                                  color: accentColor.withOpacity(0.95),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: fontFamily,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (column < nonEmptyColumns.length - 1) const SizedBox(width: 10),
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
