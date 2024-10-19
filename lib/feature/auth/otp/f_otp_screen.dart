import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/global_widgets/app_text_button.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/feature/auth/presentaion/screens/name_email_screen.dart';
import 'package:rydleap/feature/auth/registration/controller/f_registration_controller.dart';
import '../../../core/app_imagese.dart';
import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_back_button.dart';
import '../../../core/global_widgets/custom_background.dart';

class FOtpScreen extends StatefulWidget {
  const FOtpScreen({super.key});

  @override
  State<FOtpScreen> createState() => _FOtpScreenState();
}

class _FOtpScreenState extends State<FOtpScreen> {
  final FRegistrationController registrationController =
      Get.find<FRegistrationController>();
  RxString otp = "".obs;

  late Timer _timer;
  int _start = 119; // 1 minute 59 seconds
  String otpCode = ''; // Track OTP input
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resetTimer() {
    // Cancel the current timer if it's still active
    if (_timer.isActive) {
      _timer.cancel();
    }
    // Reset the countdown and restart the timer
    setState(() {
      _start = 119; // Reset to 1 minute 59 seconds
    });
    startTimer(); // Restart the timer
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}s';
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final Map<String, dynamic>? arguments = Get.arguments;

    // Check if arguments are not null
    if (arguments == null || arguments['phoneNumber'] == null) {
      return Center(
        child: Text('No phone number provided'),
      );
    }

    // Access the phone number
    String phoneNumber = arguments['phoneNumber'];
    String role = arguments['role'];
    print("Your set number is ${phoneNumber}");
    print("Your set role is ${role}");

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Custombackground(
          icon: CustomBackButton(),
          widget: Padding(
            padding: EdgeInsets.only(top: getHeight(50)),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: getHeight(129),
                width: getWidth(138),
                child: Image.asset(AppImagese.messageIcon),
              ),
            ),
          ),
          bottomContainerHeight: screenHeight() * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(35)),
              CustomTextNunito(
                text: "Enter 6-digit code",
                fontSize: getWidth(20),
              ),
              CustomTextNunito(
                text: "Your code was sent to $phoneNumber",
                fontSize: getWidth(15),
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: getHeight(24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OtpTextField(
                    decoration: InputDecoration(),
                    fillColor: Color(0xff22373F),
                    borderWidth: 0.4,
                    borderRadius: BorderRadius.circular(2),
                    focusedBorderColor: Color(0xFFFFDD2D),
                    numberOfFields: 6,
                    borderColor: Color(0xFFFFDD2D),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      // Update the otp variable and call submitOtp on every change
                      otp.value = code;
                      // Enable the button if the code length is 6
                    },
                    onSubmit: (String verificationCode) {
                      // This will also handle the final submit if needed
                      otp.value = verificationCode;
                      //controller.submitOtp(otp.value);
                      print("otp${otp.value}");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(16),
              ),
              Row(
                children: [
                  AppTextButton(
                    text: "Resend code",
                    onTap: () {
                      resetTimer();
                    },
                  ),
                  SizedBox(
                    width: getWidth(10),
                  ),
                  CustomTextNunito(
                    text: timerText,
                    fontSize: getWidth(15),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Spacer(),
              Obx(() {
                return registrationController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : CustomGradientButton(
                        text: "confirm",
                        onTap: () async {
                          print("otp${otp.value}");
                          print("otp length ${otp.value.length}");

                          // Check if OTP length is valid
                          if (otp.value.length == 6) {
                            // Call verifyOTP and wait for it to complete
                            bool isVerified = await registrationController
                                .verifyOTP(otp.value);

                            // If verification is successful, navigate to the next screen
                            if (isVerified) {
                              Get.offAll(() => NameEmailScreen(), arguments: {
                                'phoneNumber':
                                    phoneNumber, // Set phone number from user input
                                'role': role,
                              });
                            } else {
                              Get.snackbar("Error", "OTP verification failed.");
                            }
                          } else {
                            Get.snackbar(
                                "Error", "Please enter a valid 6-digit OTP.");
                          }
                        },
                      );
              }),
              SizedBox(height: getHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
