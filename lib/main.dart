import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rydleap/app.dart';
import 'package:rydleap/feature/auth/controller/auth_controller.dart';
import 'package:rydleap/feature/home/home_controller.dart';
import 'package:rydleap/feature/home/map_controller.dart';
import 'package:rydleap/feature/auth/otp/controller/otp_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/registration/controller/registration_controller.dart';
import 'package:rydleap/firebase_options.dart';

import 'feature/auth/login/controller/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Lock orientation to portrait mode
  Get.put(MapController());
  Get.put(HomeController());
  Get.put(AuthController());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Get.put(OtpController());
    Get.put(RegistrationController());
    Get.put(LoginController());
    runApp(const Rydleap());
  });
}
