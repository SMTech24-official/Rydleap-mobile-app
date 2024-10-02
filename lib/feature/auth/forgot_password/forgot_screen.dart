import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/custom_textfield.dart';
import 'package:rydleap/feature/auth/login/controller/forgot_controller.dart';
import 'package:rydleap/feature/auth/otp/otp2_screen.dart';
import 'package:rydleap/feature/auth/otp/otp_screen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final ForgotController _forgotController = Get.put(ForgotController());

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
             "forgot_password".tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
               "email".tr,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: getHeight(24)),
            CustomTextfield(
              controller: _forgotController.emailController,
              hintext: "h_email".tr,
              suffixIcon: SizedBox(),
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: getHeight(34)),
            Spacer(),
            Obx(() => _forgotController.isFormValid.value
                ? CustomGradientButton(
                    text: "confirm".tr,
                    onTap: () {



                      Get.to(()=>OtpScreen2());
                      // _forgotController.sendMail();





                    },
                  )
                : CustomBlurButton(text: "confirm".tr)),
            SizedBox(height: getHeight(20)),
          ],
        ),
      ),
    );
  }


}
