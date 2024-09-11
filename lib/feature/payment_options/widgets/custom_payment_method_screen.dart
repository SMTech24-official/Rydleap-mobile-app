import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import '../../../core/app_imagese.dart';
import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_background.dart';
import '../../../core/global_widgets/custom_error_bottom_sheet.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';
import '../../../core/global_widgets/custom_success_bottom_sheet.dart';
import '../../../core/utility/app_colors.dart';

class CustomPaymentMethodScreen extends StatelessWidget {
  final String title, subtitle, imagePath, bottomText;
  const CustomPaymentMethodScreen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imagePath,
      required this.bottomText});

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
                  SizedBox(
                    height: getHeight(12),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(15), fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: getHeight(364),
                  ),
                  CustomGradientButton(
                    text: bottomText,
                    onTap: () {
                      if (title == 'Pay Pal') {
                        _paypalBottomSheet(context);
                      } else if (title == 'Apple Pay') {
                        log('Apple');
                        showSuccessBottomSheet(
                            context: context,
                            text:
                                ' Your Apple Pay has been successfully linked. You can now use it for quick and secure payments.',
                            onButtonTap: () {
                              _errorBottomSheet(
                                  context: context,
                                  onCancelBottomTap: () {
                                    Get.back();
                                  },
                                  onRetryBottomTap: () {
                                    Get.back();
                                  });
                            });
                      } else {
                        showSuccessBottomSheet(
                            context: context,
                            text:
                                ' Your Google Pay has been successfully linked. You can now use it for quick and secure payments.',
                            onButtonTap: () {
                              _errorBottomSheet(
                                  context: context,
                                  onCancelBottomTap: () {
                                    Get.back();
                                  },
                                  onRetryBottomTap: () {
                                    Get.back();
                                  });
                            });
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _paypalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Color(0xff001B26).withOpacity(0.8),
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: screenHeight(),
                width: double.infinity,
                color: Colors.transparent,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
                  height: getHeight(238),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getHeight(15),
                      ),
                      SizedBox(
                        height: getHeight(95),
                        width: getWidth(96),
                        child: Image.asset(AppImagese.successIcon),
                      ),
                      SizedBox(
                        height: getHeight(16),
                      ),
                      Text(
                        ' Your Pay Pal has been successfully linked.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(17),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      InkWell(
                        onTap: () {
                          _errorBottomSheet(
                              context: context,
                              onCancelBottomTap: () {
                                Get.back();
                              },
                              onRetryBottomTap: () {
                                Get.back();
                              });
                        },
                        child: Container(
                          height: getHeight(40),
                          width: getWidth(104),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(88),
                              color: Color(0xff3AD896)),
                          child: Center(
                            child: Text(
                              "Done",
                              style: GoogleFonts.inter(
                                  fontSize: getWidth(14),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top:
                    getHeight(40), // Adjust the top margin for the close button
                right: getWidth(
                    20), // Adjust the right margin for the close button
                child: SizedBox(
                  height: getHeight(26),
                  width: getWidth(26),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> showSuccessBottomSheet({
    required BuildContext context,
    required String text,
    required VoidCallback onButtonTap,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Color(0xff001B26).withOpacity(0.8),
      builder: (BuildContext context) {
        return CustomSuccessBottomSheet(
          text: text,
          onButtonTap: onButtonTap,
        );
      },
    );
  }

  Future<dynamic> _errorBottomSheet(
      {required BuildContext context,
      required VoidCallback onCancelBottomTap,
      required VoidCallback onRetryBottomTap}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Color(0xff001B26).withOpacity(0.8),
      builder: (BuildContext context) {
        return CustomErrorBottomSheet(
            onCancelBottomTap: onCancelBottomTap,
            onRetryBottomTap: onRetryBottomTap);
      },
    );
  }
}
