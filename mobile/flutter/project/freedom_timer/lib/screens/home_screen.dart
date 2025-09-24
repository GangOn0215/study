import 'package:flutter/material.dart';
import 'package:freedom_timer/widgets/lottie/waiting_cat.dart';
import 'package:freedom_timer/theme/app_colors.dart';
import 'package:freedom_timer/widgets/home_header_title.dart';
import 'package:freedom_timer/widgets/home_welcome_message.dart';
import 'package:freedom_timer/widgets/work_config_form.dart';
import 'package:lottie/lottie.dart';

/// 메인 화면 입니다!
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('냥이월드 🐱')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: HomeHeaderTitle()),
            Expanded(flex: 5, child: WaitingCat()),
            Expanded(flex: 2, child: WorkConfigForm(onSaved: (workConfig) {})),
          ],
        ),
      ),
    );
  }
}
