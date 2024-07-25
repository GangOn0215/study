import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int totalRound = 4;
  final int totalGoal = 4;
  final int pomodoroDefaultSec = 10;
  late int totalSec;
  late Timer timer; // 타이머
  late int min = 0;
  late int sec = 0;

  int currentRound = 0;
  int currentGoal = 0;

  bool isRunning = false;

  // 시간 제어
  void onTick(Timer timer) {
    setState(() {
      totalSec--;

      setTimeMinSec();

      if (currentRound == 0) {
        currentRound = 1;
      }

      if (totalSec == 0) {
        timer.cancel();

        totalSec = pomodoroDefaultSec;
        currentRound++;

        isRunning = false;
      }
    });
  }

  // 타이머 시작 눌렀을 때
  void onTimeStart() {
    if (isRunning) {
      return;
    }

    isRunning = true;

    timer = Timer.periodic(
      Duration(seconds: 1),
      onTick,
    );
  }

  void setTimeMinSec() {
    setState(() {
      min = totalSec ~/ 60;
      sec = totalSec % 60;
    });
  }

  String showMinSec() {
    return '${min.toString().padLeft(2, '0')} : ${sec.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();

    totalSec = 10;
    setTimeMinSec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(
                '${showMinSec()}',
                style: TextStyle(
                  color: Theme.of(context).textTheme.headlineSmall?.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              color: Theme.of(context).textTheme.headlineSmall?.color,
              child: IconButton(
                onPressed: onTimeStart,
                icon: Icon(
                  Icons.play_circle_outline_rounded,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  size: 120,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              // color: Theme.of(context).scaffoldBackgroundColor,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Round',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.headlineSmall?.color,
                        ),
                      ),
                      Text(
                        '$currentRound/$totalRound',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Goal',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.headlineSmall?.color,
                        ),
                      ),
                      Text(
                        '$currentGoal/$totalGoal',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
