import 'package:flutter/material.dart';
import 'package:freedom_timer/theme/app_colors.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('팡팡월드 🐱')),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white38,
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 왼쪽 영역 (아이콘 + 정보)
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.24, // 화면 너비의 18%
                          child: const AccountHeaderIcon(),
                        ),
                        Expanded(
                          child: AccountHeaderInfo(), // 닉네임 + 이메일
                        ),
                      ],
                    ),
                  ),
                  // 오른쪽 관리 버튼
                  const AccountHeaderManage(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white38,
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 100, // 높이
                      color: Colors.white,
                      child: const Center(child: Text('나는 바텀시트 👋')),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 28),
                        SizedBox(width: 10),
                        Text('출/퇴근시간 설정', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_right_outlined, size: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
