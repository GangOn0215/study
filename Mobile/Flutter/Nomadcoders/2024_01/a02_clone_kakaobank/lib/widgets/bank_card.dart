import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final String name;
  final String nameEtc;
  final String amount;
  final IconData icon;
  final Color mainColor;
  final bool isBlack;

  const BankCard({
    super.key,
    required this.name,
    this.nameEtc = '',
    required this.amount,
    required this.icon,
    required this.mainColor,
    required this.isBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.more_horiz_outlined,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Icon(
                  icon,
                  color: isBlack ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: isBlack ? Colors.black : Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      nameEtc != ''
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                nameEtc,
                                style: TextStyle(
                                  color: isBlack ? Colors.black : Colors.white,
                                  fontSize: 6,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : const Text(''),
                      const SizedBox(
                        width: 3,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$amount원",
                    style: TextStyle(
                      color: isBlack ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '카드',
                  style: TextStyle(
                      color: isBlack ? Colors.black : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '이체',
                  style: TextStyle(
                      color: isBlack ? Colors.black : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
