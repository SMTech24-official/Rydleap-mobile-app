import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_text_button.dart';
import 'package:rydleap/core/global_widgets/custom_back_button.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/feature/auth/presentaion/screens/change_password.dart';

import '../../../../core/global_widgets/custom_gradient_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
    setState(() {
      otpCode = code;
      // Enable button when all 4 digits are entered
      _isButtonDisabled = otpCode.length != 4;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                "Enter 4-digit code",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Your code was sent to +(1) xxxx-xxxx",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: getHeight(24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OtpTextField(
                    fillColor: Color(0xff22373F),
                    borderWidth: 0.4,
                    borderRadius: BorderRadius.circular(2),
                    focusedBorderColor: Color(0xFFFFDD2D),
                    numberOfFields: 4,
                    borderColor: Color(0xFFFFDD2D),
                    showFieldAsBox: true,
                    onCodeChanged: onOtpCodeChanged,
                    onSubmit: (String verificationCode) {
                      setState(() {
                        otpCode = verificationCode; // Ensure OTP is captured correctly
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
                    text: "Resend code",
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
              _isButtonDisabled
                  ? CustomBlurButton(text: "Confirm")
                  : CustomGradientButton(
                      text: "Confirm",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChangePasswordScreen(),
                          ),
                        );
                      },
                    ),
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
