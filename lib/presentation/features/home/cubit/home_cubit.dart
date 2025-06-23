import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/data/product_data.dart';
import 'package:flutter_groceries_app/domain/entity/grocery_category.dart';
import 'package:flutter_groceries_app/domain/entity/product.dart';
import 'package:flutter_groceries_app/presentation/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void loadHomePage() async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

    await Future.delayed(Duration(seconds: 5));

    emit(
      state.copyWith(
        homeStatus: HomeStatus.loaded,
        exclusiveOffers:
            productsExclusiveOffer.map((e) => Product.fromMap(e)).toList(),
        bestSelling:
            productsBestSelling.map((e) => Product.fromMap(e)).toList(),
        groceries: productsGroceries.map((e) => Product.fromMap(e)).toList(),
        groceryTypes:
            typeOfGroceries.map((e) => GroceryCategory.fromMap(e)).toList(),
      ),
    );
  }
}
