import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/components/custom_switch_button.dart';

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
          "Privacy",
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
            padding:  EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(25),
                ),
                CustomSwitchButton(
                  text: "Location",
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
                  text: "Data Sharing with Partners",
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
                  text: "Ad Personalization",
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
                        text: "Partners",
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
                Spacer(),
                Column(
                  children: [
                    CustomSwitchButton(
                      text: "Activity Status",
                      value: activeStatus,
                      onChanged: (value) {
                        setState(() {
                          activeStatus = value;
                        });
                      },
                      color: adPersonalization
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.02),
                    ),
                    SizedBox(height: getHeight(90),),
                    CustomGradientButton(text: "Save", onTap: () {}),
                    SizedBox(height: getHeight(20),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
