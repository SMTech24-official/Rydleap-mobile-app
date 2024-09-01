import 'package:flutter/material.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomBlurButton extends StatelessWidget {
  final String text;

  const CustomBlurButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(getWidth(46)),
      color: Color(0xffBDBCBC),
      child: InkWell(
        borderRadius: BorderRadius.circular(getWidth(46)),
        splashColor: Colors.grey,
        child: Container(
          height: getHeight(50),
          width: double.infinity,
          decoration: BoxDecoration(
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
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.textGrey,
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
