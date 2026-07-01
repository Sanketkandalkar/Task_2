import 'package:flutter/material.dart';

class SentGiftCard extends StatelessWidget {
  const SentGiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 32), // Align before the avatar
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F5F2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text('🌹', style: TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Rose', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                        children: [
                          const Icon(Icons.monetization_on, color: Colors.amber, size: 14),
                          const SizedBox(width: 4),
                          Text('10 coins', style: TextStyle(color: const Color(0xFFE84C66).withValues(alpha: 0.8), fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F5F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('SENT', style: TextStyle(color: const Color(0xFFE84C66).withValues(alpha: 0.8), fontSize: 10, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '"A little something to brighten your day 🌹"',
              style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
