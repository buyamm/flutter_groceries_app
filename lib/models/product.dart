import 'package:flutter_groceries_app/models/has_image_name.dart';

class Product implements HasImageAndName {
  final String name;
  final double price;
  final String unit;
  final String category;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.unit,
    required this.category,
    required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      unit: map['unit'],
      category: map['category'],
      image: map['image'],
    );
  }
}
