import 'package:flutter/material.dart';
import 'package:freedom_timer/theme/app_theme.dart';
import 'routes/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,

      // 전역으로 적용할 테마
      theme: AppTheme.light,
    );
  }
}
