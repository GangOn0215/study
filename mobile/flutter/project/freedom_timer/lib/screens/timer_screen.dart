import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freedom_timer/common/footer_navigation.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late DateTime now;
  late int currentTimeStamp;
  late DateTime targetTime;
  late int targetTimeStamp;
  late int remainingSeconds;
  late int hours;
  late int minutes;
  late int seconds;
  late String timeString;
  late Color timerColor = const Color(0xFF2C2C2C); // 초기 색상: 진한 차콜

  late Timer timer;

  @override
  void initState() {
    super.initState();

    now = DateTime.now();
    currentTimeStamp = now.millisecondsSinceEpoch ~/ 1000;

    targetTime = DateTime(now.year, now.month, now.day, 18, 0, 0);
    targetTimeStamp = targetTime.millisecondsSinceEpoch ~/ 1000;

    // 남은 시간 계산 (초 단위)
    remainingSeconds = targetTimeStamp - currentTimeStamp;

    // 시분초로 변환
    hours = remainingSeconds ~/ 3600;
    minutes = (remainingSeconds % 3600) ~/ 60;
    seconds = remainingSeconds % 60;

    timeString = '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    timerColor = getTimerColor(remainingSeconds); 

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;

          hours = remainingSeconds ~/ 3600;
          minutes = (remainingSeconds % 3600) ~/ 60;
          seconds = remainingSeconds % 60;

          timeString = '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
          timerColor = getTimerColor(remainingSeconds);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  Color getTimerColor(int remainingSeconds) {
    // 색상 구간 정의
    const threeHours = 10800; // 3시간
    const twoHours = 7200;   // 2시간
    const oneHour  = 3600;   // 1시간
    const tenMins  = 600;    // 10분

    const blue   = Color(0xFF64B5F6); // 3h: 파스텔 블루
    const mint   = Color(0xFF81C784); // 2h: 파스텔 민트
    const yellow = Color(0xFFFFD54F); // 1h: 파스텔 옐로우
    const pink   = Color(0xFFF48FB1); // 10m: 파스텔 핑크

    if (remainingSeconds > threeHours) {
      return const Color(0xFF2C2C2C); // 기본 차콜
    } else if (remainingSeconds > twoHours) {
      final t = (remainingSeconds - twoHours) / (threeHours - twoHours);
      return Color.lerp(mint, blue, t)!;
    } else if (remainingSeconds > oneHour) {
      final t = (remainingSeconds - oneHour) / (twoHours - oneHour);
      return Color.lerp(yellow, mint, t)!;
    } else if (remainingSeconds > tenMins) {
      final t = (remainingSeconds - tenMins) / (oneHour - tenMins);
      return Color.lerp(pink, yellow, t)!;
    } else {
      return pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('퇴근냥이 🐱')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              timeString,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: timerColor,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }
}
