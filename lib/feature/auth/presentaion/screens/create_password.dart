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
  bool checkPass = false;
  bool checkRePass = false;
  List<String> passItems = [""];
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
              obsecureText: checkPass,
              hintext: "Password",
              suffixIcon: checkPass
                  ? Icon(
                      Icons.visibility_off,
                      color: Color(0xffF8F8F8),
                      size: getWidth(16),
                    )
                  : Icon(
                      Icons.visibility,
                      color: Color(0xffF8F8F8),
                      size: getWidth(16),
                    ),
              onTap: () {
                setState(() {
                  checkPass = !checkPass;
                });
              },
            ),
            SizedBox(
              height: getHeight(18),
            ),
            CustomTextfield(
                controller: confirmPasswordController,
                hintext: "Re-password",
                obsecureText: true,
                suffixIcon: Icon(
                  Icons.error_outline,
                  color: Color(0xffF50D0D),
                  size: getWidth(16),
                ),
                // ? Icon(
                //     Icons.error_outline,
                //     color: Color(0xffF50D0D),
                //     size: getWidth(16),
                //   )
                // : Icon(Icons.error),
                onTap: () {
                  setState(() {
                    checkRePass = !checkRePass;
                  });
                }),
            SizedBox(
              height: getHeight(16),
            ),
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Color(0xffF50D0D),
                  size: getWidth(16),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Create your Password",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          height: getWidth(12),
                          width: getWidth(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(color: Color(0xff9B9A9A))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "At least 8 characters",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                }),
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
