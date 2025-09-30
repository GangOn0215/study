// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:freedom_timer/screens/home_screen.dart';
import 'package:freedom_timer/screens/kakao_login_webview.dart';
import 'package:freedom_timer/services/api/auth_api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthApiService _authApi = AuthApiService();

  Future<void> _loginWithKakao() async {
    try {
      // 1️⃣ 카카오 로그인 URL 가져오기
      print('1단계: 로그인 URL 요청');
      String loginUrl = await _authApi.getKakaoLoginUrl();
      print('받은 URL: $loginUrl');

      // 2️⃣ 웹뷰로 카카오 로그인 페이지 열기
      print('2단계: 웹뷰 열기');
      final code = await Navigator.push<String>(
        context,
        MaterialPageRoute(
          builder: (context) => KakaoLoginWebView(loginUrl: loginUrl),
        ),
      );

      print('받은 인가 코드: $code');

      if (code == null) {
        throw Exception('로그인 취소됨');
      }

      // 3️⃣ 인가 코드로 토큰 받기
      print('3단계: 토큰 받기');
      final member = await _authApi.kakaoCallback(code);
      print('로그인 성공! 회원: ${member['nickname']}');

      // 4️⃣ 홈 화면으로 이동
      print('4단계: 홈으로 이동');
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      print('로그인 실패: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('로그인 실패: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _loginWithKakao,
          child: Text('카카오 로그인'),
        ),
      ),
    );
  }
}
