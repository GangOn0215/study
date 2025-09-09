import 'package:flutter/material.dart';
import 'package:freedom_timer/common/footer_navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
      bottomNavigationBar: FooterNavigation()
    );
  }
}