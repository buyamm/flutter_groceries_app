import 'package:flutter/widgets.dart';

class DetailInformationFoodType extends StatelessWidget {
  const DetailInformationFoodType({
    super.key,
    required this.nameCategory,
    required this.detailInformation,
  });
  final String nameCategory;
  final String detailInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 6,
          children: [
            Text(
              "Detail Information About",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              maxLines: 2,
            ),
            Text(
              nameCategory,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xff53B175),
              ),
            ),
          ],
        ),
        Text(
          detailInformation,
          maxLines: 6,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Color(0xff7C7C7C),
          ),
        ),
      ],
    );
  }
}
