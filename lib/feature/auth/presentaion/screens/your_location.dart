import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/shared/widgets/gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/presentaion/screens/login.dart';

import '../../../home/presentation/screens/home.dart';

class YourLocation extends StatelessWidget {
  const YourLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5.h, left: 5.w),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/Ellipse_9.png',
                    width: 150.w,
                    height: 60.h,
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
            SizedBox(
              height: 2.w,
            ),
            Container(
              padding: EdgeInsets.only(left: 2.w, right: 3.w, top: 10.w),
              child: Column(
                children: [

                  CustomGradientButton(
                    onTap: () {
                      CustomGlobalVariable.userType = 'User';
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    text: "User",

                  ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));


                    },
                    child: Text(
                      'Yes, I am',
                      style: TextStyle(color: Colors.black),
                    ),

                  ),
                  SizedBox(
                    height: 3.w,
                  ),
                  CustomBlurButton(
                      text: "Driver",
                      onTap: () {
                        CustomGlobalVariable.userType = 'Driver';
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Login()));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
