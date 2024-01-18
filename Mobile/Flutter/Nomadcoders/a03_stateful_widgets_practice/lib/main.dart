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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "click Button",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              Text(
                "$counter",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onAdd,
                    icon: const Icon(
                      Icons.add_box,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: onSub,
                    icon: const Icon(
                      Icons.indeterminate_check_box,
                      size: 30,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
