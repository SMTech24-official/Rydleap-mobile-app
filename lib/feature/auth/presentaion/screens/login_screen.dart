import 'package:flutter/material.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_text_button.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';

import 'package:rydleap/feature/auth/presentaion/screens/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool isChecked = false;
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Custombackground(
        widget: Padding(
          padding: EdgeInsets.only(top: getHeight(50)),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: getHeight(129),
              width: getWidth(138),
              child: Image.asset(AppImagese.appLogo),
            ),
          ),
        ),
        bottomContainerHeight: screenHeight() * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(35),),
            Text(
              "Log In",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Enter you email or phone and password to continue with Rydleap",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: getHeight(24),
            ),
            CustomTextfield(
              controller: _emailController,
              hintext: "Phone or email",
              suffixIcon: SizedBox(),
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
                controller: _passwordController,
                hintext: "Confirm password",
                suffixIcon: SizedBox(
                    height: getHeight(24),
                    width: getWidth(24),
                    child: Image.asset(AppIcons.checkOutline))),
            SizedBox(
              height: getHeight(18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me section
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Container(
                          height: getWidth(12),
                          width: getWidth(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(
                                  color: isChecked
                                      ? Colors.white
                                      : Color(0xff9B9A9A)),
                              color: isChecked
                                  ? Color(0xff0000FF)
                                  : Colors.transparent),
                          child: isChecked
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: getWidth(10),
                                )
                              : SizedBox()),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Remember me",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                          fontSize: getWidth(13)),
                    ),
                  ],
                ),

                AppTextButton(
                  text: "Forgotten password?",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OtpScreen()));
                  },
                  fontWeight: FontWeight.w400,
                  textSize: getWidth(5),
                )
              ],
            ),
            SizedBox(
              height: getHeight(34),
            ),
            Spacer(),
            CustomGradientButton(
                text: "Confirm",
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => NavPage()));
                }),
            SizedBox(
              height: getHeight(20),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }
}
