import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterNavigation extends StatelessWidget {
  const FooterNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();

    // 현재 index 계산
    int currentIndex = 0;

    if (currentPath == '/timer') {
      currentIndex = 1;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0 && currentPath != '/') {
          context.go('/'); // ✅ context.push 대신 context.go 사용 → 중복 방지
        } else if (index == 1 && currentPath != '/timer') {
          context.go('/timer');
        }
      },
      type: BottomNavigationBarType.fixed, // 아이템 2개 이상일 때 권장
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFF4A300), // 노란색
      unselectedItemColor: const Color(0xFF5C5C5C),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      elevation: 10,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
      ],
    );
  }
}
