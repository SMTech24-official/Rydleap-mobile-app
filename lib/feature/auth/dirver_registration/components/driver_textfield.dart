import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class DriverTextfield extends StatelessWidget {

  final TextEditingController controller;


  const DriverTextfield({
    super.key,
    required this.controller,

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
    
        controller: controller,
        decoration: InputDecoration(
        
         hintStyle: GoogleFonts.nunito(
              fontSize: getWidth(15),
              fontWeight: FontWeight.w400,
              color: Colors.white),
          contentPadding:
              EdgeInsets.only( left: 15, top: 10.5, ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
