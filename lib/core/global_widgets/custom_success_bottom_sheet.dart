import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import '../app_imagese.dart';
class CustomSuccessBottomSheet extends StatelessWidget {
  final String text;
  final VoidCallback onButtonTap;
  const CustomSuccessBottomSheet({super.key, required this.text, required this.onButtonTap});

  @override
  Widget build(BuildContext context) {
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
              height: getHeight(296),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(15),
                  ),
                  SizedBox(
                    height: getHeight(95),
                    width: getWidth(96),
                    child: Image.asset(AppImagese.successIcon),
                  ),
                  SizedBox(
                    height: getHeight(16),
                  ),
                  Text(
                   text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      color: Color(0xff001B26),
                      fontSize: getWidth(17),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  InkWell(
                    onTap: onButtonTap,
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
            top:
            getHeight(40),
            right: getWidth(
                20),
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
  }
}
