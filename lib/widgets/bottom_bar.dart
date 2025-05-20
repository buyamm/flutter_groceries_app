import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/screens/explore.dart';
import 'package:flutter_groceries_app/screens/profile.dart';

class BottomBar extends StatelessWidget {
  final int currentSelectedIndex;
  final Function(int) onTap;

  const BottomBar({
    super.key,
    required this.currentSelectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          label: "Account",
        ),
      ],
      currentIndex: currentSelectedIndex,
      selectedItemColor: Color(0xff53B175),
      elevation: 3,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
    );
  }
}
