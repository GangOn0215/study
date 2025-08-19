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

  void onClicked() {
    setState(() {
      counter++;
    });
  }

  void onSubtractClicked() {
    setState(() {
      counter--;
    });
  }

  void onReset() {
    setState(() {
      counter = 0;
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
              Text('Click me', style: TextStyle(fontSize: 24)),
              Text(
                '$counter',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onClicked,
                    icon: Icon(Icons.add_box_rounded, size: 42),
                  ),
                  IconButton(
                    onPressed: onReset,
                    icon: Icon(Icons.refresh, size: 42),
                  ),
                  IconButton(
                    onPressed: onSubtractClicked,
                    icon: Icon(Icons.indeterminate_check_box_rounded, size: 42),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
