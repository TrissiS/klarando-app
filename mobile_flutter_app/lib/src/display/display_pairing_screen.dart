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
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFF4A0033),
              Color(0xFFD21277),
              Color(0xFFF97316),
              Color(0xFFFACC15),
            ],
            stops: <double>[0.0, 0.34, 0.72, 1.0],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.95, -0.85),
                    radius: 1.15,
                    colors: <Color>[
                      Colors.white.withOpacity(0.17),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size screenSize = MediaQuery.of(context).size;
                  final double pixelRatio = MediaQuery.of(context).devicePixelRatio;
                  final bool isLandscape = screenSize.width >= screenSize.height;
                  final bool showInfoAside = isLandscape && constraints.maxWidth >= 980;
                  final int physicalWidth = (screenSize.width * pixelRatio).round();
                  final int physicalHeight = (screenSize.height * pixelRatio).round();
                  final String orientationLabel = isLandscape ? 'Querformat' : 'Hochformat';
                  final double qrSizeByWidth = constraints.maxWidth * 0.52;
                  final double qrSizeByHeight = constraints.maxHeight * 0.42;
                  final double qrSize = qrSizeByWidth < qrSizeByHeight ? qrSizeByWidth : qrSizeByHeight;
                  final double finalQrSize = qrSize.clamp(220.0, 720.0);
                  final double logoWidth = (constraints.maxWidth * 0.5).clamp(180.0, 520.0);
                  final Widget infoBox = DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.28),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Display-Info',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Auflösung: $physicalWidth × $physicalHeight',
                            style: const TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          Text(
                            'Skalierung: ${pixelRatio.toStringAsFixed(2)}x',
                            style: const TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          Text(
                            'Modus: $orientationLabel',
                            style: const TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          if (debugLines.isNotEmpty) ...<Widget>[
                            const SizedBox(height: 8),
                            ...debugLines.map(
                              (String line) => Text(
                                line,
                                style: const TextStyle(fontSize: 11, color: Colors.white70),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/klarando_logo_transparent.png',
                                width: logoWidth,
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'QR-Code mit Klarando OrderDesk scannen',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              if (showInfoAside)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.25),
                                            blurRadius: 16,
                                            offset: const Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: SizedBox.square(
                                          dimension: finalQrSize,
                                          child: Image.network(qrUrl, fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    SizedBox(
                                      width: (constraints.maxWidth * 0.25).clamp(220.0, 320.0),
                                      child: infoBox,
                                    ),
                                  ],
                                )
                              else
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 16,
                                        offset: const Offset(0, 8),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox.square(
                                      dimension: finalQrSize,
                                      child: Image.network(qrUrl, fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                              if (!showInfoAside) ...<Widget>[
                                const SizedBox(height: 10),
                                infoBox,
                              ],
                              const SizedBox(height: 10),
                              Text(
                                pairingCode,
                                style: TextStyle(
                                  fontSize: constraints.maxWidth < 500 ? 28 : 40,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: constraints.maxWidth < 500 ? 3 : 6,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Code gültig: $countdown',
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              if (status != null) ...<Widget>[
                                const SizedBox(height: 8),
                                Text(
                                  status!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 14, color: Colors.white),
                                ),
                                if (onRetry != null) ...<Widget>[
                                  const SizedBox(height: 8),
                                  FilledButton.tonal(
                                    onPressed: onRetry,
                                    child: const Text('Erneut versuchen'),
                                  ),
                                ],
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
