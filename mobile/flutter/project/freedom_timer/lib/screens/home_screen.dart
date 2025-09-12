import 'package:flutter/material.dart';
import 'package:freedom_timer/common/footer_navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('냥이월드 🐱')),
      body: Center(
        child: Text(
          'Welcome to Meow World 🐾',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C2C2C),
          ),
        ),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }
}
