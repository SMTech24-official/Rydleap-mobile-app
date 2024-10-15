import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:get/get_navigation/get_navigation.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/language_string.dart';
import 'package:rydleap/core/shared/screen/splashScreen.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/auth/create_password/check.dart';
import 'package:rydleap/feature/auth/login/login_screen.dart';

class Rydleap extends StatelessWidget {
  final Locale initialLocale;
  const Rydleap({super.key, required this.initialLocale});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return FlutterSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: initialLocale,
        fallbackLocale: Locale("en", "US"),
        translations: LocalString(),
        // home: SplashScreen(),
        home: LoginScreen(),
        // theme: lightThemeData(),
        theme: _darkThemeData(),
      );
    });
  }

/////////////
  ThemeData _darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      iconTheme: IconThemeData(color: Color(0xffD9D9D9), size: 24),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.nunito(
            color: Color(0xffC3BBBB),
            fontSize: getWidth(15),
            fontWeight: FontWeight.w400),
        // fillColor: AppColors.mainColor,
        fillColor: Colors.white,
        focusColor: Colors.black,
        // filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldBorderColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldBorderColor)),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            // backgroundColor: Colors.purple,
            backgroundColor: AppColors.lightPrimary,
            foregroundColor: Colors.white),
      ),
      expansionTileTheme: ExpansionTileThemeData(
          shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      )),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            iconColor: WidgetStateColor.resolveWith((states) => Colors.white)),
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.nunito(
          fontSize: 7.w,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),

        titleMedium: GoogleFonts.nunito(
          fontSize: getWidth(20),
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.nunito(
          fontSize: getWidth(15),
          color: Color(0xffECECEC),
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.nunito(
          fontSize: getWidth(14),
          color: Color(0xffEEEEEE),
          fontWeight: FontWeight.w400,
        ),
        bodySmall: GoogleFonts.nunito(
          fontSize: getWidth(12),
          color: Color(0xffD6D3D3),
          fontWeight: FontWeight.w400,
        ),

        // labelLarge: TextStyle(
        //     color: Colors.white,
        //     fontSize: 3.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w600),
        // labelMedium: TextStyle(
        //     // color: AppColors.textGray,
        //     fontSize: 3.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w400),
        // labelSmall: TextStyle(
        //     color: AppColors.textGrey,
        //     fontSize: 2.2.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w400),
        // titleLarge: TextStyle(
        //     color: Colors.white,
        //     fontSize: 4.7.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w600),
        // titleMedium: TextStyle(
        //     color: Colors.white,
        //     fontSize: 4.5.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w600),
        // // titleSmall: TextStyle(
        // //     color: Colors.white,
        // //     fontSize: 16,
        // //     fontFamily: "Outfit",
        // //     fontWeight: FontWeight.w400),
        // bodyLarge: TextStyle(
        //     color: AppColors.white,
        //     fontSize: 7.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w400),
        // bodySmall: TextStyle(
        //     color: AppColors.textGrey,
        //     fontSize: 2.5.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w400),
        // headlineLarge: TextStyle(
        //     color: Colors.white,
        //     fontSize: 3.w,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w400),
        // bodyLarge: TextStyle(fontSize: 25),
        // bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
      ),
    );
  }
}
