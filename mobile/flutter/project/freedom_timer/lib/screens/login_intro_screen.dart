import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 60),
            child: Column(
              children: [
                Center(
                  child: Text(
                    '나만의 출퇴근 메이트',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '퇴근냥이',
                    style: TextStyle(color: Colors.orange, fontSize: 45),
                  ),
                ),

                SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: '이메일을 입력하세요.',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '패스워드를 입력하세요.',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                /**
                 * 아이디 & 패스워드 & 회원가입
                 */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '회원가입',
                        style: TextStyle(color: Color(0xFF757575)),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '아이디 찾기',
                            style: TextStyle(color: Color(0xFF757575)),
                          ),
                        ),
                        Text('|'),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '비밀번호 찾기',
                            style: TextStyle(color: Color(0xFF757575)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //// 로그인 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      '로그인',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),

                //
                SizedBox(height: 40),
                Text('간편 로그인'),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print('네이버 클릭');
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/naver_circle_icon.png',
                          width: 50,
                          height: 50,
                          cacheWidth: 50, // 디코딩할 너비
                          cacheHeight: 50, // 디코딩할 높이
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        print('카카오 클릭');
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/kakao_circle_icon.png',
                          width: 50,
                          height: 50,
                          cacheWidth: 50, // 디코딩할 너비
                          cacheHeight: 50, // 디코딩할 높이
                        ),
                      ),
                    ),
                    SizedBox(width: 15),

                    InkWell(
                      onTap: () {
                        print('구글 클릭');
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/google_circle_icon.png',
                          width: 50,
                          height: 50,
                          cacheWidth: 50, // 디코딩할 너비
                          cacheHeight: 50, // 디코딩할 높이
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
