import 'package:flutter/material.dart';
import 'package:freedom_timer/widgets/account_header_icon.dart';
import 'package:freedom_timer/widgets/account_header_manage.dart';
import 'package:freedom_timer/widgets/account_header_info.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('팡팡월드 🐱')),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AccountHeaderIcon(), // 회원의 프로필 이미지
                      const SizedBox(width: 12), // 아이콘과 텍스트 사이 간격
                      AccountHeaderInfo(), // 회원의 닉네임
                    ],
                  ),
                  Row(children: [AccountHeaderManage(), SizedBox(width: 10)]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
