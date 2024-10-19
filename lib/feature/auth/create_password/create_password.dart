import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import 'package:rydleap/feature/auth/registration/controller/email_registration_controller.dart';
import 'package:rydleap/feature/auth/user_input/user_input_details.dart';

import '../../../core/global_widgets/custom_gradient_button.dart';

class CreatePasswordScreen extends StatefulWidget {
  final UserInputDetails userInputDetails;
  const CreatePasswordScreen({super.key, required this.userInputDetails});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  // final RegistrationController registrationController =
  //     Get.put(RegistrationController());
  TextEditingController _passwordController =
      TextEditingController(text: "@Password1");
  TextEditingController _confirmPasswordController =
      TextEditingController(text: "@Password1");
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
    final EmailRegistrationController controller =
        Get.put(EmailRegistrationController());
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
              text: "Create your Password",
              fontSize: getWidth(20),
            ),
            CustomTextNunito(
              text: "Ensure your password is strong and meets the criteria.",
              fontSize: getWidth(15),
              fontWeight: FontWeight.w400,
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
                CustomTextNunito(
                  text: passwordStrengthMessage,
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w400,
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
                      CustomTextNunito(
                        text: condition,
                        fontSize: getWidth(11),
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD6D3D3),
                      ),
                    ],
                  ),
                );
              },
            ),

            Spacer(),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return CustomGradientButton(
                  text: "Continue",
                  onTap: () async {
                    UserInputDetails userInput = UserInputDetails(
                      fullName: widget.userInputDetails.fullName,
                      email: widget.userInputDetails.email,
                      password: _passwordController.text,
                      confirmPassword: _confirmPasswordController.text,
                      phoneNumber: widget.userInputDetails.phoneNumber,
                      role:
                          widget.userInputDetails.role, // Get the selected role
                    );

                    await controller.onSignUp(userInput);
                    print(
                        "--------------------${userInput.toJson()}-----------");
                  },
                );
              }
            }),
            // CustomGlobalVariable.userType == 'Driver'
            //     ? isPasswordMatch && isPasswordStrong
            //         ? CustomGradientButton(
            //             text: "Driver Continue",
            //             onTap: () async {
            //               // _passwordController.clear();
            //               // _confirmPasswordController.clear();

            //               if (_passwordController.text ==
            //                   _confirmPasswordController.text) {
            //                 // Set the password in user details
            //                 widget.userInputDetails.password =
            //                     _passwordController.text;
            //                 print("User Input Details:");
            //                 print("Name: ${widget.userInputDetails.fullName}");
            //                 print("Email: ${widget.userInputDetails.email}");
            //                 print(
            //                     "Phone Number: ${widget.userInputDetails.phoneNumber}");
            //                 print(
            //                     "Password: ${widget.userInputDetails.password}");
            //                 print("Password: ${widget.userInputDetails.role}");
            //                 // Call the register user method
            //                 // await registrationController.registerDriver(
            //                 //     widget.userInputDetails.fullName,
            //                 //     widget.userInputDetails.email,
            //                 //     widget.userInputDetails.phoneNumber,
            //                 //     widget.userInputDetails.password,
            //                 //     widget.userInputDetails.role);
            //                 Get.offAll(() => LoginScreen());
            //                 // Get.snackbar(
            //                 //   "Success",
            //                 //   "succeessfully registerd",
            //                 //   snackPosition: SnackPosition.BOTTOM,
            //                 //   backgroundColor: Colors.green,
            //                 //   colorText: Colors.white,
            //                 // );
            //               } else {
            //                 // Show a message if passwords do not match
            //                 Get.snackbar(
            //                   "Error",
            //                   "Passwords do not match",
            //                   snackPosition: SnackPosition.BOTTOM,
            //                   backgroundColor: Colors.red,
            //                   colorText: Colors.white,
            //                 );
            //               }

            //               // Navigator.push(context,
            //               //     MaterialPageRoute(builder: (_) => LoginScreen()));
            //             })
            //         : CustomBlurButton(
            //             text: "Continue",
            //             // isPasswordMatch && isPasswordStrong
            //             //     ? () {
            //             //         // Navigate to the next page
            //             //       }
            //             //     : null, // Disable the button if conditions are not met
            //           )
            //     : isPasswordMatch && isPasswordStrong
            //         ? CustomGradientButton(
            //             text: "Continue",
            //             onTap: () async {
            //               // Check if passwords match and are strong
            //               if (isPasswordMatch && isPasswordStrong) {
            //                 // Set the password in user details
            //                 widget.userInputDetails.password =
            //                     _passwordController.text;

            //                 print("User Input Details:");
            //                 print("////////////////");
            //                 print("Email: ${widget.userInputDetails.email}");
            //                 print(
            //                     "Phone Number: ${widget.userInputDetails.phoneNumber}");
            //                 print(
            //                     "Password: ${widget.userInputDetails.password}");
            //                 print("Role: ${widget.userInputDetails.role}");
            //                 print("Name: ${widget.userInputDetails.fullName}");

            //                 // Call the register user method
            //                 // await registrationController.registerUser(
            //                 //   widget.userInputDetails.fullName,
            //                 //   widget.userInputDetails.email,
            //                 //   widget.userInputDetails.phoneNumber,
            //                 //   widget.userInputDetails.password,
            //                 //   widget.userInputDetails.role,
            //                 // );

            //                 // Show success message
            //                 // Get.snackbar(
            //                 //   "Success",
            //                 //   "Successfully registered",
            //                 //   snackPosition: SnackPosition.BOTTOM,
            //                 //   backgroundColor: Colors.green,
            //                 //   colorText: Colors.white,
            //                 // );

            //                 // // Navigate to the login screen
            //                 // Get.offAll(() => LoginScreen());
            //               } else {
            //                 // Show an error message if passwords do not match or are not strong
            //                 // Get.snackbar(
            //                 //   "Error",
            //                 //   isPasswordMatch
            //                 //       ? "Password is not strong enough."
            //                 //       : "Passwords do not match.",
            //                 //   snackPosition: SnackPosition.BOTTOM,
            //                 //   backgroundColor: Colors.red,
            //                 //   colorText: Colors.white,
            //                 // );
            //               }
            //             },
            //           )
            //         : CustomBlurButton(
            //             text: "Continue",
            //             // isPasswordMatch && isPasswordStrong
            //             //     ? () {
            //             //         // Navigate to the next page
            //             //       }
            //             //     : null, // Disable the button if conditions are not met
            //           ),
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
