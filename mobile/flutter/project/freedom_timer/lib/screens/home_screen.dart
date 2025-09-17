import 'package:flutter/material.dart';
import 'package:freedom_timer/theme/app_colors.dart';
import 'package:freedom_timer/widgets/home/header_title.dart';
import 'package:freedom_timer/widgets/home/welcome_message.dart';

/// 메인 화면 입니다!
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('냥이월드 🐱')),
      body: Column(
        children: [
          HeaderTitle(),
          Spacer(),
          WelcomeMessage(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
