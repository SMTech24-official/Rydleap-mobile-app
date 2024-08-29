import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/shared/widgets/background_widget.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/core/utility/assets_paths.dart';
import 'package:rydleap/feature/auth/controller/auth_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/register_screen.dart';
import 'package:rydleap/feature/auth/presentaion/screens/your_location.dart';
import 'package:rydleap/feature/home/presentation/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    bool isLoggedIn = await AuthController.checkAuthState();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => isLoggedIn ? Home() : YourLocation()));
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

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
                  Image.asset(AppImagese.appLogo)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
