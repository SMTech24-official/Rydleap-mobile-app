import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/custom_search.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/history_container.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  _RideHistoryScreenState createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Ride history",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
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
              icon: Icon(Icons.arrow_back_ios),
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
            width: 150.w, // Use responsive width
            height: 50.h, // Use responsive height
            fit: BoxFit.fill,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getHeight(21),
                ),
                CustomSearch(),
                SizedBox(
                  height: getHeight(13),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Text(
                    "Your previous rides with Redleap drivers",
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(14), fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CustomHistoryContainer(),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
