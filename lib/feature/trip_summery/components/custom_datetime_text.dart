import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomDateTimeTextWidget extends StatelessWidget {
  final String title1, title2, title3, subTitle1, subTitle2, subTitle3;
  const CustomDateTimeTextWidget({
    super.key,
    required this.title1,
    required this.subTitle1,
    required this.title2,
    required this.subTitle2,
    required this.title3,
    required this.subTitle3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: GoogleFonts.nunito(
                  fontSize: getWidth(18), fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(5),
            ),
            Text(
              subTitle1,
              style: GoogleFonts.nunito(
                  color: Color(0xffDED9D9),
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style: GoogleFonts.nunito(
                  fontSize: getWidth(18), fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(5),
            ),
            Text(
              subTitle2,
              style: GoogleFonts.nunito(
                  color: Color(0xffDED9D9),
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title3,
              style: GoogleFonts.nunito(
                  fontSize: getWidth(18), fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: getHeight(5),
            ),
            Text(
              subTitle3,
              style: GoogleFonts.nunito(
                  color: Color(0xffDED9D9),
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
