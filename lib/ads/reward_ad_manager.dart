import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAdManager {
  RewardAdManager._internal();
  static final RewardAdManager instance = RewardAdManager._internal();

  RewardedAd? _rewardedAd;
  bool _isLoading = false;
  bool _hasRewarded = false;

  bool get isReady => _rewardedAd != null;

  String get _adUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917'; // Android テスト
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313'; // iOS テスト
    }
    throw UnsupportedError('Unsupported platform');
  }

  // =========================
  // 広告ロード
  // =========================
  void load() {
    if (_isLoading || _rewardedAd != null) return;

    _isLoading = true;

    RewardedAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isLoading = false;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _rewardedAd = null;
              load(); // 次の広告を先読み
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _rewardedAd = null;
              load();
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isLoading = false;
        },
      ),
    );
  }

  // =========================
  // 広告表示
  // =========================
  void show({
    required void Function() onRewarded,
    void Function()? onNotReady,
  }) {
    if (_rewardedAd == null) {
      onNotReady?.call();
      load();
      return;
    }

    _hasRewarded = false;

    final ad = _rewardedAd;
    _rewardedAd = null; // 二重表示防止

    ad!.show(
      onUserEarnedReward: (_, __) {
        if (_hasRewarded) return;
        _hasRewarded = true;
        onRewarded();
      },
    );
  }
}
