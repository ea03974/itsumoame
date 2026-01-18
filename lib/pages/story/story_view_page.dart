import 'package:flutter/material.dart';
import 'story_list_page.dart';

class StoryViewPage extends StatelessWidget {
  final StoryData story;

  const StoryViewPage({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(story.title),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            /// ストーリー本文
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  story.body,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.7,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// 戻るボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  '一覧に戻る',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
