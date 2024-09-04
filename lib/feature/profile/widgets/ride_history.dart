import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  _RideHistoryScreenState createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  bool _isExpanded = false; // To track the icon state and text visibility

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
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(10), // Added padding for content
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Date : ",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: "June 25, 2024",
                                style: GoogleFonts.nunito(
                                    color: Color(0xffBCB0B0),
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Pickup : ",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: "Location A",
                                style: GoogleFonts.nunito(
                                    color: Color(0xffBCB0B0),
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Drop-off : ",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: "Location B",
                                style: GoogleFonts.nunito(
                                    color: Color(0xffBCB0B0),
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        // Conditionally render expanded content
                        if (_isExpanded)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Fare : ",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: "\$25",
                                      style: GoogleFonts.nunito(
                                          color: Color(0xffBCB0B0),
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Status : ",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: "Completed",
                                      style: GoogleFonts.nunito(
                                          color: Color(0xffBCB0B0),
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Driver : ",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: "John Doe",
                                      style: GoogleFonts.nunito(
                                          color: Color(0xffBCB0B0),
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Vehicle : ",
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: "Toyota Prius",
                                      style: GoogleFonts.nunito(
                                          color: Color(0xffBCB0B0),
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    height: 150,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          icon: Icon(
                            _isExpanded
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                          ),
                        ),
                        Container(
                          height: getHeight(75),
                          width: getWidth(75),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AppImagese.profileImage)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
