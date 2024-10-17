import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';

class CustomPickupDropoff extends StatelessWidget {
  final String title, subTitle1, subTitle2;
  const CustomPickupDropoff({
    super.key,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNunito(
            text: title, fontSize: getWidth(18), fontWeight: FontWeight.w500),
        SizedBox(
          height: getHeight(5),
        ),
        CustomTextNunito(
            text: subTitle1,
            fontSize: getWidth(14),
            fontWeight: FontWeight.w400),
        CustomTextNunito(
            text: subTitle2,
            fontSize: getWidth(14),
            fontWeight: FontWeight.w400)
      ],
    );
  }
}
