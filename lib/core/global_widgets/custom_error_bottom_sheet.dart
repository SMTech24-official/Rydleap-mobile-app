import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_imagese.dart';
import '../app_sizes.dart';
import '../utility/app_colors.dart';

class CustomErrorBottomSheet extends StatelessWidget {
final VoidCallback onCancelBottomTap;
final VoidCallback onRetryBottomTap;
  const CustomErrorBottomSheet({super.key, required this.onCancelBottomTap, required this.onRetryBottomTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The modal content
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
            height: getHeight(250),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: getHeight(10)),
                SizedBox(
                  height: getHeight(105),
                  width: getWidth(118),
                  child: Image.asset(AppImagese.errorImage),
                ),
                SizedBox(height: getHeight(17)),
                Center(
                  child: Text(
                    "Error!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: Color(0xff001B26),
                      fontSize: getWidth(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: getHeight(22)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onCancelBottomTap,
                      child: Container(
                        height: getHeight(40),
                        width: getWidth(104),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.whiteGrayColor,
                          borderRadius: BorderRadius.circular(88),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.inter(
                            fontSize: getWidth(14),
                            color: AppColors.navy_blue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getWidth(16)),
                    GestureDetector(
                      onTap: onRetryBottomTap,
                      child: Container(
                        alignment: Alignment.center,
                        height: getHeight(40),
                        width: getWidth(104),
                        decoration: BoxDecoration(
                          color: AppColors.redColor,
                          borderRadius: BorderRadius.circular(88),
                        ),
                        child: Text(
                          'Retry',
                          style: GoogleFonts.inter(
                            fontSize: getWidth(14),
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Close button at the top of the screen
        Positioned(
          top: getHeight(45), // Distance from the top of the screen
          right: getWidth(20), // Distance from the right edge
          child: SizedBox(
            height: getHeight(26),
            width: getWidth(26),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
