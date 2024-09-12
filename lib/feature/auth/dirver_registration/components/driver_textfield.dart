import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class DriverTextfield extends StatefulWidget {

  final TextEditingController controller;
  final String hintext;
  final Color borderColor;


  const DriverTextfield({
    super.key,
    required this.controller,
    required this.hintext,
    this.borderColor =const Color(0xff6D6A6A),

    });

  @override
  State<DriverTextfield> createState() => _DriverTextfieldState();
}

class _DriverTextfieldState extends State<DriverTextfield> {
   Color fillColor = Colors.transparent; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(41),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color:widget. borderColor, width: 0.6),
          borderRadius: BorderRadius.circular(getWidth(8))),
      child:  TextField(
   
        controller: widget.controller,

        onChanged: (text) {
          setState(() {
            // If text is not empty, change background color, otherwise make it transparent
            fillColor = text.isNotEmpty
                ? Colors.white.withOpacity(0.5) // Active color
                : Colors.transparent; // Transparent when no text
          });
        },
        decoration: InputDecoration(
        hintText: widget.hintext,
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
