import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Center(child: Text(title)),
      elevation: 0,
      automaticallyImplyLeading: false,
      // You can further customize the app bar here
    );
  }
}
