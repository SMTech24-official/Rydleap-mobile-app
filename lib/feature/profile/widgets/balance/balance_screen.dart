import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appbarColor,
          leading: CustomCloseButton(),
          title: Text(
            "About me",
            style: GoogleFonts.inter(
                fontSize: getWidth(20), fontWeight: FontWeight.w600),
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: AppColors.textBlack,
            ),
            Image.asset(
              'assets/images/Ellipse_9.png',
              width: 150.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: getHeight(26),
                  ),
                  Container(
                    height: getHeight(149),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff001B26),
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: Colors.white, width: 0.7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Balance",
                          style: GoogleFonts.nunito(
                              fontSize: getWidth(16),
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "\$ 2000.34",
                          style: GoogleFonts.inter(
                              fontSize: getWidth(35),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  Text(
                    "Add the bank account where you want to recieve payouts",
                    style: GoogleFonts.nunito(
                        color: Color(0xffE6E6E6),
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  CustomGradientButton(text: "Add Account", onTap: () {}),
                  SizedBox(height: getHeight(20),)
                ],
              ),
            ),
          ],
        ));
  }
}
