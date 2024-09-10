import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomAccountTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hinText;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color borderColor;
  final VoidCallback? onTap;

  const CustomAccountTextfield({
    super.key,
    required this.controller,
    required this.hinText,
    this.keyboardType,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.borderColor = Colors.white,
    this.onTap,
  });

  @override
  _CustomAccountTextfieldState createState() => _CustomAccountTextfieldState();
}

class _CustomAccountTextfieldState extends State<CustomAccountTextfield> {
  Color fillColor = Colors.transparent; // Initial transparent color

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(41),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor, width: 0.6),
        borderRadius: BorderRadius.circular(getWidth(8)),
      ),
      child: TextField(
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: (text) {
          setState(() {
            // If text is not empty, change background color, otherwise make it transparent
            fillColor = text.isNotEmpty
                ? Colors.white.withOpacity(0.5) // Active color
                : Colors.transparent; // Transparent when no text
          });
        },
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          hintText: widget.hinText,
          fillColor: fillColor,
          filled: true, // To apply the fill color
          hintStyle: GoogleFonts.nunito(
            fontSize: getWidth(15),
            fontWeight: FontWeight.w400,
            color: const Color(0xffDCDCDC),
          ),
          contentPadding: const EdgeInsets.only(
              bottom: 10.5, left: 15, top: 10.5, right: 15),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
