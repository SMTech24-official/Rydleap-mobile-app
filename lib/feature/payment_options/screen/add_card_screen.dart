import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/app_icons.dart';
import '../../../core/app_imagese.dart';
import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_background.dart';
import '../../../core/global_widgets/custom_blur_button.dart';
import '../../../core/global_widgets/custom_close_button.dart';
import '../../../core/utility/app_colors.dart';
import '../widgets/custom_text_field_for_add_card.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        leading: SizedBox(
          height: getHeight(26),
          width: getHeight(26),
          child: CustomCloseButton(),
        ),
        title: Text(
          'Add Card',
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w500),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _deletePaymentMethod(context);
            },
            child: Padding(
              padding: EdgeInsets.only(right: getWidth(20)),
              child: Image.asset(
                AppIcons.deleteIcon,
                height: getHeight(24),
                width: getWidth(24),
              ),
            ),
          )
        ],
      ),
      body: Custombackground(
        widget: SizedBox(),
        bottomContainerHeight: screenHeight() * 0.85,
        child: SingleChildScrollView(
          child: Column(
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
              Padding(
                padding: EdgeInsets.only(
                    left: getWidth(20),
                    right: getWidth(20),
                    top: getHeight(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldForAddCard(
                      hintText: 'Card Number',
                      suffixIcon: AppIcons.cameraIcon,
                    ),
                    SizedBox(
                      height: getHeight(4),
                    ),
                    errorShowCard(text: 'Please enter number only'),
                    SizedBox(
                      height: getWidth(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: getHeight(85),
                          width: getWidth(144),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Exp. Date',
                                style: GoogleFonts.nunito(
                                  fontSize: getWidth(16),
                                  fontWeight: FontWeight.w500,
                                  height: 21.87 / 16,
                                ),
                              ),
                              CustomTextFieldForAddCard(hintText: 'MM/YY'),
                              SizedBox(
                                height: getHeight(3),
                              ),
                              errorShowCard(text: 'Error')
                            ],
                          ),
                        ),
                        Container(
                          height: getHeight(85),
                          width: getWidth(144),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CVV',
                                style: GoogleFonts.nunito(
                                  fontSize: getWidth(16),
                                  fontWeight: FontWeight.w500,
                                  height: 21.87 / 16,
                                ),
                              ),
                              CustomTextFieldForAddCard(hintText: '123'),
                              SizedBox(
                                height: getHeight(3),
                              ),
                              errorShowCard(text: 'Error')
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getHeight(21),
                    ),
                    CustomTextFieldForAddCard(
                      hintText: 'United States',
                      prefixIcon: AppIcons.usIcon,
                      suffixIcon: AppIcons.arrowDown,
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    CustomTextFieldForAddCard(hintText: 'Nickname (Optional)'),
                    SizedBox(
                      height: getHeight(5),
                    ),
                    Text(
                      'e.g  Peace Unity',
                      style: GoogleFonts.nunito(
                        color: Color(0xFFA49595),
                        fontSize: getWidth(11),
                        fontWeight: FontWeight.w400,
                        height: 15 / 11,
                      ),
                    ),
                    SizedBox(
                      height: getHeight(302),
                    ),
                    CustomBlurButton(
                      text: 'Save',
                    )
                  ],
                ),
              )
            ],
          ),
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
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
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
                    ),
                    SizedBox(width: getWidth(14)),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
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
}

class errorShowCard extends StatelessWidget {
  final String text;
  const errorShowCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(15),
      width: getWidth(150),
      child: Row(
        children: [
          Image.asset(AppIcons.errorIcon,
              height: getHeight(12), width: getWidth(12)),
          SizedBox(
            width: getWidth(1.5),
          ),
          Text(
            text,
            style: GoogleFonts.nunito(
              color: Color(0xFFA49595),
              fontSize: getWidth(11),
              fontWeight: FontWeight.w400,
              height: 15 / 11,
            ),
          ),
        ],
      ),
    );
  }
}
