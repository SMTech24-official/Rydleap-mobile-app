import 'package:flutter/material.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isChecked = false;
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
              controller: passwordController,
              hintext: "Password",
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
              controller: confirmPasswordController,
              hintext: "Re-password",
            ),
            Spacer(),
            CustomBlurButton(
                text: "Continue",
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => NavPage()));
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }
}
