<<<<<<< Updated upstream
import 'dart:async';

=======
>>>>>>> Stashed changes
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

<<<<<<< Updated upstream
String format(int seconds) {
  int min = (seconds / 60).toInt();
  int sec = (seconds % 60).toInt();

  return "${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
}

class _HomeScreenState extends State<HomeScreen> {
  final int maxSeconds = 1500;
  int totalSeconds = 1500;
  Timer? timer;
  bool isStart = false;
  int totalPomodors = 0;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        isStart = false;
        totalSeconds = maxSeconds;
        totalPomodors++;

        timer.cancel();
      });
    } else {
      setState(() {
        isStart = true;
        totalSeconds--;
      });
    }
  }

  void onReset() {
    timer!.cancel();

    setState(() {
      totalSeconds = maxSeconds;
      isStart = false;
    });
  }

  void onStartPress() {
    timer = Timer.periodic(Duration(seconds: 1), onTick);
  }

  void onPausePressed() {
    timer!.cancel();

    setState(() {
      isStart = false;
    });
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
              child: Text(
                format(totalSeconds), // ✅ 변수 출력
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: !isStart
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.play_circle_outline),
                          iconSize: 120,
                          color: Theme.of(context).cardColor,
                          onPressed: onStartPress,
                        ),
                        if (totalSeconds < maxSeconds)
                          IconButton(
                            icon: Icon(Icons.restore_sharp),
                            color: Theme.of(context).cardColor,
                            onPressed: onReset,
                          ),
                      ],
                    )
                  : IconButton(
                      icon: Icon(Icons.pause_circle_outline),
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: onPausePressed,
                    ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(
                              context,
                            ).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '$totalPomodors',
                          style: TextStyle(
                            fontSize: 60,
                            color: Theme.of(
                              context,
                            ).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
=======
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
>>>>>>> Stashed changes
  }
}
