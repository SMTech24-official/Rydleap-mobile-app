import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomTextAmount extends StatelessWidget {
  final String text, amount;
  final Color color;
  final FontWeight? fontWeight;
  final double fontSize;
  const CustomTextAmount(
      {super.key,
      required this.text,
      required this.amount,
      this.color = Colors.white,
      this.fontSize=15,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: GoogleFonts.nunito(
                  fontSize: fontSize, fontWeight: FontWeight.w400)),
          Text(amount,
              style: GoogleFonts.nunito(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
