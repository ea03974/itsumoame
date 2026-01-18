import 'package:flutter/material.dart';
import 'story_view_page.dart';

class StoryListPage extends StatelessWidget {
  const StoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('STORY'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: storyMaster.length,
        itemBuilder: (context, index) {
          final story = storyMaster[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StoryViewPage(story: story),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Image.asset(
                    'assets/button/button2.webp',
                    width: double.infinity,
                    height: 72,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            story.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 6,
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (story.isFirst)
                          const Text(
                            'FIRST',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// =======================
/// ストーリーデータクラス
/// =======================
class StoryData {
  final String id;
  final String title;
  final String body;
  final bool isFirst;

  StoryData({
    required this.id,
    required this.title,
    required this.body,
    this.isFirst = false,
  });
}

/// =======================
/// 仮ストーリーマスター
/// =======================
final List<StoryData> storyMaster = [
  StoryData(
    id: 'ST-001',
    title: '序章：黒き騎士団',
    isFirst: true,
    body: '''
── 世界は、静かに崩れ始めていた。

黒き騎士団「Obsidian Knights」。
その刃は、救済か、破滅か──。
''',
  ),
  StoryData(
    id: 'ST-002',
    title: '第一章：集結',
    body: '''
騎士たちは、夜の城に集う。
それぞれの思惑を胸に──。
''',
  ),
  StoryData(
    id: 'ST-003',
    title: '第二章：血盟',
    body: '''
誓いは交わされた。
戻る道は、もう無い。
''',
  ),
];
