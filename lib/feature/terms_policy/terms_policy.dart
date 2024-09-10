import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_back_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/terms_policy/dummy_data/terms_policy_model.dart';

class TermsPolicyScreen extends StatefulWidget {
  const TermsPolicyScreen({super.key});

  @override
  State<TermsPolicyScreen> createState() => _TermsPolicyScreenState();
}

class _TermsPolicyScreenState extends State<TermsPolicyScreen> {
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbarColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Terms and Policies",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: CustomBackButton(),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
            child: Column(
              children: [
                SizedBox(height: getHeight(20)),
                Row(
                  children: [
                    SizedBox(
                      height: getHeight(98),
                      width: getWidth(98),
                      child: Image.asset(AppImagese.termsPolicy),
                    ),
                    SizedBox(width: getWidth(40)),
                    Container(
                      width: screenWidth() * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Terms of Service, Privacy Policy",
                            style: GoogleFonts.inter(
                              fontSize: getWidth(24),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: getHeight(6)),
                          Text(
                            "Terms of Service, Privacy Policy",
                            style: GoogleFonts.nunito(
                              fontSize: getWidth(12),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(20)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: getHeight(200)),
                    child: ListView.builder(
                      
                      shrinkWrap: true,
                      itemCount: termsPolicyItems.length,
                      itemBuilder: (context, index) {
                        final data = termsPolicyItems[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: getHeight(15)),
                          child: ListTile(
                            title: Padding(
                              padding:  EdgeInsets.only(bottom: getHeight(10)),
                              child: Text(
                                data.title,
                                style: GoogleFonts.inter(
                                  fontSize: getWidth(17),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              data.subTitle,
                              style: GoogleFonts.nunito(
                                fontSize: getWidth(14),
                                fontWeight: FontWeight.w400,
                                color: Color(0xffDED9D9),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                bottom: getHeight(20),
                left: getWidth(37),
                right: getWidth(37),
              ),
              height: screenHeight() * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff001B26),
                border: Border(
                  top: BorderSide(color: Colors.white, width: 0.4),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(agreeTerms.length, (index) {
                      final data = agreeTerms[index];
                      final isSelected = selectedItems.contains(index);
                      return Padding(
                        padding: EdgeInsets.only(top: getHeight(10)),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedItems.remove(index);
                                  } else {
                                    selectedItems.add(index);
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: getHeight(10)),
                                height: getHeight(22),
                                width: getWidth(22),
                                child: Image.asset(
                                  isSelected ? AppIcons.checkFill : AppIcons.checkWhite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: getWidth(16)),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: data.title,
                                    style: GoogleFonts.nunito(
                                      fontSize: getWidth(12),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: data.subTitle,
                                    style: GoogleFonts.nunito(
                                      fontSize: getWidth(14),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(88),
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(88),
                          onTap: () {
                            print("Decline");
                          },
                          child: Container(
                            height: getHeight(40),
                            width: getWidth(100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(88),
                              border: Border.all(
                                color: Color(0xff3AD896),
                                width: 0.4,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Decline",
                                style: GoogleFonts.nunito(
                                  fontSize: getWidth(13),
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffB7BBBD),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: getWidth(39)),
                      Material(
                        borderRadius: BorderRadius.circular(88),
                        color: Color(0xff3AD896),
                        child: InkWell(
                          splashColor: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(88),
                          onTap: () {
                            print("Accept");
                          },
                          child: Container(
                            height: getHeight(40),
                            width: getWidth(100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(88),
                              border: Border.all(
                                color: Colors.white,
                                width: 0.4,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Accept",
                                style: GoogleFonts.nunito(
                                  fontSize: getWidth(13),
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff001B26),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
