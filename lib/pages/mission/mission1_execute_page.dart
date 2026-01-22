import 'dart:math';
import 'package:flutter/material.dart';

import '/data/user_currency.dart';
import '/ads/reward_ad_manager.dart';

class Mission1ExecutePage extends StatefulWidget {
  const Mission1ExecutePage({super.key});

  @override
  State<Mission1ExecutePage> createState() => _Mission1ExecutePageState();
}

class _Mission1ExecutePageState extends State<Mission1ExecutePage> {
  int _winCount = 0;
  int _battleCount = 0;
  int _enemyLife = 3;

  /// 勝率（初期50%）
  double _winRate = 0.5;

  /// ★ 広告使用済みフラグ（1ミッション1回）
  bool _adUsed = false;

  final Random _random = Random();

  // =======================
  // 広告タップ処理
  // =======================
  void _onTapRewardAd() {
    if (_adUsed) return;

    RewardAdManager.instance.show(
      onRewarded: () {
        setState(() {
          _adUsed = true;
          _winRate += 0.1;
          if (_winRate > 0.9) _winRate = 0.9;
        });
        _showMessage('勝率が上昇しました');
      },
      onNotReady: () {
        _showMessage('広告を読み込み中です');
      },
    );
  }

  // =======================
  // ジャンケン処理
  // =======================
  void _playJanken(int playerHand) {
    if (_battleCount >= 5 || _winCount >= 3) return;

    final bool isWin = _random.nextDouble() < _winRate;

    setState(() {
      _battleCount++;
      if (isWin) {
        _winCount++;
        _enemyLife = 3 - _winCount;
      }
    });

    if (_winCount >= 3) {
      _showResultDialog(true);
    } else if (_battleCount >= 5) {
      _showResultDialog(false);
    }
  }

  // =======================
  // 結果ダイアログ
  // =======================
  void _showResultDialog(bool isSuccess) {
    if (isSuccess) {
      addDiamonds(50);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            isSuccess ? 'ミッション成功！' : 'ミッション失敗',
            style: TextStyle(
              color: isSuccess ? Colors.greenAccent : Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            isSuccess ? 'ダイヤ ×50 を獲得しました' : 'また挑戦してください',
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                '戻る',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.black,
      ),
    );
  }

  // =======================
  // UI
  // =======================
  @override
  Widget build(BuildContext context) {
    final bool isAdReady = RewardAdManager.instance.isReady;
    final bool canWatchAd = isAdReady && !_adUsed;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 8),

            Image.asset(
              'assets/enemy/enemy1.webp',
              height: 160,
            ),

            const SizedBox(height: 12),

            /// =======================
            /// 成功率UP（広告）
            /// =======================
            GestureDetector(
              onTap: canWatchAd ? _onTapRewardAd : null,
              child: Opacity(
                opacity: canWatchAd ? 1.0 : 0.5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    _adUsed
                        ? '広告は使用済みです'
                        : isAdReady
                            ? '広告を観て成功率UP ${(_winRate * 100).toInt()}%'
                            : '広告を読み込み中...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: LinearProgressIndicator(
                value: _enemyLife / 3,
                backgroundColor: Colors.white24,
                color: Colors.redAccent,
                minHeight: 10,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '勝利 $_winCount / 3　｜　戦闘 $_battleCount / 5',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _HandButton(label: 'グー', onTap: () => _playJanken(0)),
                  _HandButton(label: 'チョキ', onTap: () => _playJanken(1)),
                  _HandButton(label: 'パー', onTap: () => _playJanken(2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// 手ボタン
/// =======================
class _HandButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _HandButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
