import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  final String name;
  final String image;
  final int bgColor;

  const ExploreCard({
    super.key,
    required this.name,
    required this.image,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(bgColor).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(bgColor).withOpacity(0.9)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Image.asset(image, width: 110, height: 80, fit: BoxFit.cover),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
