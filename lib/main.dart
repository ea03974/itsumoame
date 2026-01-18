import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart'; // ★追加
import 'ads/reward_ad_manager.dart';


// Pages
import 'title_page.dart';
import 'home_page.dart';
import 'pages/story/first_story_page.dart';
import 'pages/story/story_list_page.dart';
import 'pages/mission/mission_page.dart';
import 'pages/gacha/gacha_page.dart';
import 'pages/team/team_list_page.dart';
import 'data/save_manager.dart'; // ← 既存

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ★ AdMob 初期化（アプリ起動時に1回だけ）
  await MobileAds.instance.initialize();

  // ★ リワード広告をアプリ起動時に先読み
  RewardAdManager.instance.load();

  // ★ セーブデータロード
  await SaveManager.load();

  runApp(const MyApp());
}


// =====================
// RouteObserver（必須）
// =====================
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

/* =====================
   App
===================== */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],

      // ★ ルート定義
      routes: {
        '/title': (context) => const TitlePage(),
        '/first_story': (context) => const FirstStoryPage(),
        '/home': (context) => const HomePage(),
        '/story_list': (context) => const StoryListPage(),
        '/mission': (context) => const MissionPage(),
        '/gacha': (context) => const GachaPage(),
        '/team_list': (context) => const TeamListPage(),
      },

      // ★ オープニングは毎回見る仕様
      home: const OpeningMoviePage(),
    );
  }
}

/* =====================
   AudioManager
===================== */
class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  final AudioPlayer _player = AudioPlayer();
  String? _currentAsset;

  Future<void> playLoop(String assetPath) async {
    if (_currentAsset == assetPath) return;
    _currentAsset = assetPath;

    await _player.stop();
    await _player.setAsset(assetPath);
    await _player.setLoopMode(LoopMode.one);
    await _player.play();
  }

  void stop() {
    _player.stop();
    _currentAsset = null;
  }
}

/* =====================
   Opening Movie Page
===================== */
class OpeningMoviePage extends StatefulWidget {
  const OpeningMoviePage({super.key});

  @override
  State<OpeningMoviePage> createState() => _OpeningMoviePageState();
}

class _OpeningMoviePageState extends State<OpeningMoviePage> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/movies/opening.mp4',
    )
      ..initialize().then((_) {
        setState(() => _initialized = true);
        _controller.play();
      })
      ..addListener(_onVideoEnd);
  }

  void _onVideoEnd() {
    if (_controller.value.position >= _controller.value.duration) {
      _goNext();
    }
  }

  Future<void> _goNext() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOpening', true);

    if (!mounted) return;

    Navigator.pushReplacementNamed(context, '/title');
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideoEnd);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: _goNext,
              child: const Text(
                'SKIP',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
