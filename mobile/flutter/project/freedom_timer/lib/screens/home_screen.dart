import 'package:flutter/material.dart';
import 'package:freedom_timer/theme/app_colors.dart';

/// 메인 화면 입니다!
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('냥이월드 🐱')),
      body: Center(
        child: Text(
          'Welcome to Meow World 🐾',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}
