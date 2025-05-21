import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/data/product_data.dart';
import 'package:flutter_groceries_app/widgets/product_card.dart';
import 'package:flutter_groceries_app/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                child: MySearchBar(),
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
    );
  }
}
