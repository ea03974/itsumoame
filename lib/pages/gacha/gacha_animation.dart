import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

enum GachaPhase {
  loading,
  door,
  cube,
  waitTap,
  result,
}

class GachaAnimation extends StatefulWidget {
  const GachaAnimation({super.key});

  @override
  State<GachaAnimation> createState() => _GachaAnimationState();
}

class _GachaAnimationState extends State<GachaAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _horizontalSlide1;
  late final Animation<double> _verticalSlide1;
  late final Animation<double> _horizontalSlide;
  late final Animation<double> _verticalSlide;

  GachaPhase _phase = GachaPhase.loading;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _verticalSlide = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _horizontalSlide = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    _verticalSlide1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.4, curve: Curves.easeOutCubic),
      ),
    );

    _horizontalSlide1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeOutCubic),
      ),
    );

    _startSequence();
  }

  Future<void> _startSequence() async {
    // ① Loading（3秒）
    await Future.delayed(const Duration(seconds: 3));

    // ② Door animation
    setState(() => _phase = GachaPhase.door);
    await _controller.forward().orCancel;

    // ③ Cube表示
    setState(() => _phase = GachaPhase.cube);
    await Future.delayed(const Duration(seconds: 2));

    // ④ TAP待ち
    setState(() => _phase = GachaPhase.waitTap);
  }

  void _onTapCube() {
    if (_phase != GachaPhase.waitTap) return;
    setState(() => _phase = GachaPhase.result);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height + MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _onTapCube,
        child: Stack(
          children: [
            /// ===== ① Loading =====
            if (_phase == GachaPhase.loading)
              const rive.RiveAnimation.asset(
                'assets/animations/gacha_loading.riv',
                fit: BoxFit.cover,
              ),

            /// ===== ② Door =====
            if (_phase == GachaPhase.door)
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return Stack(
                    children: [
                      _door('door_u', Offset(0, -height * _verticalSlide.value)),
                      _door('door_d', Offset(0, height * _verticalSlide.value)),
                      _door('door_l',
                          Offset(-size.width * _horizontalSlide.value, 0)),
                      _door('door_r',
                          Offset(size.width * _horizontalSlide.value, 0)),
                      _door('door_u',
                          Offset(0, -height * _verticalSlide1.value)),
                      _door('door_d',
                          Offset(0, height * _verticalSlide1.value)),
                      _door('door_l',
                          Offset(-size.width * _horizontalSlide1.value, 0)),
                      _door('door_r',
                          Offset(size.width * _horizontalSlide1.value, 0)),
                    ],
                  );
                },
              ),

            /// ===== ③ Cube / ④ TAP =====
            if (_phase == GachaPhase.cube ||
                _phase == GachaPhase.waitTap)
              Stack(
                alignment: Alignment.center,
                children: [
                  const rive.RiveAnimation.asset(
                    'assets/animations/blue_cube.riv',
                    fit: BoxFit.cover,
                  ),
                  if (_phase == GachaPhase.waitTap)
                    const Positioned(
                      bottom: 120,
                      child: Text(
                        'TAP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),

            /// ===== ⑤ Result =====
            if (_phase == GachaPhase.result)
              const rive.RiveAnimation.asset(
                'assets/animations/gacha_result.riv',
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }

  Widget _door(String name, Offset offset) {
    return Transform.translate(
      offset: offset,
      child: Image.asset(
        'assets/effect/$name.webp',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
