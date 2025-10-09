import 'package:flutter/material.dart';
import 'package:freedom_timer/screens/account_screen.dart';
import 'package:freedom_timer/screens/kakao_login.dart';
import 'package:freedom_timer/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/timer_screen.dart';
import '../common/footer_navigation.dart';
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => SplashScreen(),
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
        ),
        GoRoute(
          path: AppRoutes.timer,
          builder: (context, state) => TimerScreen(),
        ),
        GoRoute(
          path: AppRoutes.account,
          builder: (context, state) => AccountScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.kakaoLogin,
          builder: (context, state) => KakaoLogin(),
        ),
      ],
    ),
  ],
);
