import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rydleap/app.dart';
import 'package:rydleap/feature/auth/otp/controller/otp_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/registration/controller/registration_controller.dart';
import 'package:rydleap/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Get.put(OtpController());
    Get.put(RegistrationController());
    runApp(const Rydleap());
  });
}
