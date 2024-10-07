import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_text_button.dart';
import 'package:rydleap/core/global_widgets/custom_back_button.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/feature/auth/otp/controller/otp_controller.dart';

class OtpScreen2 extends StatefulWidget {
  const OtpScreen2({super.key});

  @override
  State<OtpScreen2> createState() => _OtpScreen2State();
}

class _OtpScreen2State extends State<OtpScreen2> {
   final OtpController otpController = Get.put(OtpController());
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

  void onOtpCodeChanged(String code) {
    otpController.otpCode.value = code;
    setState(() {
      otpCode = code;
      // Enable button when all 4 digits are entered
      _isButtonDisabled = otpCode.length != 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    // final Map<String, dynamic>? arguments = Get.arguments;

    // // Check if arguments are not null
    // if (arguments == null || arguments['phoneNumber'] == null) {
    //   return Center(
    //     child: Text('No phone number provided'),
    //   );
    // }

    // // Access the phone number
    // String phoneNumber = arguments['phoneNumber'];
    // print("Your set number is ${phoneNumber}");
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
              SizedBox(
                height: getHeight(35),
              ),
              Text(
                "digit_title".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "code_title".tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: getHeight(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OtpTextField(
                    decoration:InputDecoration() ,
                    fillColor: Color(0xff22373F),
                    borderWidth: 0.4,
                    borderRadius: BorderRadius.circular(2),
                    focusedBorderColor: Color(0xFFFFDD2D),
                    numberOfFields: 4,
                    borderColor: Color(0xFFFFDD2D),
                    showFieldAsBox: true,
                    onCodeChanged: onOtpCodeChanged,
                    onSubmit: (String verificationCode) {
                      otpController.otpCode.value = verificationCode;
                      setState(() {
                        otpCode =
                            verificationCode; // Ensure OTP is captured correctly
                        _isButtonDisabled = verificationCode.length != 4;
                      });
                    }, // end onSubmit
                  ),
       
                ],
              ),
              SizedBox(
                height: getHeight(16),
              ),
              Row(
                children: [
                  AppTextButton(
                    text: "resend_code".tr,
                    onTap: () {
                      resetTimer();
                    },
                  ),
                  SizedBox(
                    width: getWidth(10),
                  ),
                  Text(
                    timerText,
                    style: GoogleFonts.nunito(
                      fontSize: getWidth(15),
                      fontWeight: FontWeight.w500,
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                ],
              ),

              Spacer(),
              //  _isButtonDisabled
              //     ? CustomBlurButton(text: "Confirm"):
              Obx(() {
                if (otpController.otpResponse.value.success) {
                  return Text(
                    "${"otp_sent".tr}: ${otpController.otpResponse.value.data?.body}",
                    style: TextStyle(color: Colors.white),
                  );
                } else if (!otpController.otpResponse.value.success &&
                    otpController.otpResponse.value.message.isNotEmpty) {
                  return Text(
                    "${"error".tr}: ${otpController.otpResponse.value.message}",
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              }),
            
              Obx(() {
                return otpController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : CustomGradientButton(
                        text: "confirm".tr,
                        onTap: () async {

                          // otpController.varifiOTP();


                        }
                      );
              }),
              SizedBox(
                height: getHeight(20),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
