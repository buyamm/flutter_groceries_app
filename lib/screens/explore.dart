import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/data/explore_data.dart';
import 'package:flutter_groceries_app/widgets/explore_card.dart';
import 'package:flutter_groceries_app/widgets/search_bar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F3F2),
        title: Text(
          "Find Products",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              MySearchBar(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: GridView.count(
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9, // cang nho cang dai`
                    children: List.generate(exploreProducts.length, (index) {
                      final product = exploreProducts[index];
                      return ExploreCard(
                        name: product["name"],
                        image: product["image"],
                        bgColor: product["bgColor"],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
