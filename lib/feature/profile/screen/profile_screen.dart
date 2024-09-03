import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/dummy_data/about_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff001B26),
          leading: SizedBox(
              height: getHeight(26),
              width: getWidth(26),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))),
          title: Text(
            "About me",
            style: GoogleFonts.inter(
                fontSize: getWidth(20), fontWeight: FontWeight.w600),
          ),
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(40),
                  ),
                  Center(
                    child: Container(
                      height: getHeight(54),
                      width: getWidth(54),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(AppImagese.profileImage)),
                      ),
                    ),
                  ),
                  //profile section
                  Container(
                    width: getWidth(162),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Peace Unity",
                              style: GoogleFonts.nunito(
                                  fontSize: getWidth(18),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "(4.7⭐)",
                              style: GoogleFonts.nunito(
                                  color: AppColors.textYellow,
                                  fontSize: getWidth(12),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          "+123002765918",
                          style: GoogleFonts.nunito(
                              color: Color(0xffC3BBBB),
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "@gmail.com",
                          style: GoogleFonts.nunito(
                              color: Color(0xffC3BBBB),
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getHeight(27),
                  ),
                  Container(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      shrinkWrap: true,
                      itemCount: aboutItems.length,
                      itemBuilder: (context, index) {
                        final data = aboutItems[index];
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: getHeight(14.5)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xff545454), width: 0.6))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: getHeight(22),
                                        width: getWidth(22),
                                        child: Image.asset(data.icon)),
                                    SizedBox(
                                      width: getWidth(24.5),
                                    ),
                                    Text(
                                      data.title,
                                      style: GoogleFonts.nunito(
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: data.onTap,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                    child: CustomBlurButton(text: "Log Out"),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
