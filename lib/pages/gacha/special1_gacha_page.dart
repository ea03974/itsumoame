import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/members_master.dart';
import '../../data/user_characters.dart';
import '../../data/user_currency.dart';
import '../../data/team_acquire_master.dart';
import '../../data/acquire_type.dart';
import '../../widgets/background_scaffold.dart';

class Special1GachaPage extends StatefulWidget {
  const Special1GachaPage({super.key});

  @override
  State<Special1GachaPage> createState() => _Special1GachaPageState();
}

class _Special1GachaPageState extends State<Special1GachaPage> {
  Character? _gachaResult;
  final Random _random = Random();

  /// ===== 単発ガチャ消費コスト =====
  static const int singleGachaCost = 6;

  // 特別ガチャ①（Blue Blood）
  void _pullGacha() {
    if (membersMaster.isEmpty) return;

    final success = spendDiamonds(singleGachaCost);
    if (!success) {
      _showNotEnoughDiamondDialog();
      return;
    }

    /// ===== Blue Blood 専用抽選 =====
    final specialMembers = membersMaster.where((c) {
      final type = teamAcquireMap[c.team];
      return type == AcquireType.specialGacha1;
    }).toList();

    if (specialMembers.isEmpty) return;

    final randomIndex = _random.nextInt(specialMembers.length);
    final character = specialMembers[randomIndex];

    /// ===== 所持キャラ追加（重複は内部で無視）=====
    addCharacter(character);

    /// ★ 総戦力は user_characters 側で再計算
    recalculateTotalPower();

    setState(() {
      _gachaResult = character;
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black87,
        title: Text(
          '特別ガチャ結果',
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
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// ダイヤ不足ダイアログ
  void _showNotEnoughDiamondDialog() {
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
            onPressed: () => Navigator.pop(context),
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

    return BackgroundScaffold(
      backgroundImage: 'assets/bg/gacha_bg.webp',
      appBar: AppBar(
        title: Text(
          '特別ガチャ（Blue Blood）',
          style: baseGameTextStyle(fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
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
              '※ 実機テスト中（ダイヤ消費あり）',
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
    );
  }
}
