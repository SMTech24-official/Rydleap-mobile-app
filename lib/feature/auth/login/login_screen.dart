import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_text_button.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/forgot_password/forgot_screen.dart';
import 'package:rydleap/feature/auth/login/controller/firebase/f_login_controller.dart';
import 'package:rydleap/feature/auth/login/controller/login_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/your_location.dart';
import 'package:rydleap/feature/auth/registration/screen/f_registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());
  final FLoginController fLoginController = Get.put(FLoginController());

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    bool isRemembered = prefs.getBool('isRemembered') ?? false;

    if (isRemembered) {
      _emailController.text = prefs.getString('saved_email') ?? '';
      _passwordController.text = prefs.getString('saved_password') ?? '';
      _loginController.isChecked.value = true; // Update checkbox state
    }
  }

  void _validateForm() {
    setState(() {
      isFormValid = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  // Remember me checkbox
  Widget _buildRememberMeCheckbox() {
    return Obx(() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              _loginController.toggle();
              SharedPreferences.getInstance().then((prefs) {
                prefs.setBool('isRemembered', _loginController.isChecked.value);
              });
            },
            child: Container(
              height: getWidth(12),
              width: getWidth(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                border: Border.all(
                  color: _loginController.isChecked.value
                      ? Colors.blue
                      : const Color(0xff9B9A9A),
                ),
                color: _loginController.isChecked.value
                    ? const Color(0xff0000FF)
                    : Colors.transparent,
              ),
              child: _loginController.isChecked.value
                  ? const Icon(Icons.check, color: Colors.white, size: 10)
                  : const SizedBox(),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "remember_me".tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: getWidth(13)),
          ),
        ],
      );
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
            SizedBox(height: getHeight(35)),
            Text("log_in".tr, style: Theme.of(context).textTheme.titleMedium),
            Text("email_or_phone".tr,
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: getHeight(24)),
            CustomTextfield(
              controller: _emailController,
              hintext: "phone_or_email".tr,
              suffixIcon: SizedBox(),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: getHeight(18)),
            CustomTextfield(
              controller: _passwordController,
              hintext: "password".tr,
              suffixIcon: SizedBox(),
            ),
            SizedBox(height: getHeight(18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRememberMeCheckbox(), // Use the custom checkbox method
                AppTextButton(
                  text: "forgot_password".tr,
                  onTap: () {
                    Get.to(() => ForgotScreen());
                  },
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(height: getHeight(18)),
            Row(
              children: [
                Text("Don't have an account?".tr,
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(
                  width: getWidth(5),
                ),
                AppTextButton(
                  text: "Sign Up".tr,
                  onTap: () {
                    Get.to(() => YourLocation());
                  },
                  fontWeight: FontWeight.w400,
                  // textSize: getWidth(5),
                  textColor: AppColors.textYellow,
                ),
              ],
            ),
            Spacer(),
            Obx(() {
              if (fLoginController.isLoading.value) {
                // Show loading indicator if the login is in progress
                return Center(child: CircularProgressIndicator());
              } else {
                return isFormValid
                    ? CustomGradientButton(
                        text: "confirm".tr,
                        onTap: () async {
                          // Show the loading indicator before starting the login
                          fLoginController.isLoading.value = true;

                          // Perform login
                          await fLoginController.login(
                              _emailController.text, _passwordController.text);

                          // Save credentials if "Remember Me" is checked
                          if (_loginController.isChecked.value) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString(
                                'saved_email', _emailController.text);
                            await prefs.setString(
                                'saved_password', _passwordController.text);
                          }

                          // Hide the loading indicator once login is complete
                          fLoginController.isLoading.value = false;
                        },
                      )
                    : CustomBlurButton(text: "confirm".tr);
              }
            }),
            SizedBox(height: getHeight(20)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
