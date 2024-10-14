import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_icons.dart';
import '../../../core/app_imagese.dart';
import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_background.dart';
import '../../../core/global_widgets/custom_blur_button.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';
import '../../../core/global_widgets/custom_textfield.dart';
import '../../../core/global_widgets/global_variable.dart';

class CreateNewPassword extends StatefulWidget {
  final String role;
  const CreateNewPassword({super.key, required this.role});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  // OtpController otpController = Get.find();

  TextEditingController _passwordController =
      TextEditingController(text: "Enter New Password");
  TextEditingController _confirmPasswordController =
      TextEditingController(text: "Confirm New Password");
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
    String password = _passwordController.text;
    return password.length >= 8 &&
        containsNumber(password) &&
        containsSpecialCharacter(password);
  }

  bool get isPasswordMatch {
    return _passwordController.text == _confirmPasswordController.text &&
        _passwordController.text.isNotEmpty;
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
            Text(
              "Create your Password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Ensure your password is strong and meets the criteria.",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: getHeight(24),
            ),
            CustomTextfield(
              controller: _passwordController,
              obsecureText: checkPass,
              hintext: "Password",
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
                Text(
                  passwordStrengthMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: passwordCondition.length,
              itemBuilder: (context, index) {
                final condition = passwordCondition[index];

                switch (index) {
                  case 0:
                    isConditionMet = _passwordController.text.length >= 8;
                    break;
                  case 1:
                    isConditionMet = containsNumber(_passwordController.text);
                    break;
                  case 2:
                    isConditionMet =
                        containsSpecialCharacter(_passwordController.text);
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
                      Text(
                        condition,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Spacer(),
            CustomGlobalVariable.userType == 'Driver'
                ? isPasswordMatch && isPasswordStrong
                    ? CustomGradientButton(
                        text: "Driver Continue",
                        onTap: () async {
                          // _passwordController.clear();
                          // _confirmPasswordController.clear();

                          if (_passwordController.text ==
                              _confirmPasswordController.text) {
                            // Set the password in user details

                            // Call the register user method

                            Get.snackbar(
                              "Success",
                              "succeessfully registerd",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );
                          } else {
                            // Show a message if passwords do not match
                            Get.snackbar(
                              "Error",
                              "Passwords do not match",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => LoginScreen()));
                        })
                    : CustomBlurButton(
                        text: "Continue",
                        // isPasswordMatch && isPasswordStrong
                        //     ? () {
                        //         // Navigate to the next page
                        //       }
                        //     : null, // Disable the button if conditions are not met
                      )
                : isPasswordMatch && isPasswordStrong
                    ? CustomGradientButton(
                        text: "Continue",
                        onTap: () async {
                          // _passwordController.clear();
                          // _confirmPasswordController.clear();

                          // otpController.setPassword(
                          //     _confirmPasswordController.text, widget.role);

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => LoginScreen()));
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
    _passwordController.clear();
    _confirmPasswordController.clear();
    super.dispose();
  }
}
