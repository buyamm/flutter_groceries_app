import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/data/product_data.dart';
import 'package:flutter_groceries_app/screens/explore.dart';
import 'package:flutter_groceries_app/screens/profile.dart';
import 'package:flutter_groceries_app/widgets/product_category.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F3F2),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 26,
              height: 30,
              child: Image.asset("lib/assets/images/logo.png"),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map_outlined, color: Colors.black54),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        "Dhaka, Banassre",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: StandardSearchBar(
                  hintText: 'Search Store',
                  backgroundColor: Color(0xFFF2F3F2),
                  startIconSize: 30,
                  startIconColor: Colors.black,
                  onChanged: (value) {
                    // Handle search input change
                  },
                  onSubmitted: (value) {
                    // Handle search submission
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          "lib/assets/images/banner.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    ProductCategory(
                      title: "Exclusive Offer",
                      products: productsExclusiveOffer,
                      haveSubCard: false,
                    ),
                    ProductCategory(
                      title: "Best Selling",
                      products: productsBestSelling,
                      haveSubCard: false,
                    ),
                    ProductCategory(
                      title: "Groceries",
                      products: productsGroceries,
                      haveSubCard: true,
                      typeOfCategory: typeOfGroceries,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Cart"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "Account",
          ),
        ],
        currentIndex: _currentSelectedIndex,
        selectedItemColor: Color(0xff53B175),
        elevation: 3,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => onTapSelectedItem(value),
      ),
    );
  }

  void onTapSelectedItem(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });

    if (_currentSelectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExplorePage()),
      );
    } else if (_currentSelectedIndex == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }
}
