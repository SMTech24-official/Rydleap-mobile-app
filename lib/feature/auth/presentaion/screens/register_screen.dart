import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_glass_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/global_widgets/phone_input.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/components/or_sign_in_with.dart';
import 'package:rydleap/feature/auth/dirver_registration/driver_registration.dart';
import 'package:rydleap/feature/auth/presentaion/screens/name_email_screen.dart';
import 'package:rydleap/feature/notifications_access/notifications_access_screen.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Custombackground(
        bottomContainerHeight: screenHeight() * 0.6,
        widget: Padding(
          padding: EdgeInsets.only(
            top: getHeight(82),
          ),
          child: Container(
            margin: EdgeInsets.only(left: getWidth(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImagese.car),
                SizedBox(
                  height: getHeight(10),
                ),
                Container(
                  width: screenWidth() * 0.65,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: CustomGlobalVariable.userType == 'Driver'
                              ? "Ai- based travel bookings for drivers by "
                              : "Ai- based travel bookings by ",
                          style: GoogleFonts.nunito(
                              color: Colors.white, fontSize: getWidth(40)),
                        ),
                        TextSpan(
                          text: "“Rydleap”",
                          style: GoogleFonts.nunito(
                              color: AppColors.textYellow,
                              fontSize: getWidth(40)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: getHeight(20),),
            CustomPhoneInput(),
            CustomGradientButton(text: "Get OTP", onTap: () {
              Get.to(DriverRegistrationScreen());
            }),
            Container(
              
              width: getWidth(120),
              child: Column(
                children: [
                  Text(
                    "Privacy Policy",
                    style: GoogleFonts.nunito(
                      color: Color(0xffF9F9F9),
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Divider(color: Color(0xffF9F9F9)),
                ],
              ),
            ),
            OrSignInWith(),
            CustomGlassButton(
                icon: AppIcons.googleIcon,
                text: "Sign in with Google",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => NameEmailScreen()));
                }),
            CustomGlassButton(
                icon: AppIcons.appleIcon,
                text: "Sign in with Apple",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()));
                }),
            CustomGlassButton(
                icon: AppIcons.facebookIcon,
                text: "Sign in with Facebook",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => NotificationsAccessScreen()));
                }),
            SizedBox(
              height: getHeight(20),
            )
          ],
        ),
      ),
    );
  }
}
