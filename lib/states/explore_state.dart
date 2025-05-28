import 'package:flutter_groceries_app/models/grocery_category.dart';

class ExploreState {
  final bool isLoading;
  final List<GroceryCategory> exploreProducts;

  ExploreState({required this.isLoading, required this.exploreProducts});

  factory ExploreState.initial() =>
      ExploreState(isLoading: false, exploreProducts: []);

  ExploreState copyWith({
    bool? isLoading,
    List<GroceryCategory>? exploreProducts,
  }) {
    return ExploreState(
      isLoading: isLoading ?? this.isLoading,
      exploreProducts: exploreProducts ?? this.exploreProducts,
    );
  }
}
