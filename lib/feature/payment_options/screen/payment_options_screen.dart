import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

import '../../../core/global_widgets/custom_background.dart';
import '../../../core/global_widgets/custom_blur_button.dart';
import '../dummy_data/payment_options_model.dart';
import 'delete_payment_method.dart';

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
                            onTap: (){
                              _customBottomSheet(context);
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
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              oneSelected = true;
                            });
                          },
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
                                  Image.asset(
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
                      : Container(
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
                  SizedBox(height: getHeight(102)),
                  oneSelected
                      ? CustomBlurButton(
                          text: "Continue",
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
  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Color(0xff001B26).withOpacity(0.8),
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
                      SizedBox(
                        height: getHeight(80),
                        width: getWidth(80),
                        child: Image.asset(AppImagese.question),
                      ),
                      SizedBox(height: getHeight(17),),
                      Center(
                        child: Text(
                          "Are you sure you want to delete this Payment method?",
                          style: GoogleFonts.nunito(
                              color: Color(0xff001B26),
                              fontSize: getWidth(17),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: getHeight(22),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                      
                            child: Text('No'),
                          )
                          // Expanded(
                          //   child: TextButton(
                          //     onPressed: () {
                          //       Navigator.pop(context);
                          //     },
                          //     style: TextButton.styleFrom(
                          //       padding: EdgeInsets.symmetric(vertical: 15),
                          //       backgroundColor: Colors.grey[200],
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //     child: Text(
                          //       'No',
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         color: Colors.black,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(width: 10),
                          // Expanded(
                          //   child: TextButton(
                          //     onPressed: () {
                          //       // Add your 'Yes' button logic here
                          //     },
                          //     style: TextButton.styleFrom(
                          //       padding: EdgeInsets.symmetric(vertical: 15),
                          //       backgroundColor: Colors.red,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //     child: Text(
                          //       'Yes',
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
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



