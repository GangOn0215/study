import 'package:a03_ui_challenge/widget/currency_card.dart';
import 'package:a03_ui_challenge/widget/my_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Coxe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '₩11 134 290',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      text: 'Transfer',
                      bgColor: const Color(0XFFF2B33A),
                      textColor: Colors.black,
                    ),
                    MyButton(
                      text: 'Request',
                      bgColor: const Color(0XFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CurrencyCard(
                  text: 'Euro',
                  money: '6 428',
                  currency: 'EUR',
                  bgColor: const Color(0XFF1F2123),
                  mainColor: Colors.white,
                  icon: Icons.euro_outlined,
                  offset: const Offset(0, 0),
                ),
                CurrencyCard(
                  text: 'Bitcoin',
                  money: '9 785',
                  currency: 'BTC',
                  bgColor: Colors.white,
                  mainColor: const Color(0XFF1F2123),
                  icon: Icons.currency_bitcoin_outlined,
                  offset: const Offset(0, -40),
                ),
                CurrencyCard(
                  text: 'Euro',
                  money: '6 428',
                  currency: 'EUR',
                  bgColor: const Color(0XFF1F2123),
                  mainColor: Colors.white,
                  icon: Icons.attach_money_rounded,
                  offset: const Offset(0, -80),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
