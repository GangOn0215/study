import 'package:a01_box_list/widgets/alphabet_box.dart';
import 'package:flutter/material.dart';

class HomeAlphabetGrid extends StatelessWidget {
  HomeAlphabetGrid({super.key});

  final List<AlphabetBox> alphabetList = [
    const AlphabetBox(color: Color(0xFFFF9AA2), letter: 'A'), // 진한 핑크
    const AlphabetBox(color: Color(0xFFFFD97D), letter: 'B'), // 진한 노랑
    const AlphabetBox(color: Color(0xFF9DD9F3), letter: 'C'), // 진한 하늘
    const AlphabetBox(color: Color(0xFFA1E5AB), letter: 'D'), // 연두
    const AlphabetBox(color: Color(0xFFB39DDB), letter: 'E'), // 보라
    const AlphabetBox(color: Color(0xFFFFCC80), letter: 'F'), // 살구
    const AlphabetBox(color: Color(0xFFF48FB1), letter: 'G'), // 장밋빛
    const AlphabetBox(color: Color(0xFF80CBC4), letter: 'H'), // 민트
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal, // 나열 방향
      alignment: WrapAlignment.start, // 정렬 방식
      crossAxisAlignment: WrapCrossAlignment.center, // 교차 축 정렬
      spacing: 5, // 좌우 간격
      runSpacing: 5, // 상하 간격
      children: alphabetList,
    );
  }
}
