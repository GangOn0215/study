import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/timer_screen.dart';
import '../common/footer_navigation.dart';
import 'app_routes.dart';

CustomTransitionPage _getPage(Widget screen) {
  return CustomTransitionPage(
    child: screen,
    transitionsBuilder: (context, animation, _, child) {
      final offset = Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
      return SlideTransition(position: offset, child: child);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => SplashScreen(),
      // pageBuilder: (context, state) => _getPage(SplashScreen()),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const FooterNavigation(),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => HomeScreen(),
          // pageBuilder: (context, state) => _getPage(HomeScreen()),
        ),
        GoRoute(
          path: AppRoutes.timer,
          builder: (context, state) => TimerScreen(),
          // pageBuilder: (context, state) => _getPage(TimerScreen()),
        ),
      ],
    ),
  ],
);
