import 'package:a05_pomodoro_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
<<<<<<< Updated upstream
        scaffoldBackgroundColor: Color(0XFFE7626C),
        textTheme: TextTheme(displayLarge: TextStyle(color: Color(0xFF232B55))),
        cardColor: const Color(0XFFF4EDDB),
=======
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Color(0XFFE7626C)),
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Color(0xFF232B55)),
        ),
        cardColor: Color(0XFFF4EDDB),
>>>>>>> Stashed changes
      ),
      home: HomeScreen(),
    );
  }
}
