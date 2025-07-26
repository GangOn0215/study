import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext content) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.call),
          Icon(Icons.message),
          Icon(Icons.contact_page_sharp),
        ],
      ),
    );
  }
}
