import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/members_master.dart';
import '../../data/user_characters.dart';
import '../../data/user_currency.dart';
import '../../data/team_acquire_master.dart';
import '../../data/acquire_type.dart';
import 'gacha_animation.dart'; // ← 演出Widgetをインポート

class SingleGachaPage extends StatefulWidget {
  const SingleGachaPage({super.key});

  @override
  State<SingleGachaPage> createState() => _SingleGachaPageState();
}

class _SingleGachaPageState extends State<SingleGachaPage> {
  Character? _gachaResult;
  final Random _random = Random();

  static const int singleGachaCost = 3;

  void _pullGacha() async {
    if (membersMaster.isEmpty) return;

    final success = spendDiamonds(singleGachaCost);
    if (!success) {
      if (!mounted) return;
      _showNotEnoughDiamondDialog();
      return;
    }

    if (!mounted) return;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const GachaAnimation(),
    );

    final normalGachaMembers = membersMaster.where((c) {
      final type = teamAcquireMap[c.team];
      return type == null || type == AcquireType.normalGacha;
    }).toList();

    if (normalGachaMembers.isEmpty) return;

    final randomIndex = _random.nextInt(normalGachaMembers.length);
    final character = normalGachaMembers[randomIndex];

    addCharacter(character);
    recalculateTotalPower();

    if (!mounted) return;
    setState(() {
      _gachaResult = character;
    });

    if (!mounted) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black87,
        title: Text(
          '単発ガチャ結果',
          style: GoogleFonts.orbitron(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (character.image != null)
              Image.asset(
                character.image!,
                height: 120,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 8),
            Text(
              '${character.name}（${character.role}）',
              style: GoogleFonts.orbitron(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              '戦力: ${character.power}',
              style: GoogleFonts.orbitron(color: Colors.yellowAccent),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (!mounted) return;
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showNotEnoughDiamondDialog() {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
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
            onPressed: () {
              if (!mounted) return;
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle baseGameTextStyle({
      required double fontSize,
      FontWeight fontWeight = FontWeight.w700,
      double letterSpacing = 1.0,
      Color color = Colors.white,
    }) {
      return GoogleFonts.orbitron(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: color,
        shadows: const [
          Shadow(offset: Offset(1, 0), color: Colors.black),
          Shadow(offset: Offset(-1, 0), color: Colors.black),
          Shadow(offset: Offset(0, 1), color: Colors.black),
          Shadow(offset: Offset(0, -1), color: Colors.black),
        ],
      );
    }

    final width = MediaQuery.of(context).size.width;
    final height =
        MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true, // ステータスバーまで背景描画
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('単発ガチャ', style: baseGameTextStyle(fontSize: 18)),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // 背景画像（ステータスバー込みで全画面）
          Image.asset(
            'assets/bg/gacha_bg.webp',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          // UI
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_gachaResult != null) ...[
                  if (_gachaResult!.image != null)
                    Image.asset(
                      _gachaResult!.image!,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 8),
                  Text(
                    _gachaResult!.name,
                    style: baseGameTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  Text(
                    '戦力: ${_gachaResult!.power}',
                    style: baseGameTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                const Text(
                  '消費ダイヤ：300',
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 14,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _pullGacha,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    'ガチャを引く',
                    style: baseGameTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
