import 'package:flutter/material.dart';
import 'package:a01_click_game/screen/home_screens.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreens(),
    );
  }
}
