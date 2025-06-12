import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/data/explore_data.dart';
import 'package:flutter_groceries_app/data/product_data.dart';
import 'package:flutter_groceries_app/models/grocery_category.dart';
import 'package:flutter_groceries_app/models/product.dart';
import 'package:flutter_groceries_app/states/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void loadFoodTypes() {
    emit(
      state.copyWith(
        foodTypes:
            exploreProducts
                .map((toElement) => GroceryCategory.fromMap(toElement))
                .toList(),
      ),
    );
  }

  void selectedFoodType(GroceryCategory item) {
    final filteredItems =
        allOfProducts
            .where((element) => element['category'] == item.name)
            .toList();

    emit(
      state.copyWith(
        selectedFoodType: item.name,
        detailInformation: item.detailInformation,
        foodItems:
            filteredItems
                .map((toElement) => Product.fromMap(toElement))
                .toList(),
      ),
    );
  }
}
