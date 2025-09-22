import 'package:flutter/material.dart';

class AccountHeaderText extends StatelessWidget {
  const AccountHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text("Lv. 1"),
      ],
    );
  }
}
