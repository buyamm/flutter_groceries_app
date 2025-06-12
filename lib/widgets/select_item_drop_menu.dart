import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/cubit/cart_item_cubit.dart';
import 'package:flutter_groceries_app/models/product.dart';
import 'package:flutter_groceries_app/widgets/food_type_item.dart';

class SelectItemDropMenu extends StatelessWidget {
  const SelectItemDropMenu({
    super.key,
    required this.foodItems,
    required this.nameCategory,
  });
  final String nameCategory;
  final List<Product> foodItems;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Product>(
        isExpanded: true,
        hint: const Row(
          children: [
            Expanded(
              child: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items:
            foodItems
                .map(
                  (Product item) => DropdownMenuItem<Product>(
                    value: item,
                    child: FoodTypeItem<Product>(item: item, onPressed: () {}),
                  ),
                )
                .toList(),
        // value: selectedValue,
        onChanged: (Product? value) {
          if (value != null) {
            context.read<CartItemCubit>().addToCart(nameCategory, value);
          }
        },
        buttonStyleData: ButtonStyleData(
          height: 53,
          width: 190,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(color: Color(0xff53B175)),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          iconSize: 20,
          iconEnabledColor: Colors.white,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 250,
          decoration: BoxDecoration(color: Color(0xff53B175)),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(4),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(height: 50),
      ),
    );
  }
}
