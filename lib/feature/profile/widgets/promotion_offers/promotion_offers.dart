import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_error_bottom_sheet.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/home/home_controller.dart';

import '../../../../core/app_imagese.dart';

class PromotionOffersScreen extends StatelessWidget {
  HomeController homeController = Get.find();

  PromotionOffersScreen({super.key});

  final TextEditingController _promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Promotion and Offers",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            // homeController.getPromo();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
      ),
      body: Custombackground(
        widget: SizedBox(),
        bottomContainerHeight: screenHeight() * 0.85,
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: getWidth(48),
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffAFAFAF)),
                ),
              ),
              SizedBox(
                height: getHeight(27),
              ),
              Center(
                child: Text(
                  "Active Promotions ",
                  style: GoogleFonts.inter(
                      fontSize: getWidth(20), fontWeight: FontWeight.w500),
                ),
              ),
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.promotionModel.value.data?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          '${homeController.promotionModel.value.data?[index].title}',
                        ),
                        subtitle: Text(
                          '${homeController.promotionModel.value.data?[index].subTitle}',
                        ),
                      );
                    }),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Redeem a Promo Code",
                    style: GoogleFonts.nunito(
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(12),
                  ),
                  Container(
                    height: getHeight(45),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 0.6)),
                    child: TextField(
                      controller: _promoController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            bottom: getHeight(10), left: getWidth(10)),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(63),
                  ),
                  InkWell(
                    onTap: () {
                      _promoErrorBottomSheet(
                          context: context,
                          onCancelBottomTap: () {
                            Get.back();
                          },
                          onRetryBottomTap: () {
                            Get.back();
                          });
                    },
                    child: CustomBlurButton(
                      text: "Redeem",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(20),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _promoCodeSuccessBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent,
      // Transparent background
      barrierColor: Color(0xff001B26).withOpacity(0.8),
      // Semi-transparent black background for the barrier
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center, // Center the container on the screen
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
                  height: getHeight(257),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getHeight(4),
                      ),
                      SizedBox(
                        height: getHeight(95),
                        width: getWidth(95),
                        child: Image.asset(AppImagese.successIcon),
                      ),
                      SizedBox(
                        height: getHeight(14),
                      ),
                      Text(
                        'Promo code success!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(17),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Your code is successfully redeemed.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(21),
                      ),
                      InkWell(
                        onTap: () {
                          _promoCodeSuccessBottomSheet(context);
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

  Future<dynamic> _promoErrorBottomSheet(
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
