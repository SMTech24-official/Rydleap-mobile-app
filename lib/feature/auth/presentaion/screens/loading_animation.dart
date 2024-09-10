import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/feature/auth/controller/auth_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/your_location.dart';

class LoadingAnimationScreen extends StatefulWidget {
  const LoadingAnimationScreen({super.key});

  @override
  State<LoadingAnimationScreen> createState() => _LoadingAnimationScreenState();
}

class _LoadingAnimationScreenState extends State<LoadingAnimationScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    bool isLoggedIn = await AuthController.checkAuthState();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => YourLocation()));
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/Ellipse_2.png',
              width: 80.w,
              height: 20.h,
            ),
            Image.asset(AppImagese.appLogo),
            LoadingAnimationWidget.waveDots(
              color: Color(0xffFFDD2D),
              size: getWidth(70),
            ),
          ],
        ),
      ),
    ));
  }
}
