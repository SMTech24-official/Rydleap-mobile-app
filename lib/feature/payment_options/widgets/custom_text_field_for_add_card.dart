import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_sizes.dart';

class CustomTextFieldForAddCard extends StatelessWidget {
  final String? suffixIcon;
  final String? prefixIcon;
  final String hintText;
  final double? width;

  const CustomTextFieldForAddCard({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    required this.hintText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(40),
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.6),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                      right: getWidth(10),
                      top: getHeight(10),
                      bottom: getHeight(10)),
                  child: Image.asset(
                    suffixIcon!,
                    height: getHeight(20),
                    width: getWidth(20),
                  ),
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(
                      left: getWidth(15),
                      top: getHeight(12),
                      bottom: getHeight(12)),
                  child: Image.asset(
                    prefixIcon!,
                    height: getHeight(16),
                    width: getWidth(25),
                  ),
                )
              : null,
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(
            color:Color(0xFFD0CACA),
            fontSize: getWidth(16),
            fontWeight: FontWeight.w400,
            height: 21.82 / 16,
          ),
          contentPadding: EdgeInsets.only(
            left: prefixIcon == null
                ? getWidth(15)
                : getWidth(3), // Adjust left padding
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
