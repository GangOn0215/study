import 'package:a05_pomodoro_practice/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.orange,
        cardColor: Color(0XFFFFC22B),
        iconTheme: IconThemeData(
          color: Color(0XFFECE4DA),
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            color: Color(0XFF96330F),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
