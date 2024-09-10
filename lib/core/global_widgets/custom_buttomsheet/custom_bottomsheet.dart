import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

Future<dynamic> customBottomSheet(
    BuildContext context, 
    String title, 
    String imagePath,
    String? subTitle, // Nullable subtitle
    double titleSize,
    double? subTitleSize // Nullable subtitle size
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
                        fontSize: titleSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Only display subtitle if it's not null
                    if (subTitle != null)
                      Padding(
                        padding: EdgeInsets.only(top: getHeight(8)),
                        child: Text(
                          subTitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            color: Color(0xff001B26),
                            fontSize: subTitleSize ?? 14, // Provide default size if null
                            fontWeight: FontWeight.w500,
                          ),
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
