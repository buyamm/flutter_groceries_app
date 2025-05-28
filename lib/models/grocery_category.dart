class GroceryCategory {
  final String name;
  final int bgColor;
  final String image;

  GroceryCategory({
    required this.name,
    required this.bgColor,
    required this.image,
  });

  factory GroceryCategory.fromMap(Map<String, dynamic> map) {
    return GroceryCategory(
      name: map['name'],
      bgColor: map['bgColor'],
      image: map['image'],
    );
  }
}
