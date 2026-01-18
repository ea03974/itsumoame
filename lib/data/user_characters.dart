// lib/data/user_characters.dart

import 'members_master.dart';

/// =========================
/// ユーザー所持キャラクター（実体）
/// =========================
List<Character> userCharacters = [];

/// =========================
/// ユーザー所持キャラクターID（保存用）
/// =========================
List<String> ownedCharacterIds = [];

/// =========================
/// ユーザー総戦力
/// =========================
int getTotalPower() {
  return userCharacters.fold(0, (sum, character) => sum + character.power);
}

/// =========================
/// キャラクター追加
/// =========================
void addCharacter(Character character) {
  // IDベースで重複チェック
  if (ownedCharacterIds.contains(character.id)) return;

  ownedCharacterIds.add(character.id);
  userCharacters.add(character);
}

/// =========================
/// キャラクター削除
/// =========================
void removeCharacter(String characterId) {
  ownedCharacterIds.remove(characterId);
  userCharacters.removeWhere((c) => c.id == characterId);
}

/// =========================
/// 全ユーザー所持キャラをクリア
/// =========================
void clearUserCharacters() {
  ownedCharacterIds.clear();
  userCharacters.clear();
}
