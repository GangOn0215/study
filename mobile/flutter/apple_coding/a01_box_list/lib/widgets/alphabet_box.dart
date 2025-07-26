import 'package:flutter/material.dart';

class AlphabetBox extends StatelessWidget {
  const AlphabetBox({super.key, required this.color, required this.letter});

  final Color color;
  final String letter;

  static const double _maxWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _maxWidth,
      height: _maxWidth,
      margin: EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(color: color),
      child: Center(
        child: Text(
          letter,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
