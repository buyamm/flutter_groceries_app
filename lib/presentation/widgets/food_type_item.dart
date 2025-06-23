import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/domain/entity/has_image_name.dart';
import 'package:flutter_groceries_app/domain/entity/product.dart';

class FoodTypeItem<T extends HasImageAndName> extends StatelessWidget {
  const FoodTypeItem({super.key, required this.item, required this.onPressed});
  final T item;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Image.asset(item.image, width: 45, height: 30),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        if (item is! Product)
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onPressed.call();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xff53B175),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              fixedSize: const Size(120, 32),
            ),
            child: const Text(
              "Select",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
      ],
    );
  }
}
