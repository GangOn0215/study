import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitingCat extends StatelessWidget {
  const WaitingCat({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Lottie.asset('assets/animations/waiting_cat.json'),
    );
  }
}
