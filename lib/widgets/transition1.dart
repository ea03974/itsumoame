import 'package:flutter/material.dart';

class LogoBFadeRoute extends PageRoute<void> {
  final Widget nextPage;

  LogoBFadeRoute({required this.nextPage});

  @override
  Duration get transitionDuration =>
      const Duration(milliseconds: 2000);

  @override
  bool get opaque => true;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return nextPage;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final opacity = animation.value < 0.25
        // フェードイン
        ? animation.value / 0.25
        : animation.value < 0.75
            // 表示維持
            ? 1.0
            // フェードアウト
            : (1 - animation.value) / 0.25;

    return Stack(
      children: [
        // ===== 次画面（常に存在）=====
        child,

        // ===== 黒背景＋ロゴ =====
        if (animation.value < 1.0)
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black,
              child: Center(
                child: Opacity(
                  opacity: opacity.clamp(0.0, 1.0),
                  child: Image.asset(
                    'assets/effect/logo_b.webp',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
