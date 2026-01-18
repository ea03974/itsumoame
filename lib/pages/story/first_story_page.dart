import 'package:flutter/material.dart';

class FirstStoryPage extends StatelessWidget {
  const FirstStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '― プロローグ ―',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'これは、闇に抗う者たちの物語。',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('次へ'),
            ),
          ],
        ),
      ),
    );
  }
}
