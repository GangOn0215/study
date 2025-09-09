import 'package:flutter/material.dart';
import 'package:freedom_timer/common/footer_navigation.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Center(
        child: Text('This is the Timer Screen!'),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }

}