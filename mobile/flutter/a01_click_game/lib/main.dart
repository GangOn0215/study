import 'dart:async';
import 'dart:math';
import 'package:a01_click_game/widget/number_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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

  // 클릭된 숫자들 (상단에 보여줄 용도)
  final List<int> clickedValues = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFAEEF6),
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Click GAME'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  clickedValues.clear(); // 상단 표시 초기화
                  numbers.shuffle(Random()); // 숫자 재배치(원하면 유지해도 됨)
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔹 상단 한 줄에만 클릭한 숫자들을 표시
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

              // 🔹 3x3 버튼 그리드 (옆의 라벨 없이 버튼만)
              for (int i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (j) {
                    final slot = (i * 3) + j + 1; // 위치 번호(필요하면 사용)
                    final value = numbers[slot - 1]; // 섞인 값

                    return Padding(
                      padding: const EdgeInsets.all(6),
                      child: NumberButton(
                        number: value,
                        slot: slot,
                        secsLeft: _secsLeft, // 🔹 남은 초 전달
                        onTap: (s, v) {
                          // 자식이 알려준 클릭 숫자(v)를 상단 리스트에 추가
                          setState(() => clickedValues.add(v));
                          // 필요하면 중복 클릭 막기/게임 로직 추가 가능
                        },
                      ),
                    );
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
