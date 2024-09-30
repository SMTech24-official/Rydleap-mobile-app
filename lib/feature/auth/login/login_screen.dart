import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_text_button.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/auth/login/controller/login_controller.dart';
import 'package:rydleap/feature/auth/otp/otp_screen.dart';
import 'package:rydleap/feature/home/presentation/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

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
      isFormValid = _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  Widget _buildRememberMeCheckbox() {
    return Obx(() {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              _loginController.toggle();
              // Save checkbox state in shared preferences
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
                        ? Colors.white
                        : const Color(0xff9B9A9A)),
                color: _loginController.isChecked.value
                    ? const Color(0xff0000FF)
                    : Colors.transparent,
              ),
              child: _loginController.isChecked.value
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 10,
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "Remember me",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  fontSize: getWidth(13),
                ),
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
            Text(
              "Log In",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Enter your email or phone and password to continue with Rydleap",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: getHeight(24)),
            CustomTextfield(
              controller: _emailController,
              hintext: "Phone or email",
              suffixIcon: SizedBox(),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: getHeight(18)),
            CustomTextfield(
              controller: _passwordController,
              hintext: "Password",
              suffixIcon: SizedBox(
                height: getHeight(24),
                width: getWidth(24),
                child: Image.asset(AppIcons.checkOutline),
              ),
            ),
            SizedBox(height: getHeight(18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRememberMeCheckbox(), // Use the custom checkbox method
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
            SizedBox(height: getHeight(34)),
            Spacer(),
            Obx(() {
              if (_loginController.loading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return isFormValid
                    ? CustomGradientButton(
                        text: "Confirm",
                        onTap: () async {
                          await _loginController.login(
                            _emailController.text,
                            _passwordController.text,
                          );

                          // Save credentials only if "Remember Me" is checked
                          if (_loginController.isChecked.value) {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('saved_email', _emailController.text);
                            await prefs.setString('saved_password', _passwordController.text);
                          }
                        },
                      )
                    : CustomBlurButton(text: "Confirm");
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
