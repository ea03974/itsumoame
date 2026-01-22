import 'dart:math';
import 'package:flutter/material.dart';

import '../../data/user_characters.dart';
import '../../data/user_currency.dart';
import '../../data/members_master.dart';
import '../../data/team_acquire_master.dart';
import '../../data/acquire_type.dart';

class TenGachaPage extends StatefulWidget {
  const TenGachaPage({super.key});

  @override
  State<TenGachaPage> createState() => _TenGachaPageState();
}

class _TenGachaPageState extends State<TenGachaPage> {
  final Random _random = Random();

  /// ===== 10連ガチャ消費コスト =====
  static const int tenGachaCost = 30;

  /// ガチャ結果（空＝未実行）
  List<Character> _results = [];

  /// 10連ガチャ実行
  void _drawTen() {
    if (membersMaster.isEmpty) return;

    final success = spendDiamonds(tenGachaCost);
    if (!success) {
      _showNotEnoughDiamondDialog();
      return;
    }

    /// ===== ノーマルガチャ対象のみ抽選 =====
    final normalGachaMembers = membersMaster.where((c) {
      final type = teamAcquireMap[c.team];
      return type == null || type == AcquireType.normalGacha;
    }).toList();

    if (normalGachaMembers.isEmpty) return;

    final drawn = List.generate(10, (_) {
      final index = _random.nextInt(normalGachaMembers.length);
      return normalGachaMembers[index];
    });

    /// ===== 所持キャラ追加（重複は内部で無視）=====
    for (final c in drawn) {
      addCharacter(c);
    }

    /// ★ 総戦力は必ず再計算
    recalculateTotalPower();

    setState(() {
      _results = drawn;
    });
  }

  /// 結果画面を閉じる
  void _closeResult() {
    setState(() {
      _results = [];
    });
  }

  /// ダイヤ不足ダイアログ
  void _showNotEnoughDiamondDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'ダイヤ不足',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'ダイヤが不足しています。',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isResult = _results.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.black,

      /// ===== ガチャ前のみ AppBar =====
      appBar: isResult
          ? null
          : AppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                '10連ガチャ',
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, true),
              ),
            ),

      body: SafeArea(
        child: isResult ? _buildResultView() : _buildBeforeDraw(),
      ),
    );
  }

  /* =====================
     ガチャ前UI
  ===================== */
  Widget _buildBeforeDraw() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          child: const Text(
            '※ ガチャ演出は省略されています',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 16),

        const Text(
          '消費ダイヤ：3000',
          style: TextStyle(
            color: Colors.cyanAccent,
            fontSize: 14,
            letterSpacing: 1.5,
          ),
        ),

        const SizedBox(height: 24),

        GestureDetector(
          onTap: _drawTen,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: const Text(
              '10連を引く',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /* =====================
     ガチャ結果画面
  ===================== */
  Widget _buildResultView() {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'ガチャ結果',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _results.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final c = _results[index];

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: c.image != null
                          ? Image.asset(c.image!, fit: BoxFit.cover)
                          : const SizedBox(),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      c.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '戦力 ${c.power}',
                      style: const TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: _closeResult,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 64,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
