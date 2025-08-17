import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.bgColor,
    required this.currency,
    required this.isWhite,
    required this.money,
    required this.currencyOf,
    required this.icon,
    required this.offset,
  });

  final Color bgColor;
  final String currency;
  final String currencyOf;
  final String money;
  final bool isWhite; // 흰색, 검정 반전 처리
  final IconData icon;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency,
                  style: TextStyle(
                    color: isWhite ? Colors.white : Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      money,
                      style: TextStyle(
                        color: isWhite ? Colors.white : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      currencyOf,
                      style: TextStyle(
                        fontSize: 14,
                        color: isWhite
                            ? Colors.white.withValues(alpha: 0.6)
                            : Colors.black.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: Offset(-15, 20),
                child: Icon(
                  icon,
                  color: isWhite ? Colors.white : Colors.black,
                  size: 98,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
