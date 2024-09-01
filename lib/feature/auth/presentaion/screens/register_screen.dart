import 'package:flutter/material.dart';
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
import 'package:rydleap/feature/auth/presentaion/screens/name_email_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Custombackground(
        bottomContainerHeight: screenHeight() * 0.5,
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
                  width: screenWidth() * 0.5,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: CustomGlobalVariable.userType == 'Driver'
                              ? "Ai- based travel bookings for drivers by "
                              : "Ai- based travel bookings by ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                          ),
                        ),
                        TextSpan(
                          text: "“Rydleap”",
                          style: TextStyle(
                            color: AppColors.textYellow,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                          ),
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
            CustomPhoneInput(),
            CustomGradientButton(text: "Get OTP", onTap: () {}),
            Container(
              width: getWidth(120),
              height: 37,
              child: Column(
                children: [
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
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
                onTap: () {}),
            CustomGlassButton(
                icon: AppIcons.facebookIcon,
                text: "Sign in with Facebook",
                onTap: () {}),
            // SizedBox(
            //   height: getHeight(20),
            // )
          ],
        ),
      ),
    );
  }
}
