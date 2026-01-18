import 'package:flutter/material.dart';
import 'ten_gacha_page.dart';
import 'single_gacha_page.dart';
import 'special1_gacha_page.dart'; // ★追加

class GachaPage extends StatelessWidget {
  const GachaPage({super.key});

  void _drawSingle(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SingleGachaPage()),
    );
  }

  void _drawTen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TenGachaPage()),
    );
  }

  void _drawBlueBlood(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Special1GachaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('GACHA'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg/bg2.webp',
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'ガチャを引く',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                _GachaButton(
                  label: '1回ガチャ',
                  onTap: () => _drawSingle(context),
                ),
                const SizedBox(height: 16),

                _GachaButton(
                  label: '10連ガチャ',
                  onTap: () => _drawTen(context),
                ),
                const SizedBox(height: 24),

                /// ★ Blue Blood 特別ガチャ
                _GachaButton(
                  label: '特別ガチャ（Blue Blood）',
                  onTap: () => _drawBlueBlood(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GachaButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _GachaButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/button/button1.webp',
            width: 260,
            height: 72,
            fit: BoxFit.contain,
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                  blurRadius: 6,
                  color: Colors.black,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
