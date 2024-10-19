import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';

class CustomHistoryContainer extends StatefulWidget {
  const CustomHistoryContainer(
      {super.key,
      required this.ridingDate,
      required this.pickupDest,
      required this.dropOff});

  final String ridingDate;
  final String pickupDest;
  final String dropOff;

  @override
  State<CustomHistoryContainer> createState() => _CustomHistoryContainerState();
}

class _CustomHistoryContainerState extends State<CustomHistoryContainer> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
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
                          text: "123 Main St",
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
                          text: "456 Elm St",
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
                                text: "\$08.00",
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
                                    color: Color(0xff3AD896),
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
                                text: "Joe marks",
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
                                text: "Toyota Supra",
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
              height: _isExpanded ? 150 : 0,
              child: _isExpanded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getHeight(75),
                          width: getWidth(75),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AppImagese.profileImage)),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -15),
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: getWidth(7)),
                            height: getHeight(30),
                            // width: getWidth(125),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90)),
                            child: Center(
                              child: CustomTextNunito(
                                  text: "Burkina Faso (4.7⭐)",
                                  fontSize: getWidth(12),
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff001B26)),
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: _isExpanded
                    ? Image.asset(AppIcons.arrowUp)
                    : Image.asset(AppIcons.arrowDown)),
          ],
        ),
      ),
    );
  }
}
