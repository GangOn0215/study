import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  Color bgColor;
  Color mainColor;

  String money;
  String currency;
  String currencyAcron;

  IconData icon;
  Offset offset;

  MyCards({
    required this.bgColor,
    required this.mainColor,
    required this.money,
    required this.currency,
    required this.currencyAcron,
    required this.icon,
    required this.offset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Euro',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 36,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '1 415 112',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'EUR',
                      style: TextStyle(
                        color: mainColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              icon,
              color: mainColor,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
