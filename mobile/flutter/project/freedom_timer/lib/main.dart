import 'package:flutter/material.dart';
import 'package:freedom_timer/screens/home_screen.dart';
import 'package:freedom_timer/screens/timer_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter (
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
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/timer',
      builder: (context, state) => TimerScreen(),
    )
  ]
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
