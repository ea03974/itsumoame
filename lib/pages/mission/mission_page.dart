import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/gacha/gacha_globals.dart';
import 'mission1_execute_page.dart';

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
      if (millis != null) {
        _nextAvailableTimes[i] =
            DateTime.fromMillisecondsSinceEpoch(millis);
      }
    }
    setState(() {});
  }

  /// =========================
  /// クールタイム保存
  /// =========================
  Future<void> _saveCooldown(int index, DateTime time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      '$prefsKey$index',
      time.millisecondsSinceEpoch,
    );
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

  void _startMission(int index) {
    final nextTime =
        DateTime.now().add(const Duration(seconds: cooldownSeconds));

    _nextAvailableTimes[index] = nextTime;
    _saveCooldown(index, nextTime);

   Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const Mission1ExecutePage(),
  ),
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          final power = totalPowerNotifier.value;
          final canPower = power >= requiredPower[index];
          final onCooldown = _isOnCooldown(index);
          final enabled = canPower && !onCooldown;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: enabled ? () => _startMission(index) : null,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: enabled
                      ? Colors.grey.shade900
                      : Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: enabled ? Colors.white : Colors.white24,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.flag,
                      color:
                          enabled ? Colors.white : Colors.white38,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mission ${index + 1}',
                            style: TextStyle(
                              color: enabled
                                  ? Colors.white
                                  : Colors.white38,
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
      ),
    );
  }
}
