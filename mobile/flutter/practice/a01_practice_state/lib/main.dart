import 'package:a01_practice_state/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isDark = true;
  Color schemeBackColor = Color(0XFF1C2541);
  Color textColor = Color(0XFFE0E0E0);

  Color brightSchemeBackColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: schemeBackColor),
        textTheme: TextTheme(bodyLarge: TextStyle(color: textColor)),
      ),
      home: Scaffold(body: HomeScreen()),
    );
  }
}
