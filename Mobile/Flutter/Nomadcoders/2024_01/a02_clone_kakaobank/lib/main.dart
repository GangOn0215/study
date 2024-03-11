import 'package:a02_clone_kakaobank/widgets/bank_card.dart';
import 'package:a02_clone_kakaobank/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const CustomAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                BankCard(
                  name: '자유 통장',
                  nameEtc: '한도 계좌',
                  amount: '369,640',
                  icon: Icons.ac_unit_rounded,
                  mainColor: Colors.red.shade400,
                  isBlack: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                BankCard(
                  name: '월급, 적금',
                  amount: '647,382',
                  icon: Icons.savings_outlined,
                  mainColor: Colors.yellow.shade700,
                  isBlack: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
