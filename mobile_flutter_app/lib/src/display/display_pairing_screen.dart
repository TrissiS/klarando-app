import 'package:flutter/material.dart';

class DisplayPairingScreen extends StatelessWidget {
  const DisplayPairingScreen({
    super.key,
    required this.qrUrl,
    required this.pairingCode,
    required this.countdown,
    required this.status,
    this.debugLines = const <String>[],
    this.onRetry,
  });

  final String qrUrl;
  final String pairingCode;
  final String countdown;
  final String? status;
  final List<String> debugLines;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xFF4A0033), Color(0xFFD21277), Color(0xFFF97316), Color(0xFFFACC15)],
            stops: <double>[0.0, 0.34, 0.72, 1.0],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final media = MediaQuery.of(context);
              final size = media.size;
              final isLandscape = size.width >= size.height;
              final overscanPad = EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.04,
                vertical: constraints.maxHeight * 0.04,
              );
              final qrMax = (isLandscape
                      ? (constraints.maxHeight * 0.55)
                      : (constraints.maxWidth * 0.42 < constraints.maxHeight * 0.55
                          ? constraints.maxWidth * 0.42
                          : constraints.maxHeight * 0.55))
                  .clamp(220.0, 720.0);
              final logoWidth = (constraints.maxWidth * (isLandscape ? 0.32 : 0.56)).clamp(160.0, 520.0);
              final codeSize = (constraints.maxWidth * 0.03).clamp(22.0, 40.0);

              Widget infoBox = DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Auflösung: ${(size.width * media.devicePixelRatio).round()} × ${(size.height * media.devicePixelRatio).round()}',
                        style: const TextStyle(fontSize: 11, color: Colors.white70),
                      ),
                      Text(
                        'Skalierung: ${media.devicePixelRatio.toStringAsFixed(2)}x · ${isLandscape ? 'Querformat' : 'Hochformat'}',
                        style: const TextStyle(fontSize: 11, color: Colors.white70),
                      ),
                      for (final line in debugLines)
                        Text(line, style: const TextStyle(fontSize: 11, color: Colors.white70)),
                    ],
                  ),
                ),
              );

              final pairingMain = Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset('assets/klarando_logo_transparent.png', width: logoWidth, fit: BoxFit.contain),
                  SizedBox(height: (constraints.maxHeight * 0.015).clamp(8.0, 16.0)),
                  const Text(
                    'QR-Code mit Klarando OrderDesk scannen',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                  SizedBox(height: (constraints.maxHeight * 0.02).clamp(10.0, 18.0)),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 14,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SizedBox.square(
                        dimension: qrMax,
                        child: Image.network(qrUrl, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  SizedBox(height: (constraints.maxHeight * 0.015).clamp(8.0, 14.0)),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      pairingCode,
                      style: TextStyle(fontSize: codeSize, fontWeight: FontWeight.w800, letterSpacing: 4),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Code gültig: $countdown', style: const TextStyle(fontSize: 16, color: Colors.white)),
                  if (status != null) ...<Widget>[
                    const SizedBox(height: 6),
                    Text(status!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, color: Colors.white)),
                    if (onRetry != null) ...<Widget>[
                      const SizedBox(height: 6),
                      FilledButton.tonal(onPressed: onRetry, child: const Text('Erneut versuchen')),
                    ],
                  ],
                ],
              );

              return Padding(
                padding: overscanPad,
                child: isLandscape
                    ? Row(
                        children: <Widget>[
                          Expanded(child: Center(child: FittedBox(fit: BoxFit.contain, child: SizedBox(width: 980, height: 760, child: pairingMain)))),
                          const SizedBox(width: 12),
                          SizedBox(width: 280, child: infoBox),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(child: Center(child: FittedBox(fit: BoxFit.contain, child: SizedBox(width: 720, height: 980, child: pairingMain)))),
                          const SizedBox(height: 8),
                          infoBox,
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
