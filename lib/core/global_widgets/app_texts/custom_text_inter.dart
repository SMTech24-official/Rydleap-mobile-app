import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomTextInter extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  CustomTextInter(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.nunito(
            fontSize: fontSize ?? getWidth(14),
            color: color ?? AppColors.textWhite,
            fontWeight: fontWeight ?? FontWeight.w500));
  }
}
