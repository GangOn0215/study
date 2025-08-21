import 'package:a01_click_game/widget/number_button.dart';
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
  final int maxButton = 9;
  late List<int> numbers = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < maxButton; i++) {
      numbers.add(i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double outer = 16; // 전체 바깥 여백
    const double gap = 10; // 칸과 칸 사이 간격

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            Row(children: [Text('Click GAME')]),
          ],
          backgroundColor: Colors.lightBlue,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (j) {
                    final number = (i * 3) + j + 1;
                    return NumberButton(number: number);
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
