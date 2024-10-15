import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rydleap/app.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/auth/controller/auth_controller.dart';
import 'package:rydleap/feature/contact/controller/contact_controller.dart';
import 'package:rydleap/feature/home/home_controller.dart';
import 'package:rydleap/feature/home/map_controller.dart';
import 'package:rydleap/feature/auth/otp/controller/otp_controller.dart';
import 'package:rydleap/feature/auth/presentaion/screens/registration/controller/registration_controller.dart';
import 'package:rydleap/feature/profile/controller/profile_controller.dart';
import 'package:rydleap/firebase_options.dart';

import 'feature/auth/login/controller/forgot_controller.dart';
import 'feature/auth/login/controller/login_controller.dart';
import 'feature/profile/widgets/contact_support/contact_support_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   Locale savedLocale = await SharePref.getSelectedLanguage();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Lock orientation to portrait mode
  Get.put(MapController());
  Get.put(HomeController());
  Get.put(ProfileController());
  Get.put(AuthController());
  Get.put(ForgotController());
  Get.put(OtpController());
  Get.put(ContactController());
  Get.put(ContactSupportController());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Get.put(OtpController());
    Get.put(RegistrationController());
    Get.put(LoginController());
    runApp( Rydleap(initialLocale: savedLocale,));
  });
}
