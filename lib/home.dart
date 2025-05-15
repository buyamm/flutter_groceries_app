import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/explore.dart';
import 'package:flutter_groceries_app/product_detail.dart';
import 'package:flutter_groceries_app/profile.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> productsExclusiveOffer = [
    {
      "name": "Organic Banana",
      "price": 4.99,
      "unit": "7pcs, Prices",
      "image": "lib/assets/images/apple.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    // thêm nhiều sản phẩm nữa...
  ];

  final List<Map<String, dynamic>> productsBestSelling = [
    {
      "name": "Organic Banana",
      "price": 4.99,
      "unit": "7pcs, Prices",
      "image": "lib/assets/images/apple.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    // thêm nhiều sản phẩm nữa...
  ];

  final List<Map<String, dynamic>> productsGroceries = [
    {
      "name": "Organic Banana",
      "price": 4.99,
      "unit": "7pcs, Prices",
      "image": "lib/assets/images/apple.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    {
      "name": "Red Apple",
      "price": 3.49,
      "unit": "1kg, Prices",
      "image": "lib/assets/images/banana.png",
    },
    // thêm nhiều sản phẩm nữa...
  ];

  final List<Map<String, dynamic>> typeOfGroceries = [
    {
      "name": "Pulces",
      "bgColor": 0xFF53B175,
      "image": "lib/assets/images/cereal.png",
    },
    {
      "name": "Rice",
      "bgColor": 0xFFF8A44C,
      "image": "lib/assets/images/rice.png",
    },
  ];
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Exclusive Offer",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Color(0xff53B175),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsExclusiveOffer.length,
                              itemBuilder: (context, index) {
                                final product = productsExclusiveOffer[index];
                                return GestureDetector(
                                  onTap:
                                      () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => ProductDetail(),
                                          ),
                                        ),
                                      },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      right: 12,
                                    ), // Khoảng cách giữa các item
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    width: 170,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 90,
                                              height: 80,
                                              child: Image.asset(
                                                product["image"],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 2.0,
                                              top: 4,
                                            ),
                                            child: Text(
                                              product["name"],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            product["unit"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${product["price"].toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 46,
                                                height: 46,
                                                child: FloatingActionButton(
                                                  onPressed: () {},
                                                  backgroundColor: const Color(
                                                    0xFF53B175,
                                                  ),
                                                  elevation: 0, // do bong'
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 26,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Best selling",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Color(0xff53B175),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsBestSelling.length,
                              itemBuilder: (context, index) {
                                final product = productsBestSelling[index];
                                return GestureDetector(
                                  onTap:
                                      () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => ProductDetail(),
                                          ),
                                        ),
                                      },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      right: 12,
                                    ), // Khoảng cách giữa các item
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    width: 170,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 90,
                                              height: 80,
                                              child: Image.asset(
                                                product["image"],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 2.0,
                                              top: 4,
                                            ),
                                            child: Text(
                                              product["name"],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            product["unit"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${product["price"].toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 46,
                                                height: 46,
                                                child: FloatingActionButton(
                                                  onPressed: () {},
                                                  backgroundColor: const Color(
                                                    0xFF53B175,
                                                  ),
                                                  elevation: 0, // do bong'
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 26,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Groceries",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Color(0xff53B175),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: typeOfGroceries.length,
                              itemBuilder: (context, index) {
                                final product = typeOfGroceries[index];
                                return Container(
                                  margin: const EdgeInsets.only(
                                    right: 12,
                                    bottom: 10,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width *
                                      0.7, // 70% chiều rộng màn hình
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color(product['bgColor']),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 72,
                                        height: 72,
                                        child: Image.asset(
                                          product["image"].toString(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10.0,
                                        ),
                                        child: Text(
                                          product['name'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsGroceries.length,
                              itemBuilder: (context, index) {
                                final product = productsGroceries[index];
                                return GestureDetector(
                                  onTap:
                                      () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => ProductDetail(),
                                          ),
                                        ),
                                      },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      right: 12,
                                    ), // Khoảng cách giữa các item
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    width: 170,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 90,
                                              height: 80,
                                              child: Image.asset(
                                                product["image"],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 2.0,
                                              top: 4,
                                            ),
                                            child: Text(
                                              product["name"],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            product["unit"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${product["price"].toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 46,
                                                height: 46,
                                                child: FloatingActionButton(
                                                  onPressed: () {},
                                                  backgroundColor: const Color(
                                                    0xFF53B175,
                                                  ),
                                                  elevation: 0, // do bong'
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 26,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
