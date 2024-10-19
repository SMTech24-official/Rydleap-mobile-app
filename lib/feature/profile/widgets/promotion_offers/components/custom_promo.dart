import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_error_bottom_sheet.dart';

Future<dynamic> _promoCodeSuccessBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // Make the bottom sheet take the full screen
    backgroundColor: Colors.transparent,
    // Transparent background
    barrierColor: Color(0xff001B26).withOpacity(0.8),
    // Semi-transparent black background for the barrier
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.center, // Center the container on the screen
        child: Stack(
          children: [
            Container(
              height: screenHeight(),
              width: double.infinity,
              color: Colors.transparent,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
                height: getHeight(257),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHeight(4),
                    ),
                    SizedBox(
                      height: getHeight(95),
                      width: getWidth(95),
                      child: Image.asset(AppImagese.successIcon),
                    ),
                    SizedBox(
                      height: getHeight(14),
                    ),
                    Text(
                      'Promo code success!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Color(0xff001B26),
                        fontSize: getWidth(17),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Your code is successfully redeemed.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Color(0xff001B26),
                        fontSize: getWidth(12),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: getHeight(21),
                    ),
                    InkWell(
                      onTap: () {
                        _promoCodeSuccessBottomSheet(context);
                      },
                      child: Container(
                        height: getHeight(40),
                        width: getWidth(104),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(88),
                            color: Color(0xff3AD896)),
                        child: Center(
                          child: Text(
                            "Done",
                            style: GoogleFonts.inter(
                                fontSize: getWidth(14),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: getHeight(40), // Adjust the top margin for the close button
              right:
                  getWidth(20), // Adjust the right margin for the close button
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
        ),
      );
    },
  );
}

Future<dynamic> promoErrorBottomSheet(
    {required BuildContext context,
    required VoidCallback onCancelBottomTap,
    required VoidCallback onRetryBottomTap}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Color(0xff001B26).withOpacity(0.8),
    builder: (BuildContext context) {
      return CustomErrorBottomSheet(
          onCancelBottomTap: onCancelBottomTap,
          onRetryBottomTap: onRetryBottomTap);
    },
  );
}
