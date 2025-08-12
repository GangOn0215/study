import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text('Hello Flutter', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Text('Hello World!', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
