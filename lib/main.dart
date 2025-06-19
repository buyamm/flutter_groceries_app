import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/cubit/cart_cubit.dart';
import 'package:flutter_groceries_app/cubit/cart_item_cubit.dart';
import 'package:flutter_groceries_app/cubit/explore_cubit.dart';
import 'package:flutter_groceries_app/cubit/home_cubit.dart';
import 'package:flutter_groceries_app/cubit/login_cubit.dart';
import 'package:flutter_groceries_app/screens/cart.dart';
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
  bool _isLoggedIn = false;
  int _currentSelectedIndex = 0;

  void _handleLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void onTapSelectedItem(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', // Đặt font mặc định
        primarySwatch: Colors.blue,
      ),
      home: _isLoggedIn ? _buildMainApp() : _buildLoginScreen(),
      // home: _buildMainApp(),
    );
  }

  Widget _buildMainApp() {
    final pages = [
      BlocProvider(create: (_) => HomeCubit(), child: HomePage()),
      BlocProvider(create: (_) => ExploreCubit(), child: ExplorePage()),
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CartCubit()),
          BlocProvider(create: (_) => CartItemCubit()),
        ],
        child: CartPage(),
      ),
      Placeholder(),
      ProfilePage(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentSelectedIndex, children: pages),
      bottomNavigationBar: BottomBar(
        currentSelectedIndex: _currentSelectedIndex,
        onTap: onTapSelectedItem,
      ),
    );
  }

  Widget _buildLoginScreen() {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: LoginPage(onLoginSuccess: _handleLoginSuccess),
    );
  }
}
