import 'package:flutter/material.dart';

/// =========================
/// 総戦力（UIと実体を兼ねる）
/// =========================
final ValueNotifier<int> totalPowerNotifier = ValueNotifier<int>(0);

/// =========================
/// ダイヤ（唯一の実体 & UI表示用）
/// =========================
final ValueNotifier<int> diamondNotifier = ValueNotifier<int>(0);
