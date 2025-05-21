import 'package:flutter/material.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardSearchBar(
      hintText: 'Search Store',
      hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      backgroundColor: Color(0xFFF2F3F2),
      startIconSize: 30,
      startIconColor: Colors.black,
      borderRadius: 10,
      onChanged: (value) {
        // Handle search input change
      },
      onSubmitted: (value) {
        // Handle search submission
      },
    );
  }
}
