import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:rydleap/core/shared/screen/splashScreen.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class Rydleap extends StatelessWidget {
  const Rydleap({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // theme: lightThemeData(),
        theme: _darkThemeData(),
      );
    });
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: Color(0xff262626), size: 24),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: AppColors.lightGrey),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.musicTabBorderDark)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightPrimary)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryPurple)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryPurple)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: AppColors.lightPrimary,
            foregroundColor: Colors.white),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textTheme: TextTheme(
        labelLarge: TextStyle(
            color: Color(0xff262626),
            fontSize: 3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        labelMedium: TextStyle(
            color: AppColors.textGray,
            fontSize: 3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: Color(0xff4C4C4C),
            fontSize: 2.2.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
            color: Color(0xff262626),
            fontSize: 4.7.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: Color(0xff262626),
            fontSize: 4.5.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        titleSmall: TextStyle(
            color: Color(0xff262626),
            fontSize: 3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(
            color: Color(0xff262626),
            fontSize: 3.5.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(
            color: Color(0xff262626),
            fontSize: 3.3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
            color: Color(0xff4C4C4C),
            fontSize: 2.5.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
      ),
    );
  }

  ThemeData _darkThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      iconTheme: IconThemeData(color: Color(0xffD9D9D9), size: 24),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
            color: AppColors.textGrey,
            fontSize: 2.5.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        // fillColor: AppColors.mainColor,
        fillColor: AppColors.dividerColor,
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
        titleSmall: TextStyle(fontSize: 3.w, color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 4.5.w),
        labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        labelMedium: TextStyle(
            color: AppColors.textGray,
            fontSize: 3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: AppColors.textGrey,
            fontSize: 2.2.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 4.7.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 4.5.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w600),
        // titleSmall: TextStyle(
        //     color: Colors.white,
        //     fontSize: 16,
        //     fontFamily: "Outfit",
        //     fontWeight: FontWeight.w400),
        bodyLarge: TextStyle(
            color: AppColors.white,
            fontSize: 7.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            color: AppColors.textGrey,
            fontSize: 2.5.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 3.w,
            fontFamily: "Outfit",
            fontWeight: FontWeight.w400),
        // bodyLarge: TextStyle(fontSize: 25),
        // bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255))
      ),
    );
  }
}
