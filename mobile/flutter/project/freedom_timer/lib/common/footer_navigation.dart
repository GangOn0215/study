import 'package:flutter/material.dart';
import 'package:freedom_timer/theme/app_colors.dart';
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
          context.push('/'); // ✅ context.push 대신 context.go 사용 → 중복 방지
        } else if (index == 1 && currentPath != '/timer') {
          context.push('/timer');
        }
      },
      type: BottomNavigationBarType.fixed, // 아이템 2개 이상일 때 권장
      backgroundColor: AppColors.background,
      selectedItemColor: const Color(0xFFFFD166), // 노란색
      unselectedItemColor: Colors.grey[600],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      elevation: 10,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
      ],
    );
  }
}
