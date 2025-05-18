import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _minValue = 1;
  int _maxValue = 5;
  int _currentValue = 1;
  bool _favourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F3F2),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.file_upload_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.asset(
                  "lib/assets/images/backgroundProduct.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: (300 - 200) / 2,
                left: (MediaQuery.of(context).size.width - 320) / 2,
                child: SizedBox(
                  width: 320,
                  height: 200,
                  child: Image.asset(
                    "lib/assets/images/apple.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Naturel Red Apple",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: favouriteHandle,
                      icon:
                          _favourite
                              ? Icon(
                                Icons.favorite_border_outlined,
                                size: 30,
                                color: Colors.red,
                              )
                              : Icon(
                                Icons.favorite_border_outlined,
                                size: 30,
                                color: Colors.black54,
                              ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "1kg, Price",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: decreaseProductHandle,
                            icon:
                                (_currentValue > _minValue)
                                    ? Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Color(0xFF53B175),
                                    )
                                    : Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Colors.black54,
                                    ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _currentValue.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: increaseProductHandle,
                            icon:
                                (_currentValue < _maxValue)
                                    ? Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Color(0xFF53B175),
                                    )
                                    : Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.black54,
                                    ),
                          ),
                        ],
                      ),
                      Text(
                        "\$4.99",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 0),
                  child: Divider(color: Colors.black12, thickness: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Detail",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down, size: 30),
                    ),
                  ],
                ),
                Text(
                  'Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Divider(color: Colors.black12, thickness: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nutritions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '100gr',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Divider(color: Colors.black12, thickness: 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Review',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(Icons.star, color: Colors.amber),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 67,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Add to Basket",
                        style: TextStyle(
                          height: 2,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void increaseProductHandle() {
    setState(() {
      if (_currentValue < _maxValue) {
        _currentValue++;
      }
    });
  }

  void decreaseProductHandle() {
    setState(() {
      if (_currentValue > _minValue) {
        _currentValue--;
      }
    });
  }

  void favouriteHandle() {
    setState(() {
      _favourite = !_favourite;
    });
  }
}
