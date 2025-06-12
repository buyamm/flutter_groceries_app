import 'package:flutter/material.dart';
import 'package:flutter_groceries_app/models/grocery_category.dart';
import 'package:flutter_groceries_app/models/product.dart';
import 'package:flutter_groceries_app/screens/product_detail.dart';

class ProductCategory extends StatelessWidget {
  final String title;
  final List<Product> products;
  final bool haveSubCard;
  final List<GroceryCategory>? typeOfCategory;

  const ProductCategory({
    super.key,
    required this.title,
    required this.products,
    required this.haveSubCard,
    this.typeOfCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: Color(0xff53B175),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          haveSubCard
              ? SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: typeOfCategory!.length,
                  itemBuilder: (context, index) {
                    final product = typeOfCategory![index];
                    return Container(
                      margin: const EdgeInsets.only(right: 12, bottom: 10),
                      width:
                          MediaQuery.of(context).size.width *
                          0.7, // 70% chiều rộng màn hình
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(product.bgColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 72,
                            height: 72,
                            child: Image.asset(product.image.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              product.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
              : SizedBox.shrink(),

          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap:
                      () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductDetail(product: product),
                          ),
                        ),
                      },
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 12,
                    ), // Khoảng cách giữa các item
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.black54),
                    ),
                    width: 170,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 90,
                              height: 80,
                              child: Image.asset(product.image),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0, top: 4),
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            product.unit,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 46,
                                height: 46,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF53B175),
                                    borderRadius: BorderRadius.circular(17),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.2,
                                        ), // Màu bóng
                                        spreadRadius: 2, // Độ lan rộng của bóng
                                        blurRadius: 6, // Độ mờ của bóng
                                        offset: Offset(
                                          0,
                                          2,
                                        ), // Vị trí bóng (xuống dưới)
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      size: 26,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
