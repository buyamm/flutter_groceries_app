class ProductDetailState {
  final bool isFavorite;
  final int currentValue;

  ProductDetailState({required this.isFavorite, required this.currentValue});

  factory ProductDetailState.initial() =>
      ProductDetailState(isFavorite: false, currentValue: 1);

  ProductDetailState copyWith({bool? isFavorite, int? currentValue}) {
    return ProductDetailState(
      isFavorite: isFavorite ?? this.isFavorite,
      currentValue: currentValue ?? this.currentValue,
    );
  }
}
