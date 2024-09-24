import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/presentaion/screens/create_password.dart';
import '../../../../core/global_widgets/custom_gradient_button.dart';

class NameEmailScreen extends StatefulWidget {
  const NameEmailScreen({super.key});

  @override
  State<NameEmailScreen> createState() => _NameEmailScreenState();
}

class _NameEmailScreenState extends State<NameEmailScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool isChecked = false;
  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isFormValid = _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          isChecked;
    });
  }

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
            CustomTextfield(
              controller: _nameController,
              hintext: "Name",
              suffixIcon: SizedBox(),
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
              controller: _emailController,
              hintext: "Email",
              suffixIcon: SizedBox(),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: getHeight(18),
            ),
            //terms and condition
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By signing up with",
                          style: TextStyle(
                              color: Color(0xffDEDEDC),
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: " “Rydleap” ",
                          style: TextStyle(
                              color: AppColors.textYellow,
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: "you agree to our",
                          style: TextStyle(
                              color: Color(0xffDEDEDC),
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Terms and Conditions",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xffDEDEDC),
                        fontSize: getWidth(13),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(34),
            ),
            //captcha section
            Container(
              height: getHeight(76),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getWidth(4))),
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth() * 0.5,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  _validateForm();
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "I’m not a robot",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getWidth(16),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: getWidth(18), top: getHeight(10)),
                    child: Column(
                      children: [
                        Container(
                          height: getHeight(47),
                          width: getHeight(47),
                          child: Image.asset(AppIcons.captcha),
                        ),
                        Text(
                          "Privacy - Terms",
                          style: TextStyle(
                              color: Color(0xffABABAB),
                              fontSize: getWidth(8),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Confirm button
           isFormValid
                  ? CustomGradientButton(
              text: "Confirm",
              onTap:  () {
                      Get.to(CreatePasswordScreen());
                      
                    }
                  
                    
            ):CustomBlurButton(text: "Confirm"),
            SizedBox(
              height: getHeight(20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
