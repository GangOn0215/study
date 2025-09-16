import 'package:flutter/material.dart';
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
      theme: ThemeData(
        // 폰트
        fontFamily: "Jua",

        // 전체 배경화면
        scaffoldBackgroundColor: Color(0xFFFFF8E7),

        // 앱바
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFFF8E7),
          shadowColor: Colors.grey[300],
          elevation: 2,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "Jua",
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
