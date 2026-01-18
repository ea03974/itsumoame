import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

import 'user_characters.dart';
import 'members_master.dart';
import '../pages/gacha/gacha_globals.dart';

class SaveManager {
  /// =========================
  /// ロード（アプリ起動時に1回）
  /// =========================
  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    /// ---- ダイヤ ----
    diamondNotifier.value = prefs.getInt('diamonds') ?? 3000;

    /// ---- 所持キャラ ----
    final List<String> characterIds =
        prefs.getStringList('userCharacters') ?? [];

    userCharacters.clear();

    for (final id in characterIds) {
      try {
        final character = membersMaster.firstWhere((c) => c.id == id);
        userCharacters.add(character);
      } catch (e) {
        debugPrint('⚠ 不明なキャラIDをスキップ: $id');
      }
    }

    /// ---- 総戦力再計算 ----
    int total = 0;
    for (final c in userCharacters) {
      total += c.power;
    }
    totalPowerNotifier.value = total;
  }

  /// =========================
  /// セーブ（変更時に呼ぶ）
  /// =========================
  static Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    /// ---- ダイヤ ----
    await prefs.setInt('diamonds', diamondNotifier.value);

    /// ---- 所持キャラ ----
    await prefs.setStringList(
      'userCharacters',
      userCharacters.map((c) => c.id).toList(),
    );
  }
}
