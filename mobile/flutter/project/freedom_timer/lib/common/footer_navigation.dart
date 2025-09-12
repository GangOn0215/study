import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // 추가 필요

class FooterNavigation extends StatelessWidget {
  const FooterNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(
      context,
    ).uri.toString(); // ✅ 수정된 부분

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final currentPath = GoRouterState.of(context).uri.toString();
              if (currentPath != '/') {
                context.push('/'); // 현재 경로가 '/'가 아닐 때만 이동
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: currentPath == '/'
                  ? const Color(0xFFFFD166) // 활성
                  : const Color(0xFFF0F0F0), // 비활성
              foregroundColor: currentPath == '/'
                  ? const Color(0xFF2C2C2C)
                  : const Color(0xFF777777),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 20),
                SizedBox(width: 8),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final currentPath = GoRouterState.of(context).uri.toString();
              if (currentPath != '/timer') {
                context.push('/timer'); // 현재 경로가 '/timer'가 아닐 때만 이동
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: currentPath == '/timer'
                  ? const Color(0xFFFFD166)
                  : const Color(0xFFF0F0F0),
              foregroundColor: currentPath == '/timer'
                  ? const Color(0xFF2C2C2C)
                  : const Color(0xFF777777),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.timer, size: 20),
                SizedBox(width: 8),
                Text(
                  'Timer',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
