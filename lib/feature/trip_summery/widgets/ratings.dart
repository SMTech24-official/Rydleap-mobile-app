import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_inter.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_app_bar.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_buttomsheet/custom_bottomsheet.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  int _currentRating = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Rate your Ride",
      ),
      body: Custombackground(
        widget: SizedBox(),
        bottomContainerHeight: screenHeight() * 0.55,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getHeight(8),
              ),
              Container(
                width: getWidth(48),
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffAFAFAF)),
              ),
              SizedBox(
                height: getHeight(17),
              ),
              Column(
                children: [
                  Image.asset(AppImagese.appLogo),
                  CustomTextNunito(
                      text: "USDT 08",
                      fontWeight: FontWeight.w700,
                      fontSize: getWidth(23)),
                ],
              ),
              SizedBox(
                height: getHeight(30),
              ),
              Container(
                // height: getHeight(238),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff001B26),
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          offset: Offset(0, 1),
                          blurRadius: 10,
                          spreadRadius: 1)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: getHeight(24),
                    ),
                    Image.asset(AppImagese.profileImage),
                    CustomTextNunito(
                        text: "Rate your Driver",
                        fontWeight: FontWeight.w500,
                        fontSize: getWidth(18)),
                    CustomTextNunito(
                        text: "Rate your Driver",
                        color: Color(0xffD0CACA),
                        fontWeight: FontWeight.w400,
                        fontSize: getWidth(14)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentRating = index + 1;
                            });
                          },
                          child: Icon(
                            Icons.star,
                            color: index < _currentRating
                                ? Color(0xffFFC727)
                                : Color(0xffAFAAAA),
                            size: getWidth(30),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    InkWell(
                      onTap: () {
                        // _customBottomSheet(context);
                        customBottomSheet(context, "Thank you!",
                            AppImagese.like, "", getWidth(35), 0);
                      },
                      child: Container(
                        height: getHeight(40),
                        width: getWidth(104),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(88),
                            color: Color(0xff3AD896)),
                        child: Center(
                            child: CustomTextInter(
                                text: "Done",
                                fontSize: getWidth(14),
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
