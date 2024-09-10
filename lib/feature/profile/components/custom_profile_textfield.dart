import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomProfileTextfield extends StatelessWidget {
  final String hinText;
  final TextEditingController controller;
  final String suffixIcon;
  final TextInputType? keyboardType;
  const CustomProfileTextfield({
    super.key,
    required this.controller,
    required this.hinText,
    required this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(41),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff6D6A6A), width: 0.6),
          borderRadius: BorderRadius.circular(getWidth(8))),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hinText,
          suffixIcon: InkWell(
            onTap: () {
              print("edit");
            },
            child: SizedBox(
                height: getHeight(24),
                width: getWidth(24),
                child: Image.asset(suffixIcon)),
          ),
          hintStyle: GoogleFonts.nunito(
              fontSize: getWidth(15),
              fontWeight: FontWeight.w400,
              color: Colors.white),
          contentPadding:
              EdgeInsets.only(bottom: 10.5, left: 15, top: 10.5, right: 15),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
