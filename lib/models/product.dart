class Product {
  final String name;
  final double price;
  final String unit;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.unit,
    required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      unit: map['unit'],
      image: map['image'],
    );
  }
}
