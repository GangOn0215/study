import 'package:flutter/material.dart';
import 'package:freedom_timer/screens/home_screen.dart';
import 'package:freedom_timer/screens/timer_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter (
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
