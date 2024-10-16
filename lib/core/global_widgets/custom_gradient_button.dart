import 'package:flutter/material.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final List<Color>? colorList;
  final double? width;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.colorList,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorList ??
                [
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
            width: width ?? double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: Colors.black,
                        size: 16,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 10,
                ),
                CustomTextNunito(
                  text: text,
                  fontSize: getWidth(18),
                  color: AppColors.textBlack,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
