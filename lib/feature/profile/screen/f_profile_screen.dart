import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_inter.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_app_bar.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/components/custom_profile_items_section.dart';
import 'package:rydleap/feature/profile/components/custom_profile_section.dart';
import 'package:rydleap/feature/profile/components/profile_bottom_sheet.dart';
import 'package:rydleap/feature/profile/controller/firebase/f_profile_controller.dart';

class FProfileScreen extends StatelessWidget {
  FProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fProfileController = Get.put(FProfileController());
    return Scaffold(
        appBar: CustomAppBar(title: "about_me".tr),
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(40),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FutureBuilder<Map<String, dynamic>?>(
                          future: fProfileController.fetchUserData(),
                          // future: widget.fProfileController.fetchUserData(),
                          builder: (context, snapshot) {
                            // Loading state
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            // Error state
                            if (snapshot.hasError) {
                              return Center(
                                  child: CustomTextNunito(
                                      text: "Error fetching data",
                                      fontSize: getWidth(18),
                                      fontWeight: FontWeight.w500));
                            }

                            // No data state
                            if (!snapshot.hasData || snapshot.data == null) {
                              return Center(
                                  child: CustomTextNunito(
                                      text: "No user data found",
                                      fontSize: getWidth(18),
                                      fontWeight: FontWeight.w500));
                            }

                            // Data fetched successfully
                            final userData = snapshot.data!;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                userData['role'] == 'Driver'
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: getWidth(30),
                                          ),
                                          height: getHeight(18),
                                          width: getWidth(51),
                                          decoration: BoxDecoration(
                                              color: Color(0xff03989E),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Center(
                                            child: CustomTextNunito(
                                                text: "Online",
                                                fontSize: getWidth(10),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                CustomProfileSection(userData: userData),
                                CustomProfileItemsSection(userData: userData),
                                SizedBox(
                                  height: getHeight(30),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getWidth(20)),
                                  child: InkWell(
                                    onTap: () {
                                      profileBottomSheet(context);
                                    },
                                    child: CustomBlurButton(
                                      text: "Log Out",
                                      textColor: userData['role'] == 'Driver'
                                          ? Color(0xffFE0F00)
                                          : AppColors.textGrey,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getHeight(20),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
