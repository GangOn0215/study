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

  @override
  void initState() {
    super.initState();

    now = DateTime.now();
    currentTimeStamp = now.millisecondsSinceEpoch ~/ 1000;

    targetTime = DateTime(now.year, now.month, now.day, 18, 0, 0);
    targetTimeStamp = targetTime.millisecondsSinceEpoch ~/ 1000;

    // 남은 시간 계산 (초 단위)
    remainingSeconds = targetTimeStamp - currentTimeStamp;

    print('남은 시간: $remainingSeconds 초');

    // 시분초로 변환
    hours = remainingSeconds ~/ 3600;
    minutes = (remainingSeconds % 3600) ~/ 60;
    seconds = remainingSeconds % 60;

    print('남은 시간: ${hours}시간 ${minutes}분 ${seconds}초');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[700],
        shadowColor: Colors.grey[300],
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              '$hours:$minutes:$seconds',
              style: TextStyle(
                fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }
}