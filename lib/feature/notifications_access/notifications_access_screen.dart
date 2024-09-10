import 'package:flutter/material.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_back_button.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_container.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';

class NotificationsAccessScreen extends StatelessWidget {
  const NotificationsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(),
        CustomContainer(
            bottomContainerHeight: screenHeight() * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(210),
                  width: getWidth(179),
                  child: Image.asset(
                    AppImagese.notificationImage,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: getHeight(49),
                ),
                Text(
                  "Notifications",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: getHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(35)),
                  child: Text(
                    "We need permission to send you notifications for ride updates, promotions, and more.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Spacer(),
                CustomGradientButton(text: "Continue", onTap: () {}),
                SizedBox(
                  height: getHeight(12),
                ),
                CustomBlurButton(text: "Maybe Later"),
                SizedBox(
                  height: getHeight(20),
                )
              ],
            )),
        Positioned(
            top: getHeight(29.25),
            left: getWidth(24.16),
            child: CustomBackButton()),
      ],
    ));
  }
}
