import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_app_bar.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/balance/add_account_screen.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "About me",
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
                        CustomTextNunito(
                            text: "Balance",
                            fontSize: getWidth(16),
                            fontWeight: FontWeight.w400),
                        CustomTextNunito(
                            text: "\$ 2000.34",
                            fontSize: getWidth(35),
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  CustomTextNunito(
                      text:
                          "Add the bank account where you want to recieve payouts",
                      color: Color(0xffE6E6E6),
                      fontSize: getWidth(16),
                      fontWeight: FontWeight.w400),
                  Spacer(),
                  CustomGradientButton(
                      text: "Add Account",
                      onTap: () {
                        Get.to(AddAccountScreen());
                      }),
                  SizedBox(
                    height: getHeight(20),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
