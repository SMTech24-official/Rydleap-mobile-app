import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/components/custom_profile_items_section.dart';
import 'package:rydleap/feature/profile/components/custom_profile_section.dart';
import 'package:rydleap/feature/profile/components/profile_bottom_sheet.dart';
import 'package:rydleap/feature/profile/controller/firebase/f_profile_controller.dart';

class FProfileScreen extends StatefulWidget {
  const FProfileScreen({super.key});

  @override
  State<FProfileScreen> createState() => _FProfileScreenState();
}

class _FProfileScreenState extends State<FProfileScreen> {
  final fProfileController = Get.put(FProfileController());

  @override
  Widget build(BuildContext context) {
    final fProfileController = Get.put(FProfileController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appbarColor,
          leading: CustomCloseButton(),
          title: Text(
            "about_me".tr,
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
                              return const Center(
                                  child: Text("Error fetching data"));
                            }

                            // No data state
                            if (!snapshot.hasData || snapshot.data == null) {
                              return const Center(
                                  child: Text("No user data found"));
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
                                            child: Text(
                                              "Online",
                                              style: GoogleFonts.nunito(
                                                  fontSize: getWidth(10),
                                                  fontWeight: FontWeight.w400),
                                            ),
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
                    height: getHeight(27),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
