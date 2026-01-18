import 'save_manager.dart';
import '../pages/gacha/gacha_globals.dart';

/// =========================
/// ダイヤ操作ユーティリティ
/// （実体は diamondNotifier.value のみ）
/// =========================

/// =========================
/// ダイヤ消費
/// =========================
bool spendDiamonds(int amount) {
  final current = diamondNotifier.value;
  if (current < amount) return false;

  diamondNotifier.value = current - amount;
  SaveManager.save();
  return true;
}

/// =========================
/// ダイヤ付与
/// =========================
void addDiamonds(int amount) {
  diamondNotifier.value += amount;
  SaveManager.save();
}
