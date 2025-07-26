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
          title: const Text('Start App', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue.shade400,
        ), // header
        body: Container(
          alignment: Alignment.center,
          child: StarIconBadge(),
        ), // body
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

class StarIconBadge extends StatelessWidget {
  const StarIconBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.star),
    );
  }
}
