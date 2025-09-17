import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterNavigation extends StatelessWidget {
  const FooterNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();

    // 현재 경로가 paths 안에서 몇 번째인지 찾는다.
    final index = paths.indexOf(currentPath);

    // indexOf는 못 찾으면 -1을 반환한다 → 그럴 때를 대비해서 안전하게 0으로 보정
    final currentIndex = index == -1 ? 0 : index;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        final targetPath = paths[index];

        if (targetPath != currentPath) {
          context.go(targetPath);
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
