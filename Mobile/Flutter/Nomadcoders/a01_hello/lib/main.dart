import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Appbar",
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent.shade100,
        ),
        body: const Center(
          child: Text(
            'Hi, Hello, My name is Coxe',
          ),
        ),
      ),
    );
  }
}
