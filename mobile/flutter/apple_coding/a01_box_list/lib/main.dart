import 'package:a01_box_list/widgets/alphabet_box.dart';
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
        // header
        appBar: AppBar(
          title: const Text('App', style: TextStyle(color: Colors.white60)),
          backgroundColor: Colors.blue.shade400,
        ),
        body: Wrap(
          direction: Axis.horizontal, // 나열 방향
          alignment: WrapAlignment.start, // 정렬 방식
          crossAxisAlignment: WrapCrossAlignment.center, // 교차 축 정렬
          spacing: 5, // 좌우 간격
          runSpacing: 5, // 상하 간격
          children: [
            const AlphabetBox(color: Colors.lightBlue, letter: 'A'),
            const AlphabetBox(color: Colors.lightGreen, letter: 'B'),
            const AlphabetBox(color: Colors.pink, letter: 'C'),
            const AlphabetBox(color: Colors.orange, letter: 'D'),
            const AlphabetBox(color: Colors.brown, letter: 'E'),
            const AlphabetBox(color: Colors.teal, letter: 'F'),
            const AlphabetBox(color: Colors.indigo, letter: 'G'),
            const AlphabetBox(color: Colors.purpleAccent, letter: 'H'),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.call),
              Icon(Icons.message),
              Icon(Icons.contact_page_sharp),
            ],
          ),
        ), // footer
      ),
    );
  }
}
