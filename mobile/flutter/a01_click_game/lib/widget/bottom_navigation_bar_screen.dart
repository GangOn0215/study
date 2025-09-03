// bottom_navigation_bar_screen.dart
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarScreen({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      elevation: 150,
      iconSize: 30,
      selectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red.shade100,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm_off),
          activeIcon: Icon(Icons.access_alarm),
          label: "알림",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: "친구",
        ),
      ],
    );
  }
}
