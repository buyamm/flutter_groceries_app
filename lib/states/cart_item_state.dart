import 'package:flutter_groceries_app/models/product.dart';

class CartItemState {
  final List<Map<String, Product>> items; // Map <TenLoai, THongTinItem>
  final List<Map<String, int>>
  itemCount; // Map<TenItem, SoLuongItem trong gio hang>

  CartItemState({required this.items, required this.itemCount});

  factory CartItemState.initial() => CartItemState(items: [], itemCount: []);

  CartItemState copyWith({
    List<Map<String, Product>>? items, // Map <TenLoai, THongTinItem>
    List<Map<String, int>>? itemCount,
  }) {
    return CartItemState(
      items: items ?? this.items,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}
