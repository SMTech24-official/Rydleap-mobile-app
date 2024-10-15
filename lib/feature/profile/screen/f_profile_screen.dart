import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/components/custom_profile_items_section.dart';
import 'package:rydleap/feature/profile/components/custom_profile_section.dart';
import 'package:rydleap/feature/profile/controller/firebase/f_profile_controller.dart';

class FProfileScreen extends StatefulWidget {
  const FProfileScreen({super.key});

  @override
  State<FProfileScreen> createState() => _FProfileScreenState();
}

class _FProfileScreenState extends State<FProfileScreen> {
  final fProfileController = Get.put(FProfileController());
  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent, // Transparent background
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
                      Text(
                        'Are you sure you want to Log Out?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(42),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: getHeight(40),
                            width: getWidth(104),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(88),
                                color: Color(0xff3AD896)),
                            child: Center(
                              child: Text(
                                "Wait",
                                style: GoogleFonts.inter(
                                    fontSize: getWidth(14),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getWidth(16),
                          ),
                          InkWell(
                            onTap: () {
                              print("logout");
                            },
                            child: Container(
                              height: getHeight(40),
                              width: getWidth(104),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(88),
                                  color: Color(0xffF0F0F0)),
                              child: Center(
                                child: Text(
                                  "Log Out",
                                  style: GoogleFonts.inter(
                                      color: Color(0xff001B26),
                                      fontSize: getWidth(14),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: getHeight(40),
                right: getWidth(20),
                child: SizedBox(
                  height: getHeight(26),
                  width: getWidth(26),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => LoginScreen()),
                      // );
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

  @override
  Widget build(BuildContext context) {
    final _profileController = Get.put(FProfileController());
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
          actions: [
            Obx(() {
              if (_profileController.isLoading.value) {
                // Show loading indicator
                return Center(child: CircularProgressIndicator());
              } else {
                // Show the Confirm button if not loading
                return IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    _profileController.logout();
                  },
                );
              }
            }),
          ],
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
            //online container
            CustomGlobalVariable.userType == 'Driver'
                ? Positioned(
                    top: getHeight(17),
                    right: getWidth(30),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      height: getHeight(18),
                      // width: getWidth(40),
                      decoration: BoxDecoration(
                          color: Color(0xff03989E),
                          borderRadius: BorderRadius.circular(100)),
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

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(40),
                  ),
                  CustomProfileSection(profileController: _profileController),
                  SizedBox(
                    height: getHeight(27),
                  ),
                  CustomProfileItemsSection(),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                    child: InkWell(
                      onTap: () {
                        _customBottomSheet(context);
                      },
                      child: CustomBlurButton(
                        text: "Log Out",
                        textColor: CustomGlobalVariable.userType == 'Driver'
                            ? Color(0xffFE0F00)
                            : AppColors.textGrey,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
