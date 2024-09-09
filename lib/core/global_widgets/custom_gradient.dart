import 'package:flutter/material.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomGradient extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomGradient({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffDEFF11),
              Color(0xffF0F9BE),
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(getWidth(46)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(getWidth(46)),
          splashColor: Colors.grey.withOpacity(0.5),
          onTap: onTap,
          child: Container(
            height: getHeight(50),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.textBlack,
                fontSize: getWidth(18),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
