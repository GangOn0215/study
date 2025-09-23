import 'package:flutter/material.dart';
import 'package:freedom_timer/theme/app_theme.dart';
import 'routes/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// 전역 설정 객체
class WorkConfig {
  int startHour;
  int endHour;

  WorkConfig({this.startHour = 9, this.endHour = 18});

  static final WorkConfig instance = WorkConfig();
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,

      // 전역으로 적용할 테마
      theme: AppTheme.light,
    );
  }
}
