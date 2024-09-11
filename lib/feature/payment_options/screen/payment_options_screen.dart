import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_success_bottom_sheet.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/promotion_offers/promotion_offers.dart';

import '../../../core/global_widgets/custom_background.dart';
import '../../../core/global_widgets/custom_blur_button.dart';
import '../dummy_data/payment_options_model.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  int selectedIndex = -1;
  bool oneSelected = false;

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
          'Payment options',
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w600),
        ),
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
                  top: getHeight(35), left: getWidth(20), right: getWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cash after reaching",
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(18), fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: getHeight(16),
                  ),
                  Container(
                    height: getHeight(80),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 0.6)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImagese.cash,
                                height: getHeight(20),
                                width: getWidth(36),
                              ),
                              SizedBox(
                                width: getWidth(2),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cash',
                                    style: GoogleFonts.nunito(
                                        fontSize: getWidth(16),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'USDT 08',
                                    style: GoogleFonts.nunito(
                                      color: Color(0xFFCABDBD),
                                      fontSize: getWidth(12),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          oneSelected
                              ? Image.asset(
                                  AppIcons.addIcon,
                                  height: getHeight(28),
                                  width: getWidth(27),
                                )
                              : Image.asset(
                                  AppIcons.checkFill,
                                  height: getHeight(28),
                                  width: getWidth(27),
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  Container(
                    height: getHeight(45),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add Payment method',
                            style: GoogleFonts.nunito(
                                fontSize: getWidth(15),
                                fontWeight: FontWeight.w400),
                          ),
                          oneSelected
                              ? GestureDetector(
                                  onTap: () {
                                    _deletePaymentMethod(context);
                                  },
                                  child: SizedBox(
                                    height: getHeight(16),
                                    width: getWidth(40),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Edit',
                                          style: GoogleFonts.nunito(
                                              color: Color(0xFFCABDBD),
                                              fontSize: getWidth(12),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: getWidth(2),
                                        ),
                                        Image.asset(
                                          AppIcons.arrowDown,
                                          height: getHeight(12),
                                          width: getWidth(12),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  AppIcons.addIcon,
                                  height: getHeight(16),
                                  width: getWidth(14),
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(12),
                  ),
                  SizedBox(
                    height: getHeight(225),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: paymentItems.length,
                      itemBuilder: (context, index) {
                        final data = paymentItems[index];
                        bool isSelected = index == selectedIndex;
                        return GestureDetector(
                          onTap:data.onTap,

                          child: Container(
                            height: getHeight(45),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 0.6)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        data.icon,
                                        height: getHeight(20),
                                        width: getWidth(36),
                                      ),
                                      SizedBox(width: getWidth(2)),
                                      Text(
                                        data.title,
                                        style: GoogleFonts.nunito(
                                            fontSize: getWidth(16),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        oneSelected = true;
                                      });
                                    },
                                    child: Image.asset(
                                      isSelected
                                          ? AppIcons.checkFill
                                          : AppIcons.addIcon,
                                      height: isSelected
                                          ? getHeight(19)
                                          : getHeight(16),
                                      width: isSelected
                                          ? getWidth(19)
                                          : getWidth(14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: getHeight(15),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: getHeight(20)),
                  oneSelected
                      ? SizedBox.shrink()
                      : GestureDetector(
                    onTap: (){
                      Get.to(PromotionOffersScreen());
                    },
                        child: Container(
                            height: getHeight(45),
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: getWidth(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Promo Code',
                                    style: GoogleFonts.nunito(
                                        fontSize: getWidth(15),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Image.asset(
                                    AppIcons.addIcon,
                                    height: getHeight(16),
                                    width: getWidth(14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),
                  SizedBox(height: getHeight(102)),
                  oneSelected
                      ? GestureDetector(
                    onTap: (){
                      // _customErrorBottomSheet(context);
                      // showSuccessBottomSheet(context: context, text: ' Your Apple Pay has been successfully linked. You can now use it for quick and secure payments.', onButtonTap: (){
                      //
                      //   Get.back();
                      // });
                      // showSuccessBottomSheet(context: context, text: ' Your Google Pay has been successfully linked. You can now use it for quick and secure payments.', onButtonTap:(){
                      //   Get.back();
                      // } );
                      // _promoCodeBottomSheet(context);
                      _paypalBottomSheet(context);
                    },
                        child: CustomBlurButton(
                            text: "Continue",
                          ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _deletePaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Color(0xff001B26).withOpacity(0.8),
      builder: (BuildContext context) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
            height: getHeight(250),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: getHeight(10)),
                SizedBox(
                  height: getHeight(80),
                  width: getWidth(80),
                  child: Image.asset(AppImagese.question),
                ),
                SizedBox(height: getHeight(17)),
                Center(
                  child: Text(
                    "Are you sure you want to delete this Payment method?",
                    textAlign:
                        TextAlign.center, // Ensuring the text is centered
                    style: GoogleFonts.nunito(
                        color: Color(0xff001B26),
                        fontSize: getWidth(17),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: getHeight(22)),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the buttons in the row
                  children: [
                    Container(
                      height: getHeight(40),
                      width: getWidth(104),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.whiteGrayColor,
                        borderRadius: BorderRadius.circular(88),
                      ),
                      child: Text(
                        'No',
                        style: GoogleFonts.inter(
                            fontSize: getWidth(14),
                            color: AppColors.navy_blue,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(width: getWidth(14)),
                    Container(
                      alignment: Alignment.center,
                      height: getHeight(40),
                      width: getWidth(104),
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(88),
                      ),
                      child: Text(
                        'Yes',
                        style: GoogleFonts.inter(
                            fontSize: getWidth(14),
                            color: AppColors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
  Future<dynamic> _paypalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent, // Transparent background
      barrierColor: Color(
          0xff001B26).withOpacity(0.8), // Semi-transparent black background for the barrier
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
                  height: getHeight(238),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: getHeight(15),),
                      SizedBox(
                        height: getHeight(95),
                        width: getWidth(96),
                        child: Image.asset(AppImagese.successIcon),
                      ),
                      SizedBox(height: getHeight(16),),
                      Text(
                        ' Your Pay Pal has been successfully linked.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(17),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: getHeight(10),),
                      InkWell(
                        onTap: (){
                          Get.back();
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




}
