import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/presentation/features/explore/cubit/explore_cubit.dart';
import 'package:flutter_groceries_app/data/explore_data.dart';
import 'package:flutter_groceries_app/presentation/features/explore/cubit/explore_state.dart';
import 'package:flutter_groceries_app/presentation/widgets/explore_card.dart';
import 'package:flutter_groceries_app/presentation/widgets/search_bar.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    super.initState();
    context.read<ExploreCubit>().loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          return Stack(
            children: [
              // Nội dung chính bao gồm cả AppBar custom
              Column(
                children: [
                  // AppBar tự custom
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    color: Color(0xFFF2F3F2),
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "Find Products",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
                                childAspectRatio: 0.9,
                                children:
                                    state.exploreProducts.map((product) {
                                      return GestureDetector(
                                        onTap: () {
                                          context
                                              .read<ExploreCubit>()
                                              .selectItem(product.name);
                                        },
                                        child: ExploreCard(
                                          name: product.name,
                                          image: product.image,
                                          bgColor: product.bgColor,
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Loading overlay che toàn màn hình
              if (state.isLoading)
                Container(
                  color: Colors.black.withOpacity(0.6),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}
