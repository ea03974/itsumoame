import 'package:flutter/material.dart';
import 'data/user_characters.dart';
import '../pages/gacha/gacha_globals.dart';

// ★ ロゴフェードトランジション
import '../widgets/transition1.dart';

// ★ 各ページ
import '../pages/story/story_list_page.dart';
import '../pages/mission/mission_page.dart';
import '../pages/gacha/single_gacha_page.dart';
import '../pages/team/team_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // ★ 初回表示時に総戦力を再計算
    recalculateTotalPower();
  }

  /// ★ ロゴフェード付き遷移（共通）
  /// 戻ってきたら必ず再計算する（戻り値は使わない）
  Future<void> _pushWithLogoB(Widget page) async {
    await Navigator.of(context).push(
      LogoBFadeRoute(nextPage: page),
    );

    // ★ Home に戻ったタイミングで再計算
    recalculateTotalPower();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // ===== 背景 =====
            Positioned.fill(
              child: Image.asset(
                'assets/bg/bg1.webp',
                fit: BoxFit.cover,
              ),
            ),

            Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  'HOME',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                /// ===== 総戦力 =====
                ValueListenableBuilder<int>(
                  valueListenable: totalPowerNotifier,
                  builder: (context, totalPower, _) {
                    return Text(
                      '総戦力: $totalPower',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(offset: Offset(1, 1), blurRadius: 2),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 6),

                /// ===== ダイヤ =====
                ValueListenableBuilder<int>(
                  valueListenable: diamondNotifier,
                  builder: (context, diamond, _) {
                    return Text(
                      '💎 ダイヤ: $diamond',
                      style: const TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(offset: Offset(1, 1), blurRadius: 2),
                        ],
                      ),
                    );
                  },
                ),

                const Spacer(),

                /// ===== ボタン群 =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _HomeButton(
                        label: 'Story',
                        icon: Icons.menu_book,
                        onTap: () {
                          _pushWithLogoB(const StoryListPage());
                        },
                      ),
                      _HomeButton(
                        label: 'Mission',
                        icon: Icons.flag,
                        onTap: () {
                          _pushWithLogoB(const MissionPage());
                        },
                      ),
                      _HomeButton(
                        label: 'Gacha',
                        icon: Icons.casino,
                        onTap: () {
                          _pushWithLogoB(const SingleGachaPage());
                        },
                      ),
                      _HomeButton(
                        label: 'Team List',
                        icon: Icons.groups,
                        onTap: () {
                          _pushWithLogoB(const TeamListPage());
                        },
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* =====================
   Home Button Widget
===================== */
class _HomeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _HomeButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: const DecorationImage(
            image: AssetImage('assets/button/button1.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 28),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(offset: Offset(1, 1), blurRadius: 2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
