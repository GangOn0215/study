import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: SizedBox()), // 왼쪽 비우기
          Expanded(
            child: Center(
              child: Text('2025-01-01', style: TextStyle(fontSize: 24)),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz_outlined, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
