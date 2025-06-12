import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/models/product.dart';
import 'package:flutter_groceries_app/states/cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  final int _maxValue = 5;
  final int _minValue = 1;

  CartItemCubit() : super(CartItemState.initial());

  void addToCart(String category, Product product) {
    final updated = Map<String, List<(Product, int)>>.from(state.groupedItems);

    final productList = updated[category] ?? [];

    // Kiểm tra sản phẩm đã tồn tại chưa
    final index = productList.indexWhere(
      (entry) => entry.$1.name == product.name,
    );

    if (index != -1) {
      final currentCount = productList[index].$2;

      if (currentCount < _maxValue) {
        productList[index] = (product, currentCount + 1);
      } else {
        emit(
          state.copyWith(
            errorAlert:
                "Your cart is full of this item (maximum $_maxValue items).",
          ),
        );
        return;
      }
    } else {
      productList.add((product, 1));
    }

    updated[category] = productList;

    emit(state.copyWith(groupedItems: updated));
  }

  void increaseProductHandle(String category, Product product) {
    final updated = Map<String, List<(Product, int)>>.from(state.groupedItems);
    final productList = updated[category];

    if (productList == null) return;

    final index = productList.indexWhere(
      (entry) => entry.$1.name == product.name,
    );
    if (index == -1) return;

    final currentCount = productList[index].$2;

    if (currentCount < _maxValue) {
      productList[index] = (product, currentCount + 1);
      updated[category] = productList;
      emit(state.copyWith(groupedItems: updated));
    }
  }

  void decreaseProductHandle(String category, Product product) {
    final updated = Map<String, List<(Product, int)>>.from(state.groupedItems);
    final productList = updated[category];

    if (productList == null) return;

    final index = productList.indexWhere(
      (entry) => entry.$1.name == product.name,
    );
    if (index == -1) return;

    final currentCount = productList[index].$2;

    if (currentCount > _minValue) {
      productList[index] = (product, currentCount - 1);
      updated[category] = productList;
      emit(state.copyWith(groupedItems: updated));
    }
  }
}
