import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String name;
  final int bgColor;
  final int foreColor;
  const MyElevatedButton({
    super.key,
    required this.name,
    required this.bgColor,
    required this.foreColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(bgColor),
        foregroundColor: Color(foreColor),
        fixedSize: Size(155, 43),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      child: Text(name, style: TextStyle(fontSize: 18)),
    );
  }
}
