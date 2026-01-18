import 'package:flutter/material.dart';

/// =====================
/// 進化フェーズ
/// =====================
enum EvolutionPhase {
  before,   // 進化前
  evolving, // 進化演出
  after,    // 進化後
}

class MemberImagePage extends StatefulWidget {
  final String beforeImagePath;
  final String afterImagePath;

  const MemberImagePage({
    super.key,
    required this.beforeImagePath,
    required this.afterImagePath,
  });

  @override
  State<MemberImagePage> createState() => _MemberImagePageState();
}

class _MemberImagePageState extends State<MemberImagePage>
    with SingleTickerProviderStateMixin {
  EvolutionPhase _phase = EvolutionPhase.before;

  late AnimationController _controller;
  late Animation<double> _flashAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _flashAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// =====================
  /// タップ処理
  /// =====================
  Future<void> _onTap() async {
    if (_phase == EvolutionPhase.before) {
      setState(() => _phase = EvolutionPhase.evolving);

      await _controller.forward();

      if (!mounted) return;
      setState(() => _phase = EvolutionPhase.after);
    } else if (_phase == EvolutionPhase.after) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _onTap,
        child: Center(
          child: _buildContent(),
        ),
      ),
    );
  }

  /// =====================
  /// フェーズ別表示
  /// =====================
  Widget _buildContent() {
    switch (_phase) {
      case EvolutionPhase.before:
        return _buildImage(widget.beforeImagePath);

      case EvolutionPhase.evolving:
        return Stack(
          alignment: Alignment.center,
          children: [
            _buildImage(widget.beforeImagePath),
            FadeTransition(
              opacity: _flashAnim,
              child: Container(
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ],
        );

      case EvolutionPhase.after:
        return _buildImage(widget.afterImagePath);
    }
  }

  /// =====================
  /// 画像表示
  /// =====================
  Widget _buildImage(String path) {
    return InteractiveViewer(
      child: Image.asset(
        path,
        fit: BoxFit.contain,
      ),
    );
  }
}
