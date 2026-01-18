import 'package:flutter/material.dart';
import 'pages/story/first_story_page.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  void _start(BuildContext context) {
    // ★ 今フェーズでは分岐しない
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const FirstStoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 背景（後で差し替え可）
          const Positioned.fill(
            child: ColoredBox(color: Colors.black),
          ),

          /// タイトルUI
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ITSUMOAME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                GestureDetector(
                  onTap: () => _start(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: const Text(
                      'START',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
