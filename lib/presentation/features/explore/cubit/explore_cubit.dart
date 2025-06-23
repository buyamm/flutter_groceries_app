import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/data/explore_data.dart';
import 'package:flutter_groceries_app/domain/entity/grocery_category.dart';
import 'package:flutter_groceries_app/presentation/features/explore/cubit/explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState.initial());

  void loadItems() {
    emit(
      state.copyWith(
        exploreProducts:
            exploreProducts.map((e) => GroceryCategory.fromMap(e)).toList(),
      ),
    );
  }

  void selectItem(String item) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(isLoading: false));
  }
}
