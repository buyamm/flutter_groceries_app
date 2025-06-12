import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/cubit/cart_item_cubit.dart';
import 'package:flutter_groceries_app/models/product.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.category,
    required this.count,
  });

  final Product product;
  final String category;
  final int count;
  final _minValue = 1;
  final _maxValue = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Image.asset(product.image, width: 44, height: 31),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: const TextStyle(fontSize: 18)),
                    Text(
                      product.unit,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                IconButton(
                  onPressed:
                      count <= _minValue
                          ? null
                          : () {
                            context.read<CartItemCubit>().decreaseProductHandle(
                              category,
                              product,
                            );
                          },
                  icon: Icon(
                    Icons.remove,
                    size: 26,
                    color:
                        count <= _minValue ? Colors.black26 : Color(0xFF53B175),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12, width: 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed:
                      count >= _maxValue
                          ? null
                          : () {
                            context.read<CartItemCubit>().increaseProductHandle(
                              category,
                              product,
                            );
                          },
                  icon: Icon(
                    Icons.add,
                    size: 26,
                    color:
                        count >= _maxValue ? Colors.black26 : Color(0xFF53B175),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 4, bottom: 0),
          child: Divider(color: Colors.black12, thickness: 1),
        ),
      ],
    );
  }
}
