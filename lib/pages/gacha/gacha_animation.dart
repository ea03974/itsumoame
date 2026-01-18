import 'package:flutter/material.dart';

class GachaAnimation extends StatefulWidget {
  const GachaAnimation({super.key});

  @override
  State<GachaAnimation> createState() => _GachaAnimationState();
}

class _GachaAnimationState extends State<GachaAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scanlineY;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scanlineY = Tween<double>(
      begin: -1.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // forward() の完了時に mounted チェックを追加
    _controller.forward().whenComplete(() {
      if (!mounted) return;
      // ここで setState や他の UI 更新処理を入れる場合に安全
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// ===== ガチャコア =====
            Image.asset(
              'assets/gacha/core.webp',
              width: 200,
            ),

            /// ===== スキャンライン =====
            AnimatedBuilder(
              animation: _scanlineY,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    _scanlineY.value * 150,
                  ),
                  child: child,
                );
              },
              child: Image.asset(
                'assets/gacha/scanline.webp',
                width: 260,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
