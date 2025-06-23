import 'package:flutter_groceries_app/domain/entity/grocery_category.dart';
import 'package:flutter_groceries_app/domain/entity/product.dart';

class CartState {
  final String selectedFoodType;
  final String detailInformation;
  final List<GroceryCategory> foodTypes; // khoi tao san data
  final List<Product> foodItems;

  CartState({
    required this.selectedFoodType,
    required this.detailInformation,
    required this.foodTypes,
    required this.foodItems,
  });

  factory CartState.initial() => CartState(
    selectedFoodType: '',
    detailInformation: '',
    foodTypes: [],
    foodItems: [],
  );

  CartState copyWith({
    String? selectedFoodType,
    String? detailInformation,
    bool? isExpandedPanel,
    List<GroceryCategory>? foodTypes,
    List<Product>? foodItems,
  }) {
    return CartState(
      selectedFoodType: selectedFoodType ?? this.selectedFoodType,
      detailInformation: detailInformation ?? this.detailInformation,
      foodTypes: foodTypes ?? this.foodTypes,
      foodItems: foodItems ?? this.foodItems,
    );
  }
}
