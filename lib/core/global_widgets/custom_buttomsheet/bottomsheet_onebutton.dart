import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';

Future<dynamic> bottomSheetOneButton(
  BuildContext context,
  String title,
  String imagePath,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Color(0xff001B26),
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.center,
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
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                height: getHeight(238),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHeight(95),
                      width: getWidth(95),
                      child: Image.asset(imagePath),
                    ),
                    SizedBox(height: getHeight(16)),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Color(0xff001B26),
                        fontSize: getWidth(17),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: getHeight(40),
                        width: getWidth(104),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(88),
                            color: Color(0xff3AD896)),
                        child: Center(
                            child: CustomTextNunito(
                                text: "Done",
                                fontSize: getWidth(14),
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: getHeight(40),
              right: getWidth(20),
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
