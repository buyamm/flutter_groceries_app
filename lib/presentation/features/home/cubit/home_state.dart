import 'package:flutter_groceries_app/domain/entity/grocery_category.dart';
import 'package:flutter_groceries_app/domain/entity/product.dart';

enum HomeStatus { loading, loaded }

class HomeState {
  final HomeStatus homeStatus;
  final List<Product> exclusiveOffers;
  final List<Product> bestSelling;
  final List<Product> groceries;
  final List<GroceryCategory> groceryTypes;

  HomeState({
    required this.homeStatus,
    required this.exclusiveOffers,
    required this.bestSelling,
    required this.groceries,
    required this.groceryTypes,
  });

  factory HomeState.initial() => HomeState(
    homeStatus: HomeStatus.loading,
    exclusiveOffers: [],
    bestSelling: [],
    groceries: [],
    groceryTypes: [],
  );

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<Product>? exclusiveOffers,
    List<Product>? bestSelling,
    List<Product>? groceries,
    List<GroceryCategory>? groceryTypes,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
      exclusiveOffers: exclusiveOffers ?? this.exclusiveOffers,
      bestSelling: bestSelling ?? this.bestSelling,
      groceries: groceries ?? this.groceries,
      groceryTypes: groceryTypes ?? this.groceryTypes,
    );
  }
}
