import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_gradient.dart';
import 'package:rydleap/feature/auth/presentaion/screens/change_password.dart';

import '../../../../core/global_widgets/custom_gradient_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Custombackground(
          icon: Padding(
            padding: EdgeInsets.only(top: getHeight(20), left: getWidth(10)),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ),
          ),
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
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
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
                  Text(
                    "Resend code",
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(15),
                        fontWeight: FontWeight.w600,
                        color: Color(0xffEEEEEE)),
                  ),
                  SizedBox(
                    width: getWidth(10),
                  ),
                  Text(
                    "1:59s",
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(15),
                        fontWeight: FontWeight.w500,
                        color: Color(0xffEEEEEE)),
                  ),
                ],
              ),
              Spacer(),
              CustomGradientButton(
                  text: "Confirm",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChangePasswordScreen()));
                  }),
              SizedBox(
                height: getHeight(20),
              )
            ],
          )),
    );
  }
}
