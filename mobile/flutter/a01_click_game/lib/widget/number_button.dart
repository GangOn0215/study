import 'dart:math';
import 'package:flutter/material.dart';

class NumberButton extends StatefulWidget {
  final int number; // 버튼에 보일 숫자(랜덤)
  final int slot; // 부모에서 계산한 위치 번호(1~9)
  final int secsLeft; // 부모에서 전달받은 남은 초
  final void Function(int slot, int value)? onTap; // 부모에게 보고
  final int maxTimeSecond = 5;

  const NumberButton({
    super.key,
    required this.number,
    required this.slot,
    required this.secsLeft,
    this.onTap,
  });

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  bool? _manualFront; // null: 자동, true: 강제 앞면, false: 강제 뒷면

  @override
  void didUpdateWidget(covariant NumberButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.secsLeft != widget.secsLeft &&
        widget.secsLeft == widget.maxTimeSecond) {
      _manualFront = null; // 새 라운드 시작 시 수동 토글 해제
    }
  }

  bool get _showFront {
    if (_manualFront != null) return _manualFront!;
    return widget.secsLeft > 0; // 기본은 부모 타이머 상태 따름
  }

  void _handleTap() {
    setState(() {
      _manualFront = !_showFront;
    });
    widget.onTap?.call(widget.slot, widget.number);
  }

  @override
  Widget build(BuildContext context) {
    final double targetAngle = _showFront ? 0.0 : pi;

    return Container(
      margin: const EdgeInsets.all(6),
      width: 80,
      height: 80,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: targetAngle, end: targetAngle),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        builder: (context, angle, _) {
          final Matrix4 base = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);

          final bool showFrontNow = angle <= pi / 2;

          Widget face = showFrontNow
              ? _CardFace(
                  text: '${widget.number}',
                  onPressed: !_showFront ? _handleTap : () {},
                )
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: _CardFace(text: '?', onPressed: _handleTap),
                );

          return Transform(
            alignment: Alignment.center,
            transform: base,
            child: face,
          );
        },
      ),
    );
  }
}

class _CardFace extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _CardFace({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.black),
        ),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 24)),
    );
  }
}
