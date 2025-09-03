import 'dart:async';
import 'dart:math';
import 'package:a01_click_game/widget/number_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GameScreens extends StatefulWidget {
  const GameScreens({super.key});

  @override
  State<GameScreens> createState() => _GameScreensState();
}

class _GameScreensState extends State<GameScreens> {
  // 1~9 섞어서 중복 없이 배치
  late List<int> numbers = List.generate(9, (i) => i + 1)..shuffle(Random());

  int _secsLeft = 5; // 남은 초 (전체 버튼 공유)
  Timer? _tickTimer;
  int score = 0;
  int tapCount = 0; // 클릭 횟수 저장용 변수
  bool isGameStart = false; // 게임 시작 여부

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tickTimer?.cancel();
    super.dispose();
  }

  void dataInit() {
    setState(() {
      numbers = List.generate(9, (i) => i + 1)..shuffle(Random());
      score = 0;
      _secsLeft = 5;
      _tickTimer?.cancel();
    });
  }

  void _startTimer() {
    dataInit();

    // 새로운 타이머 시작
    _tickTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _secsLeft--;
        if (_secsLeft <= 0) {
          _secsLeft = 0;
          t.cancel();
          tapCount = 0;
        }
      });
    });
  }

  void _gameStart() {
    setState(() {
      isGameStart = true;
    });

    _startTimer();
  }

  void _gameOver() {
    dataInit();
    setState(() {
      isGameStart = false;
      _tickTimer?.cancel();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating, // 공중에 뜨게
          margin: const EdgeInsets.all(16), // 화면 여백
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 4),
          content: Row(
            children: const [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  "게임 오버!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // 클릭된 숫자들 (상단에 보여줄 용도)
  final List<int> clickedValues = [];
  final List<int> answerList = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: !isGameStart
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      // side: const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  onPressed: _gameStart,
                  child: Text(
                    '게임 시작',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          : Column(
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
                      // 숫자판 위치
                      final slot = (i * 3) + j + 1;
                      // 숫자
                      final value = numbers[slot - 1];
                      return Padding(
                        padding: const EdgeInsets.all(6),
                        child: NumberButton(
                          number: value,
                          slot: slot,
                          secsLeft: _secsLeft, // 타이머 상태 전달
                          onTap: (s, v) {
                            setState(() {
                              clickedValues.add(v);
                              tapCount++; // 클릭할 때마다 증가
                            });

                            if (_secsLeft == 0 && v == tapCount) {
                              score++; // 샘플: 시간 끝난 뒤 뒤집으면 +1
                            } else {
                              // GAME OVER
                              _gameOver();
                              // --> 시작 화면
                            }
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
}
