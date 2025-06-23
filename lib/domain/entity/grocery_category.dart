import 'package:flutter_groceries_app/domain/entity/has_image_name.dart';

class GroceryCategory implements HasImageAndName {
  final String name;
  final int bgColor;
  final String image;
  final String detailInformation;

  GroceryCategory({
    required this.name,
    required this.bgColor,
    required this.image,
    required this.detailInformation,
  });

  factory GroceryCategory.fromMap(Map<String, dynamic> map) {
    return GroceryCategory(
      name: map['name'],
      bgColor: map['bgColor'],
      image: map['image'],
      detailInformation: map['detailInformation'],
    );
  }
}
