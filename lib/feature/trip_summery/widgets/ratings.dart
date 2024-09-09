import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  int _currentRating = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        centerTitle: true,
        title: Text(
          "Rate your Ride",
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w600),
        ),
        leading: CustomCloseButton(),
      ),
      body: Custombackground(
        widget: SizedBox(),
        bottomContainerHeight: screenHeight() * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(8),
            ),
            Container(
              width: getWidth(48),
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffAFAFAF)),
            ),
            SizedBox(
              height: getHeight(17),
            ),
            Column(
              children: [
                Image.asset(AppImagese.appLogo),
                Text(
                  "USDT 08",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700, fontSize: getWidth(23)),
                )
              ],
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Container(
              // height: getHeight(238),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff001B26),
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        offset: Offset(0, 1),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: getHeight(24),
                  ),
                  Image.asset(AppImagese.profileImage),
                  Text(
                    "Rate your Driver",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w500, fontSize: getWidth(18)),
                  ),
                  Text(
                    "Rate your Driver",
                    style: GoogleFonts.nunito(
                        color: Color(0xffD0CACA),
                        fontWeight: FontWeight.w400,
                        fontSize: getWidth(14)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _currentRating = index + 1;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: index < _currentRating
                              ? Color(0xffFFC727)
                              : Color(0xffAFAAAA),
                          size: getWidth(30),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  InkWell(
                    onTap: (){
                      _customBottomSheet(context);
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
                   SizedBox(height: getHeight(20),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent, // Transparent background
      barrierColor: Color(0xff001B26).withOpacity(0.8),
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
                        child: Image.asset(AppImagese.like),
                      ),
                      SizedBox(height: getHeight(16),),
                      Center(
                        child: Text(
                          "Thank you!",
                          style: GoogleFonts.nunito(
                            color: Color(0xff001B26),
                              fontSize: getWidth(35),
                              fontWeight: FontWeight.w500),
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
                      Navigator.pop(context); // Close the bottom sheet
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => LoginScreen()),
                      // );
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

}
