import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';

import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_background.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';
import '../../../core/utility/app_colors.dart';

class CustomPaymentMethodScreen extends StatelessWidget {
  final String title,subtitle,imagePath,bottomText;
  const CustomPaymentMethodScreen({super.key, required this.title, required this.subtitle, required this.imagePath, required this.bottomText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        leading: SizedBox(
          height: getHeight(26),
          width: getHeight(26),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getWidth(20)),
            child: Image.asset(
              AppIcons.deleteIcon,
              height: getHeight(24),
              width: getWidth(24),
            ),
          )
        ],
      ),
      body: Custombackground(
        widget: SizedBox(),
        bottomContainerHeight: screenHeight() * 0.85,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: getHeight(8)),
              child: Center(
                child: Container(
                  width: getWidth(48),
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffAFAFAF)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getWidth(28), right: getWidth(28), top: getHeight(35)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      imagePath,
                      height: getHeight(129),
                      width: getWidth(115),
                    ),
                  ),
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(25), fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: getHeight(12),),
                  Text(
                   subtitle,
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(15), fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: getHeight(364),),
                  CustomGradientButton(text:bottomText, onTap: () {  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
