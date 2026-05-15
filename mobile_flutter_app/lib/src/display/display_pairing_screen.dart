import 'package:flutter/material.dart';

class DisplayPairingScreen extends StatelessWidget {
  const DisplayPairingScreen({
    super.key,
    required this.qrUrl,
    required this.pairingCode,
    required this.countdown,
    required this.status,
  });

  final String qrUrl;
  final String pairingCode;
  final String countdown;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 980),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Display verbinden',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Scanne diesen QR-Code im Klarando Adminbereich.',
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 640, maxHeight: 640),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(22),
                              child: Container(
                                color: Colors.white,
                                child: Image.network(qrUrl, fit: BoxFit.contain),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    pairingCode,
                    style: const TextStyle(fontSize: 52, fontWeight: FontWeight.w800, letterSpacing: 8),
                  ),
                  const SizedBox(height: 8),
                  Text('Gültig: $countdown', style: const TextStyle(fontSize: 20, color: Colors.white70)),
                  if (status != null) ...[
                    const SizedBox(height: 10),
                    Text(status!, style: const TextStyle(fontSize: 14, color: Colors.white70)),
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
