import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/presentation/features/product_detail/cubit/product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final int _maxValue = 5;
  final int _minValue = 1;
  ProductDetailCubit() : super(ProductDetailState.initial());

  void onFavoriteChange(bool isFavorite) {
    emit(state.copyWith(isFavorite: !isFavorite));
  }

  void increaseProductHandle() {
    if (state.currentValue < _maxValue) {
      emit(state.copyWith(currentValue: state.currentValue + 1));
    }
  }

  void decreaseProductHandle() {
    if (state.currentValue > _minValue) {
      emit(state.copyWith(currentValue: state.currentValue - 1));
    }
  }
}
