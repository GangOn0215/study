import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onAdd() {
    setState(() {
      counter++;
    });
  }

  void onSub() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0XFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'click count',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Text(
                "$counter",
                style: const TextStyle(fontSize: 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_box_rounded),
                    iconSize: 35,
                    onPressed: onAdd,
                    style: const ButtonStyle(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.indeterminate_check_box),
                    iconSize: 35,
                    onPressed: onSub,
                    style: const ButtonStyle(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
