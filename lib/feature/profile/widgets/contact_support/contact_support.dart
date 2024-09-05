import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/contact_support/call_support.dart';
import 'package:rydleap/feature/profile/widgets/contact_support/email_support.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        centerTitle: true,
        title: Text(
          "Contact Support",
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
              icon: Icon(Icons.close),
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: getHeight(14.5)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                  margin: EdgeInsets.symmetric(horizontal: getWidth(15)),
                  height: getHeight(51),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xff6D6A6A))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Call support",
                        style: GoogleFonts.nunito(
                            fontSize: getWidth(16),
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(CallSupportScreen());
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getHeight(14.5)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                  margin: EdgeInsets.symmetric(horizontal: getWidth(15)),
                  height: getHeight(51),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xff6D6A6A))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email Support",
                        style: GoogleFonts.nunito(
                            fontSize: getWidth(16),
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(EmailSupportScreen());
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
