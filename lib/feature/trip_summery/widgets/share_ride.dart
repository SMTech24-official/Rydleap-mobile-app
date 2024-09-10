import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_back_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class ShareRideScreen extends StatelessWidget {
  const ShareRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconItems = [
      AppIcons.message,
      AppIcons.gmail,
      AppIcons.whatsup,
      AppIcons.facebook,
      AppIcons.messanger,
      AppIcons.instagram,
    ];
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          centerTitle: true,
          title: Text(
            "Share Via",
            style: GoogleFonts.inter(
                fontSize: getWidth(20), fontWeight: FontWeight.w600),
          ),
          leading: CustomBackButton()),
      body: Stack(
        children: [
          Container(
            height: screenHeight(),
            width: double.infinity,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 50.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getHeight(25),
                ),
                Text(
                  "Share Via",
                  style: GoogleFonts.inter(
                      fontSize: getWidth(20), fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                Row(
                    children: List.generate(iconItems.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: getWidth(13)),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: getHeight(37),
                        width: getWidth(38),
                        child: Image.asset(iconItems[index]),
                      ),
                    ),
                  );
                })),
                SizedBox(
                  height: getHeight(38),
                ),
                Text(
                  "Pre-filled Message",
                  style: GoogleFonts.inter(
                      fontSize: getWidth(20), fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(10), vertical: getHeight(20)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 0.6, color: Colors.white)),
                  child: Text(
                    """"I just completed a trip from 123 Main St to 456 Elm St on 2023-07-20 at 14:30. The total fare was \$20.00." """,
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(18), fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
