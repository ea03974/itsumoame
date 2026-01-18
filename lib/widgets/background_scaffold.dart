/* =====================
   Background Scaffold
===================== */
import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final String backgroundImage; // ページごとに背景を差し替え可能

  const BackgroundScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundImage = 'assets/bg/bg1.webp', // デフォルト背景
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // ★ AppBarの後ろまで背景を敷く
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage), // 引数で差し替え可能
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: body,
        ),
      ),
    );
  }
}
