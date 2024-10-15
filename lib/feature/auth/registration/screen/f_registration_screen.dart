import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_glass_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/phone_input.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/components/or_sign_in_with.dart';
import 'package:rydleap/feature/auth/login/login_screen.dart';
import 'package:rydleap/feature/auth/otp/f_otp_screen.dart';
import 'package:rydleap/feature/auth/registration/controller/f_registration_controller.dart';
import 'package:rydleap/feature/driver_dashboard/presentation/driver_dashboard.dart';
import 'package:rydleap/feature/home/presentation/screens/home.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';

class FRegistrationScreen extends StatefulWidget {
  final String role;
  const FRegistrationScreen({super.key, required this.role});

  @override
  State<FRegistrationScreen> createState() => _FRegistrationScreenState();
}

class _FRegistrationScreenState extends State<FRegistrationScreen> {
  final FRegistrationController fRegistrationController =
      Get.put(FRegistrationController());

  @override
  void initState() {
    super.initState();

    // Print the role when the user arrives at the register screen
    print("Role: ${widget.role}");
  }

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
                          text: widget.role == 'Driver'
                              ? "Ai-based travel bookings for drivers by "
                              : "Ai-based travel bookings by ",
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
            SizedBox(
              height: getHeight(35),
            ),

            CustomPhoneInput(
              controller: fRegistrationController.phoneController,
            ),

////////////////////////////////////////// firebase/////////////////////////////////////////
            Obx(() {
              return fRegistrationController.isLoading.value
                  ? CircularProgressIndicator()
                  : CustomGradientButton(
                      text: "Get Otp driver",
                      onTap: () {
                        String phoneNumber = fRegistrationController
                            .phoneController
                            .text; // Get the phone number from the controller
                        fRegistrationController.sendOTP();
                        Get.to(FOtpScreen(), arguments: {
                          'phoneNumber':
                              phoneNumber, // Set phone number from user input
                          'role': widget.role,
                        });
                      });
            }),
////////////////////////////////////////// firebase/////////////////////////////////////////

            // widget.role == 'Driver'
            //     ? CustomGradientButton(
            //         text: "Get Otp driver",
            //         onTap: () {
            //           String phoneNumber = phoneController
            //               .text; // Get the phone number from the controller
            //           // otpController.sendOtp(phoneNumber,widget.role);
            //           // Get.to(OtpScreen(), arguments: {
            //           //   'phoneNumber':
            //           //       phoneNumber, // Set phone number from user input
            //           //   'role': widget.role,
            //           // });
            //         })
            // : Obx(() {
            //     return otpController.isLoading.value
            //         ? CircularProgressIndicator()
            //         : CustomGradientButton(
            //             text: "get_otp".tr,
            //             onTap: () {
            //               String phoneNumber = phoneController
            //                   .text; // Get the phone number from the controller
            //               otpController.sendOtp(phoneNumber,widget.role);
            //               Get.to(OtpScreen(), arguments: {
            //                 'phoneNumber':
            //                     phoneNumber, // Set phone number from user input
            //                 'role': widget.role,
            //               });
            //             });
            //   }),
            Container(
              // width: getWidth(120),
              // height: 37,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColors.diveiderColor))),
              child: Text(
                "privacy_policy".tr,
                style: TextStyle(
                  color: Color(0xffF9F9F9),
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            OrSignInWith(),
            CustomGlassButton(
              icon: AppIcons.googleIcon,
              text: "sign_google".tr,
              // onTap: _signInWithGoogle,
              onTap: () {
                // print("object");
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
            ),
            CustomGlassButton(
              icon: AppIcons.appleIcon,
              text: "sign_apple".tr,
              onTap: () {
                Get.to(ProfileScreen());
              },
            ),
            CustomGlassButton(
              icon: AppIcons.facebookIcon,
              text: "sign_facebook".tr,
              onTap: () {
                if (widget.role == 'User') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Home()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DriverDashboard()));
                }
              },
            ),
            SizedBox(
              height: getHeight(20),
            )
          ],
        ),
      ),
    );
  }
}
