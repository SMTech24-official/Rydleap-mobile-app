import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_buttomsheet/bottomsheet_onebutton.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/components/custom_switch_button.dart';
import 'package:rydleap/feature/profile/widgets/privacy_settings/components/privacy_dropdown.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool location = false;
  bool dataSharing = false;
  bool adPersonalization = false;
  bool partners = false;
  bool activeStatus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "privacy".tr,
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight(),
            width: double.infinity,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 50.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(25),
                ),
                CustomSwitchButton(
                  text: "location".tr,
                  value: location,
                  onChanged: (value) {
                    setState(() {
                      location = value;
                    });
                  },
                  color: location
                      ? Colors.white.withOpacity(0.1)
                      : Colors.white.withOpacity(0.02),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                CustomSwitchButton(
                  text: "data_sharing_with_partners".tr,
                  value: dataSharing,
                  onChanged: (value) {
                    setState(() {
                      dataSharing = value;
                    });
                  },
                  color: dataSharing
                      ? Colors.white.withOpacity(0.1)
                      : Colors.white.withOpacity(0.02),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                CustomSwitchButton(
                  text: "ad_personalization".tr,
                  value: adPersonalization,
                  onChanged: (value) {
                    setState(() {
                      adPersonalization = value;
                    });
                  },
                  color: adPersonalization
                      ? Colors.white.withOpacity(0.1)
                      : Colors.white.withOpacity(0.02),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                CustomGlobalVariable.userType == 'Driver'
                    ? CustomSwitchButton(
                        text: "partners".tr,
                        value: partners,
                        onChanged: (value) {
                          setState(() {
                            partners = value;
                          });
                        },
                        color: partners
                            ? Colors.white.withOpacity(0.1)
                            : Colors.white.withOpacity(0.02),
                      )
                    : SizedBox(),
                SizedBox(
                  height: getHeight(54),
                ),
                CustomPrivacyDropdown(),
               
                SizedBox(
                  height: getHeight(12),
                ),
                CustomSwitchButton(
                  text: "activity_status".tr,
                  value: activeStatus,
                  onChanged: (value) {
                    setState(() {
                      activeStatus = value;
                    });
                  },
                  color: activeStatus
                      ? Colors.white.withOpacity(0.1)
                      : Colors.white.withOpacity(0.02),
                ),
                // SizedBox(height: getHeight(90),),
                Spacer(),
                CustomGradientButton(
                    text: "save".tr,
                    onTap: () {
                      // _customBottomSheet(context);
                      bottomSheetOneButton(
                        context, 
                      "Saved!", 
                      AppImagese.successIcon, 
                     
                      );
                    }),
                SizedBox(
                  height: getHeight(20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 }
