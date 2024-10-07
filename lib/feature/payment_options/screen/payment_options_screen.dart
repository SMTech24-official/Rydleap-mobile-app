import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_success_bottom_sheet.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/payment_options/screen/add_card_screen.dart';
import 'package:rydleap/feature/profile/widgets/promotion_offers/promotion_offers.dart';
import '../../../core/global_widgets/custom_background.dart';
import '../../../core/global_widgets/custom_blur_button.dart';
import '../../earnings_details_breakdown/screen/earnings_details_breakdown_screen.dart';
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
          'payment_options'.tr,
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
                    "cash_after_reaching".tr,
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
                              GestureDetector(
                                onTap: (){
                                Get.to(EarningsDetailsBreakdownScreen());
                                },
                                child: Image.asset(
                                  AppImagese.cash,
                                  height: getHeight(20),
                                  width: getWidth(36),
                                ),
                              ),
                              SizedBox(
                                width: getWidth(2),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'cash'.tr,
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
                          GestureDetector(
                            onTap: () {
                              Get.to(AddCardScreen());
                            },
                            child: Text(
                               'add_payment_method'.tr,
                              style: GoogleFonts.nunito(
                                  fontSize: getWidth(15),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          oneSelected
                              ? SizedBox(
                                  height: getHeight(16),
                                  width: getWidth(40),
                                  child: Row(
                                    children: [
                                      Text(
                                        'edit'.tr,
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
                          onTap: data.onTap,
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
                          onTap: () {
                            Get.to(PromotionOffersScreen());
                          },
                          child: Container(
                            height: getHeight(45),
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getWidth(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'promo_Code'.tr,
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
                          onTap: () {},
                          child: CustomBlurButton(
                            text:  "continue".tr,
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
}
