import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAdManager {
  RewardAdManager._internal();
  static final RewardAdManager instance = RewardAdManager._internal();

  RewardedAd? _rewardedAd;
  bool _isLoading = false;

  bool get isReady => _rewardedAd != null;

  String get _adUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917'; // テスト用
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313'; // テスト用
    }
    throw UnsupportedError('Unsupported platform');
  }

  // =========================
  // 広告ロード（1回だけ）
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
              load(); // 次を先読み
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
    required Function() onRewarded,
    Function()? onNotReady,
  }) {
    if (_rewardedAd == null) {
      onNotReady?.call();
      load();
      return;
    }

    _rewardedAd!.show(
      onUserEarnedReward: (_, __) {
        onRewarded();
      },
    );
  }
}
