import 'package:flutter/material.dart';

/// =========================
/// 総戦力（UI表示専用 Notifier）
/// ※ 実体・計算は user_characters.dart 側
/// =========================
final ValueNotifier<int> totalPowerNotifier = ValueNotifier<int>(0);

/// =========================
/// ダイヤ（唯一の実体 & UI表示用）
/// =========================
final ValueNotifier<int> diamondNotifier = ValueNotifier<int>(0);
