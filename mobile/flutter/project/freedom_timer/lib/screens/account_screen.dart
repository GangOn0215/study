import 'package:flutter/material.dart';

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
                crossAxisAlignment:
                    CrossAxisAlignment.center, // 아이콘과 Column 세로 정렬
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(
                      Icons.account_circle_sharp,
                      size: 84,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12), // 아이콘과 텍스트 사이 간격
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                      mainAxisAlignment: MainAxisAlignment.center, // 세로 가운데 정렬
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "푸른색 맛 쿠키 ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "(dmsqlctnekf@gmail.com)",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text("Lv. 1"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
