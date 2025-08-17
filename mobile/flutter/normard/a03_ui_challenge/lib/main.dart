import 'package:a03_ui_challenge/widgets/button.dart';
import 'package:a03_ui_challenge/widgets/currency_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),

        body: SingleChildScrollView(
          child: Padding(
            // padding 집어 넣기
            // padding: EdgeInsets.all(20),
            // padding: const EdgeInsets.only(right: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Small Cookie!',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Welcome Back',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white.withValues(alpha: 0.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                        Text(
                          '\$ 5 194 482',
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'Transfer',
                      mainColor: Colors.amber,
                      fontColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      mainColor: Color(0xFF1F2123),
                      fontColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CurrencyCard(
                  bgColor: Color(0xFF1F2123),
                  currency: 'Euro',
                  isWhite: true,
                  currencyOf: 'EUR',
                  money: '4 628',
                  icon: Icons.euro_outlined,
                  offset: Offset(0, 0),
                ),
                CurrencyCard(
                  bgColor: Color(0XFFFAFAFA),
                  currency: 'Bitcoin',
                  isWhite: false,
                  currencyOf: 'BTC',
                  money: '9 785',
                  icon: Icons.currency_bitcoin_outlined,
                  offset: Offset(0, -40),
                ),
                CurrencyCard(
                  bgColor: Color(0xFF1F2123),
                  currency: 'Dollar',
                  isWhite: true,
                  money: '428',
                  currencyOf: 'USD',
                  icon: Icons.attach_money_outlined,
                  offset: Offset(0, -80),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
