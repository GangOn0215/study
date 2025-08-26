import 'package:a01_click_game/screen/alarm_screens.dart';
import 'package:a01_click_game/screen/friends_screens.dart';
import 'package:a01_click_game/screen/game_screens.dart';
import 'package:a01_click_game/widget/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEEF6),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Click GAME',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _tabIndex,
        children: [
          GameScreens(), // 탭 0: 게임
          AlarmScreens(), // 탭 1: 알림
          FriendsScreens(), // 탭 2: 친구
        ],
      ),
      bottomNavigationBar: BottomNavigationBarScreen(
        currentIndex: _tabIndex,
        onTap: (i) => setState(() => _tabIndex = i),
      ),
    );
  }
}
