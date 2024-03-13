import 'package:a03_ui_challenge_practice/widget/my_buttons.dart';
import 'package:a03_ui_challenge_practice/widget/my_cards.dart';
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
        backgroundColor: const Color(0XFF181818),
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
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 28,
                  ),
                ),
                const Text(
                  '₩11 134 290',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButtons(
                      text: 'Transfer',
                      bgColor: const Color(0XFFF2B33A),
                      textColor: Colors.black,
                    ),
                    MyButtons(
                      text: 'Request',
                      bgColor: const Color(0XFF323232),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                      'Request',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                MyCards(
                  bgColor: const Color(0XFF323232),
                  mainColor: Colors.white,
                  money: '1 415 112',
                  currency: 'Euro',
                  currencyAcron: 'EUR',
                  icon: Icons.euro,
                  offset: const Offset(0, 0),
                ),
                MyCards(
                  bgColor: Colors.white,
                  mainColor: const Color(0XFF323232),
                  money: '873 619',
                  currency: 'Won',
                  currencyAcron: 'KRW',
                  icon: Icons.usb_rounded,
                  offset: const Offset(0, -40),
                ),
                MyCards(
                  bgColor: const Color(0XFF323232),
                  mainColor: Colors.white,
                  money: '1 415 112',
                  currency: 'Dollar',
                  currencyAcron: 'USD',
                  icon: Icons.attach_money_outlined,
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
