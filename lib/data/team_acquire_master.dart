// lib/data/team_acquire_master.dart

import 'acquire_type.dart';

/// =========================
/// チームごとの取得方法定義
/// =========================
/// 省略時は normalGacha 扱い
const Map<String, AcquireType> teamAcquireMap = {
  // 特別ガチャ
  'Blue Blood': AcquireType.specialGacha1, // Blue Blood用
  '紫焔 – Shien': AcquireType.specialGacha2, // Shien用
  'Shadows': AcquireType.specialGacha3,        // Shadows用
  'Nomad': AcquireType.specialGacha4,        // Nomad用
};
