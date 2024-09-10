import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomNextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? icon;

  const CustomNextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon, // icon can be nullable, so no need to require
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(getWidth(46)),
      color: const Color(0xff3AD896),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(getWidth(46)),
        splashColor: Colors.grey.withOpacity(0.5),
        child: Container(
          height: getHeight(50),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.6),
            borderRadius: BorderRadius.circular(getWidth(46)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffFFFFFF).withOpacity(0.2),
                offset: const Offset(0, 1),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: getWidth(17),
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              if (icon != null) ...[
                SizedBox(),
                SizedBox(
                  height: getHeight(22),
                  width: getWidth(22),
                  child: Image.asset(icon!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
