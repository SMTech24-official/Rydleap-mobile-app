import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbarColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Safety Tips",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(20)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Column(
              children: [
                SizedBox(height: getHeight(20)),
                Row(
                  children: [
                    SizedBox(
                      height: getHeight(98),
                      width: getWidth(98),
                      child: Image.asset(AppImagese.safety),
                    ),
                    SizedBox(width: getWidth(40)),
                    Text(
                      "Introduction",
                      style: GoogleFonts.inter(
                        fontSize: getWidth(24),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                // The ListView.builder with flexible height inside the scroll view
                Expanded(
                  child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Item $index",
                          style: GoogleFonts.inter(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Positioned container at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: getHeight(100),
              width: double.infinity,
              child: Center(
                child: Text(
                  "Fixed Bottom Container",
                  style: GoogleFonts.inter(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
