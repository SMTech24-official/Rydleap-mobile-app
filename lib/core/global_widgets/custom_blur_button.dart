import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomBlurButton extends StatelessWidget {
  final String text;
  final Color textColor;

  const CustomBlurButton(
      {super.key, required this.text, this.textColor = AppColors.textGrey});

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
            child: CustomTextNunito(
              text: text,
              color: textColor,
              fontSize: getWidth(17.5),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
