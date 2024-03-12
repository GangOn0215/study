import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  String text;
  String money;
  String currency;
  Color bgColor;
  Color mainColor;
  IconData icon;
  Offset offset;

  CurrencyCard({
    required this.text,
    required this.money,
    required this.currency,
    required this.bgColor,
    required this.mainColor,
    required this.icon,
    required this.offset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '6 428',
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'EUR',
                      style: TextStyle(
                        color: mainColor.withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2.5,
              child: Transform.translate(
                offset: const Offset(-5, 10),
                child: Icon(
                  icon,
                  color: mainColor,
                  size: 88,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
