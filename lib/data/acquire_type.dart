// lib/data/acquire_type.dart

/// =========================
/// 取得方法タイプ
/// =========================
enum AcquireType {
  normalGacha,    // 通常ガチャ
  specialGacha1,  // 特別ガチャ（Blue Blood用）
  specialGacha2,  // 特別ガチャ（Shien用）
  specialGacha3,  // 特別ガチャ（Shadows用）
  specialGacha4,  // 特別ガチャ（Nomad用）
}

/// =========================
/// ★ レア度定義
/// =========================
enum Rarity {
  star7,
  star6,
  star5,
  star4,
  star3,
  star2,
  star1,
}

/// =========================
/// 通常ガチャ排出率（％）
/// =========================
const Map<Rarity, double> normalGachaRate = {
  Rarity.star7: 0.5,
  Rarity.star6: 2.0,
  Rarity.star5: 4.0,
  Rarity.star4: 8.0,
  Rarity.star3: 25.0,
  Rarity.star2: 27.5,
  Rarity.star1: 33.0,
};

/// =========================
/// 特別ガチャ（Blue Blood）
/// ★3〜★7のみ
/// =========================
const Map<Rarity, double> specialGacha1Rate = {
  Rarity.star7: 0.5,
  Rarity.star6: 2.0,
  Rarity.star5: 4.0,
  Rarity.star4: 8.0,
  Rarity.star3: 85.5,
};

/// =========================
/// 特別ガチャ（Shien）
/// ★3〜★7のみ
/// =========================
const Map<Rarity, double> specialGacha2Rate = {
  Rarity.star7: 0.5,
  Rarity.star6: 2.0,
  Rarity.star5: 4.0,
  Rarity.star4: 8.0,
  Rarity.star3: 85.5,
};

/// =========================
/// 特別ガチャ（Shadows）
/// ★3〜★7のみ
/// =========================
const Map<Rarity, double> specialGacha3Rate = {
  Rarity.star7: 1.27,
  Rarity.star6: 5.06,
  Rarity.star5: 10.13,
  Rarity.star4: 20.25,
  Rarity.star3: 63.29,
};

/// =========================
/// 特別ガチャ（Nomad）
/// ★6確定
/// =========================
const Map<Rarity, double> specialGacha4Rate = {
  Rarity.star6: 100.0,
};

/// =========================
/// 取得タイプ → 排出率テーブル取得
/// =========================
Map<Rarity, double> getGachaRate(AcquireType type) {
  switch (type) {
    case AcquireType.normalGacha:
      return normalGachaRate;
    case AcquireType.specialGacha1:
      return specialGacha1Rate;
    case AcquireType.specialGacha2:
      return specialGacha2Rate;
    case AcquireType.specialGacha3:
      return specialGacha3Rate;
    case AcquireType.specialGacha4:
      return specialGacha4Rate;
  }
}
