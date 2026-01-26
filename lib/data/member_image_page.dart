import 'package:flutter/material.dart';
import '../../widgets/background_scaffold.dart';

/// =====================
/// 進化フェーズ
/// =====================
enum EvolutionPhase {
  before,
  evolving,
  after,
}

class MemberImagePage extends StatefulWidget {
  final String beforeImagePath; // normalImage
  final String afterImagePath;  // evolvedImage

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
    return BackgroundScaffold(
      body: GestureDetector(
        onTap: _onTap,
        child: SafeArea(
          child: Column(
            children: [
              /// 上余白（画像を少し上寄せ）
              const SizedBox(height: 24),

              /// =====================
              /// 画像表示エリア
              /// =====================
              Expanded(
                flex: 6,
                child: Center(
                  child: _buildContent(),
                ),
              ),

              /// =====================
              /// 説明エリア
              /// =====================
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topCenter,
                  // 今後：キャラ説明・ステータスなど
                ),
              ),
            ],
          ),
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
  /// 画像表示（アスペクト比固定・適正サイズ）
  /// =====================
  Widget _buildImage(String path) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.asset(
          path,
          fit: BoxFit.contain,
          width: constraints.maxWidth * 0.9,
          height: constraints.maxHeight * 0.9,
        );
      },
    );
  }
}
