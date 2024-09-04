import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getWidth(20)),
      child: Material(
        color: Color(0xff3AD896),
        borderRadius: BorderRadius.circular(41),
        child: InkWell(
          splashColor: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(41),
          onTap: () {},
          child: Container(
            height: getHeight(35),
            width: getWidth(84),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(41)),
            child: Center(
              child: Text(
                "Save",
                style: GoogleFonts.inter(
                    fontSize: getWidth(15), fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
