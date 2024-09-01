import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final Widget suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool obsecureText;

  CustomTextfield({
    super.key,
    required this.controller,
    required this.hintext,
    required this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(50),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffA5A3A3).withOpacity(0.2),
        border: Border.all(width: 0.4, color: Color(0xffA6A7A1)),
        borderRadius: BorderRadius.circular(getWidth(50)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffFFFFFF).withOpacity(0.08),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0xffFFFFFF).withOpacity(0.08),
            offset: Offset(0, -2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        onChanged: onChanged,
        style: TextStyle(
          color: Color(0xffC3BBBB),
          fontWeight: FontWeight.w400,
          fontSize: getWidth(15),
        ), // Set text color

        decoration: InputDecoration(
          suffixIcon: InkWell(
            splashColor: Colors.transparent,
            onTap: onTap,
            child: suffixIcon,
          ),
          hintText: hintext,
          hintStyle: GoogleFonts.nunito(
              color: Color(0xffC3BBBB),
              // color: Colors.red,
              fontSize: getWidth(15),
              fontWeight: FontWeight.w400),

          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          border: InputBorder.none, // Remove default border
          contentPadding: EdgeInsets.symmetric(
            horizontal: getWidth(16), // Adjust padding as needed
          ),
        ),
      ),
    );
  }
}
