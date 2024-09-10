import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_next_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/report_problem/report_problem2.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  List<bool> isSelected =
      List.generate(5, (_) => false); // Track selected items
  List<String> reprotItems = [
    CustomGlobalVariable.userType == 'Driver'
        ? "Ride issue"
        : "Driver behavior",
    CustomGlobalVariable.userType == 'Driver'
        ? "App issue"
        : "Vehicle condition",
    CustomGlobalVariable.userType == 'Driver'
        ? "Account issue"
        : "Payment issue",
    CustomGlobalVariable.userType == 'Driver' ? "Safety issue" : "Lost item",
    "Other",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        leading: CustomCloseButton()
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
          ListView.builder(
            itemCount: reprotItems.length,
            itemBuilder: (context, index) {
              final data = reprotItems[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
                child: 
                Padding(
                  padding: EdgeInsets.only(bottom: getHeight(14.5)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                    margin: EdgeInsets.symmetric(horizontal: getWidth(15)),
                    height: getHeight(51),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: isSelected[index]
                                  ? Colors.transparent
                                  : Color(0xff6D6A6A))),
                      color: isSelected[index]
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: isSelected[index]
                          ? BorderRadius.circular(10)
                          : BorderRadius.circular(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data,
                          style: GoogleFonts.nunito(
                              fontSize: getWidth(16),
                              fontWeight: FontWeight.w400),
                        ),
                        if (isSelected[index]) Image.asset(AppIcons.checkFill)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: getHeight(20), left: getWidth(20), right: getWidth(20)),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomNextButton(
                  text: "Next",
                  onTap: () {
                    Get.to(ReportProblem2());
                  },
                  
                )),
          )
        ],
      ),
    );
  }
}
