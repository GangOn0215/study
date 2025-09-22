import 'package:flutter/material.dart';

class AccountHeaderManage extends StatelessWidget {
  const AccountHeaderManage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.manage_accounts, color: Colors.white),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
