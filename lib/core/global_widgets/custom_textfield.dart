import 'package:flutter/material.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  bool obsecureText;
  CustomTextfield(
      {super.key,
      required this.controller,
      required this.hintext,
      this.suffixIcon,
      this.onTap,
      this.onChanged,
      this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(50),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffA5A3A3).withOpacity(0.2),
        border: Border.all(color: Color(0xffA6A7A1)),
        borderRadius: BorderRadius.circular(getWidth(46)),
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
            fontSize: getWidth(15)), // Set text color to black

        decoration: InputDecoration(
          suffixIcon: InkWell(
              splashColor: Colors.transparent, onTap: onTap, child: suffixIcon),
          hintText: hintext,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          border: InputBorder.none, // Remove default border
          contentPadding: EdgeInsets.symmetric(
              horizontal: getWidth(16)), // Adjust padding as needed
        ),
      ),
    );
  }
}
