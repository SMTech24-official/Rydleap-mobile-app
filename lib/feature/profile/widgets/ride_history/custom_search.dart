import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
      height: getHeight(50),
      // width: getWidth(125),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(70)),
      child: TextField(
        // controller: controller,
        style: GoogleFonts.inter(
          fontSize: getWidth(14),
          fontWeight: FontWeight.w400,
          color: AppColors.appbarColor, // Set the text color here
        ),

        decoration: InputDecoration(
          hintText: "Search History",
          suffixIcon: SizedBox(
              height: getHeight(24),
              width: getWidth(24),
              child: Image.asset(AppIcons.search)),
          hintStyle: GoogleFonts.inter(
              fontSize: getWidth(14),
              fontWeight: FontWeight.w400,
              color: Color(0xff949A9C)),
          contentPadding: EdgeInsets.only(
            left: 15,
            top: 5,
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
