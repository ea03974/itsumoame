import 'package:flutter/material.dart';

class GachaAnimation extends StatefulWidget {
  const GachaAnimation({super.key});

  @override
  State<GachaAnimation> createState() => _GachaAnimationState();
}

class _GachaAnimationState extends State<GachaAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // 左右スライド（第1層）
  late final Animation<double> _horizontalSlide1;

  // 上下スライド（第2層）
  late final Animation<double> _verticalSlide1;

  // 左右スライド（第3層）
  late final Animation<double> _horizontalSlide;

  // 上下スライド（第4層）
  late final Animation<double> _verticalSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // ===== 上下ドア（第4層） =====
    _verticalSlide = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic)),
    );

    // ===== 左右ドア（第3層） =====
    _horizontalSlide = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.4, 0.6, curve: Curves.easeOutCubic)),
    );

    // ===== 上下ドア（第2層） =====
    _verticalSlide1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.4, curve: Curves.easeOutCubic)),
    );

    // ===== 左右ドア（第1層） =====
    _horizontalSlide1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.2, curve: Curves.easeOutCubic)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // ここでステータスバー分も加えて全画面高さに
    final height =
        MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar:
          true, // ←これでステータスバー部分も描画可能
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Stack(
            children: [
              // ===== 上下ドア（4） =====
              Transform.translate(
                offset: Offset(0, -height * _verticalSlide.value),
                child: Image.asset(
                  'assets/effect/door_u.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),
              Transform.translate(
                offset: Offset(0, height * _verticalSlide.value),
                child: Image.asset(
                  'assets/effect/door_d.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),

              // ===== 左右ドア（3） =====
              Transform.translate(
                offset: Offset(-width * _horizontalSlide.value, 0),
                child: Image.asset(
                  'assets/effect/door_l.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),
              Transform.translate(
                offset: Offset(width * _horizontalSlide.value, 0),
                child: Image.asset(
                  'assets/effect/door_r.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),

              // ===== 上下ドア（2） =====
              Transform.translate(
                offset: Offset(0, -height * _verticalSlide1.value),
                child: Image.asset(
                  'assets/effect/door_u.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),
              Transform.translate(
                offset: Offset(0, height * _verticalSlide1.value),
                child: Image.asset(
                  'assets/effect/door_d.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),

              // ===== 左右ドア（1） =====
              Transform.translate(
                offset: Offset(-width * _horizontalSlide1.value, 0),
                child: Image.asset(
                  'assets/effect/door_l.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),
              Transform.translate(
                offset: Offset(width * _horizontalSlide1.value, 0),
                child: Image.asset(
                  'assets/effect/door_r.webp',
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
