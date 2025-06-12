import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/cubit/cart_cubit.dart';
import 'package:flutter_groceries_app/cubit/cart_item_cubit.dart';
import 'package:flutter_groceries_app/models/grocery_category.dart';
import 'package:flutter_groceries_app/states/cart_item_state.dart';
import 'package:flutter_groceries_app/states/cart_state.dart';
import 'package:flutter_groceries_app/widgets/cart_item.dart';
import 'package:flutter_groceries_app/widgets/detail_information_item.dart';
import 'package:flutter_groceries_app/widgets/food_type_item.dart';
import 'package:flutter_groceries_app/widgets/select_item_drop_menu.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      context.read<CartCubit>().loadFoodTypes();
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Color(0xffE2E2E2), height: 1.0),
        ),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          spacing: 20,
          children: [
            BlocBuilder<CartCubit, CartState>(
              builder:
                  (context, state) => Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<GroceryCategory>(
                          isExpanded: true,
                          hint: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Food type",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                state.selectedFoodType.isEmpty
                                    ? 'Select food type'
                                    : state.selectedFoodType,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          items:
                              state.foodTypes
                                  .map(
                                    (GroceryCategory item) =>
                                        DropdownMenuItem<GroceryCategory>(
                                          value: item,
                                          child: FoodTypeItem<GroceryCategory>(
                                            item: item,
                                            onPressed: () {
                                              context
                                                  .read<CartCubit>()
                                                  .selectedFoodType(item);
                                            },
                                          ),
                                        ),
                                  )
                                  .toList(),
                          onChanged: (GroceryCategory? value) {
                            // setState(() {
                            //   selectedValue = value;
                            // });
                          },
                          iconStyleData: IconStyleData(
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                            iconEnabledColor: Colors.white,
                            iconSize: 26,
                          ),
                          buttonStyleData: const ButtonStyleData(
                            decoration: BoxDecoration(color: Color(0xff53B175)),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 12,
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: MediaQuery.of(context).size.width - 28,
                            decoration: BoxDecoration(color: Color(0xff53B175)),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility: MaterialStateProperty.all<bool>(
                                true,
                              ),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 48,
                          ),
                        ),
                      ),

                      if (state.selectedFoodType.isNotEmpty) ...[
                        DetailInformationFoodType(
                          nameCategory: state.selectedFoodType,
                          detailInformation: state.detailInformation,
                        ),
                        SelectItemDropMenu(
                          nameCategory: state.selectedFoodType,
                          foodItems: state.foodItems,
                        ),
                      ],
                    ],
                  ),
            ),

            // 🔻 Phần scroll
            Expanded(
              child: BlocListener<CartItemCubit, CartItemState>(
                listener: (context, state) {
                  if (state.errorAlert.isNotEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorAlert)));
                  }
                },
                child: BlocBuilder<CartItemCubit, CartItemState>(
                  builder: (context, state) {
                    final groupedItems = state.groupedItems;

                    return ListView(
                      padding: EdgeInsets.zero,
                      children:
                          groupedItems.entries.map((entry) {
                            final category = entry.key;
                            final productList = entry.value;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Chỉ hiện 1 lần mỗi category
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                ...productList.map((pair) {
                                  final product = pair.$1;
                                  final count = pair.$2;

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CartItem(
                                      product: product,
                                      category: category,
                                      count: count,
                                    ),
                                  );
                                }),
                              ],
                            );
                          }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
