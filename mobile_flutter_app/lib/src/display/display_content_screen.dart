import 'package:flutter/material.dart';

class DisplayContentScreen extends StatelessWidget {
  const DisplayContentScreen({
    super.key,
    required this.content,
    required this.connectionMessage,
  });

  final Map<String, dynamic> content;
  final String? connectionMessage;

  @override
  Widget build(BuildContext context) {
    final screen = (content['screen'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
    final items = (content['items'] as List?)?.cast<Map<String, dynamic>>() ?? const <Map<String, dynamic>>[];
    final backgroundColor = _parseColor(screen['backgroundColor'] as String?) ?? const Color(0xFF111827);

    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Stack(
          children: [
            Positioned.fill(
              child: items.isEmpty
                  ? const Center(
                      child: Text(
                        'Display noch nicht eingerichtet',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(24),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final config = (item['config'] as Map<String, dynamic>?) ?? const <String, dynamic>{};
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${item['type'] ?? 'ITEM'}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                const SizedBox(height: 4),
                                Text('${config['title'] ?? config['name'] ?? 'Inhalt'}', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700)),
                                if (config['text'] != null) ...[
                                  const SizedBox(height: 6),
                                  Text('${config['text']}', style: const TextStyle(color: Colors.white70, fontSize: 18)),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            if (connectionMessage != null)
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.72), borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Text(connectionMessage!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
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
