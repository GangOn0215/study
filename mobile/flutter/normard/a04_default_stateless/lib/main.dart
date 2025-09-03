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
  int counter = 0;

  void add() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
              Text(
                '$counter',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: add,
                icon: Icon(Icons.add_box_rounded, size: 36),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
