import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),

        body: Padding(
          // padding 집어 넣기
          // padding: EdgeInsets.all(20),
          // padding: const EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Greeting(
                    name: 'Jun',
                    subText: 'Welcome Back',
                    alpha: 0.8,
                    alignRight: true,
                  ),
                ],
              ),
              SizedBox(height: 120),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white.withValues(alpha: 0.5),
                        ),
                      ),
                      Text(
                        '\$ 5 194 482',
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    text: 'Transfer',
                    mainColor: Colors.amber,
                    fontColor: Colors.black,
                  ),
                  Button(
                    text: 'Request',
                    mainColor: Color(0xFF1F2123),
                    fontColor: Colors.white,
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
