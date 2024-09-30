import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_glass_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/global_widgets/phone_input.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/components/or_sign_in_with.dart';
import 'package:rydleap/feature/auth/dirver_registration/driver_registration.dart';
import 'package:rydleap/feature/auth/otp/controller/otp_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/name_email_screen.dart';
import 'package:rydleap/feature/auth/otp/otp_screen.dart';
import 'package:rydleap/feature/driver_dashboard/presentation/driver_dashboard.dart';
import 'package:rydleap/feature/home/presentation/screens/home.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';
import 'package:rydleap/feature/social_login/google_login.dart';

import '../../../../../core/global_widgets/custom_gradient_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final OtpController otpController = Get.put(OtpController());
  final TextEditingController phoneController =
      TextEditingController(text: "+8801606542072");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Navigate to the NameEmailScreen if login is successful
        if (userCredential.user != null) {
          Get.to(NameEmailScreen());
        }

        setState(() {
          _user = userCredential.user;
        });
      }
    } catch (error) {
      // Print error in console
      print("Google login failed: $error");
    }
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Custombackground(
        bottomContainerHeight: screenHeight() * 0.5,
        //car and text section
        widget: Padding(
          padding: EdgeInsets.only(
            top: getHeight(82),
          ),
          child: Container(
            margin: EdgeInsets.only(left: getWidth(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(onPressed: _signOut, child: Text("logout")),
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
            SizedBox(
              height: getHeight(35),
            ),
            CustomPhoneInput(
              controller: phoneController,
            ),
            Obx(() {
              return otpController.isLoading.value
                  ? CircularProgressIndicator()
                  : CustomGradientButton(
                      text: "Get OTP",
                      onTap: () {
                        String phoneNumber = phoneController
                            .text; // Get the phone number from the controller
                        otpController.sendOtp(phoneNumber);
                        Get.to(OtpScreen(), arguments: {
                          'phoneNumber': phoneNumber, // Pass the phone number here
                        });
                        // Get.to(DriverRegistrationScreen());
                        // Get.to(OtpScreen());
                      });
            }),

            // Container(
            //   width: getWidth(120),
            //   height: 37,
            //   child: Column(
            //     children: [
            //       Text(
            //         "Privacy Policy",
            //         style: TextStyle(
            //           color: Color(0xffF9F9F9),
            //           fontSize: getWidth(14),
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       Divider(color: Color(0xffF9F9F9)),
            //     ],
            //   ),
            // ),
            // OrSignInWith(),
            // CustomGlassButton(
            //     icon: AppIcons.googleIcon,
            //     text: "Sign in with Google",
            //     onTap: () {
            //       Get.to(NameEmailScreen());
            //     }),
            // // GoogleLogin(),
            // CustomGlassButton(
            //     icon: AppIcons.appleIcon,
            //     text: "Sign in with Apple",
            //     onTap: () {
            //       Get.to(ProfileScreen());
            //     }),
            // CustomGlassButton(
            //     icon: AppIcons.facebookIcon,
            //     text: "Sign in with Facebook",
            //     onTap: () {
            //       if (CustomGlobalVariable.userType == 'User') {
            //         Navigator.push(
            //             context, MaterialPageRoute(builder: (_) => Home()));
            //       } else {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (_) => DriverDashboard()));
            //       }
            //     }),
            // SizedBox(
            //   height: getHeight(20),
            // )
          ],
        ),
      ),
    );
  }
}
