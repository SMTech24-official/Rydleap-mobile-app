import 'package:flutter/material.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  const CustomTextfield(
      {super.key, required this.controller, required this.hintext});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(getWidth(46)),
      color: Color(0xffA5A3A3).withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(getWidth(46)),
        splashColor: Colors.grey,
        child: Container(
          height: getHeight(50),
          width: double.infinity,
          decoration: BoxDecoration(
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
            // Update to TextInputType.text
            controller: controller,
            style: TextStyle(
                color: Color(0xffC3BBBB),
                fontWeight: FontWeight.w400,
                fontSize: getWidth(15)), // Set text color to black

            decoration: InputDecoration(
              hintText: hintext,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none, // Remove default border
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getWidth(16)), // Adjust padding as needed
            ),
          ),
        ),
      ),
    );
  }
}
