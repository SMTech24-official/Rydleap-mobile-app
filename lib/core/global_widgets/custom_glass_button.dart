import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomGlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String icon;

  const CustomGlassButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(getWidth(46)),
        splashColor: Colors.grey.withOpacity(0.5),
        onTap: onTap,
        child: Container(
          height: getHeight(50),
          width: double.infinity,
          decoration: BoxDecoration(
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
              borderRadius: BorderRadius.circular(getWidth(46)),
              color: Color(0xffA5A3A3).withOpacity(0.5),
              border: Border.all(color: Color(0xffA6A7A1), width: 0.4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Color(0xffE4DDDD),
                  fontSize: getWidth(15),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
