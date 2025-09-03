import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int milliSecond = 0;
  bool isStart = false;
  Timer? timer;
  String startTitle = '시작';
  Color startColor = Colors.lightBlue;

  // 타이머 작동
  void onStart() {
    timer = Timer.periodic(Duration(milliseconds: 10), onTick);

    setState(() {
      isStart = true;
      startTitle = '계속';
      startColor = Colors.brown;
    });
  }

  void onPause() {
    timer!.cancel();

    setState(() {
      isStart = false;
    });
  }

  void onReset() {
    timer!.cancel();

    setState(() {
      milliSecond = 0;
      isStart = false;
      startTitle = '시작';
      startColor = Colors.lightBlue;
    });
  }

  // 타이머 콜백
  void onTick(Timer timer) {
    setState(() {
      milliSecond++;
    });
  }

  // 밀리세컨드 기준으로 분:초:밀리세컨드 포맷
  String format(int milliSecond) {
    int tempMilliSecond = milliSecond % 100;
    int tempSecond = ((milliSecond / 100) % 60).toInt();
    int second = (milliSecond / 100).toInt();
    int min = (second / 60).toInt();

    String minStr = min.toString().padLeft(2, '0'); // 분
    String secStr = tempSecond.toString().padLeft(2, '0'); // 초
    String millStr = tempMilliSecond.toString().padLeft(2, '0'); // 밀리세컨드초

    return "$minStr:$secStr.$millStr";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(),
              child: Text(
                format(milliSecond),
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: isStart ? () {} : onReset,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30,
                        ),
                        backgroundColor: Colors.grey,
                      ),

                      child: Text(
                        isStart ? '구간 기록' : '초기화',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: isStart ? onPause : onStart,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 30,
                        ),
                        backgroundColor: isStart
                            ? Colors.redAccent
                            : startColor,
                      ),
                      child: Text(
                        isStart ? '중지' : startTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
