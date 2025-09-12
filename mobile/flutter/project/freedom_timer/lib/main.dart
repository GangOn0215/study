import 'package:flutter/material.dart';
import 'package:freedom_timer/common/footer_navigation.dart';
import 'package:freedom_timer/screens/home_screen.dart';
import 'package:freedom_timer/screens/splash_screen.dart';
import 'package:freedom_timer/screens/timer_screen.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    // ✅ Splash → Home 전용 (Fade + Scale)
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const SplashScreen(),
        transitionsBuilder: (context, animation, _, child) {
          final scale = Tween<double>(begin: 0.9, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut),
          );
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: scale, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 700),
      ),
    ),

    // ✅ ShellRoute (Home / Timer)
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const FooterNavigation(),
        );
      },
      routes: [
        // Home (왼쪽 슬라이드)
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: HomeScreen(),
            transitionsBuilder: (context, animation, _, child) {
              final offset = Tween<Offset>(
                begin: const Offset(-1.0, 0.0), // 왼쪽에서 살짝
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ));
              return SlideTransition(position: offset, child: child);
            },
            transitionDuration: const Duration(milliseconds: 300),
          ),
        ),

        // Timer (오른쪽 슬라이드)
        GoRoute(
          path: '/timer',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const TimerScreen(),
            transitionsBuilder: (context, animation, _, child) {
              final offset = Tween<Offset>(
                begin: const Offset(1.0, 0.0), // 오른쪽에서 들어옴
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ));
              return SlideTransition(position: offset, child: child);
            },
            transitionDuration: const Duration(milliseconds: 300),
          ),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,

      // 전역으로 적용할 테마
      theme: ThemeData(
        // 전체 배경화면
        scaffoldBackgroundColor: Color(0xFFFFF8E7),

        // 앱바
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFFF8E7),
          shadowColor: Colors.grey[300],
          elevation: 2,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF2C2C2C),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // 버튼
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFD166),
            foregroundColor: Color(0xFF2C2C2C),
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // 텍스트
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF2C2C2C), fontSize: 16),
        ),
      ),
    );
  }
}
