import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/gacha/gacha_globals.dart';
import 'mission1_execute_page.dart';
import '../../ads/reward_ad_manager.dart';

class MissionPage extends StatefulWidget {
  const MissionPage({super.key});

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  static const int cooldownSeconds = 600;
  static const String prefsKey = 'mission_next_time_';

  final List<int> requiredPower = [0, 2000, 3000, 4000, 5000];
  final List<DateTime?> _nextAvailableTimes =
      List.generate(5, (_) => null);

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadCooldowns();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// =========================
  /// クールタイム読込
  /// =========================
  Future<void> _loadCooldowns() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 5; i++) {
      final millis = prefs.getInt('$prefsKey$i');
      if (millis != null && millis > 0) {
        _nextAvailableTimes[i] =
            DateTime.fromMillisecondsSinceEpoch(millis);
      }
    }
    setState(() {});
  }

  /// =========================
  /// クールタイム保存
  /// =========================
  Future<void> _saveCooldown(int index, int millis) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$prefsKey$index', millis);
  }

  bool _isOnCooldown(int index) {
    final time = _nextAvailableTimes[index];
    if (time == null) return false;
    return DateTime.now().isBefore(time);
  }

  String _remainingTimeText(int index) {
    final time = _nextAvailableTimes[index];
    if (time == null) return '';

    final diff = time.difference(DateTime.now());
    if (diff.isNegative) return '';

    final minutes = diff.inMinutes;
    final seconds = diff.inSeconds % 60;

    return '再挑戦まで '
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  /// =========================
  /// ミッション開始（通常）
  /// =========================
  void _startMission(int index) {
    final nextTime =
        DateTime.now().add(const Duration(seconds: cooldownSeconds));

    _nextAvailableTimes[index] = nextTime;
    _saveCooldown(index, nextTime.millisecondsSinceEpoch);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Mission1ExecutePage(),
      ),
    );
  }

  /// =========================
  /// 広告視聴 → クール解除
  /// =========================
  void _watchAdAndSkip(int index) {
    RewardAdManager.instance.show(
      onRewarded: () async {
        _nextAvailableTimes[index] = null;
        await _saveCooldown(index, 0);
        setState(() {});
      },
      onNotReady: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('広告準備中です。しばらくお待ちください'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('MISSION'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      /// ★ 総戦力を購読
      body: ValueListenableBuilder<int>(
        valueListenable: totalPowerNotifier,
        builder: (context, totalPower, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 5,
            itemBuilder: (context, index) {
              final canPower = totalPower >= requiredPower[index];
              final onCooldown = _isOnCooldown(index);

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () {
                    if (!canPower) return;

                    if (onCooldown) {
                      _watchAdAndSkip(index);
                    } else {
                      _startMission(index);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: onCooldown
                          ? Colors.grey.shade800
                          : Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: onCooldown
                            ? Colors.white24
                            : Colors.white,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flag,
                          color: onCooldown
                              ? Colors.white38
                              : Colors.white,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mission ${index + 1}',
                                style: TextStyle(
                                  color: onCooldown
                                      ? Colors.white38
                                      : Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '必要戦力：${requiredPower[index]}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              if (onCooldown) ...[
                                const SizedBox(height: 6),
                                Text(
                                  _remainingTimeText(index),
                                  style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '📺 広告を観て待ち時間スキップ',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
