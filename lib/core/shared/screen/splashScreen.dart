import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rydleap/core/shared/widgets/background_widget.dart';
import 'package:rydleap/core/utility/assets_paths.dart';
import 'package:rydleap/feature/auth/controller/auth_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/login.dart';
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
      body: BackgroundWidget(
          // centerWidget: Center(
          //   child: SvgPicture.asset(AssetsPaths.logo),
          // ),
          ),
    );
  }
}
