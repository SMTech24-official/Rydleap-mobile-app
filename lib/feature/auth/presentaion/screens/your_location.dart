import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:rydleap/core/app_sizes.dart';

import 'package:rydleap/core/global_widgets/global_variable.dart';

import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/presentaion/screens/registration/register_screen.dart';

import '../../../../core/global_widgets/custom_gradient_button.dart';

class YourLocation extends StatelessWidget {
  const YourLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/Ellipse_9.png',
                  width: 150.w,
                  height: 60.h,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/Ellipse_2.png',
                  width: 80.w,
                  height: 20.h,
                ),
                Image.asset(
                  'assets/images/image_4.png',
                  width: 30.w,
                  height: 15.h,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you in ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Los Angeles?',
                style: TextStyle(
                    fontSize: 7.w,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightPrimary),
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getWidth(18)),
            child: Column(
              children: [
                CustomGradientButton(
                  onTap: () {
                    CustomGlobalVariable.userType = 'User';
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                  },
                  text: "User",
                ),
                SizedBox(
                  height: 3.w,
                ),
                CustomGradientButton(
                    text: "Driver",
                    onTap: () {
                      CustomGlobalVariable.userType = 'Driver';
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RegisterScreen()));
                    })
              ],
            ),
          ),
          SizedBox(
            height: getHeight(20),
          )
        ],
      ),
    );
  }
}
