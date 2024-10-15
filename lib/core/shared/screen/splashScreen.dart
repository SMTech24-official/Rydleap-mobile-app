import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/feature/auth/login/login_screen.dart';
import 'package:rydleap/feature/profile/screen/f_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4)); // Delay for 4 seconds

    // Access shared preferences to check if the user is logged in
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn =
        prefs.getBool('isLoggedIn') ?? false; // Check the login state

    // Navigate to the appropriate screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => isLoggedIn ? FProfileScreen() : LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
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
                Image.asset(AppImagese.appLogo)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
