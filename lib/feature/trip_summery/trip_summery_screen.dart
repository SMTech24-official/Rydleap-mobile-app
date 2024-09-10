import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/trip_summery/components/custom_datetime_text.dart';
import 'package:rydleap/feature/trip_summery/components/custom_pickup_dropoff.dart';
import 'package:rydleap/feature/trip_summery/widgets/ratings.dart';
import 'package:rydleap/feature/trip_summery/widgets/share_ride.dart';

class TripSummeryScreen extends StatelessWidget {
  const TripSummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        centerTitle: true,
        title: Text(
          "Trip Summary",
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(20)),
          child: SizedBox(
            height: getHeight(26),
            width: getWidth(26),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
            ),
          ),
        ),
      ),
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
                CustomPickupDropoff(
                  title: "Pickup: ",
                  subTitle1: "123 Main St123 Main St123 Main St123 Main St",
                  subTitle2: "123 Main St123 Main St123 Main St123 Main St",
                ),
                SizedBox(
                  height: getHeight(14),
                ),
                CustomPickupDropoff(
                  title: "Dropoff: ",
                  subTitle1: "123 Main St123 Main St123 Main St123 Main St",
                  subTitle2: "123 Main St123 Main St123 Main St123 Main St",
                ),
                SizedBox(
                  height: getHeight(14),
                ),
                CustomDateTimeTextWidget(
                    title1: "Date",
                    subTitle1: "20/03/2004",
                    title2: "Time",
                    subTitle2: "10:24 am",
                    title3: "",
                    subTitle3: ""),
                SizedBox(
                  height: getHeight(102),
                ),
                Text(
                  "Fare breakdown",
                  style: GoogleFonts.inter(
                      fontSize: getWidth(24), fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getHeight(16),
                ),
                CustomDateTimeTextWidget(
                    title1: "Base Fare:",
                    subTitle1: "\$5.00",
                    title2: "Distance:",
                    subTitle2: "\$10.00",
                    title3: "Time:",
                    subTitle3: "\$3.00"),
                SizedBox(
                  height: getHeight(33),
                ),
                CustomDateTimeTextWidget(
                    title1: "Surcharges:",
                    subTitle1: "\$2.00",
                    title2: "Total:",
                    subTitle2: "\$20.00",
                    title3: "",
                    subTitle3: ""),
                Spacer(),
                CustomGradientButton(text: "Rate our Driver", onTap: () {
                  Get.to(RatingsScreen());
                }),
                SizedBox(
                  height: getHeight(12),
                ),
                InkWell(
                    onTap: () {
                      Get.to(ShareRideScreen());
                    },
                    child: CustomBlurButton(text: "Share my Ride!")),
                SizedBox(
                  height: getHeight(20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
