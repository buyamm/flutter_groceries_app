import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/home.dart';
import 'package:flutter_groceries_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto', // Đặt font mặc định
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
