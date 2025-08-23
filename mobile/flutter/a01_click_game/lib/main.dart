import 'dart:async';
import 'dart:math';
import 'package:a01_click_game/widget/bottom_navigation_bar_screen.dart';
import 'package:a01_click_game/widget/number_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // -- 탭 인덱스 ( 하단 바 & 본문 교체)
  int _tabIndex = 0;

  // 1~9 섞어서 중복 없이 배치
  late final List<int> numbers = List.generate(9, (i) => i + 1)
    ..shuffle(Random());

  int _secsLeft = 5; // 남은 초 (전체 버튼 공유)
  Timer? _tickTimer;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _tickTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _secsLeft--;
        if (_secsLeft <= 0) {
          _secsLeft = 0;
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _tickTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _secsLeft = 5;
      _tickTimer?.cancel();
    });

    // 새로운 타이머 시작
    _tickTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _secsLeft--;
        if (_secsLeft <= 0) {
          _secsLeft = 0;
          t.cancel();
        }
      });
    });
  }

  // 클릭된 숫자들 (상단에 보여줄 용도)
  final List<int> clickedValues = [];

  // ---- 탭별 화면들
  Widget _buildHomeGame() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 상단: 남은 시간 / 점수
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                _secsLeft != 0
                    ? Text(
                        '남은 시간: $_secsLeft 초',
                        style: const TextStyle(fontSize: 20),
                      )
                    : Text(
                        '점수: $score',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ],
            ),
          ),
          // 3x3 버튼
          for (int i = 0; i < 3; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (j) {
                final slot = (i * 3) + j + 1;
                final value = numbers[slot - 1];
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: NumberButton(
                    number: value,
                    slot: slot,
                    secsLeft: _secsLeft, // 타이머 상태 전달
                    onTap: (s, v) {
                      setState(() => clickedValues.add(v));
                      // 예: 맞춘 점수 로직
                      if (_secsLeft == 0) score++; // 샘플: 시간 끝난 뒤 뒤집으면 +1
                    },
                  ),
                );
              }),
            ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                clickedValues.clear();
                numbers.shuffle(Random());
                score = 0;
                _startTimer(); // 라운드 리셋
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('다시 시작'),
          ),
        ],
      ),
    );
  }

  Widget _buildAlarmPage() {
    return const Center(child: Text('알림 탭 (예시 페이지)'));
  }

  Widget _buildFriendsPage() {
    return const Center(child: Text('친구 탭 (예시 페이지)'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            _buildHomeGame(), // 탭 0: 게임
            _buildAlarmPage(), // 탭 1: 알림
            _buildFriendsPage(), // 탭 2: 친구
          ],
        ),
        bottomNavigationBar: BottomNavigationBarScreen(
          currentIndex: _tabIndex,
          onTap: (i) => setState(() => _tabIndex = i),
        ),
      ),
    );
  }
}
