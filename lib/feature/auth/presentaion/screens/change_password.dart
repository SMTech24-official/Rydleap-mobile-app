import 'package:flutter/material.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_buttomsheet/custom_bottomsheet.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import '../../../../core/global_widgets/custom_gradient_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool checkPass = false;

  bool isConditionMet = false;

  bool containsNumber(String password) {
    return password.contains(RegExp(r'\d'));
  }

  bool containsSpecialCharacter(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  List<String> passwordCondition = [
    "At least 8 characters",
    "Includes a number",
    "Includes a special character",
  ];

  bool get isPasswordStrong {
    String password = _newPasswordController.text;
    return password.length >= 8 &&
        containsNumber(password) &&
        containsSpecialCharacter(password);
  }

  bool get isPasswordMatch {
    return _newPasswordController.text == _confirmPasswordController.text &&
        _newPasswordController.text.isNotEmpty;
  }

  String get passwordStrengthMessage {
    if (isPasswordMatch && isPasswordStrong) {
      return "Strong";
    } else if (isPasswordMatch && !isPasswordStrong) {
      return "Week";
    } else {
      return "Passwords do not match.";
    }
  }

  Widget get passwordStrengthIcon {
    if (isPasswordMatch && isPasswordStrong) {
      return Image.asset(AppIcons.checkFill);
    } else {
      return Icon(
        Icons.error_outline,
        color: Colors.red,
      );
    }
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
              child: Image.asset(AppImagese.lockIcon),
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
            CustomTextNunito(
              text: "Change Password",
              fontSize: getWidth(20),
            ),

            SizedBox(
              height: getHeight(24),
            ),
            CustomTextfield(
              controller: _currentPasswordController,
              obsecureText: checkPass,
              hintext: "Current Password",
              suffixIcon: SizedBox(),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
              controller: _newPasswordController,
              obsecureText: checkPass,
              hintext: "New Password",
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    checkPass = !checkPass;
                  });
                },
                child: SizedBox(
                  height: getHeight(24),
                  width: getWidth(24),
                  child: Icon(
                    checkPass ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xffF8F8F8),
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
              controller: _confirmPasswordController,
              obsecureText: checkPass,
              hintext: "Re-password",
              suffixIcon: SizedBox(
                  height: getHeight(24),
                  width: getWidth(24),
                  child: passwordStrengthIcon),
              onTap: () {
                setState(() {
                  checkPass = !checkPass;
                });
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: getHeight(16),
            ),
            Row(
              children: [
                SizedBox(
                    height: getHeight(24),
                    width: getWidth(24),
                    child: passwordStrengthIcon),
                SizedBox(
                  width: 10,
                ),
                CustomTextNunito(
                    text: passwordStrengthMessage,
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w400),
              ],
            ),
            //password conditon section
            ListView.builder(
              shrinkWrap: true,
              itemCount: passwordCondition.length,
              itemBuilder: (context, index) {
                final condition = passwordCondition[index];

                switch (index) {
                  case 0:
                    isConditionMet = _newPasswordController.text.length >= 8;
                    break;
                  case 1:
                    isConditionMet =
                        containsNumber(_newPasswordController.text);
                    break;
                  case 2:
                    isConditionMet =
                        containsSpecialCharacter(_newPasswordController.text);
                    break;
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        height: getWidth(12),
                        width: getWidth(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(
                            color: isConditionMet
                                ? Colors.white
                                : Color(0xff9B9A9A),
                          ),
                          color: isConditionMet
                              ? Color(0xff30B64D)
                              : Color(0xffF50D0D),
                        ),
                        child: isConditionMet
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: getWidth(10),
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.white,
                                size: getWidth(10),
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextNunito(
                        text: condition,
                        fontSize: getWidth(12),
                        color: Color(0xffD6D3D3),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                );
              },
            ),
            Spacer(),
            isPasswordMatch && isPasswordStrong
                ? CustomGradientButton(
                    text: "Continue",
                    onTap: () {
                      _currentPasswordController.clear();
                      _newPasswordController.clear();
                      _confirmPasswordController.clear();
                      // _customBottomSheet(context);
                      customBottomSheet(
                          context,
                          "Your password has been changed successfully!",
                          AppImagese.successIcon,
                          "",
                          getWidth(17),
                          0);
                    })
                : CustomBlurButton(
                    text: "Continue",
                    // isPasswordMatch && isPasswordStrong
                    //     ? () {
                    //         // Navigate to the next page
                    //       }
                    //     : null, // Disable the button if conditions are not met
                  ),
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
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
    super.dispose();
  }
}
