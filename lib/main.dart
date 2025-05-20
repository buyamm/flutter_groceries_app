import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/screens/explore.dart';
import 'package:flutter_groceries_app/screens/home.dart';
import 'package:flutter_groceries_app/screens/login.dart';
import 'package:flutter_groceries_app/screens/profile.dart';
import 'package:flutter_groceries_app/widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  int _currentSelectedIndex = 0;

  final List<Widget> _pages = [HomePage(), ExplorePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto', // Đặt font mặc định
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: IndexedStack(index: _currentSelectedIndex, children: _pages),
        bottomNavigationBar: BottomBar(
          currentSelectedIndex: _currentSelectedIndex,
          onTap: onTapSelectedItem,
        ),
      ),
    );
  }

  void onTapSelectedItem(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }
}
