import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  int number = 0;

  NumberButton({super.key, required this.number});

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // 버튼 배경색
          foregroundColor: Colors.white, // 텍스트/아이콘 색
          minimumSize: const Size(80, 80), // 버튼 크기
          shape: RoundedRectangleBorder(
            // 모양
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black), // 테두리
          ),
          padding: EdgeInsets.zero, // 내부 패딩
        ),
        onPressed: () {
          debugPrint("Button ${widget.number} clicked");
        },
        child: Text(
          '${widget.number}',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
