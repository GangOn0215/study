import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // 꼭 필요함

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('App', style: TextStyle(color: Colors.white60)),
      backgroundColor: Colors.blue.shade400,
    );
  }
}
