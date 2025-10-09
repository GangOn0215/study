import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoLogin extends StatefulWidget {
  const KakaoLogin({super.key});

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  bool _isLoading = false;
  bool _loginFailed = false;

  @override
  void initState() {
    super.initState();
    // _initLogin();
  }

  Future<void> _initLogin() async {
    var success = await checkKakaoLogin();

    if (!mounted) return;

    if (success) {
      context.go('/');
    } else {
      setState(() {
        _isLoading = false;
        _loginFailed = true;
      });
    }
  }

  Future<bool> checkKakaoLogin() async {
    try {
      if (await isKakaoTalkInstalled()) {
        print('✅ 카카오톡 로그인 시도');
        var token = await UserApi.instance.loginWithKakaoTalk();

        print(token);
        return true;
      } else {
        print('✅ 카카오계정 로그인 시도');
        var token = await UserApi.instance.loginWithKakaoAccount();
        var userInfo = await UserApi.instance.me();

        print(token);
        print(userInfo);

        return true;
      }
    } catch (error) {
      print('❌ 로그인 실패: $error');

      if (error is PlatformException && error.code == 'CANCELED') {
        print('사용자가 로그인 취소');
        return false;
      }

      try {
        print('🔁 fallback: 카카오계정 로그인 재시도');
        await UserApi.instance.loginWithKakaoAccount();
        return true;
      } catch (error) {
        print('❌ fallback 실패: $error');
        return false;
      }
    }
  }

  Future<void> _onLoginButtonPressed() async {
    setState(() {
      _isLoading = true;
      _loginFailed = false;
    });

    await _initLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/kakao_login_medium_wide.png',
                    height: 50,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onLoginButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEE500), // 카카오 노란색
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('카카오로 로그인'),
                  ),
                  if (_loginFailed)
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        '로그인에 실패했습니다. 다시 시도해주세요.',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
