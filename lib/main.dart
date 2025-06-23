import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/presentation/features/cart/cubit/cart_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/cart/cubit/cart_item_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/explore/cubit/explore_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/home/cubit/home_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/login/cubit/login_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/profile/cubit/profile_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/signup/cubit/signup_cubit.dart';
import 'package:flutter_groceries_app/presentation/features/cart/view/cart.dart';
import 'package:flutter_groceries_app/presentation/features/explore/view/explore.dart';
import 'package:flutter_groceries_app/presentation/features/home/view/home.dart';
import 'package:flutter_groceries_app/presentation/features/login/view/login.dart';
import 'package:flutter_groceries_app/presentation/features/profile/view/profile.dart';
import 'package:flutter_groceries_app/presentation/widgets/bottom_bar.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => SignupCubit()),
        BlocProvider(create: (_) => HomeCubit(), child: HomePage()),
        BlocProvider(create: (_) => ExploreCubit(), child: ExplorePage()),
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CartCubit()),
            BlocProvider(create: (_) => CartItemCubit()),
          ],
          child: CartPage(),
        ),
        BlocProvider(create: (_) => ProfileCubit(), child: ProfilePage()),
      ],
      child: const MyApp(),
    ),
  );
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
    );
  }

  Widget _buildMainApp() {
    final pages = [
      HomePage(),
      ExplorePage(),
      CartPage(),
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
