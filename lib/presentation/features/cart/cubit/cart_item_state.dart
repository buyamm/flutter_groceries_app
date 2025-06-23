import 'package:flutter_groceries_app/domain/entity/product.dart';

class CartItemState {
  // Map<String, List<(Product, int)>> groupedItems = {
  //   "Fruits": [
  //     (Product(name: "Apple", unit: "kg", image: "assets/images/apple.png"), 2),
  //     (Product(name: "Banana", unit: "bunch", image: "assets/images/banana.png"), 1),
  //   ],
  //   "Vegetables": [
  //     (Product(name: "Broccoli", unit: "piece", image: "assets/images/broccoli.png"), 3),
  //   ],
  // };
  final Map<String, List<(Product, int)>> groupedItems;
  final String errorAlert;

  CartItemState({required this.groupedItems, this.errorAlert = ''});

  factory CartItemState.initial() => CartItemState(groupedItems: {});

  CartItemState copyWith({
    Map<String, List<(Product, int)>>? groupedItems,
    String? errorAlert,
  }) {
    return CartItemState(
      groupedItems: groupedItems ?? this.groupedItems,
      errorAlert: errorAlert ?? this.errorAlert,
    );
  }
}
