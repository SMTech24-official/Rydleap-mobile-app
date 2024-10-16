import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/feature/profile/controller/firebase/f_profile_controller.dart';

final _profileController = Get.put(FProfileController());
Future<dynamic> profileBottomSheet(BuildContext context) {
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
                        InkWell(
                          onTap: () {
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
                                "Wait",
                                style: GoogleFonts.inter(
                                    fontSize: getWidth(14),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getWidth(16),
                        ),
                        Obx(() {
                          if (_profileController.isLoading.value) {
                            // Show loading indicator
                            return Center(child: CircularProgressIndicator());
                          } else {
                            // Show the Confirm button if not loading
                            return InkWell(
                              onTap: () {
                                _profileController.logout();
                              },
                              child: Container(
                                height: getHeight(40),
                                width: getWidth(104),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(88),
                                    color: Color(0xffF0F0F0)),
                                child: Center(
                                  child: Text(
                                    "Logout",
                                    style: GoogleFonts.inter(
                                        fontSize: getWidth(14),
                                        color: Color(0xff001B26),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
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
