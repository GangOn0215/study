import 'package:a01_box_list/screens/home/home_alphabet_grid.dart';
import 'package:a01_box_list/screens/home/home_appbar.dart';
import 'package:a01_box_list/screens/home/home_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: HomeAlphabetGrid(),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
